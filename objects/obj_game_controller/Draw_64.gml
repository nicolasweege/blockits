if (room == rm_main_menu)
{
	exit;	
}

if (show_debug_info)
{
	draw_set_color(c_white);
	draw_set_font(fnt_debug);
	draw_set_alpha(0.6);
	
	draw_text_transformed(5, 5, string(fps), debug_info_text_size, debug_info_text_size, 0);
	
	draw_text_transformed(5, 15, "instances: " + string(instance_count), debug_info_text_size, debug_info_text_size, 0);
	
	var deac_instances_string = global.use_instance_deactivation ? "on" : "off";
	draw_text_transformed(5, 30, "deactivate instances: " + deac_instances_string, debug_info_text_size, debug_info_text_size, 0);
	
	draw_text_transformed(5, 45, "cam stick speed: " + string(obj_camera.camera_lerp), debug_info_text_size, debug_info_text_size, 0);

	draw_text_transformed(5, 60, "shake remain: " + string(global.shake_remain), debug_info_text_size, debug_info_text_size, 0);
	draw_text_transformed(5, 70, "player momentum x: " + string(global.player_momentum_x), debug_info_text_size, debug_info_text_size, 0);
	draw_text_transformed(5, 80, "player momentum speed: " + string(global.player_momentum_speed), debug_info_text_size, debug_info_text_size, 0);
	draw_text_transformed(5, 90, "hspeed: " + string(obj_player.h_speed), debug_info_text_size, debug_info_text_size, 0);
	draw_text_transformed(5, 100, "vspeed: " + string(obj_player.v_speed), debug_info_text_size, debug_info_text_size, 0);
	
	draw_text_transformed(5, 110, "screen_shake_xdir: " + string(global.screen_shake_xdir), debug_info_text_size, debug_info_text_size, 0);
	draw_text_transformed(5, 120, "screen_shake_ydir: " + string(global.screen_shake_ydir), debug_info_text_size, debug_info_text_size, 0);
	draw_text_transformed(5, 130, "activate_library_area: " + string(global.activate_library_area), debug_info_text_size, debug_info_text_size, 0);
	draw_text_transformed(5, 140, "dash_dir: " + string(obj_player.dash_dir), debug_info_text_size, debug_info_text_size, 0);
	
	draw_set_color(c_white);
	draw_set_font(-1);
	draw_set_alpha(1);
}

// taking screenshots
if (keyboard_check_pressed(vk_f6) 
    || keyboard_check_pressed(vk_space))
{
	capture_entire_screen("screen");
}

// pausing
if (global.is_paused)
{
	// pause background
	draw_set_alpha(0.9);
	draw_rectangle_color(0, 0, global.cam_width, global.cam_height, 
	                     c_black, c_black, c_black, c_black, 
						 0);
	draw_set_alpha(1);
	
	update_menu_inputs();
	
	draw_set_font(fnt_default);
	current_menu();
	draw_set_font(-1);
}