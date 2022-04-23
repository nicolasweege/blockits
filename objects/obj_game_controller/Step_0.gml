if ((keyboard_check_pressed(global.input_vk_pause)
	|| gamepad_button_check_pressed(global.device, global.input_gp_pause))
	&& global.menu.menu_pages_list[global.menu.page] == 0)
	global.pause = !global.pause;

if (!global.pause)
	audio_resume_all();

if (!global.pause && !window_has_focus())
{
	global.pause = true;
	audio_pause_all();
	audio_resume_sound(MENU_CHANGE_OPTION_SOUND);
	audio_resume_sound(MENU_SELECT_SOUND);
	audio_resume_sound(MENU_CLICK_SOUND);
}
