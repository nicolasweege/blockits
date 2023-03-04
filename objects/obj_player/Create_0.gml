update_player_inputs();

grav = 0.25;
h_speed = 0;
v_speed = 0;
walk_speed = 2.5;
jump_speed = 4;
can_jump = 0;
jump_buffer_amount = 8;

haccel = 0.22;
vaccel = 0.1;

xscale = 1;
yscale = 1;
side_to_look = 1;
player_color = c_white;
can_create_death_par = true;
on_floor = false;

// dash
can_dash = false;
dash_dist = 50;
dash_time = 8;
dash_dir = 0;
dash_speed = 0;
dash_energy = 0;

// on wall
wall_grav = 0.1;
on_wall = 0;
wall_hspeed = 2;
wall_vspeed = -3.8;
wall_max_vspeed = 1;
wall_jump_delay = 0;
wall_jump_delay_max = 8;

wall_jump_buffer = 8;
wall_timer = 0;
last_wall = 0;

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
				can_dash = true;
			}
			
			v_speed = 0;
			break;
		} 
		else 
		{ 
			y += sign_vspeed; 
		}
	}
	
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

edge_state = function()
{
	if (jump_pressed)
	{
		v_speed = -jump_speed;
		player_state = free_state;
	}
}

free_state = function()
{
	// walking
	// hspeed_to = ((right - left) * walk_speed);
	// h_speed = lerp(h_speed, hspeed_to, 0.5);
	// h_speed = ((right- left) * walk_speed);
	
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
	
	// h_speed = ((right - left) * walk_speed);
	
	// falling
	/*
	if (!place_meeting(x, y + 1, obj_default_collider) && on_wall != 0)
	{
		if (v_speed > 0)
		{
			v_speed = lerp(v_speed, 1, 0.15);	
		}
		else
		{
			v_speed += grav;
		}
		
		// right
		if (on_wall == 1 && jump_pressed)
		{
			v_speed = -jump_speed;
			h_speed = -10;
		}
		
		// left
		if (on_wall == -1 && jump_pressed)
		{
			v_speed = -jump_speed;
			h_speed = 10;
		}
	}
	else
	{
		v_speed += grav;
	}
	*/
	
	
	
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
	var grav_final = grav;
	var max_vspeed_final = jump_speed;
	
	if (on_wall == 1 && v_speed > 0 && right) // right
	{
		grav_final = wall_grav;
		max_vspeed_final = wall_max_vspeed;
	}
	
	if (on_wall == -1 && v_speed > 0 && left) // left
	{
		grav_final = wall_grav;
		max_vspeed_final = wall_max_vspeed;
	}
	
	/*
	if (on_wall != 0 && v_speed > 0)
	{
		if (!right && !left)
		{
			grav_final = wall_grav;
			max_vspeed_final = wall_max_vspeed;
		}
		
		if (on_wall == 1 && right)
		{
			v_speed = 0;
		}
		if (on_wall == -1 && left)
		{
			v_speed = 0;
		}
		
		//
		grav_final = wall_grav;
		max_vspeed_final = wall_max_vspeed;
	}
	*/
	
	if (v_speed < (max_vspeed_final * 1.4))
	{
		v_speed += grav_final;
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
	
	/*
	if (v_speed < (jump_speed * 2))
	{
		v_speed += grav;
	}
	*/
	
	// dashing
	if (can_dash && dash_pressed && (left || right || down || up))
	{
		can_dash = false;
		can_jump = 0;
		dash_dir = point_direction(0, 0, right-left, down-up);
		dash_speed = (dash_dist / dash_time);
		dash_energy = dash_dist;
		
		xscale = 1.2;
		yscale = 0.5;
		screen_shake(1.5, 5);
		player_state = dash_state;
	}
	
	// jumping
	if (can_jump-- > 0 && jump_pressed)
	{
		v_speed = -jump_speed;
		can_jump = 0;
		xscale = 0.5;
		yscale = 1.5;
		create_player_dust_particle(1, x, y, layer, obj_player_dust_particle);
	}
	// jump releasing
	if (!place_meeting(x, y + 1, obj_default_collider) && v_speed <= 0 && jump_released)
	{
		v_speed *= 0.05;
	}
	
	// going to the death state
	if (place_meeting(x, y, obj_death_collider) || place_meeting(x, y, obj_spine))
	{
		player_state = death_state;
	}
	
	/*
	var at_ledge = false;
	var hwall;
	var ledge_above_or_below;
	*/
	
	// horizontal collision
	repeat (abs(h_speed)) 
	{
		var sign_hspeed = sign(h_speed);
	
		if (place_meeting(x + sign_hspeed, y, obj_default_collider)) 
		{
			/*
			hwall = instance_place(x + h_speed, y, obj_default_collider);
			if (!position_meeting((sign(h_speed) == 1) ? hwall.bbox_left : hwall.bbox_right, 
			                      hwall.bbox_top - 1, obj_default_collider))
			{
				at_ledge = true;
				ledge_above_or_below = sign(obj_player.bbox_top - hwall.bbox_top);
			}
			*/
			
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
				can_jump = jump_buffer_amount;
				can_dash = true;
			}
			
			v_speed = 0;
			break;
		} 
		else 
		{ 
			y += sign_vspeed; 
		}
	}
	
	/*
	if (at_ledge && (ledge_above_or_below != sign(obj_player.bbox_top - hwall.bbox_top)))
	{
		// y = hwall.bbox_top + sprite_get_yoffset(obj_player);
		y = hwall.bbox_top + (sprite_get_height(spr_player) / 2);
		player_state = edge_state;
	}
	*/
}

player_state = free_state;