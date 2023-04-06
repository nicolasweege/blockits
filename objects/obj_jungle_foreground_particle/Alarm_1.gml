// TODO: make the particles work for all the levels
part_particles_create(particle_system, 
                      random_range(x - (global.cam_width / 2), x + (global.cam_width / 2)), 
					  random_range(y - (global.cam_height / 2), y + (global.cam_height / 2)),
					  particle, 
					  1);
					  
alarm_set(1, 15);