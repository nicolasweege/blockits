if (place_meeting(x, y, obj_player))
{	
	if (keyboard_check_pressed(vk_enter) 
	    || gamepad_button_check_pressed(global.device, gp_face4))
		{
			room_goto(room_to);
			obj_player.x = xto;
			obj_player.y = yto;
		}
}