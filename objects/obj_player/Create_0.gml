if (!instance_exists(obj_game_controller))
{
	instance_create_layer(0, 0, "controllers", obj_game_controller);	
}

if (!instance_exists(obj_camera))
{
	instance_create_layer(0, 0, "camera", obj_camera);
}

if (!instance_exists(obj_console))
{
	instance_create_layer(0, 0, "controllers", obj_console);
}


update_player_inputs();

// speed
grav = 0.25;
h_speed = 0;
v_speed = 0;
walk_speed = 2.4;
haccel = 0.24;

// jump
jump_speed = 4;
coyote_can_jump = 0;
jump_coyote_max = 8;
jump_buffer_counter = 0;
jump_buffer_max = 8;

// color
player_color = c_white;
player_color_red = 255;
player_color_green = 255;
player_color_blue = 255;

// dash
can_disable_dash = false;
can_dash = 1;
// can_dash_amount = 1;
dash_dist = 35;
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
wall_hspeed = 2.5;
wall_vspeed = -3.8;
wall_max_vspeed = 1;
wall_jump_delay = 0;
wall_jump_delay_max = 7;

wall_jump_buffer = 10;
wall_timer = 0;
last_wall = 0;

// misc
xscale = 1;
yscale = 1;
side_to_look = 1;
can_create_death_par = true;
on_floor = false;

can_reset_vspeed = false;
change_player_color_speed = 0.15;


// STATES

dash_state = function()
{
	if (can_disable_dash)
	{
		can_dash -= 1;
		can_disable_dash = false;
	}
	
	h_speed = lengthdir_x(dash_speed, dash_dir);
	v_speed = lengthdir_y(dash_speed, dash_dir);
	
	trail_timer--;
	if (trail_timer <= 0)
	{
		with (instance_create_depth(x, y, depth + 1, obj_player_trail))
		{
			sprite_index = other.sprite_index;
			image_blend = c_fuchsia;
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
		}
	}

	// vertical collision
	repeat (abs(v_speed)) 
	{
		var sign_vspeed = sign(v_speed);
	
		if (place_meeting(x, y + sign_vspeed, obj_default_collider)) 
		{
			/*
			if (v_speed > 0)
			{
				can_jump = jump_buffer_amount;
				// can_dash = true;
			}
			*/
			
			v_speed = 0;
			break;
		} 
		else 
		{ 
			y += sign_vspeed;
		}
	}
	
	// going to the death state
	if (place_meeting(x, y, obj_death_collider) || place_meeting(x, y, obj_spine))
	{
		player_state = death_state;
	}
	
	dash_energy -= dash_speed;
	if (dash_energy <= 0)
	{
		h_speed *= 0.8;
		v_speed *= 0.8;
		player_state = free_state;
	}
}

back_state = function()
{
	player_state = free_state;
}

death_state = function()
{
	// global.cam_target = noone;
	global.cam_target = obj_player_death_par;
	instance_destroy();
	
	if (can_create_death_par)
	{
		create_player_death_particle(90, true, xscale);
	}
	
	player_state = back_state;
}

