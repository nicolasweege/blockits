if (player_state == on_main_menu_state)
{
	exit;	
}

if (h_speed != 0)
{
	side_to_look = sign(h_speed);
}

if (player_state == god_mode_state)
{
	depth = -9999;
	draw_sprite_ext(spr_player_creator, 
	                0, 
					x, y, 
					xscale * side_to_look, 
					yscale, 
					image_angle, 
					player_color,
					image_alpha);
}
else
{
	layer = layer_get_id(PLAYER_LAYER_NAME);
	draw_sprite_ext(sprite_index, 
	                0, 
					x, y, 
					xscale * side_to_look, 
					yscale, 
					image_angle, 
					player_color,
					image_alpha);
}