update_player_inputs();

grav = 0.4;
h_speed = 0;
v_speed = 0;
walk_speed = 2;
jump_speed = 4.8;
can_jump = 0;
jump_buffer_amount = 5;

xscale = 1;
player_color = c_white;
can_create_death_par = true;

// dash
can_dash = false;
dash_dist = 50;
dash_time = 8;
dash_dir = 0;
dash_speed = 0;
dash_energy = 0;

/*
floor_accel = .5;
air_accel = .2;
slide_speed = 0.1;
on_floor = false;
on_left_wall = false;
on_right_wall = false;
last_wall = 0;
wall_limit = 5;
wall_timer = 0;
jump_limit = 10;
jump_timer = 0;
*/

dash_state = function()
{
	h_speed = lengthdir_x(dash_speed, dash_dir);
	v_speed = lengthdir_y(dash_speed, dash_dir);
	
	// horizontal collision
	if (place_meeting(x + h_speed, y, obj_default_collider))
	{
		while (abs(h_speed) > 0.1)
		{
			h_speed *= 0.5;
			if (!place_meeting(x + h_speed, y, obj_default_collider))
			{
				x += h_speed;
			}
		}
		h_speed = 0;
	}
	x += h_speed;
	
	// vertical collision
	if (place_meeting(x, y + v_speed, obj_default_collider))
	{
		if (v_speed > 0)
		{
			can_jump = 	jump_buffer_amount;
			can_dash = true;
		}
		
		while (abs(v_speed) > 0.1)
		{
			v_speed *= 0.5;
			if (!place_meeting(x, y + v_speed, obj_default_collider))
			{
				y += v_speed;
			}
		}
		v_speed = 0;
	}
	y += v_speed;
	
	dash_energy -= dash_speed;
	if (dash_energy <= 0)
	{
		h_speed = 0;
		v_speed = 0;
		player_state = free_state;
	}
}

back_state = function()
{
	player_state = free_state;
}

death_state = function()
{		
	global.cam_target = noone;
	instance_destroy();
	
	if (can_create_death_par)
	{
		create_player_death_particle(90, true, xscale);
	}
	
	player_state = back_state;
}

free_state = function()
{
	// walking
	// hspeed_to = ((right - left) * walk_speed);
	// h_speed = lerp(h_speed, hspeed_to, 0.5);
	// h_speed = ((right- left) * walk_speed);
	
	h_speed = ((right - left) * walk_speed);
	
	// falling
	if (v_speed < (jump_speed * 2))
	{
		v_speed += grav;
	}
	
	// dashing
	if (can_dash && dash_pressed && (left || right))
	{
		can_dash = false;
		can_jump = 0;
		dash_dir = point_direction(0, 0, right-left, down-up);
		dash_speed = (dash_dist / dash_time);
		dash_energy = dash_dist;
		player_state = dash_state;
	}
	
	// jumping
	if (can_jump-- > 0 && jump_pressed)
	{
		v_speed = -jump_speed;
		can_jump = 0;
	}
	// jump releasing
	if (!place_meeting(x, y + 1, obj_default_collider) && v_speed <= 0 && jump_released)
	{
		v_speed *= 0.05;
	}
	
	// going to the death state
	if (place_meeting(x, y, obj_death_collider))
	{
		player_state = death_state;
	}
	
	// horizontal collision
	if (place_meeting(x + h_speed, y, obj_default_collider))
	{
		while (abs(h_speed) > 0.1)
		{
			h_speed *= 0.5;
			if (!place_meeting(x + h_speed, y, obj_default_collider))
			{
				x += h_speed;
			}
		}
		h_speed = 0;
	}
	x += h_speed;
	
	// vertical collision
	if (place_meeting(x, y + v_speed, obj_default_collider))
	{
		if (v_speed > 0)
		{
			can_jump = 	jump_buffer_amount;
			can_dash = true;
		}
		
		while (abs(v_speed) > 0.1)
		{
			v_speed *= 0.5;
			if (!place_meeting(x, y + v_speed, obj_default_collider))
			{
				y += v_speed;
			}
		}
		v_speed = 0;
	}
	y += v_speed;
}

player_state = free_state;