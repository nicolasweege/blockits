if (room == rm_main_menu)
{
	exit;	
}

draw_set_font(fnt_default);

if (show_debug_info)
{
	draw_text_transformed(5, 5, string(fps), 1, 1, 0);
	
	draw_text_transformed(5, 15, "instances: " + string(instance_count), 1, 1, 0);
	
	var deac_instances_string = global.use_instance_deactivation ? "on" : "off";
	draw_text_transformed(5, 30, "deactivate instances: " + deac_instances_string, 1, 1, 0);
	
	draw_text_transformed(5, 45, "cam stick speed: " + string(obj_camera.camera_lerp), 1, 1, 0);
	
	draw_text_transformed(5, 60, "shake remain: " + string(global.shake_remain), 1, 1, 0);
	draw_text_transformed(5, 70, "player momentum x: " + string(global.player_momentum_x), 1, 1, 0);
	draw_text_transformed(5, 80, "player momentum speed: " + string(global.player_momentum_speed), 1, 1, 0);
	draw_text_transformed(5, 90, "hspeed: " + string(obj_player.h_speed), 1, 1, 0);
	draw_text_transformed(5, 100, "vspeed: " + string(obj_player.v_speed), 1, 1, 0);
	
	draw_text_transformed(5, 110, "screen_shake_xdir: " + string(global.screen_shake_xdir), 1, 1, 0);
	draw_text_transformed(5, 120, "screen_shake_ydir: " + string(global.screen_shake_ydir), 1, 1, 0);
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
	draw_set_alpha(0.9);
	draw_rectangle_color(0, 0, global.cam_width, global.cam_height, 
	                     c_black, c_black, c_black, c_black, 
						 0);
	draw_set_alpha(1);
	
	update_menu_inputs();
	current_menu();
}

draw_set_font(-1);