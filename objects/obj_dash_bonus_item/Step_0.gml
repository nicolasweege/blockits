if (global.is_paused)
{
	if (!has_paused)
	{
		image_speed = 0;
		
		if (time_source_get_state(showup_timer) == time_source_state_active)
		{
			time_source_pause(showup_timer);
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
		
		if (time_source_get_state(showup_timer) == time_source_state_paused)
		{
			time_source_resume(showup_timer);	
		}
		
		has_unpaused = true;
		has_paused = false;
	}
}

current_state();