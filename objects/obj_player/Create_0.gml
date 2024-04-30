// @TODO @Incomplete: change the collision checking for most of the precise stuff
// to the 'repeat' structure inside each state. With this we are not going to have 
// issues whith precision anymore. (In the wall sliding thing for example).

if (!instance_exists(obj_dash_bonus_light))
{
	instance_create_depth(0, 0, depth + 1, obj_dash_bonus_light);
}

update_player_inputs();

// GENERAL VARIABLES
// generic
has_paused                     = false;
has_unpaused                   = false;
is_player_inside_destroy_block = false;
on_slab                        = 0;
player_dir                     = 0;
can_collect_collectable        = false;

// gravity stuff
original_grav_value       = 0.23;
// under_water_grav_value = 0.15;
grav                      = original_grav_value;

// speed / acceleration stuff
h_speed                   = 0;
v_speed                   = 0;
original_walk_speed       = 2.4;
walk_speed                = original_walk_speed;
haccel                    = 0.24;
vaccel                    = 0.19;
player_capsule_hdir       = 0;
player_capsule_vdir       = 0;
// original_capsule_speed = 4;
original_capsule_speed    = 2.4;
capsule_speed             = original_capsule_speed;

 // jump stuff
jump_speed                     = 4;
coyote_can_jump                = 0;
jump_coyote_max                = 8;
jumper_object_can_jump_release = true;
// player jumping before landing vars
jump_buffer_counter            = 0;
jump_buffer_max                = 8;

// color  stuff
player_color       = c_white;
player_color_red   = 255;
player_color_green = 255;
player_color_blue  = 255;

// dash stuff
can_disable_dash        = false;
can_dash                = 1;
// dash_dist            = 35;
dash_dist               = 35;
// dash_time            = 8;
dash_time               = 8;
dash_dir                = 0;
dash_speed              = 0;
dash_energy             = 0;
time_to_dash            = 10;
dash_timer              = time_to_dash;
time_to_can_jumper_dash = 5;
can_jumper_dash_timer   = 0;
use_dash_boom_color     = false;

// destroy block
dash_destroy_block_buffer_counter = 0;
dash_destroy_block_buffer_max     = 16;

trail_timer   = 0;
time_to_trail = 1.5;

// wall interaction stuff
wall_grav           = 0.1;
on_wall             = 0;
// wall_hspeed      = 2.5;
wall_hspeed         = 2.8;
wall_vspeed         = -4.2;
wall_max_vspeed     = 1;
wall_jump_delay     = 0;
wall_jump_delay_max = 3.5;

wall_jump_buffer = 10;
wall_timer       = 0;
last_wall        = 0;

// checkpoint stuff
current_player_checkpoint = 0;

// misc / animation stuff
player_state_string                 = "";
xscale                              = 1;
yscale                              = 1;
side_to_look                        = 1;
// can_create_death_par             = true;
on_floor                            = false;
on_roof                             = false;
on_destroy_block                    = false;
temp_on_floor                       = false;
can_reset_vspeed                    = false;
change_player_color_speed           = 0.15;
change_player_dash_boom_color_speed = 0.04;
player_anim_lerp                    = 0.08;
// player_eye_rot                   = 5;
current_player_capsule              = 0;

// player particle stuff
walking_dust_particles_time_to_spawn = 10;
walking_dust_particles_timer         = walking_dust_particles_time_to_spawn;

can_spawn_dash_particles = false;

dash_particle_system = part_system_create_layer(layer_get_id(PLAYER_LAYER) + 1, false);
// dash_particles_time_to_spawn = 2;
dash_particles_time_to_spawn    = 2;
dash_particles_spawn_timer      = dash_particles_time_to_spawn;

dash_particle       = part_type_create();
dash_particle_color = make_color_rgb(255, 255, 50);
	
//  part_type_sprite(dash_particle, spr_pixel_particle, false, false, false);
part_type_sprite(dash_particle, choose(spr_player_dust_particle_1, spr_player_dust_particle_2), true, false, false);
// part_type_life(dash_particle, 40, 50);
part_type_life(dash_particle, 30, 30);
// part_type_alpha3(dash_particle, 0.8, 1, 0);
part_type_alpha3(dash_particle, 0.5, 0.5, 0);
part_type_color1(dash_particle, dash_particle_color);
// part_type_direction(dash_particle, 225, 315, 1, 30);
part_type_speed(dash_particle, 0.1, 0.006, 0, 0);




// <---------------------------------> STATES <--------------------------------->



// LOCK STATE
lock_state = function()
{
	player_state_string = "lock_state";
}

// ON MAIN MENU STATE
on_main_menu_state = function()
{
	// do nothing
	player_state_string = "on_main_menu_state";
}

// DASH STATE
hspeed_to_bounce = 0;
vspeed_to_bounce = 0;

bounce_player_destroy_block_timer = time_source_create(time_source_game,
					                                    0.01,
														time_source_units_seconds,
														function()
														{
															h_speed = hspeed_to_bounce;
															v_speed = vspeed_to_bounce;
														}, [], 1);


dash_state = function()
{
    player_state_string = "dash_state";

	PLAYER_handle_rope();
	PLAYER_get_collectable();
	PLAYER_get_dash_bonus_item();
	
	if (can_disable_dash)
	{
		can_dash -= 1;
		can_disable_dash = false;
	}
	
	h_speed = lengthdir_x(dash_speed, dash_dir);
	v_speed = lengthdir_y(dash_speed, dash_dir);
	
	trail_timer--;
	// trail_timer -= global.delta;
	if (trail_timer <= 0)
	{
		with (instance_create_depth(x, y, depth + 1, obj_player_trail))
		{
			// sprite_index = other.sprite_index;
			sprite_index = spr_player_trail;
			// image_blend = make_color_rgb(180, 180, 0);
			image_blend = other.dash_particle_color;
			image_alpha = 0.7;
		}
		trail_timer = time_to_trail;
	}
	
    // horizontal collision
    repeat (abs(h_speed)) 
    {
        PLAYER_get_collectable();
        PLAYER_get_dash_bonus_item();
    
        var sign_hspeed = sign(h_speed);
        
        PLAYER_handle_wall_dash_col_x_collision(sign_hspeed);
        
        if (place_meeting(x + sign_hspeed, y, obj_default_collider)) 
        {
            PLAYER_handle_destroy_block_x_collision(sign_hspeed);
            
            h_speed = 0;
            break;
        } 
        else 
        { 
            x += sign_hspeed;
            x = round(x);
        }
    }
    
    // vertical collision
    repeat (abs(v_speed)) 
    {
        PLAYER_get_collectable();
        PLAYER_get_dash_bonus_item();
        
        var sign_vspeed = sign(v_speed);
        
        PLAYER_handle_wall_dash_col_y_collision(sign_vspeed);
        
        if (place_meeting(x, y + sign_vspeed, obj_default_collider)) 
        {
            PLAYER_handle_destroy_block_y_collision(sign_vspeed);
            
            v_speed = 0;
            break;
        } 
        else 
        { 
            y += sign_vspeed;
            y = round(y);
        }
    }
	
	// going to the death state
	if (place_meeting(x, y, obj_death_collider))
	{
		PLAYER_goto_death_state();
	}
	
	// dash particles
	if (right && !up && !down && place_meeting(x + 1, y, obj_default_collider))
	{
		can_spawn_dash_particles = false;	
	}
	if (left && !up && !down && place_meeting(x - 1, y, obj_default_collider))
	{
		can_spawn_dash_particles = false;	
	}
	if (on_roof && up && !right && !left)
	{
		can_spawn_dash_particles = false;
	}
	if (on_floor && down && !right && !left)
	{
		can_spawn_dash_particles = false;
	}
	
	if (can_spawn_dash_particles && (h_speed != 0 || v_speed != 0))
	{
		dash_particles_spawn_timer -= 1;
		if (dash_particles_spawn_timer <= 0)
		{
			var length = 10;
			var angle_diff = irandom_range(-30, 30);
			var xdiff = x + lengthdir_x(length, ((dash_dir - 180) + angle_diff));
			var ydiff = (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) 
			            + lengthdir_y(length, ((dash_dir - 180) + angle_diff));
			
			create_player_dash_particle(2, xdiff, ydiff, layer_get_id(PLAYER_LAYER) + 1, 
						                choose(obj_player_dash_particle_1, 
												obj_player_dash_particle_2),
										0, 
										0, 
										dash_particle_color);
							  
			dash_particles_spawn_timer = dash_particles_time_to_spawn;
		}
	}
	
	// stop dashing
	dash_energy -= dash_speed;
	if (dash_energy <= 0)
	{
		h_speed *= 0.8;
		v_speed *= 0.8;
		player_state = free_state;
	}
}

