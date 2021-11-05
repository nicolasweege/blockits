if (instance_exists(obj_menu)) {
	var pause_menu_buttom = keyboard_check_pressed(vk_escape);
	var menu_pages_list_value = obj_menu.menu_pages_list[obj_menu.page];
	if (pause_menu_buttom && menu_pages_list_value == 0) { global.pause = !global.pause; }
}

/*if (global.pause) {
	audio_pause_all();
	audio_resume_sound(snd_ui_button_confirm);
	audio_resume_sound(snd_ui_change_selection);
	audio_resume_sound(snd_ui_click);
	audio_resume_sound(snd_menu_music);
} else {
	audio_resume_all();
} */