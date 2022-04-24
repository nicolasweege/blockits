if (keyboard_check_pressed(global.input_vk_invoke_debug) || gamepad_button_check_pressed(global.device, global.input_gp_invoke_debug))
{
	show_debug++;
	audio_play_sound(MENU_CLICK_SOUND, 1, false);
}

if (show_debug > 3)
{
	show_debug = 1;
}
