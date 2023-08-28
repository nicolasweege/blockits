draw_set_font(fnt_default);

// menu background
draw_set_alpha(0.8);
/*
draw_rectangle_color(0, 0, global.cam_width, global.cam_height, 
	                    c_black, c_black, c_black, c_black, 
						0);
						*/
draw_set_alpha(1);

if (show_save_slots_page)
{		
	// slot 01 button
	var save_slot_01_button = blockits_draw_button(global.cam_width / 2, 
					                                global.cam_height / 2 - 20, 
													"slot 1", 
				                                    80, 15, 
													c_white, c_white, c_white);
											 
	if (save_slot_01_button)
	{
		global.current_save_slot = saves.save_01;
		if (!load_game_data(global.current_save_slot))
		{
			room_goto(rm_nexus);
			if (!instance_exists(obj_player))
			{				  
				instance_create_layer(0, 0, PLAYER_LAYER_NAME, obj_player);
			}
			
			obj_player.x = PLAYER_START_GAME_WITHOUT_SAVE_XPOS;
			obj_player.y = PLAYER_START_GAME_WITHOUT_SAVE_YPOS;
			obj_player.player_state = obj_player.free_state;
		}
	}
	
	
	// slot 02 button
	var save_slot_02_button = blockits_draw_button(global.cam_width / 2, 
		                                        global.cam_height / 2, 
												"slot 2", 
	                                            80, 15, 
												c_white, c_white, c_white);
											 
	if (save_slot_02_button)
	{
		global.current_save_slot = saves.save_02;
		if (!load_game_data(global.current_save_slot))
		{
			room_goto(rm_nexus);
			if (!instance_exists(obj_player))
			{				  
				instance_create_layer(0, 0, PLAYER_LAYER_NAME, obj_player);
			}
			
			obj_player.x = PLAYER_START_GAME_WITHOUT_SAVE_XPOS;
			obj_player.y = PLAYER_START_GAME_WITHOUT_SAVE_YPOS;
			obj_player.player_state = obj_player.free_state;
		}
	}
		
		
	// slot 03 button
	var save_slot_03_button = blockits_draw_button(global.cam_width / 2, 
		                                        global.cam_height / 2 + 20, 
												"slot 3", 
	                                            80, 15, 
												c_white, c_white, c_white);
											 
	if (save_slot_03_button)
	{
		global.current_save_slot = saves.save_03;
		if (!load_game_data(global.current_save_slot))
		{
			room_goto(rm_nexus);
			if (!instance_exists(obj_player))
			{				  
				instance_create_layer(0, 0, PLAYER_LAYER_NAME, obj_player);
			}
			
			obj_player.x = PLAYER_START_GAME_WITHOUT_SAVE_XPOS;
			obj_player.y = PLAYER_START_GAME_WITHOUT_SAVE_YPOS;
			obj_player.player_state = obj_player.free_state;
		}
	}
	
	// back button
	var back_button = blockits_draw_button(global.cam_width / 2, 
					                        global.cam_height / 2 + 40, 
											"back", 
				                            80, 15, 
											c_white, c_white, c_white);
	if (back_button
		|| keyboard_check_pressed(vk_escape)
		|| gamepad_button_check_pressed(global.device, gp_face1))
		{
			show_save_slots_page = false;
		}
}
else
{
	// play button
	var play_button = blockits_draw_button(global.cam_width / 2, 
		                                        global.cam_height / 2 - 10, 
												"play", 
	                                            80, 15, 
												c_white, c_white, c_white);

	if (play_button)
	{
		show_save_slots_page = true;
	}
		
	// exit button
	var exit_button = blockits_draw_button(global.cam_width / 2, 
		                                    (global.cam_height / 2) + 10, 
											"exit", 
	                                        80, 15, 
											c_white, c_white, c_white);

	if (exit_button)
	{
		game_end();
	}	
}

draw_set_font(-1);