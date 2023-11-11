
#region THINGS WE DO WHEN INITIALIZING THE GAME (YES, WE DO IT IN THE PLAYER OBJECT)
/*
if (!instance_exists(obj_player_eye))
{
	instance_create_depth(x, 
	                      y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2),
						  depth + 1, obj_player_eye);	
}
*/

// discord weird stuff
if (!instance_exists(objNekoPresenceDemo))
{
	instance_create_layer(0, 0, "controllers", objNekoPresenceDemo);	
}

if (!instance_exists(obj_game_controller))
{
	instance_create_layer(0, 0, "controllers", obj_game_controller);	
}

if (!instance_exists(obj_camera))
{
	instance_create_layer(0, 0, "camera", obj_camera);
}

/*
if (!instance_exists(obj_console))
{
	instance_create_layer(0, 0, "controllers", obj_console);
}
*/

if (!instance_exists(obj_dash_bonus_light))
{
	// instance_create_layer(0, 0, layer + 1, obj_dash_bonus_light);
	instance_create_depth(0, 0, depth + 1, obj_dash_bonus_light);
}

if (global.checkpoint_id == noone)
{
	global.checkpoint_x = obj_player_creator.x;
	global.checkpoint_y = obj_player_creator.y;
}
#endregion

update_player_inputs();

#region GENERAL VARIABLES
// speed
original_grav_value = 0.23;
under_water_grav_value = 0.15;
grav = original_grav_value;
h_speed = 0;
v_speed = 0;
original_walk_speed = 2.4;
walk_speed = original_walk_speed;
haccel = 0.24;
vaccel = 0.19;

// jump
jump_speed = 4;
coyote_can_jump = 0;
jump_coyote_max = 8;
jump_buffer_counter = 0;
jump_buffer_max = 8;
jumper_object_can_jump_release = true;

// color
player_color = c_white;
player_color_red = 255;
player_color_green = 255;
player_color_blue = 255;

// dash
can_disable_dash = false;
can_dash = 1;
// dash_dist = 35;
dash_dist = 35;
// dash_time = 8;
dash_time = 8;
dash_dir = 0;
dash_speed = 0;
dash_energy = 0;
time_to_dash = 10;
dash_timer = time_to_dash;

// dash trail
trail_timer = 0;
time_to_trail = 1.5;

// on wall
wall_grav = 0.1;
on_wall = 0;
// wall_hspeed = 2.5;
wall_hspeed = 2.8;
wall_vspeed = -4.2;
wall_max_vspeed = 1;
wall_jump_delay = 0;
wall_jump_delay_max = 3.5;

wall_jump_buffer = 10;
wall_timer = 0;
last_wall = 0;

// misc
xscale = 1;
yscale = 1;
side_to_look = 1;
can_create_death_par = true;
on_floor = false;
on_roof = false;
temp_on_floor = false;
can_reset_vspeed = false;
change_player_color_speed = 0.15;
player_anim_lerp = 0.08;
player_eye_rot = 5;

/*
player_moving_platform_mode = false;
can_start_moving_platform_timer = true;
player_moving_platform_mode_timer = time_source_create(time_source_game,
                                                       1,
													   time_source_units_seconds,
													   function()
													   {
														   player_moving_platform_mode = false;
														   can_start_moving_platform_timer = true;
													   }, [], 1);
*/

// dust particles
walking_dust_particles_time_to_spawn = 10;
walking_dust_particles_timer = walking_dust_particles_time_to_spawn;


#region dash particle system
can_spawn_dash_particles = false;

dash_particle_system = part_system_create_layer(layer_get_id(PLAYER_LAYER_NAME) + 1, false);
dash_particles_time_to_spawn = 2;
dash_particles_spawn_timer = dash_particles_time_to_spawn;

// particles
dash_particle = part_type_create();
dash_particle_color = make_color_rgb(255, 255, 50);

part_type_sprite(dash_particle, spr_pixel_particle, false, false, false);
part_type_life(dash_particle, 40, 50);
part_type_alpha3(dash_particle, 0.8, 1, 0);
part_type_color1(dash_particle, dash_particle_color);

// part_type_direction(dash_particle, 225, 315, 1, 30);
part_type_speed(dash_particle, 0.1, 0.006, 0, 0);
#endregion

