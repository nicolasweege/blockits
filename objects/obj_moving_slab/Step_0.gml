if (global.is_paused
    || global.console_enabled
	|| !global.player_can_move)
{
	exit;
}

if (!instance_exists(obj_player))
{
	exit;	
}

if (obj_player.player_state == obj_player.god_mode_state
    || obj_player.player_state == obj_player.death_state)
{
	exit;	
}

/*
if (obj_player.y > y) 
{
	sprite_index = -1;
}
else 
{
	sprite_index = spr_moving_slab;
}
*/

if (place_meeting(x, y - 1, obj_player)
    && obj_player.v_speed >= 0
    && !has_collided_with_player)
{
	current_speed = original_current_speed;
	has_collided_with_player = true;
}

h_speed = (hdir * current_speed);
v_speed = (vdir * current_speed);

#region COLLISION
repeat (abs(h_speed)) // horizontal collision
{
	var h_speed_sign = sign(h_speed);
	
	if (place_meeting(x + h_speed_sign, y, obj_platform_point)
	    || place_meeting(x + h_speed_sign, y, obj_default_collider))
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
		x = round(x);
		
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
		
		if (place_meeting(x, y - 1, obj_player))
		{
			with (obj_player)
			{	
				if (place_meeting(x, y + 1, obj_moving_slab))
				{
					// x += h_speed_sign;
					x += h_speed_sign;
				}
			}
		}
	}
}

/*
repeat (abs(v_speed)) // vertical collision
{
	var v_speed_sign = sign(v_speed);
	
	if (place_meeting(x, y + v_speed_sign, obj_platform_point)
	    || place_meeting(x, y + v_speed_sign, obj_default_collider))
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
*/
#endregion



