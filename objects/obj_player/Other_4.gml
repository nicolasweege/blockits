if (!part_system_exists(dash_particle_system))
{
	dash_particle_system 
	= part_system_create_layer(layer_get_id(PLAYER_LAYER) + 1, false);	
}

if (!part_type_exists(dash_particle))
{
	dash_particle = part_type_create();
	part_type_sprite(dash_particle, spr_pixel_particle, false, false, false);
	part_type_life(dash_particle, 40, 50);
	part_type_alpha3(dash_particle, 0.8, 1, 0);
	part_type_color1(dash_particle, dash_particle_color);

	// part_type_direction(dash_particle, 225, 315, 1, 30);
	part_type_speed(dash_particle, 0.1, 0.006, 0, 0);
}