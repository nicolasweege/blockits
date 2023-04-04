if (instance_exists(obj_player))
{
	part_emitter_burst(particle_system, emitter, particle, 1);
}

alarm_set(0, 25);