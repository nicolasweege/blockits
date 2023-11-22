/*
repeat (game_get_speed(gamespeed_fps) * 10)
{
	part_particles_create(particle_system, 
	                      random_range(global.camx - global.cam_width, (global.camx + global.cam_width) + global.cam_width), 
	                      random_range(global.camy - global.cam_height, (global.camy + global.cam_height) + global.cam_height),
	                      particle, 
	                      1);
					  
	part_particles_create(particle_system, 
						  random_range(global.camx - global.cam_width, (global.camx + global.cam_width) + global.cam_width), 
						  random_range(global.camy - global.cam_height, (global.camy + global.cam_height) + global.cam_height),
						  particle, 
						  1);
}

repeat (game_get_speed(gamespeed_fps) * 10)
{						  
	part_system_update(particle_system);
}
*/