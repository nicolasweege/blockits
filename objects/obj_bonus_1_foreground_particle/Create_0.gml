
has_paused = false;
has_unpaused = false;

particle_system = part_system_create_layer(layer, false);

particle = part_type_create();
part_type_sprite(particle, spr_pixel_particle, 0, 0, 1);
part_type_speed(particle, 0, 0, 0, 0);
part_type_life(particle, 100, 200);
part_type_alpha3(particle, 0, 1, 0);
part_type_color1(particle, particle_color);
part_type_scale(particle, 13000, 1);

// 0.08
create_particles_timer = time_source_create(time_source_game,
                                            0.06,
											time_source_units_seconds,
											function()
											{
												part_type_color1(particle, choose(particle_color, particle_color_2));
												
												part_particles_create(particle_system, 
							                                          0, 
												                      random_range(global.camy - (global.cam_height * 2), (global.camy + global.cam_height) + (global.cam_height * 2)),
												                      particle, 
												                      1);
					  
												part_particles_create(particle_system, 
							                                          0, 
												                      random_range(global.camy - (global.cam_height * 2), (global.camy + global.cam_height) + (global.cam_height * 2)),
												                      particle, 
												                      1);
											}, [], -1);

time_source_start(create_particles_timer);