if (obj_player.y > y && place_meeting(x, y, obj_player))
{
	sprite_index = -1;
	draw_sprite_ext(current_sprite_to_draw, 0, 
				    x, y, 
					image_xscale, image_yscale, 
					image_angle, image_blend, image_alpha);	
}

if (current_state == default_state)
{
	current_sprite_to_draw = default_sprite;
	draw_sprite_ext(current_sprite_to_draw, 
	                0, 
					x, y, 
					image_xscale, 
					image_yscale, 
					image_angle, 
					c_white,
					image_alpha);
}

if (current_state == destroy_state)
{
	current_sprite_to_draw = destroy_sprite;
	draw_sprite_ext(current_sprite_to_draw, 
	                0, 
					x, y, 
					image_xscale, 
					image_yscale, 
					image_angle, 
					c_white,
					image_alpha);
}