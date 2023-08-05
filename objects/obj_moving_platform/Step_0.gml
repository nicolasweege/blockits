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

if (instance_exists(obj_player))
{
	if (obj_player.player_state == obj_player.god_mode_state)
	{
		exit;
	}
}

// TODO: fix the death collision bug when the platform is moving in diagonal

h_speed = (hdir * current_speed);
v_speed = (vdir * current_speed);


/*
// stand up the platform (player em cima da platadorma)
if (place_meeting(x, y - 1, obj_player))
{
	with (obj_player)
	{
		// dying
		if (other.vdir < 0 && place_meeting(x, y - 1, obj_default_collider))
		{
			player_state = death_state;
		}
	}
}

// bouncing the player when colliding in the bottom of the platform
if (vdir < 0 && place_meeting(x, y + 1, obj_player))
{
	with (obj_player)
	{
		player_state = free_state;
		v_speed = 1;
	}
}

// lateral x axis collision in the oposite side of the platform's direction
if (hdir > 0 && place_meeting(x - 1, y, obj_player))
{
	with (obj_player)
	{
		// player_state = free_state;
		// h_speed = -3;
		x += sign(other.h_speed);
	}
}
if (hdir < 0 && place_meeting(x + 1, y, obj_player))
{
	with (obj_player)
	{
		// player_state = free_state;
		// h_speed = 3;
		x += sign(other.h_speed);
	}
}

// vertical death collision (player ta em baixo da plataforma)
if (place_meeting(x, y + 1, obj_player))
{
	with (obj_player)
	{
		// dying
		if (other.vdir > 0 && place_meeting(x, y + 1, obj_default_collider))
		{
			player_state = death_state;
		}
		
		// y += other.v_speed;
	}
}

// lateral death collision
if (place_meeting(x + sign(h_speed), y, obj_player))
{
	with (obj_player)
	{	
		// dying
		if (other.hdir < 0 && place_meeting(x - 1, y, obj_default_collider))
		{
			player_state = death_state;
		}
		if (other.hdir > 0 && place_meeting(x + 1, y, obj_default_collider))
		{
			player_state = death_state;
		}
		
		x += sign(other.h_speed);
	}
}
*/

repeat (abs(h_speed))
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
		x += h_speed_sign;	
		x = round(x);
	}
	
	with (obj_player)
	{
		if (player_state == free_state
		    || player_state == dash_state)
		{
			// TODO: try to implement momentum to the player when jumping off the platform
			// if (player_moving_platform_mode)
			// (place_meeting(x, y + 1, obj_moving_platform))
			if (player_moving_platform_mode)
			{
				if (jump_pressed 
				    && place_meeting(x, y + 1, obj_moving_platform)
					&& can_start_moving_platform_timer)
				{
					time_source_start(player_moving_platform_mode_timer);
					can_start_moving_platform_timer = false;
				}
				
				// walk_speed = other.current_speed;
				if (other.hdir < 0)
				{
					if (right)
					{
						h_speed = (other.h_speed * -1);
					}
				}
				if (other.hdir > 0)
				{
					if (left)
					{
						h_speed = (other.h_speed * -1);
					}
				}
			
				x += h_speed_sign;
			}
		
			if (place_meeting(x + h_speed_sign, y, obj_moving_platform)
			    && !place_meeting(x, y + 1, obj_moving_platform))
			{
				x += h_speed_sign;
			}
		}
	}
}

repeat (abs(v_speed))
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
		y += v_speed_sign;
		y = round(y);
	}
	
	with (obj_player)
	{
		if (player_state == free_state
		    || player_state = dash_state)
		{
			if (player_moving_platform_mode)
			{
				y += v_speed_sign;
			}
		}
	}
}




