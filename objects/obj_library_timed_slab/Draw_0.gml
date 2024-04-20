if (can_draw)
{
	if (can_destroy)
	{
		if (global.app_state == states.PAUSE_MENU)
		{
			draw_sprite_ext(sprite_to_draw, 0, 
					        x, y, 
							image_xscale, image_yscale, 
							image_angle, image_blend, image_alpha);
		}
		else
		{
			random_x = random_range(-1, 1);
			random_y = random_range(-1, 1);
		
			draw_sprite_ext(sprite_to_draw, 0, 
					        x + random_x, y + random_y, 
							image_xscale, image_yscale, 
							image_angle, image_blend, image_alpha);
		}
	}
	else
	{
		draw_sprite_ext(sprite_to_draw, 0, 
				        x, y, 
						image_xscale, image_yscale, 
						image_angle, image_blend, image_alpha);	
	}
}
else
{			
	if (shake_to_showup)
	{
		if (global.app_state == states.PAUSE_MENU)
		{
			draw_sprite_ext(sprite_highlight, 0, 
						    x, y, 
							image_xscale, image_yscale, 
							image_angle, image_blend, image_alpha);
		}
		else
		{
			random_x = random_range(-1, 1);
			random_y = random_range(-1, 1);
		
			draw_sprite_ext(sprite_highlight, 0, 
						    x + random_x, y + random_y, 
							image_xscale, image_yscale, 
							image_angle, image_blend, image_alpha);
		}
	}
	else
	{
		draw_sprite_ext(sprite_highlight, 0, 
				    x, y, 
					image_xscale, image_yscale, 
					image_angle, image_blend, image_alpha);
	}
}