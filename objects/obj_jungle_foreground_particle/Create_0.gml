particle_system = part_system_create_layer(layer, false);

particle = part_type_create();

// part_type_sprite(particle, spr_pixel_particle, false, false, false);
part_type_shape(particle, pt_shape_pixel);
part_type_direction(particle, 0, 359, 0.5, 50);
// part_type_speed(particle, 0, 0.15, 0, 0);
part_type_speed(particle, 0.03, 0.1, 0, 0.05);

part_type_life(particle, 250, 250);
part_type_alpha3(particle, 0, 1, 0);
part_type_color1(particle, particle_color);

alarm_set(1, 1);