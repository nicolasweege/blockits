// for @debug / @editor use
function EDITOR_handle_and_draw_rooms_button(button_xpos, button_ypos,
                                             button_text, text_size,
                                             button_width, button_height,
                                             room_to_go_to,
                                             use_especific_text_halign = false,
                                             use_especific_text_valign = false)
{
    if (room_exists(room_to_go_to))
    {   
        var button = EDITOR_draw_text_button(button_xpos, button_ypos,
                                             button_text, text_size,
                                             button_width, button_height,
                                             c_white, c_white, c_white,
                                             use_especific_text_halign,
                                             use_especific_text_valign);
            
        if (button
            && room != room_to_go_to)
        {
            if (!instance_exists(obj_room_transition))
        	{
        		var transition = instance_create_layer(0, 0,
        		                                       "controllers",
        		                                       obj_room_transition);
                
                transition.transitioning_from_debug_menu = true;
        		transition.room_to_go                    = room_to_go_to;
        		// transition.teleporter_id                 = id;
        		
        		switch (room_to_go_to)
                {
                    case rm_bonus_1:
                        transition.xto = BONUS_1_ROOM_INIT_SPAWN_XPOS;
                        transition.yto = BONUS_1_ROOM_INIT_SPAWN_YPOS;
                    break;
                    
                    case rm_bonus_2:
                        transition.xto = BONUS_2_ROOM_INIT_SPAWN_XPOS;
                        transition.yto = BONUS_2_ROOM_INIT_SPAWN_YPOS;
                    break;
                    
                    case rm_capsule_bonus:
                        transition.xto = CAPSULE_BONUS_ROOM_INIT_SPAWN_XPOS;
                        transition.yto = CAPSULE_BONUS_ROOM_INIT_SPAWN_YPOS;
                    break;
                    
                    case rm_destroy_block_bonus:
                        transition.xto = DESTROY_BLOCK_BONUS_ROOM_INIT_SPAWN_XPOS;
                        transition.yto = DESTROY_BLOCK_BONUS_ROOM_INIT_SPAWN_YPOS;
                    break;
                    
                    case rm_laser_beam_bonus:
                        transition.xto = LASER_BEAM_BONUS_ROOM_INIT_SPAWN_XPOS;
                        transition.yto = LASER_BEAM_BONUS_ROOM_INIT_SPAWN_YPOS;
                    break;
                    
                    case rm_maze_bonus:
                        transition.xto = MAZE_BONUS_ROOM_INIT_SPAWN_XPOS;
                        transition.yto = MAZE_BONUS_ROOM_INIT_SPAWN_YPOS;
                    break;
                    
                    case rm_wall_dash_collider_bonus:
                        transition.xto = WALL_DASH_COLLIDER_BONUS_ROOM_INIT_SPAWN_XPOS;
                        transition.yto = WALL_DASH_COLLIDER_BONUS_ROOM_INIT_SPAWN_YPOS;
                    break;
                    
                    case rm_secret_1:
                        transition.xto = SECRET_1_ROOM_INIT_SPAWN_XPOS;
                        transition.yto = SECRET_1_ROOM_INIT_SPAWN_YPOS;
                    break;
                    
                    case rm_debug_1:
                        transition.xto = DEBUG_1_ROOM_INIT_SPAWN_XPOS;
                        transition.yto = DEBUG_1_ROOM_INIT_SPAWN_YPOS;
                    break;
                    
                    case rm_jungle:
                        transition.xto = JUNGLE_ROOM_INIT_SPAWN_XPOS;
                        transition.yto = JUNGLE_ROOM_INIT_SPAWN_YPOS;
                    break;
                    
                    case rm_library:
                        transition.xto = LIBRARY_ROOM_INIT_SPAWN_XPOS;
                        transition.yto = LIBRARY_ROOM_INIT_SPAWN_YPOS;
                    break;
                    
                    case rm_mountain:
                        transition.xto = MOUNTAIN_ROOM_INIT_SPAWN_XPOS;
                        transition.yto = MOUNTAIN_ROOM_INIT_SPAWN_YPOS;
                    break;
                    
                    case rm_nexus:
                        transition.xto = NEXUS_ROOM_INIT_SPAWN_XPOS;
                        transition.yto = NEXUS_ROOM_INIT_SPAWN_YPOS;
                    break;
                    
                    case rm_playground:
                        transition.xto = PLAYGROUND_ROOM_INIT_SPAWN_XPOS;
                        transition.yto = PLAYGROUND_ROOM_INIT_SPAWN_YPOS;
                    break;
                    
                    default:
                        transition.xto = (room_width / 2);
                        transition.yto = (room_height / 2);
                }
        		
        		obj_player.h_speed             = 0;
        		obj_player.v_speed             = 0;
        		obj_player.jump_pressed        = 0;
        		obj_player.coyote_can_jump     = 0;
        		obj_player.jump_buffer_counter = 0;
        	}
        }
    }
    else
    {
        var button = EDITOR_draw_text_button(button_xpos, button_ypos,
                                             "room does not exists", text_size,
                                             button_width, button_height,
                                             c_white, c_white, c_white,
                                             use_especific_text_halign,
                                             use_especific_text_valign);
    }
}

