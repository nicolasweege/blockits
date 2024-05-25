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
		
		if (time_source_get_state(time_togo_default_state) == time_source_state_active)
		{
			time_source_pause(time_togo_default_state);
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
		image_speed = original_image_speed;
		
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
        
		if (time_source_get_state(time_togo_default_state) == time_source_state_paused)
		{
			time_source_resume(time_togo_default_state);
		}
		
		has_unpaused = true;
		has_paused   = false;
	}
}

if (obj_player.player_state == obj_player.god_mode_state)
{
	exit;
}

if ((place_meeting(x, y - 1, obj_player) 
     || place_meeting(x + 1, y, obj_player)
	 || place_meeting(x - 1, y, obj_player)) 
    && !can_destroy
	&& obj_player.player_state != obj_player.death_state
	&& obj_player.player_state != obj_player.god_mode_state)
{
	can_destroy = true;
	// image_speed = 1;
	time_source_start(destroy_timer);
}
else if (!can_destroy)
{
	sprite_index = current_sprite_to_draw;
	image_speed  = 0;
	image_index  = 0;
}

current_state();