/*
    if (obj_player.player_state == obj_player.god_mode_state)
    {
        draw_set_alpha(0.1);
        
        draw_line_width_colour(0, (VIEW_H / 2), (VIEW_W / 2), (VIEW_H / 2), 0.5, c_white, c_white);
        draw_line_width_colour((VIEW_W / 2), (VIEW_H / 2), VIEW_W, (VIEW_H / 2), 0.5, c_white, c_white);
        
        draw_line_width_colour((VIEW_W / 2), 0, (VIEW_W / 2), (VIEW_H / 2), 0.5, c_white, c_white);
        draw_line_width_colour((VIEW_W / 2), (VIEW_H / 2), (VIEW_W / 2), VIEW_H, 0.5, c_white, c_white);
        
        draw_set_alpha(1);
    }
*/

/*
    // Scene blooms and vignettes (maybe we're going this way,
    // instead of placing individual sprites in the rooms).
    switch (room)
    {
        case rm_jungle:
            gpu_set_blendmode(bm_add);
            // green bloom
            draw_sprite_ext(spr_bloom_gradient, 0, 0 + 30, 0 + 30, 1, 1, 0, make_colour_rgb(169, 255, 0), 0.1);
            
            // purple bloom
            draw_sprite_ext(spr_bloom_gradient, 0, global.cam_width, global.cam_height, 1, 1, 0, make_colour_rgb(55, 00, 255), 0.1);
            
            gpu_set_blendmode(bm_normal); 
            
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
            gpu_set_blendmode(bm_add);
            draw_sprite_ext(spr_bloom_gradient, 0, 0, 0, 1, 1, 0, c_purple, .4);
            gpu_set_blendmode(bm_normal);
            
            // vignette
            draw_sprite_ext(spr_bloom_gradient, 0, global.cam_width - 50, 0, 1, 1, 0, c_black, 0.4);
            draw_sprite_ext(spr_bloom_gradient, 0, 0 + 50, global.cam_height, 1, 1, 0, c_black, 0.4);
        break;
        
        case rm_nexus:
            // vignette
            draw_sprite_ext(spr_bloom_gradient, 0, global.cam_width - 50, 0, 1, 1, 0, c_black, 0.4);
            draw_sprite_ext(spr_bloom_gradient, 0, 0 + 50, global.cam_height, 1, 1, 0, c_black, 0.4);
        break;
    }
*/

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
	
    var _current_room_string = "";
    switch (room)
    {
        case rm_main_menu:
            _current_room_string = "Main menu";
        break;
        
        case rm_playground:
            _current_room_string = "Playground";
        break;
        
        case rm_nexus:
            _current_room_string = "Nexus";
        break;
        
        case rm_mountain:
            _current_room_string = "Mountain";
        break;
        
        case rm_mockups:
            _current_room_string = "Mockups";
        break;
        
        case rm_library:
            _current_room_string = "Library";
        break;
        
        case rm_jungle:
            _current_room_string = "Jungle";
        break;
        
        case rm_end:
            _current_room_string = "End";
        break;
        
        case rm_bonus_1:
            _current_room_string = "Bonus 1";
        break;
        
        case rm_bonus_2:
            _current_room_string = "Bonus 2";
        break;
        
        default:
            _current_room_string = "Generic room";
    }
	
	draw_set_color(c_yellow);
	draw_text_transformed(5, 160, "current room: " + _current_room_string, debug_info_text_size, debug_info_text_size, 0);
	draw_set_color(c_white);
	
	/*
    	if (instance_exists(obj_level_editor))
    	{
    	   draw_text_transformed((VIEW_W - 100), (0 + 10), string(obj_level_editor.real_obj_to_grab.image_xscale), 0.2, 0.2, 0);
    	   draw_text_transformed((VIEW_W - 100), (0 + 10) + 10, string(obj_level_editor.real_obj_to_grab.image_yscale), 0.2, 0.2, 0);
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
	                      0.2,
	                      0.2,
	                      0);
	
	draw_set_color(c_white);
	draw_set_font(-1);
	draw_set_alpha(1);
}

// Pausing
if (global.app_state == states.PAUSE_MENU
    && global.app_state == states.MAIN_MENU)
{
    exit;
}

// @TODO @Incomplete: move this to the obj_level_editor when possible
// Editor buttons
if (global.app_state == states.EDITOR)
{
    // triggers
    var triggers_button = EDITOR_draw_icon_button(VIEW_W - 20, 10,
                                                  spr_triggers, 0,
                                                  0.4, 0.4,
                                                  c_white, c_green);
    
    if (triggers_button)
    {
        if (can_show_debug_layers)
        {
            can_show_debug_layers = false;
        }
        else
        {
            can_show_debug_layers = true;
        }
        
        layer_set_visible("default_colliders", can_show_debug_layers);
    	layer_set_visible("death_colliders", can_show_debug_layers);
    	layer_set_visible("checkpoints", can_show_debug_layers);
    	layer_set_visible("level_changers", can_show_debug_layers);
    	layer_set_visible("camera_offset_masks", can_show_debug_layers);
    }
    
    // debug info
    var debug_info_button = EDITOR_draw_icon_button(VIEW_W - 10, 10,
                                                    spr_debug_info, 0,
                                                    0.4, 0.4,
                                                    c_white, c_green);
    
    if (debug_info_button)
    {
        if (show_debug_info)
        {
            show_debug_info = false;
        }
        else
        {
            show_debug_info = true;
        }
        
        show_debug_overlay(show_debug_info);
    }
    
    // blooms and vignettes
    var blooms_vignettes_button = EDITOR_draw_icon_button(VIEW_W - 10, 20,
                                                          spr_blooms_vignettes, 0,
                                                          0.4, 0.4,
                                                          c_white, c_green);
    
    if (blooms_vignettes_button)
    {
        // toggle using scene bloom effects
        if (keyboard_check_pressed(vk_f4))
        {
        	global.use_scene_bloom_and_vignette = !global.use_scene_bloom_and_vignette;
        	
        	if (layer_exists("foreground_scene_bloom"))
        	{
        		layer_set_visible("foreground_scene_bloom", !layer_get_visible("foreground_scene_bloom"));
        	}
        	if (layer_exists("foreground_scene_bloom_vignette"))
        	{
        		layer_set_visible("foreground_scene_bloom_vignette", !layer_get_visible("foreground_scene_bloom_vignette"));
        	}
        }
    }
    
    var player_visibility_button = EDITOR_draw_icon_button(VIEW_W - 20, 20,
                                                          spr_player_visibility, 0,
                                                          0.4, 0.4,
                                                          c_white, c_green);
    
    if (player_visibility_button)
    {
        layer_set_visible(PLAYER_LAYER, !layer_get_visible(PLAYER_LAYER));
    }
}