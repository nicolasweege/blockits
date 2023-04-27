


if (keyboard_check_pressed(vk_escape)
    || gamepad_button_check_pressed(global.device, gp_select))
{
	if (global.console_enabled)
	{
		global.console_enabled = false;
	}
	else
	{
		// game_end();
		global.is_paused = !global.is_paused;
		
		if (!global.is_paused)
		{
			audio_resume_all();
		}
		else
		{
			audio_pause_all();
		}
	}
}

// enabling console
if (keyboard_check_pressed(vk_f7) && instance_exists(obj_console) 
    && !global.is_paused)
{
	global.console_enabled = !global.console_enabled;
}

// restarting the game
if (keyboard_check_pressed(vk_f5)
    || gamepad_button_check_pressed(global.device, gp_start))
{
	game_restart();
	// room_restart();
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