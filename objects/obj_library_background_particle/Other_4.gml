repeat (game_get_speed(gamespeed_fps) * 10)
{	
	part_particles_create(particle_system, 
					      random_range(global.camx - (global.cam_width * 2), (global.camx + global.cam_width) + (global.cam_width * 2)), 
					      random_range(global.camy - (global.cam_height * 2), (global.camy + global.cam_height) + (global.cam_height * 2)),
					      particle, 
					      1);
}

repeat (game_get_speed(gamespeed_fps) * 10000)
{	
	part_system_update(particle_system);
}
