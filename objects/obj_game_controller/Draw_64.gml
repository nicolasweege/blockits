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
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, global.cam_width, global.cam_height, 
	                     c_black, c_black, c_black, c_black, 
						 0);
	draw_set_alpha(1);

	// resume button
	var resume_button = blockits_draw_button(global.cam_width / 2, 
	                                         global.cam_height / 2, 
											 "resume", 
                                             80, 15, 
											 c_white, c_white, c_white);

	if (resume_button)
	{
		// capture_entire_screen("screen");
		if (global.is_paused)
		{
			global.is_paused = false;
		}
	}

	// exit button
	var exit_button = blockits_draw_button(global.cam_width / 2, 
	                                       (global.cam_height / 2) + 20, 
										   "exit", 
                                           80, 15, 
										   c_white, c_white, c_white);

	if (exit_button)
	{
		game_end();
	}
}