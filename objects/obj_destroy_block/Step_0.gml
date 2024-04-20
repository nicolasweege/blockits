if (global.app_state == states.PAUSE_MENU)
{
	if (!has_paused)
	{
		image_speed = 0;
		
		if (time_source_get_state(time_togo_default_state) == time_source_state_active)
		{
			time_source_pause(time_togo_default_state);
		}
		
		has_paused = true;
		has_unpaused = false;
	}
	
	exit;
}
else
{
	if (!has_unpaused)
	{
		image_speed = original_image_speed;
		
		if (time_source_get_state(time_togo_default_state) == time_source_state_paused)
		{
			time_source_resume(time_togo_default_state);
		}
		
		has_unpaused = true;
		has_paused = false;
	}
}

if (obj_player.player_state == obj_player.god_mode_state)
{
	exit;
}


current_state();