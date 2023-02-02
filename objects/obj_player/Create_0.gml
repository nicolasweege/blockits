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
				can_jump = 	jump_buffer_amount;
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