function EDITOR_handle_and_draw_layer_button(button_xpos, button_ypos,
                                             button_text, text_size,
                                             button_width, button_height,
                                             layer_name,
                                             use_especific_text_halign = false,
                                             use_especific_text_valign = false)
{
    if (layer_exists(layer_name))
    {
        
        /*
            var button = EDITOR_draw_icon_button(button_xpos, button_ypos,
                                                 button_icon, icon_sprite_subimage,
                                                 button_size, button_size,
                                                 c_white, c_green);
        */
        
        var button  = EDITOR_draw_text_button(button_xpos, button_ypos,
                                              button_text, text_size,
                                              button_width, button_height,
                                              c_white, c_white, c_white,
                                              use_especific_text_halign,
                                              use_especific_text_valign);
            
        if (button)
        {
            if (layer_get_visible(layer_name))
            {
                layer_set_visible(layer_name, false);
            }
            else
            {
                layer_set_visible(layer_name, true);
            }
        }
    }
}

function EDITOR_draw_text_button(_x, _y,
                                 text, text_size,
                                 width, height,
                                 color, hover_color, bg_color,
                                 use_especific_text_halign = false,
                                 use_especific_text_valign = false)
{
	var xx = _x;
	var yy = _y;
	var w  = (width/2);
	var h  = (height/2);
	
	var original_color = draw_get_color();
	var original_alpha = draw_get_alpha();
	
	var border_left   = xx - w;
	var border_right  = xx + w;
	var border_top    = yy - h;
	var border_bottom = yy + h;
	
	var mouse_within = point_in_rectangle(device_mouse_x_to_gui(0), 
	                                      device_mouse_y_to_gui(0), 
	                                      border_left, border_top, 
	                                      border_right, border_bottom);
	
    if (mouse_within)
    {
        global.mouse_within_debug_button = true;
        
        draw_set_color(bg_color);
        draw_set_alpha(0.2);
        
        /*
            draw_rectangle(border_left, border_top, border_right,
                           border_bottom, false);
        */
        
        draw_set_color(hover_color);
        draw_set_alpha(1);
    }
    else
    {
        draw_set_color(color);
        draw_set_alpha(0.5);
    }
    
    if (!use_especific_text_halign)
    {
        draw_set_halign(fa_center);
    }
        
    if (!use_especific_text_valign)
    {
        draw_set_valign(fa_middle);
    }
    
	draw_text_transformed(xx, yy, text, text_size, text_size, 0);
	
	// reseting
	if (!use_especific_text_halign)
    {
    	draw_set_halign(fa_left);
    }
    
    if (!use_especific_text_valign)
    {
    	draw_set_valign(fa_top);
    }
    
    draw_set_color(original_color);
    draw_set_alpha(original_alpha);
	
	// return (mouse_within && mouse_check_button_pressed(mb_left));
	return (mouse_within && mouse_check_button_released(mb_left));
}

