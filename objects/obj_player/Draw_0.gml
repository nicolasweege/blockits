if (h_speed != 0)
{
	side_to_look = sign(h_speed);
}

draw_sprite_ext(sprite_index, 
                0, 
				x, y, 
				xscale * side_to_look, 
				yscale, 
				image_angle, 
				player_color,
				image_alpha);