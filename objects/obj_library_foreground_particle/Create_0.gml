
has_paused = false;
has_unpaused = false;

particle_system = part_system_create_layer(layer, false);

particle = part_type_create();
part_type_sprite(particle, spr_pixel_particle_4, 1, 0, 1);
part_type_direction(particle, 225, 270, -0.01, 20);
part_type_speed(particle, 0.05, 0.05, 0.001, 0);
part_type_life(particle, 600, 600);
part_type_alpha3(particle, 1, 1, 0);
part_type_color1(particle, particle_color);

/*
repeat (game_get_speed(gamespeed_fps) * 2)
{	
	part_particles_create(particle_system, 
					      random_range(global.camx - (global.cam_width * 2), (global.camx + global.cam_width) + (global.cam_width * 2)), 
					      random_range(global.camy - (global.cam_height * 2), (global.camy + global.cam_height) + (global.cam_height * 2)),
					      particle, 
					      1);
}

repeat (game_get_speed(gamespeed_fps) * 2)
{	
	part_system_update(particle_system);
}
*/

create_particles_timer = time_source_create(time_source_game,
                                            2, 
											time_source_units_seconds,
											function()
											{
												part_particles_create(particle_system, random_range(x - 10, x + 10), y, particle, 1);
												/*
												part_particles_create(particle_system, 
							                                          random_range(global.camx - (global.cam_width * 2), (global.camx + global.cam_width) + (global.cam_width * 2)), 
												                      random_range(global.camy - (global.cam_height * 2), (global.camy + global.cam_height) + (global.cam_height * 2)),
												                      particle, 
												                      1);
																	  */
											}, [], -1);

time_source_start(create_particles_timer);