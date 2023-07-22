if (surface_exists(main_surface))
{
	surface_set_target(main_surface);
	draw_set_alpha(0.7);
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, 0);
	
	draw_set_alpha(1);
	draw_set_color(c_white);
	
	draw_circle(x, y, 30, 0);
					
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target();
	
	draw_surface(main_surface, 0, 0);
}
else
{
	main_surface = surface_create(room_width, room_height);
}