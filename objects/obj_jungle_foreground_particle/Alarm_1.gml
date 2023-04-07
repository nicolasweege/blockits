// TODO: make the particles work for all the levels
/*
part_particles_create(particle_system, 
                      random_range(x, x + global.cam_width), 
					  random_range(y, y + global.cam_height),
					  particle, 
					  1);
					  */
					  
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
					  
alarm_set(1, 15);