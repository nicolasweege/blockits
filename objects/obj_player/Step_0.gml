update_player_inputs();

on_floor = place_meeting(x, y + 1, obj_default_collider);
on_right_wall = place_meeting(x + 1, y, obj_wall_collider);
on_left_wall = place_meeting(x - 1, y, obj_wall_collider);
on_normal_right_wall = place_meeting(x + 1, y, obj_default_collider);
on_normal_left_wall = place_meeting(x - 1, y, obj_default_collider);

if (on_floor) 
{
	jump_timer = jump_limit;
}

if (!on_floor && jump_timer > 0)
{
   	jump_timer--;
}

if (on_left_wall || on_right_wall) 
{
	last_wall = on_left_wall ? "left_wall" : "right_wall";
	wall_timer = wall_limit;
}

if (!on_left_wall && !on_right_wall && wall_timer > 0) 
{
	wall_timer--;
}

_h_speed = (right - left) * max_h_speed;



// updating the player's state
switch (player_state)
{
	case "idle":
	{	
		show_debug_message("state: " + player_state);
		
		h_speed = 0;
		v_speed = 0;
		
		// going to the falling state
		if (!on_floor && v_speed <= 0)
		{
			// v_speed += grav;
			player_state = "falling";
		}
		
		// going to the jumping state
		if (on_floor && jump)
		{
			jump_limit_pos = y - max_v_speed;
			player_state = "jumping";
		}
		
		// going to the walking state
		if ((on_left_wall || on_normal_left_wall) && right)
		{
			player_state = "walking";
		}
		if ((on_right_wall || on_normal_right_wall) && left)
		{
			player_state = "walking";
		}
		if (!on_left_wall && !on_right_wall && !on_normal_left_wall && !on_normal_right_wall && (left || right))
		{
			player_state = "walking";
		}
		
		// going to the death state
		if (place_meeting(x, y, obj_death_collider))
		{
			player_state = "death";
		}
		
		// should we implement "going to the sliding state"?
	} 
	break;
	
	case "walking":
	{
		show_debug_message("state: " + player_state);
		
		h_speed = lerp(h_speed, _h_speed, floor_accel);
		
		// going to the falling state
		if (!on_floor && !on_right_wall && !on_left_wall)
		{
			player_state = "falling";
		}
		
		// going to the jumping state
		if (jump && (on_floor || jump_timer))
		{
			jump_limit_pos = y - max_v_speed;
			player_state = "jumping";
		}
		
		// going to the idle state
		if (!right && !left && on_floor)
		{
			player_state = "idle";
		}
		if (on_floor && right && (on_right_wall || on_normal_right_wall))
		{
			player_state = "idle";
		}
		if (on_floor && left && (on_left_wall || on_normal_left_wall))
		{
			player_state = "idle";
		}
		
		// going to the death state
		if (place_meeting(x, y, obj_death_collider))
		{
			player_state = "death";
		}
	}
	break;
	
	case "jumping":
	{
		show_debug_message("state: " + player_state);
		
		h_speed = lerp(h_speed, _h_speed, floor_accel);
		
		if (y > jump_limit_pos)
		{
			v_speed = -max_v_speed;
			
			if (jump_r)
			{
				// v_speed *= .1;
				player_state = "falling";
			}
		}
		else 
		{
			player_state = "falling";
		}
		
		// going to the falling state
		if (v_speed >= 0 && !on_left_wall && !on_right_wall)
		{
			player_state = "falling";
		}
		
		// going to the sliding state
		if (v_speed == 0 && (on_left_wall || on_right_wall))
		{
			player_state = "sliding";
		}
		if (v_speed >= 0 && (on_left_wall || on_right_wall))
		{
			player_state = "sliding";
		}
	}
	break;
	
	case "falling":
	{
		show_debug_message("state: " + player_state);
		
		h_speed = lerp(h_speed, _h_speed, floor_accel);
		v_speed += grav;
		
		// going to the idle state
		if (on_floor && !right && !left)
		{
			player_state = "idle";
		}
		
		// going to the walking state if needed
		if (on_floor && (right || left))
		{
			player_state = "walking";	
		}
		
		// going to the sliding state
		if (!on_floor && (on_left_wall || on_right_wall))
		{
			player_state = "sliding";
		}
	}
	break;
	
	case "sliding":
	{
		show_debug_message("state: " + player_state);
		
		h_speed = lerp(h_speed, _h_speed, floor_accel);
		
		// sliding
		if (!on_floor && (on_left_wall || on_right_wall) && v_speed >= 0)
		{
			// v_speed += lerp(v_speed, slide, air_accel);
			v_speed += slide_speed;
		}
		
		if (!on_floor && (on_left_wall || on_right_wall) && v_speed < 0)
		{
			v_speed = 0;
		}
		
		show_debug_message("v_speed: " + string(v_speed));
		
		// left wall jump
		if (last_wall == "left_wall" && jump && !on_floor)
		{
			v_speed = -max_v_speed * .9;
			h_speed = max_h_speed * 2;
			// player_state = "jumping";
		}
	
		// right wall jump
		if (last_wall == "right_wall" && jump && !on_floor)
		{
			v_speed = -max_v_speed * .9;
			h_speed = -max_h_speed * 2;
			// player_state = "jumping";
		}
		
		// going to the falling state
		if (!on_floor && !on_left_wall && !on_right_wall)
		{
			player_state = "falling";
		}
		if (!on_floor && on_left_wall && right)
		{
			player_state = "falling";
		}
		if (!on_floor && on_right_wall && left)
		{
			player_state = "falling";
		}
		
		// going to the idle state
		if (on_floor && (on_left_wall || on_right_wall))
		{
			player_state = "idle";
		}
	}
	break;
	
	case "death":
	{
		show_debug_message("state: " + player_state);
		
		global.cam_target = noone;
		instance_destroy();
	
		if (can_create_death_par)
		{
			create_player_death_particle(90, true);
		}
	
		player_state = "back";
	}
	break;
	
	case "back":
	{
		show_debug_message("state: " + player_state);
	}
	break;
}



// horizontal collision
repeat (abs(h_speed)) 
{
	var sign_h_speed = sign(h_speed);
	
	/*
	// im probably going to use this code for some game feel stuff in the game
	// ramps collision
	if (place_meeting(x + sign_h_speed, y, obj_default_collider) && 
		!place_meeting(x + sign_h_speed, y - 1, obj_default_collider))
		{ 
			y--; 
		}
		
	if (!place_meeting(x + sign_h_speed, y, obj_default_collider) && 
		!place_meeting(x + sign_h_speed, y + 1, obj_default_collider) &&
		place_meeting(x + sign_h_speed, y + 2, obj_default_collider)) 
		{ 
			y++; 
		}
	*/
	
	// normal collision
	if (place_meeting(x + sign_h_speed, y, obj_default_collider)) 
	{
		h_speed = 0;
		break;
	} 
	else 
	{ 
		x += sign_h_speed; 
	}
}

// vertical collision
repeat (abs(v_speed)) 
{
	var sign_v_speed = sign(v_speed);
	
	// normal collision
	if (place_meeting(x, y + sign_v_speed, obj_default_collider)) 
	{
		v_speed = 0;
		break;
	} 
	else 
	{ 
		y += sign_v_speed; 
	}
}