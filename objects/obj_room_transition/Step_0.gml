// @TODO @Incomplete: verify how the room transition object ends
// the transition, related to the player object.

// pausing
if (global.is_paused)
{
	if (!has_paused)
	{	
		if (time_source_get_state(transition_timer) == time_source_state_active)
		{
			time_source_pause(transition_timer);
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
		if (time_source_get_state(transition_timer) == time_source_state_paused)
		{
			time_source_resume(transition_timer);
		}
		
		has_unpaused = true;
		has_paused = false;
	}
}


if (fade_in && alpha < 1)
{
	alpha += transition_speed;
}

if (alpha >= 1 && fade_in)
{
	time_source_start(transition_timer);
	fade_in = false;
}

if (fade_out && alpha > 0)
{
	alpha -= transition_speed;
}

if (fade_out && alpha <= 0)
{
	// layer_set_visible("player", true);
	// global.player_input_enable = true;
	instance_destroy();
}