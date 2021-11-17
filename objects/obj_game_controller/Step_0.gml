if (!global.pause && !window_has_focus()){ global.pause = true; }

if (instance_exists(obj_pause_menu)){
	var input_pause_p = keyboard_check_pressed(global.input_vk_pause) || gamepad_button_check_pressed(global.device, global.input_gp_pause);
	var menu_pages_list_val = obj_pause_menu.menu_pages_list[obj_pause_menu.page];
	if (input_pause_p && menu_pages_list_val == 0 && global.can_pause) global.pause = !global.pause;
}

if (global.pause){
	audio_pause_all();
	audio_resume_sound(snd_menu_change_option);
	audio_resume_sound(snd_menu_select);
	audio_resume_sound(snd_menu_click);
} else audio_resume_all();