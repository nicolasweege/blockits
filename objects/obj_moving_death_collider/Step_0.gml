if (global.is_paused
	|| !global.player_can_move
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
	
	if (place_meeting(x + h_speed_sign, y, obj_platform_point))
	{
		if (can_change_hdir)
		{
			time_source_start(change_hdir_timer);
			can_change_hdir = false;
		}
		
		h_speed = 0;
		break;
	}
	else
	{
		x += h_speed_sign;
	}
}

repeat (abs(v_speed)) // vertical collision
{
	var v_speed_sign = sign(v_speed);
	
	if (place_meeting(x, y + v_speed_sign, obj_platform_point))
	{
		if (can_change_vdir)
		{
			time_source_start(change_vdir_timer);
			can_change_vdir = false;
		}
		
		v_speed = 0;
		break;
	}
	else
	{
		y += v_speed_sign;
	}
}
#endregion