// ON CAPSULE STATE
on_capsule_state = function()
{
    player_state_string = "on_capsule_state";
    
    /*
        if (place_meeting(x, y, obj_capsule))
    	{
    		current_player_capsule = instance_place(x, y, obj_capsule);
    	}
	*/
    
    xscale = 1;
	yscale = 1;
	
	// going to the GOD MODE
	if (gamepad_button_check_pressed(global.gamepad_device, gp_select)
	    || keyboard_check_pressed(vk_f1))
	{
		xscale = 1;
		yscale = 1;
		current_player_capsule.enter_capsule_timer = current_player_capsule.time_to_enter_capsule;
		current_player_capsule.player_can_enter_capsule = false;
		current_player_capsule.current_state = current_player_capsule.free_state;
		current_player_capsule = 0;
		player_state = god_mode_state;
	}
	
	if (jump_pressed)
    {
		current_player_capsule.enter_capsule_timer = current_player_capsule.time_to_enter_capsule;
		current_player_capsule.player_can_enter_capsule = false;
		current_player_capsule.current_state = current_player_capsule.free_state;
		current_player_capsule = 0;
		
		v_speed = -5;
		if (right && !left)
		{
		    h_speed = 4;
		}
		if (!right && left)
		{
		    h_speed = -4;
		}
		
        player_state = free_state;
    }
	
	// @on_capsule_state dashing
	if (dash_pressed && (left || right || down || up))
	{
		// picking dash direction
		dash_dir = point_direction(0, 0, right-left, down-up);
		
		if (down && (left || right) && !up) // floor diagonal dashing
		{	
			if (!place_meeting(x - 1, y, obj_default_collider)
			    && !place_meeting(x + 1, y, obj_default_collider))
				{
					if (on_floor)
					{
						dash_dir = point_direction(0, 0, right-left, 0);
					}
					else
					{
						dash_dir = point_direction(0, 0, right-left, down-up);
					}
				}
		}
		
		if (up && (left || right) && !down) // roof diagonal dashing
		{
			if (!place_meeting(x - 1, y, obj_default_collider) 
			    && !place_meeting(x + 1, y, obj_default_collider))
				{
					if (place_meeting(x, y - 1, obj_default_collider))
					{
						dash_dir = point_direction(0, 0, right-left, 0);
					}
					else
					{
						dash_dir = point_direction(0, 0, right-left, down-up);
					}
				}
		}
		
		if (left && down && !right) // left-wall diagonal dashing
		{
			if (!on_floor)
			{
				if (place_meeting(x - 1, y, obj_default_collider))
				{
					dash_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					dash_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		if (left && up && !right) // left-wall diagonal dashing
		{
			if (!place_meeting(x, y - 1, obj_default_collider))
			{
				if (place_meeting(x - 1, y, obj_default_collider))
				{
					dash_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					dash_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		if (right && down && !left) // right-wall diagonal dashing
		{
			if (!on_floor)
			{
				if (place_meeting(x + 1, y, obj_default_collider))
				{
					dash_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					dash_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		if (right && up && !left) // right-wall diagonal dashing
		{
			if (!place_meeting(x, y - 1, obj_default_collider))
			{
				if (place_meeting(x + 1, y, obj_default_collider))
				{
					dash_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					dash_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		// not dashing
		if (left && right && !up && !down)
		{
			exit;
		}
		if (up && down && !left && !right)
		{
			exit;
		}
		if (left && right && down && on_floor)
		{
			exit;	
		}
		if (left && right && up && down)
		{
			exit;
		}
		
		if (on_floor)
		{
			dash_timer = time_to_dash;
		}
		else
		{
			dash_timer = 0;
		}
		
		coyote_can_jump = 0;
		dash_speed = ((dash_dist * 2) / dash_time);
		dash_energy = dash_dist;
		
		// screen shake and player animation stuff
		if ((down || up) && !left && !right) // up or down (vertical)
		{
			xscale = 0.7;
			yscale = 1.3;
			screen_shake_dash(2, 7, false, true, (right - left), (down - up));
		}
		else if ((left || right) && !down && !up) // left or right (horizontal)
		{
			xscale = 1.2;
			yscale = 0.7;
			screen_shake_dash(2, 7, true, false, (right - left), (down - up));
		}
		else if ((down || up) && (left || right)) // diagonals
		{
			xscale = 1.2;
			yscale = 0.8;
			screen_shake_dash(2, 7, true, true, (right - left), (down - up));
		}
		else // any other situation
		{
			xscale = 1.2;
			yscale = 0.7;
			screen_shake_dash(2, 7, true, true, (right - left), (down - up));
		}
		
		audio_play_sound(choose(snd_redbooster_dash, snd_greenbooster_dash), 1, 0);
		can_spawn_dash_particles = true;
		// can_disable_dash = true;
		instance_create_depth(x, y, depth + 1, obj_player_dash_boom_effect);
		
		current_player_capsule.player_can_enter_capsule = false;
		current_player_capsule.enter_capsule_timer = current_player_capsule.time_to_enter_capsule;
		current_player_capsule.current_state = current_player_capsule.free_state;
		current_player_capsule = 0;
		
		player_state = dash_state;
	}
}

// HORIZONTAL JUMPER MOMENTUM STATE
keep_horizontal_jumper_momentum = false;

horizontal_jumper_momentum_state = function()
{
    player_state_string = "horizontal_jumper_momentum_state";
    
	PLAYER_handle_rope();
	PLAYER_get_collectable();
	PLAYER_get_dash_bonus_item();
	
	h_speed = ((global.player_momentum_x * (global.player_momentum_speed * 1.1)) * 0.99);
	
	if (v_speed < (jump_speed * 1.10)) // 1.4
	{
		v_speed += grav;
	}
	
	// dash particles
	dash_particles_spawn_timer -= 1;
	if (dash_particles_spawn_timer <= 0)
	{
		var length = 10;
		var angle_diff = irandom_range(-30, 30);
		var xdiff = x + lengthdir_x(length, ((direction - 270) + angle_diff));
		var ydiff = (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) 
			        + lengthdir_y(length, angle_diff);
			
		create_player_dash_particle(2, xdiff, ydiff, layer_get_id(PLAYER_LAYER) + 1, 
						            choose(obj_player_dash_particle_1, 
											obj_player_dash_particle_2),
									0, 
									0, 
									dash_particle_color);
							  
		dash_particles_spawn_timer = dash_particles_time_to_spawn;
	}
	
	// going to the death state
	if (place_meeting(x, y, obj_death_collider))
	{
		screen_shake(5, 10, true, true);
		PLAYER_goto_death_state();
	}
	
	// horizontal collision
	repeat (abs(h_speed)) 
	{
		var sign_hspeed = sign(h_speed);
	
		if (place_meeting(x + sign_hspeed, y, obj_default_collider)) 
		{
			h_speed = 0;
			player_state = free_state;
			keep_horizontal_jumper_momentum = false;
			break;
		} 
		else 
		{ 
			x += sign_hspeed;
			x = round(x);
		}
	}
	
	// vertical collision
	repeat (abs(v_speed)) 
	{
		var sign_vspeed = sign(v_speed);
	
		if (place_meeting(x, y + sign_vspeed, obj_default_collider)) 
		{
			if (v_speed > 0)
			{
				coyote_can_jump = jump_coyote_max;
				can_dash = 1;
			}
			
			v_speed = 0;
			break;
		} 
		else 
		{
			y += sign_vspeed;
			y = round(y);
		}
	}
}


// BELT MOMENTUM STATE
keep_belt_momentum = false;

set_player_belt_momentum_timer = time_source_create(time_source_game,
	                                               0.3,
												   time_source_units_seconds,
												   function()
												   {
													   with (obj_player)
													   {
														   keep_belt_momentum = true;
														   player_state = free_state;
													   }
												   }, [], 1);

belt_momentum_state = function()
{
    player_state_string = "belt_momentum_state";
    
	PLAYER_handle_rope();
	PLAYER_get_collectable();
	PLAYER_get_dash_bonus_item();
	
	// h_speed = (global.player_momentum_x * (global.player_momentum_speed);
	h_speed = ((global.player_momentum_x * (global.player_momentum_speed * 1.1)) * 0.99);
	
	if (v_speed < (jump_speed * 1.10)) // 1.4
	{
		v_speed += grav;
	}
	
	// @belt_momentum_state dashing
	if (can_dash > 0 && dash_pressed && dash_timer <= 0 && (left || right || down || up))
	{
		
		// picking dash direction
		dash_dir = point_direction(0, 0, right-left, down-up);
		
		if (down && (left || right) && !up) // floor diagonal dashing
		{
			if (!place_meeting(x - 1, y, obj_default_collider)
			    && !place_meeting(x + 1, y, obj_default_collider))
				{
					if (on_floor)
					{
						dash_dir = point_direction(0, 0, right-left, 0);
					}
					else
					{
						dash_dir = point_direction(0, 0, right-left, down-up);
					}
				}
		}
		
		if (up && (left || right) && !down) // roof diagonal dashing
		{
			if (!place_meeting(x - 1, y, obj_default_collider) 
			    && !place_meeting(x + 1, y, obj_default_collider))
				{
					if (place_meeting(x, y - 1, obj_default_collider))
					{
						dash_dir = point_direction(0, 0, right-left, 0);
					}
					else
					{
						dash_dir = point_direction(0, 0, right-left, down-up);
					}
				}
		}
		
		if (left && down && !right) // left-wall diagonal dashing
		{
			if (!on_floor)
			{
				if (place_meeting(x - 1, y, obj_default_collider))
				{
					dash_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					dash_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		if (left && up && !right) // left-wall diagonal dashing
		{
			if (!place_meeting(x, y - 1, obj_default_collider))
			{
				if (place_meeting(x - 1, y, obj_default_collider))
				{
					dash_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					dash_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		if (right && down && !left) // right-wall diagonal dashing
		{
			if (!on_floor)
			{
				if (place_meeting(x + 1, y, obj_default_collider))
				{
					dash_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					dash_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		if (right && up && !left) // right-wall diagonal dashing
		{
			if (!place_meeting(x, y - 1, obj_default_collider))
			{
				if (place_meeting(x + 1, y, obj_default_collider))
				{
					dash_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					dash_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		// not dashing
		if (left && right && !up && !down)
		{
			exit;
		}
		if (up && down && !left && !right)
		{
			exit;
		}
		if (left && right && down && on_floor)
		{
			exit;	
		}
		if (left && right && up && down)
		{
			exit;
		}
		
		if (on_floor)
		{
			dash_timer = time_to_dash;
		}
		else
		{
			dash_timer = 0;	
		}
		
		coyote_can_jump = 0;
		dash_speed = (dash_dist / dash_time);
		dash_energy = dash_dist;
		
		// screen shake and player animation stuff
		if ((down || up) && !left && !right) // up or down (vertical)
		{
			xscale = 0.7;
			yscale = 1.3;
			screen_shake(2, 7, false, true);
		}
		else if ((left || right) && !down && !up) // left or right (horizontal)
		{
			xscale = 1.2;
			yscale = 0.7;
			screen_shake(2, 7, true, false);
		}
		else if ((down || up) && (left || right)) // diagonals
		{
			xscale = 1.2;
			yscale = 0.8;
			screen_shake(2, 7, true, true);
		}
		else // any other situation
		{
			xscale = 1.2;
			yscale = 0.7;
			screen_shake(2, 7, true, true);
		}
		
		audio_play_sound(choose(snd_redbooster_dash, snd_greenbooster_dash), 1, 0);
		can_spawn_dash_particles = true;
		can_disable_dash = true;
		
		time_source_stop(set_player_rope_momentum_timer);
		player_state = dash_state;
	}
	
	// going to the death state
	if (place_meeting(x, y, obj_death_collider))
	{
		screen_shake(5, 10, true, true);
		PLAYER_goto_death_state();
	}
	
	// horizontal collision
	repeat (abs(h_speed)) 
	{
		var sign_hspeed = sign(h_speed);
	
		if (place_meeting(x + sign_hspeed, y, obj_default_collider)) 
		{
			h_speed = 0;
			player_state = free_state;
			keep_belt_momentum = false;
			break;
		} 
		else 
		{ 
			x += sign_hspeed;
			x = round(x);
		}
	}
	
	// vertical collision
	repeat (abs(v_speed)) 
	{
		var sign_vspeed = sign(v_speed);
	
		if (place_meeting(x, y + sign_vspeed, obj_default_collider)) 
		{
			if (v_speed > 0)
			{
				coyote_can_jump = jump_coyote_max;
				can_dash = 1;
			}
			
			v_speed = 0;
			break;
		} 
		else 
		{
			y += sign_vspeed;
			y = round(y);
		}
	}
}


// ROPE MOMENTUM STATE
keep_rope_momentum = false;

rope_momentum_state = function()
{
    player_state_string = "rope_momentum_state";
    
	PLAYER_handle_rope();
	PLAYER_get_collectable();
	PLAYER_get_dash_bonus_item();
	
	// h_speed = (global.player_momentum_x * (global.player_momentum_speed);
	h_speed = ((global.player_momentum_x * (global.player_momentum_speed * 1.1)) * 0.99);
	
	if (v_speed < (jump_speed * 1.10)) // 1.4
	{
		v_speed += grav;
	}
	
	// dash particles
	dash_particles_spawn_timer -= 1;
	if (dash_particles_spawn_timer <= 0)
	{
		var length = 10;
		var angle_diff = irandom_range(-30, 30);
		var xdiff = x + lengthdir_x(length, ((direction - 270) + angle_diff));
		var ydiff = (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) 
			        + lengthdir_y(length, angle_diff);
			
		create_player_dash_particle(2, xdiff, ydiff, layer_get_id(PLAYER_LAYER) + 1, 
						            choose(obj_player_dash_particle_1, 
											obj_player_dash_particle_2),
									0, 
									0, 
									dash_particle_color);
							  
		dash_particles_spawn_timer = dash_particles_time_to_spawn;
	}
	
	// @rope_momentum_state dashing
	if (can_dash > 0 && dash_pressed && dash_timer <= 0 && (left || right || down || up))
	{
		// picking dash direction
		dash_dir = point_direction(0, 0, right-left, down-up);
		
		if (down && (left || right) && !up) // floor diagonal dashing
		{
			if (!place_meeting(x - 1, y, obj_default_collider)
			    && !place_meeting(x + 1, y, obj_default_collider))
				{
					if (on_floor)
					{
						dash_dir = point_direction(0, 0, right-left, 0);
					}
					else
					{
						dash_dir = point_direction(0, 0, right-left, down-up);
					}
				}
		}
		
		if (up && (left || right) && !down) // roof diagonal dashing
		{
			if (!place_meeting(x - 1, y, obj_default_collider) 
			    && !place_meeting(x + 1, y, obj_default_collider))
				{
					if (place_meeting(x, y - 1, obj_default_collider))
					{
						dash_dir = point_direction(0, 0, right-left, 0);
					}
					else
					{
						dash_dir = point_direction(0, 0, right-left, down-up);
					}
				}
		}
		
		if (left && down && !right) // left-wall diagonal dashing
		{
			if (!on_floor)
			{
				if (place_meeting(x - 1, y, obj_default_collider))
				{
					dash_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					dash_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		if (left && up && !right) // left-wall diagonal dashing
		{
			if (!place_meeting(x, y - 1, obj_default_collider))
			{
				if (place_meeting(x - 1, y, obj_default_collider))
				{
					dash_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					dash_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		if (right && down && !left) // right-wall diagonal dashing
		{
			if (!on_floor)
			{
				if (place_meeting(x + 1, y, obj_default_collider))
				{
					dash_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					dash_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		if (right && up && !left) // right-wall diagonal dashing
		{
			if (!place_meeting(x, y - 1, obj_default_collider))
			{
				if (place_meeting(x + 1, y, obj_default_collider))
				{
					dash_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					dash_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		// not dashing
		if (left && right && !up && !down)
		{
			exit;
		}
		if (up && down && !left && !right)
		{
			exit;
		}
		if (left && right && down && on_floor)
		{
			exit;	
		}
		if (left && right && up && down)
		{
			exit;
		}
		
		if (on_floor)
		{
			dash_timer = time_to_dash;
		}
		else
		{
			dash_timer = 0;	
		}
		
		coyote_can_jump = 0;
		dash_speed = (dash_dist / dash_time);
		dash_energy = dash_dist;
		
		// screen shake and player animation stuff
		if ((down || up) && !left && !right) // up or down (vertical)
		{
			xscale = 0.7;
			yscale = 1.3;
			screen_shake(2, 7, false, true);
		}
		else if ((left || right) && !down && !up) // left or right (horizontal)
		{
			xscale = 1.2;
			yscale = 0.7;
			screen_shake(2, 7, true, false);
		}
		else if ((down || up) && (left || right)) // diagonals
		{
			xscale = 1.2;
			yscale = 0.8;
			screen_shake(2, 7, true, true);
		}
		else // any other situation
		{
			xscale = 1.2;
			yscale = 0.7;
			screen_shake(2, 7, true, true);
		}
		
		audio_play_sound(choose(snd_redbooster_dash, snd_greenbooster_dash), 1, 0);
		can_spawn_dash_particles = true;
		can_disable_dash = true;
		
		time_source_stop(set_player_rope_momentum_timer);
		player_state = dash_state;
	}
	
	// going to the death state
	if (place_meeting(x, y, obj_death_collider))
	{
		screen_shake(5, 10, true, true);
		PLAYER_goto_death_state();
	}
	
	// horizontal collision
	repeat (abs(h_speed)) 
	{
		var sign_hspeed = sign(h_speed);
	
		if (place_meeting(x + sign_hspeed, y, obj_default_collider)) 
		{
			h_speed = 0;
			player_state = free_state;
			keep_rope_momentum = false;
			break;
		} 
		else 
		{ 
			x += sign_hspeed;
			x = round(x);
		}
	}
	
	// vertical collision
	repeat (abs(v_speed)) 
	{
		var sign_vspeed = sign(v_speed);
	
		if (place_meeting(x, y + sign_vspeed, obj_default_collider)) 
		{
			if (v_speed > 0)
			{
				coyote_can_jump = jump_coyote_max;
				can_dash = 1;
			}
			
			v_speed = 0;
			break;
		} 
		else 
		{
			y += sign_vspeed;
			y = round(y);
		}
	}
}


// DEATH STATE
// back_to_checkpoint_speed = 8;
back_to_checkpoint_speed = 10;

player_got_to_checkpoint  = false;
going_back_to_checkpoint = false;
can_create_death_transition = true;

going_back_to_checkpoint_timer = time_source_create(time_source_game,
				                                    0.65,
													time_source_units_seconds,
													function()
													{
														going_back_to_checkpoint = true;
													}, [], 1);

death_state = function()
{
    player_state_string = "death_state";
	
	// going to the GOD MODE
	if (gamepad_button_check_pressed(global.gamepad_device, gp_select)
	    || keyboard_check_pressed(vk_f1))
	{
		xscale = 1;
		yscale = 1;
		player_state = free_state;
		player_state = god_mode_state;
	}
	
	player_color_green = lerp(player_color_green, 0, change_player_color_speed);
	player_color_blue  = lerp(player_color_blue, 0, change_player_color_speed);
	player_color_red   = lerp(player_color_red, 255, change_player_color_speed);
	
    if (distance_to_point(global.checkpoint_x, global.checkpoint_y) <= 1)
    // if (point_distance(x, y, global.checkpoint_x, global.checkpoint_y) <= 1)
    {
        player_got_to_checkpoint = true;
        going_back_to_checkpoint = false;
        
        screen_shake(5, 10, true, true);
        
        h_speed               = 0;
        v_speed               = 0;
        jump_pressed          = 0;
        coyote_can_jump       = 0;
        jump_buffer_counter   = 0;
        can_jumper_dash_timer = 0;
        
        /*
            global.use_instance_deactivation = true;
            
            instance_activate_region(camera_get_view_x(global.current_camera) - obj_camera.instances_buffer,
                                     camera_get_view_y(global.current_camera) - obj_camera.instances_buffer,
                                     obj_camera.instances_buffer + (global.cam_width + obj_camera.instances_buffer),
                                     obj_camera.instances_buffer + (global.cam_height + obj_camera.instances_buffer),
                                     true);
        */
        
        player_state = free_state;
        
        exit;
    }
	
	/*
    	if (abs(x - global.checkpoint_x) < 5 && abs(y - global.checkpoint_y) < 5)
    	{
    		player_got_to_checkpoint = true;
    		going_back_to_checkpoint = false;
    		screen_shake(5, 10, true, true);
    		player_state = free_state;
    		
    		h_speed = 0;
    		v_speed = 0;
    		jump_pressed = 0;
    		coyote_can_jump = 0;
    		jump_buffer_counter = 0;
    		can_jumper_dash_timer = 0;
    		
    		global.use_instance_deactivation = true;
    	}
	*/
	
	if (going_back_to_checkpoint 
        && !player_got_to_checkpoint)
	{
		var dir = point_direction(x, y, global.checkpoint_x, global.checkpoint_y);
		x += (lengthdir_x(back_to_checkpoint_speed, dir));
		y += (lengthdir_y(back_to_checkpoint_speed, dir));
	}
}

// ROPE SWING STATE
grapple_x = 0;
grapple_y = 0;
rope_x = 0;
rope_y = 0;
rope_angle_vel = 0;
rope_angle = 0;
rope_length = 0;
rope_accel_rate = 0.2;
rope_manual_accel_rate = 0.07;

set_player_rope_momentum_timer = time_source_create(time_source_game,
	                                               0.3,
												   time_source_units_seconds,
												   function()
												   {
													   with (obj_player)
													   {
														   keep_rope_momentum = true;
														   player_state = free_state;
													   }
												   }, [], 1);

rope_swing_state = function()
{
    player_state_string = "rope_swing_state";

	PLAYER_get_collectable();
	PLAYER_get_dash_bonus_item();
	
	// going to the GOD MODE
	if (gamepad_button_check_pressed(global.gamepad_device, gp_select)
	    || keyboard_check_pressed(vk_f1))
	{
		xscale = 1;
		yscale = 1;
		player_state = god_mode_state;
	}
	
	// recovering dash
	if (can_dash <= 0)
	{
		can_dash = 1;
	}
	
	var rope_angle_accel = (-rope_accel_rate * dcos(rope_angle));
	rope_angle_accel += ((right - left) * rope_manual_accel_rate);
	rope_length += ((down - up));
	rope_length = max(rope_length, 65);
	rope_length = min(rope_length, 65);
	
	rope_angle_vel += rope_angle_accel;
	rope_angle += rope_angle_vel;
	rope_angle_vel *= 0.99;
	
	rope_x = grapple_x + lengthdir_x(rope_length, rope_angle);
	rope_y = grapple_y + lengthdir_y(rope_length, rope_angle);
	
	h_speed = rope_x - x;
	v_speed = rope_y - y;
	
	if (jump_pressed
	    && !instance_place(x, y, obj_rope))
	{
		if (!right && left)
		{
			global.player_momentum_x = -1;
			global.player_momentum_speed = 4;
			player_state = rope_momentum_state;
			time_source_start(set_player_rope_momentum_timer);
		}
		else if (right && !left)
		{
			global.player_momentum_x = 1;
			global.player_momentum_speed = 4;
			player_state = rope_momentum_state;
			time_source_start(set_player_rope_momentum_timer);
		}
		else if (!right && !left)
		{
			player_state = free_state;
		}
		
		/*
		h_speed = rope_angle_vel * 1.2;
		v_speed = -jump_speed;
		*/
		
		instance_create_depth(x, y, obj_player.depth + 1, obj_player_dash_boom_effect);
	}
	
	// going to the death state
	if (place_meeting(x, y, obj_death_collider))
	{
		screen_shake(5, 10, true, true);
		PLAYER_goto_death_state();
	}
	
	// horizontal collision
	repeat (abs(h_speed)) 
	{
		var sign_hspeed = sign(h_speed);
	
		if (place_meeting(x + sign_hspeed, y, obj_default_collider)) 
		{	
			if (player_state == rope_swing_state)
			{
				rope_angle = point_direction(grapple_x, grapple_y, x, y);
				rope_angle_vel = -rope_angle_vel;
			}
			
			h_speed = 0;
			break;
		} 
		else 
		{ 
			x += sign_hspeed;
			x = round(x);
		}
	}
	
	// vertical collision
	repeat (abs(v_speed)) 
	{
		var sign_vspeed = sign(v_speed);
	
		if (place_meeting(x, y + sign_vspeed, obj_default_collider)) 
		{	
			if (player_state == rope_swing_state)
			{
				rope_angle = point_direction(grapple_x, grapple_y, x, y);
				rope_angle_vel = -rope_angle_vel;
			}
			
			v_speed = 0;
			break;
		} 
		else 
		{
			y += sign_vspeed;
			y = round(y);
		}
	}
}

// FREE STATE
free_state = function()
{
    player_state_string = "free_state";

	PLAYER_handle_rope();
	// PLAYER_get_collectable();
	// PLAYER_get_dash_bonus_item();
	
	// crawling animation stuff
	if (on_floor && down && !left && !right && !up)
	{
		if (xscale < 1.5)
		{
			xscale = lerp(xscale, 1.7, 0.12); //0.17
		}
		if (yscale > 0.5)
		{
			yscale = lerp(yscale, 0.5, 0.12); // 0.17
		}
	}
	
	// under water testing
	/*
    	if (gamepad_button_check_pressed(global.gamepad_device, gp_face4)
    	    || keyboard_check_pressed(vk_space))
    	{
    		grav = under_water_grav_value;
    		player_state = under_water_state;
    	}
	*/
	
	// going to the GOD MODE
	if (gamepad_button_check_pressed(global.gamepad_device, gp_select)
	    || keyboard_check_pressed(vk_f1))
	{
		xscale = 1;
		yscale = 1;
		player_state = god_mode_state;
	}

	// momentum stuff
	if (keep_horizontal_jumper_momentum)
	{
		h_speed += (global.player_momentum_x * 0.23);
		
		global.player_momentum_speed -= 0.4;
		if (global.player_momentum_speed <= 0)
		{
			keep_horizontal_jumper_momentum = false;
		}
	}
	
	wall_jump_delay = max(wall_jump_delay - 1, 0);
	// wall_jump_delay = max(wall_jump_delay - global.delta, 0);
	
	if (wall_jump_delay == 0)
	{
		var hspeed_to = (((right - left) * walk_speed));
		if (on_floor)
		{
			default_accel = haccel;
		}
		else
		{
			default_accel = vaccel;
		}
		
		h_speed = lerp(h_speed, hspeed_to, default_accel);
		
		if (((left && !place_meeting(x - 1, y, obj_default_collider)) || (right && !place_meeting(x + 1, y, obj_default_collider))) 
		    && on_floor 
			&& !(left && right))
		{
			if (h_speed <= -1 || h_speed >= 1)
			{
				// player dust particles when walking
				walking_dust_particles_timer -= 1;
				// walking_dust_particles_timer -= global.delta;
				
				if (walking_dust_particles_timer <= 0)
				    // && !is_player_inside_destroy_block)
				{
					if (!place_meeting(x + 1, y, obj_jumper))
					{
						create_player_dust_particle(1, x, y, PLAYER_DUST_PARTICLES_LAYER, 
						                            choose(obj_player_dust_particle_1, 
													       obj_player_dust_particle_2));
					}
				
					walking_dust_particles_timer = walking_dust_particles_time_to_spawn;
				}
			}
		}
	}
	
	// player walking animation stuff
	if ((right ^^ left) && place_meeting(x, y + 1, obj_default_collider))
	{
		if (xscale < 1.5)
		{
			xscale = lerp(xscale, 1.7, player_anim_lerp); //0.17
		}
		if (yscale > 0.5)
		{
			yscale = lerp(yscale, 0.5, player_anim_lerp); // 0.17
		}
	}
	
	// WALL JUMP stuff
	if (!place_meeting(x, y + 1, obj_default_collider) 
	    && ((on_wall == 1 && right) || (on_wall == -1 && left)))
	{
		wall_timer = wall_jump_buffer;
		last_wall = on_wall;
		jumper_object_can_jump_release = true;
	}
	
	if (on_wall == 0 || !((on_wall == 1 && right) || (on_wall == -1 && left)))
	{
		if (wall_timer > 0)
		{
			wall_timer--;
			// wall_timer -= global.delta;
		}
	}
	
	// actual wall jump
	if (!place_meeting(x, y + 1, obj_default_collider) && jump_pressed
	    && ((on_wall == 1 && right) || (on_wall == -1 && left) || wall_timer))
	{
		wall_jump_delay = wall_jump_delay_max;
		h_speed = (-last_wall * wall_hspeed);
		v_speed = wall_vspeed;
		xscale = 0.6;
		yscale = 1.4;
		wall_timer = 0;
		
		var xx = x;
		if (last_wall == 1) // right wall
		{
			xx = (x + (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
			create_player_dust_particle(1, xx, (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), 
										PLAYER_DUST_PARTICLES_LAYER, choose(obj_player_dust_particle_1, obj_player_dust_particle_2),
										random_range(90, 180));
		}
		if (last_wall == -1) // left wall
		{
			xx = (x - (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
			create_player_dust_particle(1, xx, (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), 
										PLAYER_DUST_PARTICLES_LAYER, choose(obj_player_dust_particle_1, obj_player_dust_particle_2),
										random_range(0, 90));
		}
		
		audio_play_sound(snd_player_jump, 1, 0);
	}
	
	// wall sliding
	if (on_wall == 1 && right && v_speed >= 0
	    && !is_player_inside_destroy_block) // right
	{	
		if (can_reset_vspeed)
		{
			v_speed = 0.8;
			can_reset_vspeed = false;
		}
		
		if (v_speed < (wall_max_vspeed * 1.4))
		{
			v_speed += wall_grav;
		}
		
		if (v_speed >= 1.2)
		{
			walking_dust_particles_timer -= 1;
			if (walking_dust_particles_timer <= 0)
			{
				var xx = x;
				if (last_wall == 1) // right wall
				{
					xx = (x + (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
					create_player_dust_particle(1, xx, (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), 
												PLAYER_DUST_PARTICLES_LAYER, choose(obj_player_dust_particle_1, obj_player_dust_particle_2),
												random_range(90, 180));
				}
				if (last_wall == -1) // left wall
				{
					xx = (x - (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
					create_player_dust_particle(1, xx, (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), 
												PLAYER_DUST_PARTICLES_LAYER, choose(obj_player_dust_particle_1, obj_player_dust_particle_2),
												random_range(0, 90));
				}
				
				walking_dust_particles_timer = walking_dust_particles_time_to_spawn;
			}
		}
	}
	
	if (on_wall == 1 && right && v_speed < 0
	    && !is_player_inside_destroy_block) // right
	{
		if (v_speed < (jump_speed * 1.2))
		{
			v_speed += grav;
		}
		
		if (v_speed >= 1.2)
		{
			walking_dust_particles_timer -= 1;
			if (walking_dust_particles_timer <= 0
			    && !is_player_inside_destroy_block)
			{
				var xx = x;
				if (last_wall == 1) // right wall
				{
					xx = (x + (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
					create_player_dust_particle(1, xx, (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), 
												PLAYER_DUST_PARTICLES_LAYER, choose(obj_player_dust_particle_1, obj_player_dust_particle_2),
												random_range(90, 180));
				}
				if (last_wall == -1) // left wall
				{
					xx = (x - (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
					create_player_dust_particle(1, xx, (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), 
												PLAYER_DUST_PARTICLES_LAYER, choose(obj_player_dust_particle_1, obj_player_dust_particle_2),
												random_range(0, 90));
				}
				
				walking_dust_particles_timer = walking_dust_particles_time_to_spawn;
			}
		}
	}
	
	if (on_wall == -1 && left && v_speed >= 0
	    && !is_player_inside_destroy_block) // left
	{
		if (can_reset_vspeed)
		{
			v_speed = 0.8;
			can_reset_vspeed = false;
		}
		
		if (v_speed < (wall_max_vspeed * 1.2))
		{
			v_speed += wall_grav;
		}
		
		if (v_speed >= 1.2)
		{
			walking_dust_particles_timer -= 1;
			if (walking_dust_particles_timer <= 0
			    && !is_player_inside_destroy_block)
			{
				var xx = x;
				if (last_wall == 1) // right wall
				{
					xx = (x + (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
					create_player_dust_particle(1, xx, (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), 
												PLAYER_DUST_PARTICLES_LAYER, choose(obj_player_dust_particle_1, obj_player_dust_particle_2),
												random_range(90, 180));
				}
				if (last_wall == -1) // left wall
				{
					xx = (x - (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
					create_player_dust_particle(1, xx, (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), 
												PLAYER_DUST_PARTICLES_LAYER, choose(obj_player_dust_particle_1, obj_player_dust_particle_2),
												random_range(0, 90));
				}
				
				walking_dust_particles_timer = walking_dust_particles_time_to_spawn;
			}
		}
	}
	
	// falling
	if (on_wall == -1 && left && v_speed < 0) // left
	{
		if (v_speed < (jump_speed * 1.10)) // 1.4
		{
			v_speed += grav;
		}
	}
	
	if (on_wall != 0 && !left && !right)
	{
		can_reset_vspeed = true;
		if (v_speed < (jump_speed * 1.10)) // 1.4
		{
			v_speed += grav;
		}
	}
	
	if (on_wall == 0)
	{
		can_reset_vspeed = true;
		if (v_speed < (jump_speed * 1.10)) // 1.4
		{
			v_speed += grav;
		}
	}
	
	// player falling animation stuff
	if (!place_meeting(x, y + 1, obj_default_collider) && v_speed > 2.5)
	{
		if (on_wall == 1 && !right)
		{
			
			if (xscale > 0.7)
			{
				xscale = lerp(xscale, 0.7, player_anim_lerp); // 0.15
			}
			if (yscale < 1.4)
			{
				yscale = lerp(yscale, 1.4, player_anim_lerp); // 0.15
			}
		}
		
		if (on_wall == -1 && !left)
		{
			if (xscale > 0.7)
			{
				xscale = lerp(xscale, 0.7, player_anim_lerp); // 0.15
			}
			if (yscale < 1.4)
			{
				yscale = lerp(yscale, 1.4, player_anim_lerp); // 0.15
			}
		}
		
		if (on_wall == 0)
		{
			if (xscale > 0.7)
			{
				xscale = lerp(xscale, 0.7, player_anim_lerp); // 0.15
			}
			if (yscale < 1.4)
			{
				yscale = lerp(yscale, 1.4, player_anim_lerp); // 0.15
			}
		}
	}
	
	// @free_state dashing
	// && (left || right || down || up)
	if (dash_timer > 0)
	{
		dash_timer -= 1;
		// dash_timer -= global.delta;
	}
	
	if (can_jumper_dash_timer > 0)
	{
		can_jumper_dash_timer -= 1;
		// can_jumper_dash_timer -= global.delta;
	}
	
	/*
	&& !place_meeting(x, y + 1, obj_jumper)
	&& !place_meeting(x + sign(h_speed), y, obj_horizontal_jumper)
	*/
	if (can_dash > 0 
	    && can_jumper_dash_timer <= 0 
	    && dash_pressed 
	    && dash_timer <= 0 
	    && (left || right || down || up))
	{	
		// picking dash direction
		dash_dir = point_direction(0, 0, right-left, down-up);
		
		if (down && (left || right) && !up) // floor diagonal dashing
		{	
			if (!place_meeting(x - 1, y, obj_default_collider)
			    && !place_meeting(x + 1, y, obj_default_collider))
				{
					if (on_floor)
					{
						dash_dir = point_direction(0, 0, right-left, 0);
					}
					else
					{
						dash_dir = point_direction(0, 0, right-left, down-up);
					}
				}
		}
		
		if (up && (left || right) && !down) // roof diagonal dashing
		{
			if (!place_meeting(x - 1, y, obj_default_collider) 
			    && !place_meeting(x + 1, y, obj_default_collider))
				{
					if (place_meeting(x, y - 1, obj_default_collider))
					{
						dash_dir = point_direction(0, 0, right-left, 0);
					}
					else
					{
						dash_dir = point_direction(0, 0, right-left, down-up);
					}
				}
		}
		
		if (left && down && !right) // left-wall diagonal dashing
		{
			if (!on_floor)
			{
				if (place_meeting(x - 1, y, obj_default_collider))
				{
					dash_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					dash_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		if (left && up && !right) // left-wall diagonal dashing
		{
			if (!place_meeting(x, y - 1, obj_default_collider))
			{
				if (place_meeting(x - 1, y, obj_default_collider))
				{
					dash_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					dash_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		if (right && down && !left) // right-wall diagonal dashing
		{
			if (!on_floor)
			{
				if (place_meeting(x + 1, y, obj_default_collider))
				{
					dash_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					dash_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		if (right && up && !left) // right-wall diagonal dashing
		{
			if (!place_meeting(x, y - 1, obj_default_collider))
			{
				if (place_meeting(x + 1, y, obj_default_collider))
				{
					dash_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					dash_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		// not dashing
		if (left && right && !up && !down)
		{
			exit;
		}
		if (up && down && !left && !right)
		{
			exit;
		}
		if (left && right && down && on_floor)
		{
			exit;	
		}
		if (left && right && up && down)
		{
			exit;
		}
		
		if (on_floor)
		{
			dash_timer = time_to_dash;
		}
		else
		{
			dash_timer = 0;
		}
		
		coyote_can_jump = 0;
		dash_speed = (dash_dist / dash_time);
		dash_energy = dash_dist;
		
		// screen shake and player animation stuff
		if ((down || up) && !left && !right) // up or down (vertical)
		{
			xscale = 0.7;
			yscale = 1.3;
			screen_shake_dash(2, 7, false, true, (right - left), (down - up));
		}
		else if ((left || right) && !down && !up) // left or right (horizontal)
		{
			xscale = 1.2;
			yscale = 0.7;
			screen_shake_dash(2, 7, true, false, (right - left), (down - up));
		}
		else if ((down || up) && (left || right)) // diagonals
		{
			xscale = 1.2;
			yscale = 0.8;
			screen_shake_dash(2, 7, true, true, (right - left), (down - up));
		}
		else // any other situation
		{
			xscale = 1.2;
			yscale = 0.7;
			screen_shake_dash(2, 7, true, true, (right - left), (down - up));
		}
		
		audio_play_sound(choose(snd_redbooster_dash, snd_greenbooster_dash), 1, 0);
		can_spawn_dash_particles = true;
		can_disable_dash = true;
		instance_create_depth(x, y, depth + 1, obj_player_dash_boom_effect);
		
		player_state = dash_state;
	}
	
	// @free_state jumping
	if (jump_pressed && v_speed > 0)
	{
		jump_buffer_counter = jump_buffer_max;
	}
	
	if (coyote_can_jump-- > 0 && jump_pressed && v_speed > 0)
	{
		v_speed = -jump_speed;
		coyote_can_jump = 0;
		xscale = 0.6;
		yscale = 1.3;
		audio_play_sound(snd_player_jump, 1, 0);
		if (!place_meeting(x + 1, y, obj_jumper))
		{
			create_player_dust_particle(1, x, y, PLAYER_DUST_PARTICLES_LAYER, choose(obj_player_dust_particle_1, obj_player_dust_particle_2));
		}
		
		if (place_meeting(x, y + 1, obj_belt))
		{
			global.player_momentum_x = sign(h_speed);
		
			if (sign(h_speed) == global.player_belt_current_dir)
			{
				global.player_momentum_speed = 6;
			}
			else
			{
				global.player_momentum_speed = 2;
			}
			player_state = belt_momentum_state;
			time_source_start(set_player_belt_momentum_timer);
		}
	}
	
	if (jump_buffer_counter > 0)
	{
		jump_buffer_counter -= 1;
		// jump_buffer_counter -= global.delta;
		
		if ((place_meeting(x, y + 1, obj_default_collider) 
		     || place_meeting(x, y + 1, obj_slab_collider)) 
			 && v_speed > 0
			 && !place_meeting(x, y + 1, obj_jumper))
		{
			v_speed = -jump_speed;
			coyote_can_jump = 0;
			xscale = 0.6;
			yscale = 1.3;
			audio_play_sound(snd_player_jump, 1, 0);
			audio_play_sound(snd_player_default_land_5, 1, 0);
			
			if (!place_meeting(x + 1, y, obj_jumper))
			{
				create_player_dust_particle(1, x, y, PLAYER_DUST_PARTICLES_LAYER, choose(obj_player_dust_particle_1, obj_player_dust_particle_2));
			}
		}
	}
	
	// @free_state jump releasing
	if (!place_meeting(x, y + 1, obj_default_collider) 
	    && v_speed <= 0 
		&& jump_released
		&& jumper_object_can_jump_release)
	{
		v_speed *= 0.05;
	}
	
	// going to the death state
	if (place_meeting(x, y, obj_death_collider))
	{
		PLAYER_goto_death_state();
	}
	
	// @free_state collision 
	// horizontal collision
    repeat (abs(h_speed)) 
    {   
        PLAYER_get_collectable();
        PLAYER_get_dash_bonus_item();
        
        var sign_hspeed = sign(h_speed);
        
        PLAYER_handle_wall_dash_col_x_collision(sign_hspeed);
        
        if (place_meeting(x + sign_hspeed, y, obj_default_collider)) 
        {
            PLAYER_handle_checkpoint_setting();
            PLAYER_handle_destroy_block_x_collision(sign_hspeed);
            
            if (keep_horizontal_jumper_momentum)
            {
                keep_horizontal_jumper_momentum = false;
            }
            
            h_speed = 0;
            break;
        } 
        else 
        { 
            x += sign_hspeed;
            x = round(x);
        }
    }
	
    // vertical collision
    repeat (abs(v_speed)) 
    {   
        PLAYER_get_collectable();
        PLAYER_get_dash_bonus_item();
        
        var sign_vspeed = sign(v_speed);
        
        PLAYER_handle_wall_dash_col_y_collision(sign_vspeed);
        
        if (place_meeting(x, y + sign_vspeed, obj_default_collider)) 
        {
            PLAYER_handle_checkpoint_setting();
            PLAYER_handle_destroy_block_y_collision(sign_vspeed);
            
            if (v_speed > 0)
            {
                coyote_can_jump = jump_coyote_max;
                can_dash = 1;
            }
            
            v_speed = 0;
            break;
        }
        else 
        {
            y += sign_vspeed;
            y = round(y);
        }
    }
}

// UNDER WATER STATE
under_water_state = function()
{
    player_state_string = "under_water_state";

	// going back to free state
	if (gamepad_button_check_pressed(global.gamepad_device, gp_face4)
	    || keyboard_check_pressed(vk_space))
	{
		grav = original_grav_value;
		player_state = free_state;
	}
	
	var hspeed_to = ((right - left) * walk_speed);
	var vspeed_to = ((down - up) * walk_speed);
	default_accel = haccel;
	
	h_speed = lerp(h_speed, hspeed_to, default_accel);
	v_speed = lerp(v_speed, vspeed_to, default_accel);
	
	if ((right ^^ left) && place_meeting(x, y + 1, obj_default_collider))
	{
		if (xscale < 1.5)
		{
			xscale = lerp(xscale, 1.7, player_anim_lerp); //0.17
		}
		if (yscale > 0.5)
		{
			yscale = lerp(yscale, 0.5, player_anim_lerp); // 0.17s
		}
	}
	
	// falling
	if (v_speed < 1)
	{
		v_speed += grav;
	}
	
	// animating player falling
	if (!place_meeting(x, y + 1, obj_default_collider) && on_wall == 0 && v_speed > 2.5)
	{
		if (xscale > 0.7)
		{
			xscale = lerp(xscale, 0.7, player_anim_lerp); // 0.15
		}
		if (yscale < 1.4)
		{
			yscale = lerp(yscale, 1.4, player_anim_lerp); // 0.15
		}	
	}
	
	// going to the death state
	if (place_meeting(x, y, obj_death_collider))
	{
		screen_shake(5, 10, true, true);
		PLAYER_goto_death_state();
	}
	
	// horizontal collision
	repeat (abs(h_speed)) 
	{
		var sign_hspeed = sign(h_speed);
	
		if (place_meeting(x + sign_hspeed, y, obj_default_collider)) 
		{
			if (keep_horizontal_jumper_momentum)
			{
				keep_horizontal_jumper_momentum = false;	
			}
			
			h_speed = 0;
			break;
		} 
		else 
		{ 
			x += sign_hspeed;
			x = round(x);
		}
	}
	
	// vertical collision
	repeat (abs(v_speed)) 
	{
		var sign_vspeed = sign(v_speed);
	
		if (place_meeting(x, y + sign_vspeed, obj_default_collider)) 
		{
			if (v_speed > 0)
			{
				coyote_can_jump = jump_coyote_max;
				can_dash = 1;
			}
			
			v_speed = 0;
			break;
		} 
		else 
		{
			y += sign_vspeed;
			y = round(y);
		}
	}
}

// GOD MODE STATE
original_god_mode_movement_speed   = (walk_speed * 2);
god_mode_movement_speed            = original_god_mode_movement_speed;
god_mode_fast_movement_speed       = (god_mode_movement_speed * 2);
god_mode_ultra_fast_movement_speed = (god_mode_movement_speed * 5);

god_mode_state = function()
{
    player_state_string = "god_mode_state";

	// going back to free state
    if ((gamepad_button_check_pressed(global.gamepad_device, gp_select)
        || keyboard_check_pressed(vk_f1))
        && !instance_place(x, y, obj_default_collider)
        && !instance_place(x, y, obj_death_collider))
    {
        with (obj_camera)
        {
            new_cam_width  = VIEW_W;
            new_cam_height = VIEW_H;
        }
    
        god_mode_movement_speed = original_god_mode_movement_speed;
    
        // resetting camera position and size.
		global.camx = (global.cam_target.x - (global.cam_width/2));
				
        global.camy = ((global.cam_target.y - 
                       (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) 
                       - (global.cam_height/2));
        
        camera_set_view_pos(global.current_camera, global.camx, global.camy);
        camera_set_view_size(global.current_camera, VIEW_W, VIEW_H);
        
        global.use_instance_deactivation = true;
        player_state = free_state;
    }
	
    if (keyboard_check(vk_shift)
        || gamepad_button_check(global.gamepad_device, gp_shoulderrb)
        || gamepad_button_check(global.gamepad_device, gp_shoulderlb))
    {
        if (obj_camera.new_cam_width >= (VIEW_W * 3))
        {
            god_mode_movement_speed = god_mode_ultra_fast_movement_speed;
        }
        else
        {
            god_mode_movement_speed = god_mode_fast_movement_speed;
        }
        
        /*
            with (obj_camera)
            {
                camera_lerp = 0.1;
            }
        */
    }
    else
    {
        if (obj_camera.new_cam_width >= (VIEW_W * 3))
        {
            god_mode_movement_speed = god_mode_fast_movement_speed;
        }
        else
        {
            god_mode_movement_speed = original_god_mode_movement_speed;
        }
        
        /*
            with (obj_camera)
            {
                camera_lerp = original_camera_lerp;
            }
        */
    }
	
	var hspeed_to = lengthdir_x(god_mode_movement_speed, 
	                            point_direction(0, 0, right - left, down - up));
	                            
	var vspeed_to = lengthdir_y(god_mode_movement_speed, 
	                            point_direction(0, 0, right - left, down - up));
    			
	if (left && right && !up && !down)
	{
		hspeed_to = 0;
		vspeed_to = 0;
	}
	if (up && down && !left && !right)
	{
		hspeed_to = 0;
		vspeed_to = 0;
	}
	if (left && right && up && down)
	{
		hspeed_to = 0;
		vspeed_to = 0;
	}
	if (!left && !right && !up && !down)
	if (!left && !right && !up && !down)
	{
		hspeed_to = 0;
		vspeed_to = 0;
	}
	
	if (right || left || up || down)
	{
		// h_speed = hspeed_to;
		// v_speed = vspeed_to;	
		h_speed = lerp(h_speed, hspeed_to, 0.2);
		v_speed = lerp(v_speed, vspeed_to, 0.2);
	}
	else
	{
		h_speed = 0;
		v_speed = 0;
	}
	
	/*
	default_accel = vaccel;
	var hspeed_to = (((right - left) * god_mode_movement_speed));
	var vspeed_to = (((down - up)    * god_mode_movement_speed));
	h_speed = lerp(h_speed, hspeed_to, default_accel);
	v_speed = lerp(v_speed, vspeed_to, default_accel);
	*/
	
	/*
	if (right ^^ left)
	{
		if (xscale < 1.5)
		{
			xscale = lerp(xscale, 1.7, player_anim_lerp); //0.17
		}
		if (yscale > 0.5)
		{
			yscale = lerp(yscale, 0.5, player_anim_lerp); // 0.17
		}
	}
	
	if (down ^^ up)
	{
		if (xscale > 0.5)
		{
			xscale = lerp(xscale, 0.5, player_anim_lerp); //0.17
		}
		if (yscale < 1.5)
		{
			yscale = lerp(yscale, 1.7, player_anim_lerp); // 0.17
		}
	}
	*/
	
	repeat (abs(h_speed))
	{
		var sign_hspeed = sign(h_speed);
		x += sign_hspeed;
		x = round(x);
	}
	
	repeat (abs(v_speed))
	{
		var sign_vspeed = sign(v_speed);
		y += sign_vspeed;
		y = round(y);
	}
}


// PRE DIRECT STATE
// direct state stuff
can_disable_direct = false;
can_direct = 1;
direct_time = 8;
direct_dir = 0;
direct_speed = 0;
direct_energy = 0;
time_to_direct = 10;
direct_timer = time_to_direct;
direct_dist = 66;

player_on_direct_state = false;
is_in_timed_direct = false;

can_drop_direct = false;
timed_direct_timer = time_source_create(time_source_game,
				                        0.7,
										time_source_units_seconds,
										function()
										{
											can_drop_direct = true;
										}, [], 1);

can_enter_timed_direct = true;
can_enter_timed_direct_timer = time_source_create(time_source_game,
							                      3,
												  time_source_units_seconds,
												  function()
												  {
													  can_enter_timed_direct = true;
												  }, [], 1);

pre_direct_state = function()
{
    player_state_string = "pre_direct_state";

	xscale = 1;
	yscale = 1;
	h_speed = 0;
	v_speed = 0;
	jump_pressed = 0;
	coyote_can_jump = 0;
	jump_buffer_counter = 0;
	can_jumper_dash_timer = 0;
	
	// going to the GOD MODE
	if (gamepad_button_check_pressed(global.gamepad_device, gp_select)
	    || keyboard_check_pressed(vk_f1))
	{
		xscale = 1;
		yscale = 1;
		player_state = god_mode_state;
	}
	
	if (can_drop_direct && is_in_timed_direct)
	{
		can_enter_timed_direct = false;
		can_drop_direct = false;
		time_source_start(can_enter_timed_direct_timer);
		h_speed = 0;
		// v_speed = -4;
		v_speed = 0;
		player_state = free_state;
	}
	
	// going to the death state
	if (place_meeting(x, y, obj_death_collider))
	{
		screen_shake(5, 10, true, true);
		PLAYER_goto_death_state();
	}
	
	// @pre_direct_state dashing
	if (dash_pressed && (left || right || down || up))
	{
		
		// picking dash direction
		direct_dir = point_direction(0, 0, right-left, down-up);
		
		if (down && (left || right) && !up) // floor diagonal dashing
		{
			if (!place_meeting(x - 1, y, obj_default_collider)
				&& !place_meeting(x + 1, y, obj_default_collider))
				{
					if (on_floor)
					{
						direct_dir = point_direction(0, 0, right-left, 0);
					}
					else
					{
						direct_dir = point_direction(0, 0, right-left, down-up);
					}
				}
		}
		
		if (up && (left || right) && !down) // roof diagonal dashing
		{
			if (!place_meeting(x - 1, y, obj_default_collider) 
				&& !place_meeting(x + 1, y, obj_default_collider))
				{
					if (place_meeting(x, y - 1, obj_default_collider))
					{
						direct_dir = point_direction(0, 0, right-left, 0);
					}
					else
					{
						direct_dir = point_direction(0, 0, right-left, down-up);
					}
				}
		}
		
		if (left && down && !right) // left-wall diagonal dashing
		{
			if (!on_floor)
			{
				if (place_meeting(x - 1, y, obj_default_collider))
				{
					direct_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					direct_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		if (left && up && !right) // left-wall diagonal dashing
		{
			if (!place_meeting(x, y - 1, obj_default_collider))
			{
				if (place_meeting(x - 1, y, obj_default_collider))
				{
					direct_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					direct_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		if (right && down && !left) // right-wall diagonal dashing
		{
			if (!on_floor)
			{
				if (place_meeting(x + 1, y, obj_default_collider))
				{
					direct_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					direct_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		if (right && up && !left) // right-wall diagonal dashing
		{
			if (!place_meeting(x, y - 1, obj_default_collider))
			{
				if (place_meeting(x + 1, y, obj_default_collider))
				{
					direct_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					direct_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		// not dashing
		if (left && right && !up && !down)
		{
			exit;
		}
		if (up && down && !left && !right)
		{
			exit;
		}
		if (left && right && down && on_floor)
		{
			exit;	
		}
		if (left && right && up && down)
		{
			exit;
		}
			
		if (on_floor)
		{
			direct_timer = time_to_direct;
		}
		else
		{
			direct_timer = 0;
		}
		
		coyote_can_jump = 0;
		direct_speed = (direct_dist / direct_time);
		direct_energy = direct_dist;
		
		// screen shake and player animation stuff
		if ((down || up) && !left && !right) // up or down (vertical)
		{
			xscale = 0.7;
			yscale = 1.3;
			screen_shake(2, 7, false, true);
		}
		else if ((left || right) && !down && !up) // left or right (horizontal)
		{
			xscale = 1.2;
			yscale = 0.7;
			screen_shake(2, 7, true, false);
		}
		else if ((down || up) && (left || right)) // diagonals
		{
			xscale = 1.2;
			yscale = 0.8;
			screen_shake(2, 7, true, true);
		}
		else // any other situation
		{
			xscale = 1.2;
			yscale = 0.7;
			screen_shake(2, 7, true, true);
		}
		
		audio_play_sound(choose(snd_redbooster_dash, snd_greenbooster_dash), 1, 0);
		can_spawn_dash_particles = true;
		can_disable_direct = true;
		
		instance_destroy(obj_direct_feedback_arrow);
		
		if (can_dash <= 0)
		{
			can_dash = 1;
		}
		
		// reseting timed direct stuff
		time_source_stop(timed_direct_timer);
		time_source_stop(can_enter_timed_direct_timer);
		can_drop_direct = false;
		can_enter_timed_direct = true;
		
		instance_create_depth(x, y, obj_player.depth + 1, obj_player_dash_boom_effect);
		
		player_state = on_direct_state;
	}
}


// ON DIRECT STATE
on_direct_state = function()
{
    player_state_string = "on_direct_state";

	PLAYER_handle_rope();
	PLAYER_get_collectable();
	PLAYER_get_dash_bonus_item();
	
	if (can_disable_direct)
	{
		can_direct -= 1;
		can_disable_direct = false;
	}
	
	h_speed = lengthdir_x(direct_speed, direct_dir);
	v_speed = lengthdir_y(direct_speed, direct_dir);
	
	trail_timer--;
	// trail_timer -= global.delta;
	if (trail_timer <= 0)
	{
		/*
		with (instance_create_depth(x, y, depth + 1, obj_player_trail))
		{
			// sprite_index = other.sprite_index;
			sprite_index = spr_player_trail;
			// image_blend = make_color_rgb(180, 180, 0);
			image_blend = other.dash_particle_color;
			image_alpha = 0.7;
		}
		*/
		trail_timer = time_to_trail;
	}
	
	// horizontal collision
	repeat (abs(h_speed)) 
	{
		var sign_hspeed = sign(h_speed);
	
		if (place_meeting(x + sign_hspeed, y, obj_default_collider)) 
		{
			h_speed = 0;
			break;
		} 
		else 
		{ 
			x += sign_hspeed;
			x = round(x);
		}
	}

	// vertical collision
	repeat (abs(v_speed)) 
	{
		var sign_vspeed = sign(v_speed);
	
		if (place_meeting(x, y + sign_vspeed, obj_default_collider)) 
		{
			v_speed = 0;
			break;
		} 
		else 
		{ 
			y += sign_vspeed;
			y = round(y);
		}
	}
	
	// going to the death state
	if (place_meeting(x, y, obj_death_collider))
	{
		screen_shake(5, 10, true, true);
		PLAYER_goto_death_state();
	}
	
	// dash particles
	dash_particles_spawn_timer -= 1;
	if (dash_particles_spawn_timer <= 0)
	{
		var length = 10;
		var angle_diff = irandom_range(-30, 30);
		var xdiff = x + lengthdir_x(length, ((direction - 270) + angle_diff));
		var ydiff = (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) 
			        + lengthdir_y(length, angle_diff);
			
		create_player_dash_particle(3, xdiff, ydiff, layer_get_id(PLAYER_LAYER) + 1, 
						            choose(obj_player_dash_particle_1, 
											obj_player_dash_particle_2),
									0, 
									0, 
									dash_particle_color);
							  
		dash_particles_spawn_timer = dash_particles_time_to_spawn;
	}
	
	// stop dashing
	direct_energy -= direct_speed;
	if (direct_energy <= 0)
	{
		h_speed *= 0.8;
		v_speed *= 0.8;
		player_state = free_state;
	}
}


player_state = free_state;














