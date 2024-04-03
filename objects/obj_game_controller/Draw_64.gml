if (room == rm_main_menu)
{
	exit;	
}

// Scene blooms and vignettes (maybe were going this way,
// instead of placing individual sprites in the rooms).
switch (room)
{
    case rm_jungle:
        /*
        gpu_set_blendmode(bm_add);
        // green bloom
        draw_sprite_ext(spr_bloom_gradient, 0, 0 + 30, 0 + 30, 1, 1, 0, make_colour_rgb(169, 255, 0), 0.1);
        
        // purple bloom
        draw_sprite_ext(spr_bloom_gradient, 0, global.cam_width, global.cam_height, 1, 1, 0, make_colour_rgb(55, 00, 255), 0.1);
        
        gpu_set_blendmode(bm_normal); 
        */
        
        // vignette
        draw_sprite_ext(spr_bloom_gradient, 0, global.cam_width - 50, 0, 1, 1, 0, c_black, 0.4);
        draw_sprite_ext(spr_bloom_gradient, 0, 0 + 50, global.cam_height, 1, 1, 0, c_black, 0.4);   
    break;
    
    case rm_library:
        // vignette
        draw_sprite_ext(spr_bloom_gradient, 0, global.cam_width - 50, 0, 1, 1, 0, c_black, 0.5);
        draw_sprite_ext(spr_bloom_gradient, 0, 0 + 50, global.cam_height, 1, 1, 0, c_black, 0.5);
    break;
    
    case rm_playground:
        /*
            gpu_set_blendmode(bm_add);
            draw_sprite_ext(spr_bloom_gradient, 0, 0, 0, 1, 1, 0, c_purple, .4);
            gpu_set_blendmode(bm_normal);
        */
    break;
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
	// draw_text_transformed(5, 90, "player h_speed: " + string(obj_player.h_speed), debug_info_text_size, debug_info_text_size, 0);
	// draw_text_transformed(5, 100, "player v_speed: " + string(obj_player.v_speed), debug_info_text_size, debug_info_text_size, 0);
	if (obj_player.current_player_capsule)
	{
    	draw_text_transformed(5, 90, "current_capsule h_speed: " + string(obj_player.current_player_capsule.h_speed), debug_info_text_size, debug_info_text_size, 0);
    	draw_text_transformed(5, 100, "current_capsule v_speed: " + string(obj_player.current_player_capsule.v_speed), debug_info_text_size, debug_info_text_size, 0);
	}
	
	draw_text_transformed(5, 110, "screen_shake_xdir: " + string(global.screen_shake_xdir), debug_info_text_size, debug_info_text_size, 0);
	draw_text_transformed(5, 120, "screen_shake_ydir: " + string(global.screen_shake_ydir), debug_info_text_size, debug_info_text_size, 0);
	draw_text_transformed(5, 130, "activate_library_area: " + string(global.activate_library_area), debug_info_text_size, debug_info_text_size, 0);
	draw_text_transformed(5, 140, "dash_dir: " + string(obj_player.dash_dir), debug_info_text_size, debug_info_text_size, 0);
	
	draw_text_transformed(5, 150, "player_state: " + string(obj_player.player_state_string), debug_info_text_size, debug_info_text_size, 0);
	
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