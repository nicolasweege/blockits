if (!global.pause && !window_has_focus())
	global.pause = true;

pause = keyboard_check_pressed(global.input_vk_pause) || gamepad_button_check_pressed(global.device, global.input_gp_pause);
var menu_pages_list_val = global.menu.menu_pages_list[global.menu.page];

if (pause && menu_pages_list_val == 0)
{
	global.pause = !global.pause;
}

if (global.pause)
{
	audio_pause_all();
	audio_resume_sound(snd_menu_change_option);
	audio_resume_sound(snd_menu_select);
	audio_resume_sound(snd_menu_click);
}

if (!global.pause)
	audio_resume_all();
