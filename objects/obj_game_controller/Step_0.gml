if (keyboard_check_pressed(vk_escape)
    || gamepad_button_check_pressed(global.device, gp_start))
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

if (global.is_paused && gamepad_button_check_pressed(global.device, gp_face2))
{
	global.is_paused = false;
	audio_resume_all();
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


// audio stuff

audio_listener_position(global.camx + (global.cam_width / 2), 
                        global.camy + (global.cam_height / 2), 
						0);

/*
if (instance_exists(obj_player))
{
	audio_listener_position(obj_player.x, obj_player.y, 0);
}
*/