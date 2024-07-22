
has_paused = false;
has_unpaused = false;

particle_system = part_system_create_layer(layer, false);

particle = part_type_create();
/*
part_type_sprite(particle, spr_pixel_particle, 0, 0, 1);
part_type_direction(particle, 0, 0, 0, 0);
part_type_speed(particle, 0.1, 0.3, 0.01, 0);
part_type_life(particle, 500, 500);
part_type_alpha3(particle, 0, 1, 0);
part_type_color1(particle, particle_color);
part_type_scale(particle, 2000, 1);
*/

part_type_sprite(particle, spr_pixel_particle, 0, 0, 1);
// part_type_sprite(particle, spr_pixel_particle_5, true, true, 0);
part_type_speed(particle, 0, 0, 0, 0);
part_type_life(particle, 100, 200);
// part_type_life(particle, 30, 30);
part_type_alpha3(particle, 0, 1, 0);
part_type_color1(particle, particle_color);
part_type_scale(particle, 13000, 1);

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
                                            0.01, // 0.05
											time_source_units_seconds,
											function()
											{
												part_type_color1(particle, choose(particle_color, particle_color_2));
												
												part_particles_create(particle_system, 
							                                          0, 
												                      round(random_range(global.camy - (global.cam_height * 2), (global.camy + global.cam_height) + (global.cam_height * 2))),
												                      particle, 
												                      1);
					  
												part_particles_create(particle_system, 
							                                          0, 
												                      round(random_range(global.camy - (global.cam_height * 2), (global.camy + global.cam_height) + (global.cam_height * 2))),
												                      particle, 
												                      1);
											}, [], -1);

time_source_start(create_particles_timer)