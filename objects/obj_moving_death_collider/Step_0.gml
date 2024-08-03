if (global.app_state == states.PAUSE_MENU
    || global.app_state == states.EDITOR
    || !global.player_can_move
	|| obj_player.player_state == obj_player.death_state)
{
	if (!has_paused)
	{	
		if (time_source_get_state(change_hdir_timer) == time_source_state_active)
		{
			time_source_pause(change_hdir_timer);
		}
		if (time_source_get_state(change_vdir_timer) == time_source_state_active)
		{
			time_source_pause(change_vdir_timer);
		}
		
		has_paused   = true;
		has_unpaused = false;
	}
	
	exit;
}
else
{
	if (!has_unpaused)
	{	
		if (time_source_get_state(change_hdir_timer) == time_source_state_paused)
		{
			time_source_resume(change_hdir_timer);
		}
		if (time_source_get_state(change_vdir_timer) == time_source_state_paused)
		{
			time_source_resume(change_vdir_timer);
		}
		
		has_unpaused = true;
		has_paused   = false;
	}
}


h_speed = (hdir * current_speed);
v_speed = (vdir * current_speed);

if (place_meeting(x, y + 1, obj_platform_point)
    || place_meeting(x, y - 1, obj_platform_point))
{
	if (can_play_impact_audio)
	{
		// audio_play_sound(snd_debris_dirt_soft_01, 1, 0);
		can_play_impact_audio = false;
	}
}

if (!place_meeting(x, y + 1, obj_platform_point)
    && !place_meeting(x, y - 1, obj_platform_point))
{
	can_play_impact_audio = true;
}


// COLLISION
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
		x = round(x);
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
		y = round(y);
	}
}