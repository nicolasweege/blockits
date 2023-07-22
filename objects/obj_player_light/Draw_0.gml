if (surface_exists(main_surface))
{
	surface_set_target(main_surface);
	draw_set_alpha(darkness);
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, 0);
	
	draw_set_alpha(1);
	draw_set_color(c_white);
	
	gpu_set_blendmode(bm_subtract);

	if (instance_exists(obj_player))
	{
		if (light_target == obj_player)
		{
			draw_circle(light_target.x, 
				        (light_target.y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)),
						30, 
						0);		
		}
	}
				
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target();
	
	draw_surface(main_surface, 0, 0);
}
else
{
	main_surface = surface_create(room_width, room_height);
}