function EDITOR_draw_icon_button(xx, yy,
                                 icon_sprite, icon_sprite_subimage,
                                 icon_xscale, icon_yscale,
                                 normal_color, hover_color)
{
    var alpha          = 1;
    var final_color    = c_white;
	var width          = sprite_get_width(icon_sprite);
	var height         = sprite_get_height(icon_sprite);
	
	var border_left    = xx;
	var border_right   = ((xx + (icon_xscale * width)) - 1);
	var border_top     = yy;
	var border_bottom  = ((yy + (icon_yscale * height)) - 1);
	
	var mouse_within   = point_in_rectangle(device_mouse_x_to_gui(0),
	                                        device_mouse_y_to_gui(0),
	                                        border_left, border_top,
	                                        border_right, border_bottom);
	
    if (mouse_within)
    {
        global.mouse_within_debug_button = true;
        
        // final_color = hover_color;
        final_color = c_gray;
        alpha       = 1;
        
        // drawing background rectangle
        // draw_set_color(hover_color);
        draw_set_color(c_white);
        // draw_set_alpha(0.5);
        
        /*
        draw_rectangle(border_left, border_top, border_right, 
        border_bottom, false);
        */
        
        draw_rectangle(border_left, border_top, border_right, 
        border_bottom, true);
                
        draw_set_color(c_white);
        draw_set_alpha(1);
    }
    else
    {
        // final_color = normal_color;
        final_color = c_gray;
        // alpha       = 0.5;
    }
	
    draw_sprite_ext(icon_sprite, icon_sprite_subimage,
                    xx, yy,
                    icon_xscale, icon_yscale,
                    0, final_color, alpha);
	
	// return (mouse_within && mouse_check_button_pressed(mb_left));
	return (mouse_within && mouse_check_button_released(mb_left));
}

// for @in-game use
function blockits_draw_button(_x, _y, text, 
                              width, height, 
                              color, hover_color, bg_color, 
                              is_selected = false)
{
	var xx = _x;
	var yy = _y;
	var w = (width/2);
	var h = (height/2);
	
	var original_color = draw_get_color();
	var original_alpha = draw_get_alpha();
	
	var border_left = xx - w;
	var border_right = xx + w;
	var border_top = yy - h;
	var border_bottom = yy + h;
	
	var mouse_within = point_in_rectangle(device_mouse_x_to_gui(0), 
	                                      device_mouse_y_to_gui(0), 
	                                      border_left, border_top, 
	                                      border_right, border_bottom);
	
    /*
        // if (mouse_within || is_selected)
        if (mouse_within)
        {
            draw_set_color(bg_color);
            draw_set_alpha(0.2);
            
            draw_rectangle(border_left, border_top, border_right, 
            border_bottom, false);
            
            draw_set_color(hover_color);
            draw_set_alpha(1);
        }
        else
        {
            draw_set_color(color);
            draw_set_alpha(0.5);
        }
    */
    
    /*
        if (is_selected)
        {
    		draw_set_alpha(0.2);
    		
    		draw_rectangle(border_left, border_top, border_right, 
    		               border_bottom, false);
    					   
    		draw_set_color(hover_color);
    		draw_set_alpha(1);
        }
        else
        {
            draw_set_color(color);
    		draw_set_alpha(0.5);
        }
    	
    	draw_rectangle(border_left, border_top, border_right, 
    		            border_bottom, true);
    */
    
    if (is_selected)
    {
        // global.camy += sin(global.shake_remain * 3);
        /*
            global.button_green_color += sin(global.button_green_color_to * 3);
            global.button_blue_color  += sin(global.button_blue_color * 3);
            global.button_red_color   += sin(global.button_red_color * 3);
        */
        
        /*
            if (global.button_green_color <= global.button_green_color_to)
            {
                global.button_green_color = lerp(global.button_green_color, 
                                                 global.button_green_color_to, 
                                                 0.1);
                                                 
            	global.button_blue_color  = lerp(global.button_blue_color, 
            	                                 global.button_blue_color_to, 
            	                                 0.1);
            	                                 
            	global.button_red_color   = lerp(global.button_red_color, 
            	                                 global.button_red_color_to, 
            	                                 0.1);
            }
            else if (global.button_green_color <= global.button_green_color_to)
            {
                global.button_green_color = lerp(global.button_green_color, 
                                                 0, 
                                                 0.1);
                                                 
            	global.button_blue_color  = lerp(global.button_blue_color, 
            	                                 0, 
            	                                 0.1);
            	                                 
            	global.button_red_color   = lerp(global.button_red_color, 
            	                                 0, 
            	                                 0.1);
            }
        */
        
        global.button_green_color = lerp(global.button_green_color, 
                                         global.button_green_color_to, 
                                         0.04);
                                             
    	global.button_blue_color  = lerp(global.button_blue_color, 
    	                                 global.button_blue_color_to, 
    	                                 0.04);
    	                                 
    	global.button_red_color   = lerp(global.button_red_color, 
    	                                 global.button_red_color_to, 
    	                                 0.04);
    	
        draw_set_color(make_color_rgb(global.button_red_color, 
                                      global.button_green_color, 
                                      global.button_blue_color));
        
		// draw_set_color(hover_color);
		draw_set_alpha(1);
    }
    else
    {   
        draw_set_color(color);
		draw_set_alpha(0.5);
    }
    
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	// draw_text(xx, yy, text);
	draw_text_transformed(xx, yy, text, 0.2, 0.2, 0);
	
	// reseting
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(original_color);
	draw_set_alpha(original_alpha);
	
	/*
    	if (obj_game_controller.use_mouse_button_selection)
    	{
    		// return (mouse_within && mouse_check_button_pressed(mb_left));
    		return (mouse_within && mouse_check_button_released(mb_left));
    	}
    	else
    	{
    		return (is_selected && menu_select);
    	}
	*/
	
	return (is_selected && menu_select);
}

