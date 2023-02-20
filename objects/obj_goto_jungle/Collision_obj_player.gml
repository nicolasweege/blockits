if (keyboard_check_pressed(vk_enter) 
    || gamepad_button_check_pressed(global.device, gp_face4))
	{
		room_goto(rm_jungle);
	}