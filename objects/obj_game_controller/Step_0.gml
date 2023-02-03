if (keyboard_check_pressed(vk_escape) 
    || gamepad_button_check_pressed(global.device, gp_select))
{
	game_end();
}

if (keyboard_check_pressed(vk_f5))
{
	game_restart();
}

if (keyboard_check_pressed(vk_f4))
{
	window_set_fullscreen(!window_get_fullscreen());
}

// debug keybindings
if (keyboard_check_pressed(vk_f1))
{
	layer_set_visible("default_colliders", !layer_get_visible("default_colliders"));
	layer_set_visible("checkpoints", !layer_get_visible("checkpoints"));
	// layer_set_visible("camera_masks", !layer_get_visible("camera_masks"));
}

if (keyboard_check_pressed(vk_f2))
{
	layer_set_visible("player", !layer_get_visible("player"));
	layer_set_visible("platform_colliders", !layer_get_visible("platform_colliders"));
	layer_set_visible("wall_colliders", !layer_get_visible("wall_colliders"));
	layer_set_visible("death_colliders", !layer_get_visible("death_colliders"));
}

if (keyboard_check_pressed(vk_f3))
{
	show_debug_info = !show_debug_info;
	show_debug_overlay(show_debug_info);
}