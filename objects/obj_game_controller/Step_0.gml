if (keyboard_check_pressed(vk_f4))
{
	window_set_fullscreen(!window_get_fullscreen());
}

if (keyboard_check_pressed(vk_escape))
{
	game_end();
}

if (keyboard_check_pressed(vk_f2))
{
	game_restart();
}

// debug keybindings

if (keyboard_check_pressed(vk_f1))
{
	layer_set_visible("default_colliders", !layer_get_visible("default_colliders"));
	layer_set_visible("checkpoints", !layer_get_visible("checkpoints"));
	layer_set_visible("camera_masks", !layer_get_visible("camera_masks"));
}