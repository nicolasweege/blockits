part_particles_create(particle_system, 
                      random_range(0, global.cam_width), 
					  random_range(0, global.cam_height), 
					  particle, 
					  1);
					  
alarm_set(1, 30);