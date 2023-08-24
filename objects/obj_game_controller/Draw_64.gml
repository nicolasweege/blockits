if (room == rm_main_menu)
{
	exit;	
}

draw_set_font(fnt_default);

if (show_debug_info)
{
	draw_text_transformed(0, 5, + string(fps), 1, 1, 0);
	// draw_text_transformed(0, 10, "FPS real: " + string(fps_real), 0.5, 0.5, 0);
}

// taking screenshots
if (keyboard_check_pressed(vk_f6))
{
	capture_entire_screen("screen");
}

// pausing
if (global.is_paused)
{
	// pause background
	draw_set_alpha(0.8);
	draw_rectangle_color(0, 0, global.cam_width, global.cam_height, 
	                     c_black, c_black, c_black, c_black, 
						 0);
	draw_set_alpha(1);


	// resume button
	var resume_button = blockits_draw_button(global.cam_width / 2, 
	                                         global.cam_height / 2 - 30, 
											 "resume", 
                                             80, 15, 
											 c_white, c_white, c_white);

	if (resume_button)
	{
		audio_resume_all();
		global.is_paused = false;
	}
	
	// save button
	var save_button = blockits_draw_button(global.cam_width / 2, 
	                                         global.cam_height / 2 - 10, 
											 "save", 
                                             80, 15, 
											 c_white, c_white, c_white);
											 
	if (save_button)
	{
		save_game_data(global.current_save_slot);
	}
	

	// exit to main menu button
	var exit_to_main_menu_button = blockits_draw_button(global.cam_width / 2, 
	                                       (global.cam_height / 2) + 10, 
										   "main menu", 
                                           80, 15, 
										   c_white, c_white, c_white);

	if (exit_to_main_menu_button)
	{
		room_goto(rm_main_menu);
		obj_player.player_state = obj_player.lock_state;
		obj_player.x = 0;
		obj_player.y = 0;
	}
	
	// exit game button
	var exit_button = blockits_draw_button(global.cam_width / 2, 
	                                       (global.cam_height / 2) + 30, 
										   "exit game", 
                                           80, 15, 
										   c_white, c_white, c_white);

	if (exit_button)
	{
		game_end();
	}
}

draw_set_font(-1);