#endregion

// <---------------------------------> STATES <--------------------------------->
#region ON_MAIN_MENU_STATE
on_main_menu_state = function()
{
	// do nothing
}
#endregion

#region DASH STATE
dash_state = function()
{
	if (can_disable_dash)
	{
		can_dash -= 1;
		can_disable_dash = false;
	}
	
	h_speed = lengthdir_x(dash_speed, dash_dir);
	v_speed = lengthdir_y(dash_speed, dash_dir);
	
	// trail_timer--;
	trail_timer -= global.delta;
	if (trail_timer <= 0)
	{
		with (instance_create_depth(x, y, depth + 1, obj_player_trail))
		{
			sprite_index = other.sprite_index;
			image_blend = make_color_rgb(180, 180, 0);
			image_alpha = 0.7;
		}
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
	if (place_meeting(x, y, obj_death_collider) || place_meeting(x, y, obj_spine))
	{
		screen_shake(5, 10, true, true);
		PLAYER_goto_death_state();
	}
	
	#region dash particles
	
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
			var angle_diff = random_range(-30, 30);
			var xdiff = x + lengthdir_x(length, ((dash_dir - 180) + angle_diff));
			var ydiff = (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) 
			            + lengthdir_y(length, ((dash_dir - 180) + angle_diff));

			part_type_direction(dash_particle, dash_dir, dash_dir, 0, 10);

			part_particles_create(dash_particle_system, 
							      xdiff, 
								  ydiff, 
								  dash_particle, 
								  1);
							  
			dash_particles_spawn_timer = dash_particles_time_to_spawn;
		}
	}
	
	#endregion
	
	// stop dashing
	dash_energy -= dash_speed;
	if (dash_energy <= 0)
	{
		h_speed *= 0.8;
		v_speed *= 0.8;
		player_state = free_state;
	}
}
#endregion

#region HORIZONTAL JUMPER MOMENTUM STATE
keep_horizontal_jumper_momentum = false;

