particle_system = part_system_create_layer(layer, false);

particle = part_type_create();
/*
part_type_shape(particle, pt_shape_pixel);
part_type_direction(particle, 0, 359, 0, 50);
part_type_speed(particle, 0.03, 0.1, 0, 0.05);
part_type_life(particle, 250, 250);
part_type_alpha3(particle, 0, 1, 0);
part_type_color1(particle, particle_color);
*/
// part_type_shape(particle, pt_shape_pixel);
part_type_sprite(particle, spr_pixel_particle_3, 1, 0, 1);
part_type_direction(particle, 270, 270, 0, 5);
part_type_speed(particle, 0.01, 0.1, 0.001, 0.05);
part_type_life(particle, 500, 500);
part_type_alpha3(particle, 0, 1, 0);
part_type_color1(particle, particle_color);

create_particles_timer = time_source_create(time_source_game,
                                            0.065, 
											time_source_units_seconds,
											function()
											{
												part_particles_create(particle_system, 
							                                          random_range(global.camx - (global.cam_width * 2), (global.camx + global.cam_width) + (global.cam_width * 2)), 
												                      random_range(global.camy - (global.cam_height * 2), (global.camy + global.cam_height) + (global.cam_height * 2)),
												                      particle, 
												                      1);
					  
												part_particles_create(particle_system, 
							                                          random_range(global.camx - (global.cam_width * 2), (global.camx + global.cam_width) + (global.cam_width * 2)), 
												                      random_range(global.camy - (global.cam_height * 2), (global.camy + global.cam_height) + (global.cam_height * 2)),
												                      particle, 
												                      1);
											}, [], -1);

time_source_start(create_particles_timer);