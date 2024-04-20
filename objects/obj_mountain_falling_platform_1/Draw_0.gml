if (can_draw)
{
	if (obj_player.y > y && place_meeting(x, y, obj_player))
	{
		sprite_index = -1;
		draw_sprite_ext(sprite_to_draw, 0, 
				        x, y, 
						image_xscale, image_yscale, 
						image_angle, image_blend, image_alpha);	
	}
	else if (can_destroy)
	{
		if (image_index >= (image_number - 4))
		{
			image_index = (image_number - 1);
		}
		/*
		draw_sprite_ext(sprite_to_draw, 
		                image_index, 
				        x, y, 
						image_xscale, image_yscale, 
						image_angle, image_blend, image_alpha);	
						*/
		
		if (global.app_state == states.PAUSE_MENU)
		{
			draw_sprite_ext(sprite_to_draw, image_index, 
							x, y, 
							image_xscale, image_yscale, 
							image_angle, image_blend, image_alpha);
		}
		else
		{
			random_x = random_range(-1, 1);
			random_y = random_range(-1, 1);
		
			draw_sprite_ext(sprite_to_draw, image_index, 
						    x + random_x, y + random_y, 
							image_xscale, image_yscale, 
							image_angle, image_blend, image_alpha);
		}
		
	}
	else
	{
		image_speed = 0;
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
		draw_sprite_ext(sprite_highlight, 
		                0, 
					    x, y, 
						image_xscale, image_yscale, 
						image_angle, image_blend, image_alpha);
		
		// falling animation
		if (global.app_state != states.PAUSE_MENU)
		{
			fall_anim_alpha -= 0.02;
			fall_anim_yoffset += 0.5;
		}
		draw_sprite_ext(sprite_to_draw, 0, 
				        x, y + fall_anim_yoffset, 
						image_xscale, image_yscale, 
						image_angle, image_blend, fall_anim_alpha);	
	}
}