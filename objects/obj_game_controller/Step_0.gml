if ((keyboard_check_pressed(DEFAULT_INPUT_VK_PAUSE) || gamepad_button_check_pressed(global.device, DEFAULT_INPUT_GP_PAUSE)) && global.menu.menu_pages_list[global.menu.page] == 0)
	global.pause = !global.pause;

if (!global.pause && !window_has_focus())
	global.pause = true;

if (global.pause)
{
	audio_pause_all();
	audio_resume_sound(MENU_CLICK_SOUND);
}

if (!global.pause)
	audio_resume_all();
