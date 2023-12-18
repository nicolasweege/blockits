if (obj_player.y > y && place_meeting(x, y, obj_player))
{
	sprite_index = -1;
	draw_sprite_ext(current_sprite_to_draw, 0, 
				    x, y, 
					image_xscale, image_yscale, 
					image_angle, image_blend, image_alpha);	
}
else
{
	draw_sprite_ext(current_sprite_to_draw, 
	                0, 
					x, y, 
					image_xscale, 
					image_yscale, 
					image_angle, 
					c_white,
					image_alpha);
}