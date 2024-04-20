if (global.app_state == states.PAUSE_MENU)
{
	if (!has_paused)
	{
		image_speed = 0;
		
		if (time_source_get_state(destroy_timer) == time_source_state_active)
		{
			time_source_pause(destroy_timer);
		}
		if (time_source_get_state(showup_timer) == time_source_state_active)
		{
			time_source_pause(showup_timer);
		}
		if (time_source_get_state(shake_to_showup_timer) == time_source_state_active)
		{
			time_source_pause(shake_to_showup_timer);
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
		if (time_source_get_state(showup_timer) == time_source_state_paused)
		{
			time_source_resume(showup_timer);
		}
		if (time_source_get_state(shake_to_showup_timer) == time_source_state_paused)
		{
			time_source_resume(shake_to_showup_timer);
		}
		
		has_unpaused = true;
		has_paused = false;
	}
}

if ((place_meeting(x + 1, y, obj_player)
     || place_meeting(x - 1, y, obj_player)) 
    && !can_destroy
	&& obj_player.player_state != obj_player.death_state
	&& obj_player.player_state != obj_player.god_mode_state)
{
	can_destroy = true;
	image_speed = 1.5;
	time_source_start(destroy_timer);
}
else if (!can_destroy)
{
	sprite_index = sprite_to_draw;
	image_speed = 0;
	image_index = 0;
}