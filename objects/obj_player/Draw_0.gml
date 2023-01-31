if (global.colliders_controller.show_collider == 1)
{
	global.player.player_color = PLATFORM_COLLIDER_COLOR;
}

if (global.colliders_controller.show_collider == 2)
{
	global.player.player_color = WALL_COLLIDER_COLOR;
}

draw_sprite_ext(sprite_index, 
                1, 
				x, y, 
				image_xscale, 
				image_yscale, 
				image_angle, 
				player_color, 
				image_alpha);
				
// show_debug_message("v_speed: " + string(v_speed));
// show_debug_message("h_speed: " + string(h_speed));