free_state = function()
{
	wall_jump_delay = max(wall_jump_delay - 1, 0);
	
	if (wall_jump_delay == 0)
	{
		// h_speed = ((right - left) * walk_speed);
		var hspeed_to = ((right - left) * walk_speed);
		h_speed = lerp(h_speed, hspeed_to, haccel);
	}
	
	if ((right ^^ left) && place_meeting(x, y + 1, obj_default_collider))
	{
		if (xscale < 1.5)
		{
			xscale = lerp(xscale, 1.5, 0.15);
		}
		if (yscale > 0.5)
		{
			yscale = lerp(yscale, 0.5, 0.15);
		}
	}
	
	// wall jump
	if (!place_meeting(x, y + 1, obj_default_collider) && on_wall != 0)
	{
		wall_timer = wall_jump_buffer;
		last_wall = on_wall;
	}
	
	if (on_wall == 0)
	{
		if (wall_timer > 0)
		{
			wall_timer--;
		}
	}
	
	// actual wall jump
	if (!place_meeting(x, y + 1, obj_default_collider) && (on_wall != 0 || wall_timer) && jump_pressed)
	{
		wall_jump_delay = wall_jump_delay_max;
		h_speed = -last_wall * wall_hspeed;
		v_speed = wall_vspeed;
		xscale = 0.5;
		yscale = 1.5;
		
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
									layer - 1, obj_player_dust_particle,
									random_range(90, 180));
	}
	
	// wall sliding and falling
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
	}
	
	if (on_wall == 1 && right && v_speed < 0) // right
	{
		if (v_speed < (jump_speed * 1.2))
		{
			v_speed += grav;
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
	}
	
	if (on_wall == -1 && left && v_speed < 0) // left
	{
		if (v_speed < (jump_speed * 1.4))
		{
			v_speed += grav;
		}
	}
	
	if (on_wall != 0 && !left && !right)
	{
		can_reset_vspeed = true;
		if (v_speed < (jump_speed * 1.4))
		{
			v_speed += grav;
		}
	}
	
	if (on_wall == 0)
	{
		can_reset_vspeed = true;
		if (v_speed < (jump_speed * 1.4))
		{
			v_speed += grav;
		}
	}
	
	// animating player falling
	if (!place_meeting(x, y + 1, obj_default_collider) && on_wall == 0 && v_speed > 3)
	{
		if (xscale > 0.7)
		{
			xscale = lerp(xscale, 0.7, 0.15);
		}
		if (yscale < 1.4)
		{
			yscale = lerp(yscale, 1.4, 0.15);
		}	
	}
	
	// dashing
	// && (left || right || down || up)
	if (dash_timer > 0)
	{
		dash_timer -= 1;
	}
	
	if (can_dash > 0 && dash_pressed && dash_timer <= 0 && (left || right || down || up))
	{
		if (on_floor)
		{
			dash_timer = time_to_dash;
		}
		else
		{
			dash_timer = 0;	
		}
		
		// can_dash -= 1;
		coyote_can_jump = 0;
		dash_dir = point_direction(0, 0, right-left, down-up);
		dash_speed = (dash_dist / dash_time);
		dash_energy = dash_dist;
		
		if ((down || up) && !left && !right) // up or down (vertical)
		{
			xscale = 0.5;
			yscale = 1.3;
			// screen_shake(2, 7, false, true);
		}
		else if ((left || right) && !down && !up) // left or right (horizontal)
		{
			xscale = 1.2;
			yscale = 0.5;
			// screen_shake(2, 7, true, false);
		}
		else if ((down || up) && (left || right)) // diagonals
		{
			xscale = 1.2;
			yscale = 0.5;
			// screen_shake(2, 7, true, true);
		}
		else
		{
			xscale = 1.2;
			yscale = 0.5;
			// screen_shake(2, 7, true, true);
		}
		
		audio_play_sound(choose(snd_redbooster_dash, snd_greenbooster_dash), 1, 0);
		instance_create_depth(0, 0, layer, obj_player_trail_particles);
		can_disable_dash = true;
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
		xscale = 0.5;
		yscale = 1.5;
		create_player_dust_particle(1, x, y, layer, obj_player_dust_particle);
	}
	
	if (jump_buffer_counter > 0)
	{
		jump_buffer_counter -= 1;
		
		if ((place_meeting(x, y + 1, obj_default_collider) 
		     || place_meeting(x, y + 1, obj_slab_collider)) 
			 && v_speed > 0)
		{
			v_speed = -jump_speed;
			coyote_can_jump = 0;
			xscale = 0.5;
			yscale = 1.5;
			create_player_dust_particle(1, x, y, layer, obj_player_dust_particle);
		}
	}
	
	// jump releasing
	if (!place_meeting(x, y + 1, obj_default_collider) && v_speed <= 0 && jump_released)
	{
		v_speed *= 0.05;
	}
	
	// going to the death state
	if (place_meeting(x, y, obj_death_collider) || place_meeting(x, y, obj_spine))
	{
		screen_shake(5, 10, true, true);
		player_state = death_state;
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
		}
	}
}

player_state = free_state;