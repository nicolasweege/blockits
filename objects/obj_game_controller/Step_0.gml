if (keyboard_check_pressed(vk_escape)
    || gamepad_button_check_pressed(global.device, gp_select))
{
	if (global.console_enabled)
	{
		global.console_enabled = false;
	}
	else
	{
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

// fullscreen
if (keyboard_check_pressed(vk_f4))
{
	window_set_fullscreen(!window_get_fullscreen());
}

// debug keybindings
if (keyboard_check_pressed(vk_f1))
{
	layer_set_visible("default_colliders", !layer_get_visible("default_colliders"));
	layer_set_visible("checkpoints", !layer_get_visible("checkpoints"));
}

if (keyboard_check_pressed(vk_f2))
{
	layer_set_visible("player", !layer_get_visible("player"));
}

if (keyboard_check_pressed(vk_f3))
{
	show_debug_info = !show_debug_info;
	show_debug_overlay(show_debug_info);
}