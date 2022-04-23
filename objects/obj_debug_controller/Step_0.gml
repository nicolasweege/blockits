if (keyboard_check_pressed(global.input_vk_invoke_debug) || gamepad_button_check_pressed(global.device, global.input_gp_invoke_debug))
{
	show_debug++;
}

if (show_debug > 3)
{
	show_debug = 0;
}