function blockits_draw_menu_text(_x, _y, text, color)
{
	var xx = _x;
	var yy = _y;
	
	var original_color = draw_get_color();
	var original_alpha = draw_get_alpha();
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(color);
	// draw_text(xx, yy, text);
	draw_text_transformed(xx, yy, text, 0.2, 0.2, 0);
	
	// reseting
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(original_color);
	draw_set_alpha(original_alpha);
}

function blockits_draw_selectable_menu_text(_x, _y, 
                                            text, 
                                            color, hover_color, bg_color, 
                                            is_selected = false)
{
	var xx = _x;
	var yy = _y;
	
	var original_color = draw_get_color();
	var original_alpha = draw_get_alpha();
	
	if (is_selected)
    {	
        draw_set_color(make_color_rgb(global.button_red_color, 
                                      global.button_green_color, 
                                      global.button_blue_color));
                                      
		// draw_set_color(hover_color);
		draw_set_alpha(1);
    }
    else
    {
        draw_set_color(color);
		draw_set_alpha(0.5);
    }
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	// draw_text(xx, yy, text);
	draw_text_transformed(xx, yy, text, 0.2, 0.2, 0);
	
	// reseting
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(original_color);
	draw_set_alpha(original_alpha);
}

function get_keyboard_new_keybind(current_key)
{
	var vk_last = keyboard_lastkey;
	
	if ((vk_last == current_key)
	    || 
		(vk_last != global.PLAYER_up_key
	    && vk_last != global.PLAYER_down_key 
		&& vk_last != global.PLAYER_left_key 
		&& vk_last != global.PLAYER_right_key
		&& vk_last != global.PLAYER_jump_key
		&& vk_last != global.PLAYER_dash_key
		&& vk_last != global.MENU_select_key
		&& vk_last != global.MENU_exit_key
		&& vk_last != global.MENU_pause_key))
	{
		return vk_last;
	}
	
	return vk_nokey;
}

function get_gamepad_new_keybind(current_gp)
{
	var gp_last = -1;
	
	if (gamepad_button_check_pressed(global.gamepad_device, gp_face1))      gp_last = gp_face1;
	if (gamepad_button_check_pressed(global.gamepad_device, gp_face2))      gp_last = gp_face2;
	if (gamepad_button_check_pressed(global.gamepad_device, gp_face3))      gp_last = gp_face3;
	if (gamepad_button_check_pressed(global.gamepad_device, gp_face4))      gp_last = gp_face4;
	if (gamepad_button_check_pressed(global.gamepad_device, gp_shoulderl))  gp_last = gp_shoulderl;
	if (gamepad_button_check_pressed(global.gamepad_device, gp_shoulderlb)) gp_last = gp_shoulderlb;
	if (gamepad_button_check_pressed(global.gamepad_device, gp_shoulderr))  gp_last = gp_shoulderr;
	if (gamepad_button_check_pressed(global.gamepad_device, gp_shoulderrb)) gp_last = gp_shoulderrb;
	if (gamepad_button_check_pressed(global.gamepad_device, gp_select))     gp_last = gp_select;
	if (gamepad_button_check_pressed(global.gamepad_device, gp_start))      gp_last = gp_start;
	if (gamepad_button_check_pressed(global.gamepad_device, gp_stickl))     gp_last = gp_stickl;
	if (gamepad_button_check_pressed(global.gamepad_device, gp_stickr))     gp_last = gp_stickr;
	if (gamepad_button_check_pressed(global.gamepad_device, gp_padu))       gp_last = gp_padu;
	if (gamepad_button_check_pressed(global.gamepad_device, gp_padd))       gp_last = gp_padd;
	if (gamepad_button_check_pressed(global.gamepad_device, gp_padl))       gp_last = gp_padl;
	if (gamepad_button_check_pressed(global.gamepad_device, gp_padr))       gp_last = gp_padr;
	
	if ((gp_last == current_gp)
	    || 
	    (gp_last != global.PLAYER_up_gp 
	    && gp_last != global.PLAYER_down_gp 
		&& gp_last != global.PLAYER_left_gp 
		&& gp_last != global.PLAYER_right_gp
		&& gp_last != global.PLAYER_jump_gp
		&& gp_last != global.PLAYER_dash_gp))
	{
		return gp_last;
	}
	
	return -1;
}

