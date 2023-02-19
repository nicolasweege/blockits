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

if (h_speed != 0)
{
	side_to_look = sign(h_speed);
}

draw_sprite_ext(sprite_index, 
                0, 
				x, y, 
				xscale * side_to_look, 
				yscale, 
				image_angle, 
				image_blend, 
				image_alpha);