if (can_draw)
{
	if (can_destroy)
	{
		random_x = random_range(-1, 1);
		random_y = random_range(-1, 1);
		
		draw_sprite_ext(spr_timed_slab, 0, 
			        x + random_x, y + random_y, 
					image_xscale, image_yscale, 
					image_angle, image_blend, image_alpha);
	}
	else
	{
		draw_sprite_ext(spr_timed_slab, 0, 
				        x, y, 
						image_xscale, image_yscale, 
						image_angle, image_blend, image_alpha);	
	}
}
else
{			
	timer -= 1;
	if (timer <= 0)
	{
		random_x = random_range(-1, 1);
		random_y = random_range(-1, 1);
		
		draw_sprite_ext(spr_timed_slab_highlight, 0, 
				    x + random_x, y + random_y, 
					image_xscale, image_yscale, 
					image_angle, image_blend, image_alpha);
	}
	else
	{
		draw_sprite_ext(spr_timed_slab_highlight, 0, 
				    x, y, 
					image_xscale, image_yscale, 
					image_angle, image_blend, image_alpha);
	}
}