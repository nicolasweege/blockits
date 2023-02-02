// changing the player's color
/*
if (global.colliders_controller.show_collider == 1)
{
	global.player.player_color = PLATFORM_COLLIDER_COLOR;
}

if (global.colliders_controller.show_collider == 2)
{
	global.player.player_color = WALL_COLLIDER_COLOR;
}
*/

draw_sprite_ext(sprite_index, 
                1, 
				x, y, 
				xscale, 
				image_yscale, 
				image_angle, 
				image_blend, 
				image_alpha);