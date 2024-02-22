
has_paused = false;
has_unpaused = false;

particle_system = part_system_create_layer(layer, false);

particle = part_type_create();
part_type_sprite(particle, spr_pixel_particle, 0, 0, 0);
part_type_direction(particle, 0, 359, 0, 10);
part_type_speed(particle, 0.03, 0.1, 0, 0.05);
part_type_life(particle, 200, 350);
part_type_alpha3(particle, 0, 1, 0);
part_type_color1(particle, particle_color);

// 0.08
create_particles_timer = time_source_create(time_source_game,
                                            0.06,
											time_source_units_seconds,
											function()
											{
												part_particles_create(particle_system, 
							                                          random_range(global.camx - global.cam_width, (global.camx + global.cam_width) + global.cam_width), 
												                      random_range(global.camy - global.cam_height, (global.camy + global.cam_height) + global.cam_height),
												                      particle, 
												                      1);
												/*
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
																	  */
											}, [], -1);

time_source_start(create_particles_timer);