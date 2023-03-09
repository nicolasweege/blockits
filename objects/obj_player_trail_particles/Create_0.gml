particle_system = part_system_create_layer("Player", false);

particle = part_type_create();

particle_color = c_fuchsia;

part_type_sprite(particle, spr_pixel_particle, false, false, false);
part_type_life(particle, 35, 35);
part_type_alpha3(particle, 1, 0.5, 0);
part_type_color1(particle, particle_color);

alarm_set(0, 60);
alarm_set(1, 1);