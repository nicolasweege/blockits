if (!global.pause && !window_has_focus()){ global.pause = true; }

if (instance_exists(obj_pause_menu)){
	var _input_pause_menu_p = keyboard_check_pressed(global.input_vk_pause) || gamepad_button_check_pressed(global.gp_slot, global.input_gp_pause);
	var _menu_pages_list_value = obj_pause_menu.menu_pages_list[obj_pause_menu.page];
	if (_input_pause_menu_p && _menu_pages_list_value == 0 && global.can_pause) global.pause = !global.pause;
}

if (global.pause){
	audio_pause_all();
	audio_resume_sound(snd_menu_change_option);
	audio_resume_sound(snd_menu_select);
	audio_resume_sound(snd_menu_click);
} else audio_resume_all();