if (keyboard_check_pressed(vk_f1)
	|| gamepad_button_check_pressed(global.device, gp_stickr))
	show_debug = !show_debug;
