if (global.app_state == states.PAUSE_MENU
    || global.app_state == states.EDITOR
    || obj_player.player_state == obj_player.death_state)
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

// landing
temp_on_floor = place_meeting(x, y + 1, obj_default_collider);
if (temp_on_floor && !on_floor && v_speed >= 0)
{
    if (use_falling)
    {
        // screen_shake(5, 10, true, true);
        screen_shake(15, 10, true, true);
        audio_play_sound(snd_debris_stone_soft_01, 1, false);
    }
}

on_floor = place_meeting(x, y + 1, obj_default_collider);



current_state();