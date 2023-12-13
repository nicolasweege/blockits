if (global.is_paused)
{
	if (!has_paused)
	{
		image_speed = 0;
		has_paused = true;
		has_unpaused = false;
	}
	
	if (time_source_get_state(destroy_timer) == time_source_state_active)
	{
		time_source_pause(destroy_timer);
	}
	
	exit;
}
else
{
	if (!has_unpaused)
	{
		image_speed = original_image_speed;
		has_unpaused = true;
		has_paused = false;
	}
	
	if (time_source_get_state(destroy_timer) == time_source_state_paused)
	{
		time_source_resume(destroy_timer);
	}
}

if (obj_player.player_state == obj_player.god_mode_state)
{
	exit;
}

update_player_inputs();

current_state();