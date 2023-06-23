if (hdir != 0)
{
	side_to_look = sign(hdir);
}

draw_sprite_ext(sprite_index, 
                0, 
				x, y, 
				side_to_look, 
				image_yscale, 
				image_angle, 
				c_white,
				image_alpha);