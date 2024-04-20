if (global.app_state == states.PAUSE_MENU
    || !global.player_can_move)
{
	if (!has_paused)
	{
		part_system_automatic_update(particle_system, false);
		
		if (time_source_get_state(create_particles_timer) == time_source_state_active)
		{
			time_source_pause(create_particles_timer);
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
		part_system_automatic_update(particle_system, true);

		if (time_source_get_state(create_particles_timer) == time_source_state_paused)
		{
			time_source_resume(create_particles_timer);
		}
		
		has_unpaused = true;
		has_paused = false;
	}
}