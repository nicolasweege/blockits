if (global.colliders_controller.show_collider == 1)
	global.player.c = PLATFORM_COLLIDER_COLOR;

if (global.colliders_controller.show_collider == 2)
	global.player.c = WALL_COLLIDER_COLOR;

draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, c, image_alpha);
