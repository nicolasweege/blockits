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
		x += h_speed_sign;
		// x = round(x);
	}
}

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
		y += v_speed_sign;
	}
}
#endregion




