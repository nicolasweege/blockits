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

if (obj_player.player_state == obj_player.god_mode_state)
{
	exit;
}


if (obj_player.y > y) 
{
	sprite_index = -1;
}
else 
{
	if (place_meeting(x, y - 1, obj_player) && !can_destroy)
	{
		can_destroy = true;
		time_source_start(destroy_timer);
	}
	else if (!can_destroy)
	{
		sprite_index = sprite_to_draw;
	}
}