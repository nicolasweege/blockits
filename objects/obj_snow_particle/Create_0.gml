particle_system = part_system_create_layer(layer, false);

snow_particle = part_type_create();
part_type_sprite(snow_particle, spr_pixel_particle, 0, 0, 0);
// part_type_shape(snow_particle, pt_shape_square);
// part_type_size(snow_particle, 0.01, 0.01, 0, 0);
part_type_speed(snow_particle, 0.4, 0.6, 0, 0);
part_type_direction(snow_particle, 270, 270, 0, 15);
part_type_life(snow_particle, 150, 150);
part_type_alpha3(snow_particle, 1, 0.5, 0.1);
part_type_color1(snow_particle, particle_color);

snow_emitter = part_emitter_create(particle_system);
/*
part_emitter_region(particle_system, snow_emitter, 
                    0, global.cam_width, 
					0 - 50, global.cam_height,
					ps_shape_rectangle, ps_distr_linear);
*/
part_emitter_region(particle_system, snow_emitter, 
                    obj_player.x - (global.cam_width / 2), obj_player.x + (global.cam_width / 2), 
					obj_player.y - (global.cam_width / 2), obj_player.y + (global.cam_width / 2),
					ps_shape_rectangle, ps_distr_linear);
					
part_emitter_stream(particle_system, snow_emitter, snow_particle, 1);