function check_gamepad_keybind_input()
{	
	if (gamepad_button_check_pressed(global.gamepad_device, gp_face1)
		|| gamepad_button_check_pressed(global.gamepad_device, gp_face2)
		|| gamepad_button_check_pressed(global.gamepad_device, gp_face3)
		|| gamepad_button_check_pressed(global.gamepad_device, gp_face4)
		|| gamepad_button_check_pressed(global.gamepad_device, gp_shoulderl)
		|| gamepad_button_check_pressed(global.gamepad_device, gp_shoulderlb)
		|| gamepad_button_check_pressed(global.gamepad_device, gp_shoulderr)
		|| gamepad_button_check_pressed(global.gamepad_device, gp_shoulderrb)
		|| gamepad_button_check_pressed(global.gamepad_device, gp_select)
		|| gamepad_button_check_pressed(global.gamepad_device, gp_start)
		|| gamepad_button_check_pressed(global.gamepad_device, gp_stickl)
		|| gamepad_button_check_pressed(global.gamepad_device, gp_stickr)
		|| gamepad_button_check_pressed(global.gamepad_device, gp_padu)
		|| gamepad_button_check_pressed(global.gamepad_device, gp_padd)
		|| gamepad_button_check_pressed(global.gamepad_device, gp_padl)
		|| gamepad_button_check_pressed(global.gamepad_device, gp_padr))
	{
		return true;
	}
	
	return false;
}

function get_keyboard_key_string(var_to_get_from)
{
	var key_string = "";
		
	switch (var_to_get_from)
	{
		case ord("Q"):		 key_string = "Q";              break;
		case ord("W"):		 key_string = "W";              break;
		case ord("E"):		 key_string = "E";              break;
		case ord("R"):		 key_string = "R";              break;
		case ord("T"):		 key_string = "T";              break;
		case ord("Y"):		 key_string = "Y";              break;
		case ord("U"):		 key_string = "U";              break;
		case ord("I"):		 key_string = "I";              break;
		case ord("O"):		 key_string = "O";              break;
		case ord("P"):		 key_string = "P";              break;
		case ord("A"):		 key_string = "A";              break;
		case ord("S"):		 key_string = "S";              break;
		case ord("D"):		 key_string = "D";              break;
		case ord("F"):		 key_string = "F";              break;
		case ord("G"):		 key_string = "G";              break;
		case ord("H"):		 key_string = "H";              break;
		case ord("J"):		 key_string = "J";              break;
		case ord("K"):		 key_string = "K";              break;
		case ord("L"):		 key_string = "L";              break;
		case ord("Ç"):		 key_string = "Ç";              break;
		case ord("Z"):		 key_string = "Z";              break;
		case ord("X"):		 key_string = "X";              break;
		case ord("C"):		 key_string = "C";              break;
		case ord("V"):		 key_string = "V";              break;
		case ord("B"):		 key_string = "B";              break;
		case ord("N"):		 key_string = "N";              break;
		case ord("M"):		 key_string = "M";              break;
		case vk_left:        key_string = "left arrow";     break;
		case vk_right:       key_string = "right arrow";    break;
		case vk_up:          key_string = "up arrow";       break;
		case vk_down:        key_string = "down arrow";     break;
		case vk_enter:       key_string = "enter";          break;
		case vk_escape:      key_string = "escape";         break;
		case vk_space:       key_string = "space";          break;
		case vk_shift:       key_string = "shift";          break;
		case vk_rcontrol:    key_string = " right control"; break;
		case vk_lcontrol:    key_string = "left control";   break;
		case vk_alt:         key_string = "alt";            break;
		case vk_backspace:   key_string = "backspace";      break;
		case vk_tab:         key_string = "tab";            break;
		case vk_home:        key_string = "home";           break;
		case vk_end:         key_string = "end";            break;
		case vk_delete:      key_string = "delete";         break;
		case vk_insert:      key_string = "insert";         break;
		case vk_pageup:      key_string = "pageup";         break;
		case vk_pagedown:    key_string = "pagedown";       break;
		case vk_pause:       key_string = "pause";          break;
		case vk_printscreen: key_string = "printscreen";    break;
		case vk_f1:          key_string = "f1";             break;
		case vk_f2:          key_string = "f2";             break;
		case vk_f3:          key_string = "f3";             break;
		case vk_f4:          key_string = "f4";             break;
		case vk_f5:          key_string = "f5";             break;
		case vk_f6:          key_string = "f6";             break;
		case vk_f7:          key_string = "f7";             break;
		case vk_f8:          key_string = "f8";             break;
		case vk_f9:          key_string = "f9";             break;
		case vk_f10:         key_string = "f10";            break;
		case vk_f11:         key_string = "f11";            break;
		case vk_f12:         key_string = "f12";            break;
		case vk_numpad0:     key_string = "0";              break;
		case vk_numpad1:     key_string = "1";              break;
		case vk_numpad2:     key_string = "2";              break;
		case vk_numpad3:     key_string = "3";              break;
		case vk_numpad4:     key_string = "4";              break;
		case vk_numpad5:     key_string = "5";              break;
		case vk_numpad6:     key_string = "6";              break;
		case vk_numpad7:     key_string = "7";              break;
		case vk_numpad8:     key_string = "8";              break;
		case vk_numpad9:     key_string = "9";              break;
		case vk_multiply:    key_string = "multiply";       break;
		case vk_divide:      key_string = "divide";         break;
		case vk_add:         key_string = "add";            break;
		case vk_subtract:    key_string = "subtract";       break;
		case vk_decimal:     key_string = "decimal";        break;
		
		default:             key_string = "unknown";
	}
		
	return key_string;
}

