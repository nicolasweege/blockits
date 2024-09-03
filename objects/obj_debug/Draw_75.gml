// Taking screenshots
if (keyboard_check_pressed(vk_f6))
{
	capture_entire_screen("screen");
}

// Debug information
if (show_debug_info)
{   
	draw_set_color(c_white);
	draw_set_font(global.karmina_regular_font);
	// draw_set_alpha(0.8);
	
	draw_text_transformed(5, 5, string(fps), debug_info_text_size, debug_info_text_size, 0);
	
	draw_text_transformed(5, 15, "instances: " + string(instance_count), debug_info_text_size, debug_info_text_size, 0);
	
	var deac_instances_string = global.use_instance_deactivation ? "on" : "off";
	draw_text_transformed(5, 30, "deactivate instances: " + deac_instances_string, debug_info_text_size, debug_info_text_size, 0);
	
	draw_text_transformed(5, 45, "cam stick speed: " + string(obj_camera.camera_lerp), debug_info_text_size, debug_info_text_size, 0);

	draw_text_transformed(5, 60, "shake remain: " + string(global.shake_remain), debug_info_text_size, debug_info_text_size, 0);
	draw_text_transformed(5, 70, "player momentum x: " + string(global.player_momentum_x), debug_info_text_size, debug_info_text_size, 0);
	draw_text_transformed(5, 80, "player momentum speed: " + string(global.player_momentum_speed), debug_info_text_size, debug_info_text_size, 0);
	
    if (obj_player.current_player_capsule)
    {
        draw_text_transformed(5, 90, "current_capsule h_speed: " + string(obj_player.current_player_capsule.h_speed), debug_info_text_size, debug_info_text_size, 0);
        draw_text_transformed(5, 100, "current_capsule v_speed: " + string(obj_player.current_player_capsule.v_speed), debug_info_text_size, debug_info_text_size, 0);
        draw_set_color(c_yellow);
        draw_text_transformed(100, 100, "current_capsule direction: " + string(obj_player.current_player_capsule.player_capsule_direction), debug_info_text_size, debug_info_text_size, 0);
        draw_set_color(c_white);
    }
    else
    {
        draw_text_transformed(5, 90, "player h_speed: " + string(obj_player.h_speed), debug_info_text_size, debug_info_text_size, 0);
        draw_text_transformed(5, 100, "player v_speed: " + string(obj_player.v_speed), debug_info_text_size, debug_info_text_size, 0);
    }
	
	draw_text_transformed(5, 110, "screen_shake_xdir: " + string(global.screen_shake_xdir), debug_info_text_size, debug_info_text_size, 0);
	draw_text_transformed(5, 120, "screen_shake_ydir: " + string(global.screen_shake_ydir), debug_info_text_size, debug_info_text_size, 0);
	draw_text_transformed(5, 130, "activate_library_area: " + string(global.activate_library_area), debug_info_text_size, debug_info_text_size, 0);
	draw_text_transformed(5, 140, "dash_dir: " + string(obj_player.dash_dir), debug_info_text_size, debug_info_text_size, 0);
	
	draw_set_color(c_lime);
	draw_text_transformed(5, 150, "player_state: " + string(obj_player.player_state_string), debug_info_text_size, debug_info_text_size, 0);
	draw_set_color(c_white);
	
	var _current_room_string = room_get_name(room);
	draw_set_color(c_yellow);
	draw_text_transformed(5, 160, "current room: " + _current_room_string, debug_info_text_size, debug_info_text_size, 0);
	draw_set_color(c_white);
	
	/*
    	if (instance_exists(obj_level_editor))
    	{
    	   draw_text_transformed((VIEW_W - 100),
    	                         (0 + 10),
    	                         string(obj_level_editor.real_obj_to_grab.image_xscale),
    	                         debug_info_text_size,
    	                         debug_info_text_size,
    	                         0);
    	                         
    	   draw_text_transformed((VIEW_W - 100),
    	                         (0 + 10) + 10,
    	                         string(obj_level_editor.real_obj_to_grab.image_yscale),
    	                         debug_info_text_size,
    	                         debug_info_text_size,
    	                         0);
    	}
	*/
	
	var app_state_string = "";
	switch (global.app_state)
	{
	   case states.GAME:
	       app_state_string = "Game";
	   break;
	   
	   case states.EDITOR:
	       app_state_string = "Editor";
	   break;
	   
	   case states.PAUSE_MENU:
	       app_state_string = "Pause Menu";
	   break;
	   
	   case states.MAIN_MENU:
	       app_state_string = "Main Menu";
	   break;
	}
	
	draw_text_transformed((VIEW_W - 100),
	                      (0 + 10),
	                      "App State: " 
	                      + app_state_string,
	                      debug_info_text_size,
	                      debug_info_text_size,
	                      0);
	
	draw_set_color(c_white);
	draw_set_font(-1);
	draw_set_alpha(1);
}