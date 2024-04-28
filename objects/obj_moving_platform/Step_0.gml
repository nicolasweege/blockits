if (global.app_state == states.PAUSE_MENU
    || global.app_state == states.EDITOR
	|| !global.player_can_move
	|| obj_player.player_state == obj_player.death_state)
{
	exit;
}

h_speed = (hdir * current_speed);
v_speed = (vdir * current_speed);

// COLLISION
repeat (abs(h_speed)) // horizontal collision
{
	var h_speed_sign = sign(h_speed);
	
	if (place_meeting(x + h_speed_sign, y, obj_platform_point))
	{
		hdir *= -1;
		h_speed = hdir;
		break;
	}
	else
	{
		// TODO: try to implement momentum to the player when jumping off the platform
		
		if (h_speed_sign > 0
		    && place_meeting(x - 1, y, obj_player))
			{
				with (obj_player)
				{
					x += h_speed_sign;
				}
			}
		
		if (h_speed_sign < 0
		    && place_meeting(x + 1, y, obj_player))
			{
				with (obj_player)
				{
					x += h_speed_sign;
				}
			}
		
		x += h_speed_sign;
		// x = round(x);
		
		if (h_speed_sign > 0
		    && place_meeting(x + 1, y, obj_player))
			{
				with (obj_player)
				{
					x += h_speed_sign;
				}
			}
			
		if (h_speed_sign < 0
			&& place_meeting(x - 1, y, obj_player))
			{
				with (obj_player)
				{
					x += h_speed_sign;
				}
			}
		
		with (obj_player)
		{	
			if (place_meeting(x, y + 1, obj_moving_platform))
			{
				// x += h_speed_sign;
				x += h_speed_sign;
			}
		}
	}
}

repeat (abs(v_speed)) // vertical collision
{
	var v_speed_sign = sign(v_speed);
	
	if (place_meeting(x, y + v_speed_sign, obj_platform_point))
	{
		vdir *= -1;
		v_speed = vdir;
		break;
	}
	else
	{
		if (!place_meeting(x, y + 1, obj_player))
		{
			with (obj_player)
			{
				if (place_meeting(x, y + 1, obj_moving_platform))
				{
					y += v_speed_sign;
				}
			}
		}
		
		// bouncing the player
		if (v_speed_sign != 0 && place_meeting(x, y + 1, obj_player))
		{
			with (obj_player)
			{
				if (player_state != free_state)
				{
					player_state = free_state;
				}
				
				// v_speed = 1;
			}
		}
		
		y += v_speed_sign;
		// y = round(y);
		
		if (v_speed_sign > 0
		    && place_meeting(x, y + 1, obj_player))
		{
			with (obj_player)
			{
				y += v_speed_sign;
			}
		}
	}
}




