if (global.is_paused)
{
	part_system_automatic_update(particle_system, false);
	if (time_source_get_state(create_particles_timer) != time_source_state_paused)
	{
		time_source_pause(create_particles_timer);
	}
	exit;
}

part_system_automatic_update(particle_system, true);

if (time_source_get_state(create_particles_timer) == time_source_state_paused)
{
	time_source_resume(create_particles_timer);
}