function get_gamepad_gp_string(var_to_get_from)
{
	var gp_string = "";
	
	switch (var_to_get_from)
	{
		case gp_face1:		gp_string = "A";          break;
		case gp_face2:		gp_string = "B";          break;
		case gp_face3:		gp_string = "X";          break;
		case gp_face4:		gp_string = "Y";          break;
		case gp_shoulderl:	gp_string = "shoulderl";  break;
		case gp_shoulderlb:	gp_string = "shoulderlb"; break;
		case gp_shoulderr:	gp_string = "shoulderr";  break;
		case gp_shoulderrb: gp_string = "shoulderrb"; break;
		case gp_select:		gp_string = "select";     break;
		case gp_start:		gp_string = "start";      break;
		case gp_stickl:		gp_string = "stickl";     break;
		case gp_stickr:		gp_string = "stickr";     break;
		case gp_padu:		gp_string = "padu";       break;
		case gp_padd:		gp_string = "padd";       break;
		case gp_padl:		gp_string = "padl";       break;
		case gp_padr:		gp_string = "padr";       break;
		
		default:            gp_string = "unknown";
	}
		
	return gp_string;
}

function MENU_get_gamepad_icon_to_draw(var_to_get_from)
{
	var gp_icon = 0;
	
	switch (var_to_get_from)
	{
		case gp_face1:		gp_icon = "A";          break;
		case gp_face2:		gp_icon = "B";          break;
		case gp_face3:		gp_icon = "X";          break;
		case gp_face4:		gp_icon = "Y";          break;
		case gp_shoulderl:	gp_icon = "shoulderl";  break;
		case gp_shoulderlb:	gp_icon = "shoulderlb"; break;
		case gp_shoulderr:	gp_icon = "shoulderr";  break;
		case gp_shoulderrb: gp_icon = "shoulderrb"; break;
		case gp_select:		gp_icon = "select";     break;
		case gp_start:		gp_icon = "start";      break;
		case gp_stickl:		gp_icon = "stickl";     break;
		case gp_stickr:		gp_icon = "stickr";     break;
		case gp_padu:		gp_icon = "padu";       break;
		case gp_padd:		gp_icon = "padd";       break;
		case gp_padl:		gp_icon = "padl";       break;
		case gp_padr:		gp_icon = "padr";       break;
		
		default:            gp_icon = "unknown";
	}
		
	return gp_icon;
}