lock_state = function()
{
	/*
	var hspeed_to = (global.player_momentum_x * global.player_momentum_speed);
	h_speed = lerp(h_speed, hspeed_to, default_accel);
	*/
	
	// h_speed = (global.player_momentum_x * (global.player_momentum_speed);
	h_speed = ((global.player_momentum_x * (global.player_momentum_speed * 1.1)) * 0.99);
	
	/*
	if (h_speed > walk_speed)
	{
		h_speed -= (0.1 * global.delta);
		global.player_momentum_speed -= (0.1 * global.delta);
	}
	*/
	
	
	
	if (v_speed < (jump_speed * 1.10)) // 1.4
	{
		v_speed += grav;
	}
	
	// going to the death state
	if (place_meeting(x, y, obj_death_collider) || place_meeting(x, y, obj_spine))
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
#endregion

#region ROPE MOMENTUM STATE
keep_rope_momentum = false;

rope_momentum_state = function()
{	
	// h_speed = (global.player_momentum_x * (global.player_momentum_speed);
	h_speed = ((global.player_momentum_x * (global.player_momentum_speed * 1.1)) * 0.99);
	
	if (v_speed < (jump_speed * 1.10)) // 1.4
	{
		v_speed += grav;
	}
	
	// dashing
	if (can_dash > 0 && dash_pressed && dash_timer <= 0 && (left || right || down || up))
	{
		#region // picking dash direction
		
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
		
		#endregion
		
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
	if (place_meeting(x, y, obj_death_collider) || place_meeting(x, y, obj_spine))
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
#endregion

#region DEATH STATE

back_to_checkpoint_speed = 7;

player_got_to_checkpoint  = false;
going_back_to_checkpoint = false;
can_create_death_transition = true;

going_back_to_checkpoint_timer = time_source_create(time_source_game,
				                                    0.6,
													time_source_units_seconds,
													function()
													{
														going_back_to_checkpoint = true;
													}, [], 1);

death_state = function()
{
	/*
	if (going_back_to_checkpoint
	    && can_create_death_transition)
	{
		instance_create_layer(0,
	                          0,
				              "controllers",
						      obj_death_transition);
		
		going_back_to_checkpoint = false;
		can_create_death_transition = false;
	}
	
	player_color_green = lerp(player_color_green, 100, change_player_color_speed);
	player_color_blue = lerp(player_color_blue, 100, change_player_color_speed);
	player_color_red = lerp(player_color_red, 255, change_player_color_speed);
	
	h_speed = h_speed * 0.99;
	v_speed = v_speed * 0.99;
	*/
	
	/*
	// h_speed = lerp(h_speed, (sign(h_speed) * walk_speed) , default_accel);
	
	if (v_speed < (jump_speed * 1.10)) // 1.4
	{
		v_speed += grav;
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
	*/
	
	
	// going to the GOD MODE
	if (gamepad_button_check_pressed(global.device, gp_select)
	    || keyboard_check_pressed(vk_alt))
	{
		xscale = 1;
		yscale = 1;
		player_state = god_mode_state;
	}
	
	if (keep_horizontal_jumper_momentum)
	{
		keep_horizontal_jumper_momentum = false;
	}
	
	player_color_green = lerp(player_color_green, 0, change_player_color_speed);
	player_color_blue = lerp(player_color_blue, 0, change_player_color_speed);
	player_color_red = lerp(player_color_red, 100, change_player_color_speed);
	
	if (going_back_to_checkpoint 
	    && !player_got_to_checkpoint)
		{
			var dir = point_direction(x, y, global.checkpoint_x, global.checkpoint_y);
			x += (lengthdir_x(back_to_checkpoint_speed, dir));
			y += (lengthdir_y(back_to_checkpoint_speed, dir));
			
			player_color_green = lerp(player_color_green, 50, change_player_color_speed);
			player_color_blue = lerp(player_color_blue, 50, change_player_color_speed);
			player_color_red = lerp(player_color_red, 50, change_player_color_speed);
		}
	
	
	if (abs(x - global.checkpoint_x) < 5 && abs(y - global.checkpoint_y) < 5)
	{
		going_back_to_checkpoint = false;
		screen_shake(5, 10, true, true);
		player_state = free_state;
	}
	
}
#endregion

#region ROPE SWING STATE
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
		
		if (can_dash <= 0)
		{
			can_dash = 1;
		}
	}
	
	// going to the death state
	if (place_meeting(x, y, obj_death_collider) || place_meeting(x, y, obj_spine))
	{
		screen_shake(5, 10, true, true);
		PLAYER_goto_death_state();
	}
	
	// horizontal collision
	repeat (abs(h_speed * global.delta)) 
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
	repeat (abs(v_speed * global.delta)) 
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
#endregion

#region FREE STATE
free_state = function()
{
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
	if (gamepad_button_check_pressed(global.device, gp_face4)
	    || keyboard_check_pressed(vk_space))
	{
		grav = under_water_grav_value;
		player_state = under_water_state;
	}
	*/
	
	// going to the GOD MODE
	if (gamepad_button_check_pressed(global.device, gp_select)
	    || keyboard_check_pressed(vk_alt))
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
	
	// wall_jump_delay = max(wall_jump_delay - 1, 0);
	wall_jump_delay = max(wall_jump_delay - global.delta, 0);
	
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
		
		/*
		if (right || left)
		{
			if (abs(h_speed) > walk_speed)
			{
				// h_speed = hspeed_to;
				h_speed = lerp(h_speed, hspeed_to, 0.25);
			}
			else
			{
				if (on_floor)
				{
					h_speed += (hspeed_to * 0.2);
				}
				else
				{
					h_speed += (hspeed_to * 0.2);
				}
			}
		}
		
		
		if ((!right && !left) || on_wall != 0)
		{
			if (on_floor)
			{
				if (h_speed < 0)
				{
					h_speed += (0.1 * walk_speed);
					if (h_speed > 0)
					{
						h_speed = 0;
					}
				}
				else if (h_speed > 0)
				{
					h_speed -= (0.1 * walk_speed);
					if (h_speed < 0)
					{
						h_speed = 0;	
					}
				}	
			}
			else
			{
				if (h_speed < 0)
				{
					h_speed += (0.1 * walk_speed);
					if (h_speed > 0)
					{
						h_speed = 0;
					}
				}
				else if (h_speed > 0)
				{
					h_speed -= (0.1 * walk_speed);
					if (h_speed < 0)
					{
						h_speed = 0;	
					}
				}
			}
		}
		*/
		
		if (((left && !place_meeting(x - 1, y, obj_default_collider)) || (right && !place_meeting(x + 1, y, obj_default_collider))) 
		    && on_floor 
			&& !(left && right))
		{
			if (h_speed <= -1 || h_speed >= 1)
			{
				// player dust particles when walking
				// walking_dust_particles_timer -= 1;
				walking_dust_particles_timer -= global.delta;
				if (walking_dust_particles_timer <= 0)
				{
					create_player_dust_particle(1, x, y, global.player_dust_particles_layer, 
					                            choose(obj_player_dust_particle_1, 
												       obj_player_dust_particle_2));
				
					walking_dust_particles_timer = walking_dust_particles_time_to_spawn;
				}
			}
		}
	}
	
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
	
	// wall jump
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
			// wall_timer--;
			wall_timer -= global.delta;
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
		}
		if (last_wall == -1) // left wall
		{
			xx = (x - (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
		}
		
		create_player_dust_particle(1, xx, (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), 
									global.player_dust_particles_layer, choose(obj_player_dust_particle_1, obj_player_dust_particle_2),
									random_range(90, 180));
									
		audio_play_sound(snd_player_jump, 1, 0);
	}
	
	// wall sliding
	if (on_wall == 1 && right && v_speed >= 0) // right
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
				}
				if (last_wall == -1) // left wall
				{
					xx = (x - (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
				}
		
				create_player_dust_particle(1, xx, (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), 
											global.player_dust_particles_layer, choose(obj_player_dust_particle_1, obj_player_dust_particle_2),
											random_range(90, 180));
				
				walking_dust_particles_timer = walking_dust_particles_time_to_spawn;
			}
		}
	}
	
	if (on_wall == 1 && right && v_speed < 0) // right
	{
		if (v_speed < (jump_speed * 1.2))
		{
			v_speed += grav;
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
				}
				if (last_wall == -1) // left wall
				{
					xx = (x - (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
				}
		
				create_player_dust_particle(1, xx, (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), 
											global.player_dust_particles_layer, choose(obj_player_dust_particle_1, obj_player_dust_particle_2),
											random_range(90, 180));
				
				walking_dust_particles_timer = walking_dust_particles_time_to_spawn;
			}
		}
	}
	
	if (on_wall == -1 && left && v_speed >= 0) // left
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
			if (walking_dust_particles_timer <= 0)
			{
				var xx = x;
				if (last_wall == 1) // right wall
				{
					xx = (x + (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
				}
				if (last_wall == -1) // left wall
				{
					xx = (x - (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
				}
		
				create_player_dust_particle(1, xx, (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), 
											global.player_dust_particles_layer, choose(obj_player_dust_particle_1, obj_player_dust_particle_2),
											random_range(90, 180));
				
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
	
	// animating player falling
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
	
	// dashing
	// && (left || right || down || up)
	if (dash_timer > 0)
	{
		// dash_timer -= 1;
		dash_timer -= global.delta;
	}
	
	if (can_dash > 0 && dash_pressed && dash_timer <= 0 && (left || right || down || up))
	{
		#region // picking dash direction
		
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
		
		#endregion
		
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
		
		// dashing animation test
		// instance_create_depth(x, y, layer - 1, obj_player_dash_boom_anim);
		
		player_state = dash_state;
	}
	
	// jumping
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
		create_player_dust_particle(1, x, y, global.player_dust_particles_layer, choose(obj_player_dust_particle_1, obj_player_dust_particle_2));
	}
	
	if (jump_buffer_counter > 0)
	{
		// jump_buffer_counter -= 1;
		jump_buffer_counter -= global.delta;
		
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
			create_player_dust_particle(1, x, y, global.player_dust_particles_layer, choose(obj_player_dust_particle_1, obj_player_dust_particle_2));
		}
	}
	
	// jump releasing
	if (!place_meeting(x, y + 1, obj_default_collider) 
	    && v_speed <= 0 
		&& jump_released
		&& jumper_object_can_jump_release)
	{
		v_speed *= 0.05;
	}
	
	// going to the death state
	if (place_meeting(x, y, obj_death_collider) || place_meeting(x, y, obj_spine))
	{
		screen_shake(5, 10, true, true);
		PLAYER_goto_death_state();
	}
	
	// horizontal collision
	repeat (abs(h_speed * global.delta)) 
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
	repeat (abs(v_speed * global.delta)) 
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
#endregion

#region UNDER WATER STATE
under_water_state = function()
{
	// going back to free state
	if (gamepad_button_check_pressed(global.device, gp_face4)
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
	if (place_meeting(x, y, obj_death_collider) || place_meeting(x, y, obj_spine))
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
#endregion

#region GOD MODE STATE
original_god_mode_movement_speed = (walk_speed * 2);
god_mode_movement_speed = original_god_mode_movement_speed;
god_mode_fast_movement_speed = (god_mode_movement_speed * 2);

god_mode_state = function()
{
	// going back to free state
	if ((gamepad_button_check_pressed(global.device, gp_select)
	    || keyboard_check_pressed(vk_alt))
		&& !instance_place(x, y, obj_default_collider)
		&& !instance_place(x, y, obj_death_collider))
	{
		player_state = free_state;
	}
	
	if (keyboard_check(vk_shift)
	    || gamepad_button_check(global.device, gp_shoulderrb)
		|| gamepad_button_check(global.device, gp_shoulderlb))
	{
		god_mode_movement_speed = god_mode_fast_movement_speed;
		with (obj_camera)
		{
			camera_lerp = 0.1;
		}
	}
	else
	{
		god_mode_movement_speed = original_god_mode_movement_speed;
		with (obj_camera)
		{
			camera_lerp = original_camera_lerp;
		}
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
#endregion

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

#region PRE DIRECT STATE
pre_direct_state = function()
{
	xscale = 1;
	yscale = 1;
	
	// going to the death state
	if (place_meeting(x, y, obj_death_collider) || place_meeting(x, y, obj_spine))
	{
		screen_shake(5, 10, true, true);
		PLAYER_goto_death_state();
	}
	
	if (dash_pressed && (left || right || down || up))
	{
		
		#region // picking dash direction
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
		#endregion
			
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
		
		#region screen shake and player animation stuff
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
		#endregion
		
		audio_play_sound(choose(snd_redbooster_dash, snd_greenbooster_dash), 1, 0);
		can_spawn_dash_particles = true;
		can_disable_direct = true;
		
		if (instance_exists(obj_direct_feedback_arrow))
		{
			instance_destroy(obj_direct_feedback_arrow);	
		}
		
		if (can_dash <= 0)
		{
			can_dash = 1;
		}
		
		player_state = on_direct_state;
	}
}
#endregion

#region ON DIRECT STATE
on_direct_state = function()
{
	if (can_disable_direct)
	{
		can_direct -= 1;
		can_disable_direct = false;
	}
	
	h_speed = lengthdir_x(direct_speed, direct_dir);
	v_speed = lengthdir_y(direct_speed, direct_dir);
	
	// trail_timer--;
	trail_timer -= global.delta;
	if (trail_timer <= 0)
	{
		with (instance_create_depth(x, y, depth + 1, obj_player_trail))
		{
			sprite_index = other.sprite_index;
			image_blend = make_color_rgb(180, 180, 0);
			image_alpha = 0.7;
		}
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
	if (place_meeting(x, y, obj_death_collider) || place_meeting(x, y, obj_spine))
	{
		screen_shake(5, 10, true, true);
		PLAYER_goto_death_state();
	}
	
	#region dash particles
	
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
			var angle_diff = random_range(-30, 30);
			var xdiff = x + lengthdir_x(length, ((direct_dir - 180) + angle_diff));
			var ydiff = (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) 
					    + lengthdir_y(length, ((direct_dir - 180) + angle_diff));

			part_type_direction(dash_particle, direct_dir, direct_dir, 0, 10);

			part_particles_create(dash_particle_system, 
									xdiff, 
									ydiff, 
									dash_particle, 
									1);
							  
			dash_particles_spawn_timer = dash_particles_time_to_spawn;
		}
	}
	
	#endregion
	
	// stop dashing
	direct_energy -= direct_speed;
	if (direct_energy <= 0)
	{
		h_speed *= 0.8;
		v_speed *= 0.8;
		player_state = free_state;
	}
}
#endregion

player_state = free_state;














