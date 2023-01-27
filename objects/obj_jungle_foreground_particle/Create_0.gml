particle_system = part_system_create_layer(layer_to_display, false);

particle = part_type_create();

part_type_sprite(particle, spr_jungle_pixel_particle, false, false, false);
part_type_life(particle, 200, 200);
part_type_alpha3(particle, 0.5, 1, 0);
part_type_color1(particle, particle_color);

// alarm[0] = (room_speed*5);
alarm[1] = 5;