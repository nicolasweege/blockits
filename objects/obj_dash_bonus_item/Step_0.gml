if (global.is_paused)
{
	image_speed = 0;
	
	if (time_source_get_state(showup_timer) == time_source_state_active)
	{
		time_source_pause(showup_timer);
	}
	
	exit;
}
else
{
	image_speed = original_image_speed;
	
	if (time_source_get_state(showup_timer) == time_source_state_paused)
	{
		time_source_resume(showup_timer);	
	}
}

current_state();