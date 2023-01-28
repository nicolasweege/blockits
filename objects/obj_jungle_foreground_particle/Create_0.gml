particle_system = part_system_create_layer(layer_to_display, false);

particle = part_type_create();

part_type_sprite(particle, spr_pixel_particle, false, false, false);
part_type_life(particle, 250, 250);
part_type_alpha3(particle, 0, 1, 0);
part_type_color1(particle, particle_color);

alarm_set(1, 1);