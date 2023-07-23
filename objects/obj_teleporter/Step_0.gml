if (place_meeting(x, y, obj_player))
{	
	if (keyboard_check_pressed(vk_enter) 
	    || gamepad_button_check_pressed(global.device, gp_face4))
		{
			if (!instance_exists(obj_room_transition))
			{
				var transition = instance_create_layer(0, 0, 
				                                       "controllers", 
													   obj_room_transition);
				transition.room_to_go = room_to;
				transition.xto = xto;
				transition.yto = yto;
			}
			
			/*
			room_goto(room_to);
			obj_player.x = xto;
			obj_player.y = yto;
			*/
		}
}