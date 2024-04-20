if (global.app_state == states.MAIN_MENU)
{
    exit;
}

// handling menu when pausing
if ((keyboard_check_pressed(global.MENU_pause_key)
    || gamepad_button_check_pressed(global.gamepad_device, global.MENU_pause_gp))
	&& global.app_state != states.PAUSE_MENU)
{
    menu_index                = 1;
    
    global.button_green_color = global.initial_button_green_color;
    global.button_blue_color  = global.initial_button_blue_color;
    global.button_red_color   = global.initial_button_red_color;
}