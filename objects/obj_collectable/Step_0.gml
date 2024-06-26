if (global.app_state == states.PAUSE_MENU
    || global.app_state == states.EDITOR)
{
	if (!has_paused)
	{
		image_speed = 0;
		
		if (time_source_get_state(destroy_timer) == time_source_state_active)
		{
			time_source_pause(destroy_timer);
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
		image_speed = 1;
		
		if (time_source_get_state(destroy_timer) == time_source_state_paused)
		{
			time_source_resume(destroy_timer);
		}
		
		has_unpaused = true;
		has_paused = false;
	}
}

if (obj_player.player_state == obj_player.god_mode_state)
{
	exit;
}

update_player_inputs();

current_state();