particle_system = part_system_create_layer("Player", false);
particle = part_type_create();
emitter = part_emitter_create(particle_system);

particle_color = c_white;

part_type_shape(particle, pt_shape_pixel);
part_type_size(particle, 1, 1, 0, 0);
part_type_life(particle, 200, 200);
part_type_alpha3(particle, 1, 0.5, 0);
part_type_color1(particle, particle_color);

part_type_direction(particle, 90, 90, 0, 30);
part_type_speed(particle, 0.05, 0.1, 0, 0);

alarm_set(0, 1);