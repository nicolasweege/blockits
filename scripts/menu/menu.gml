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
	
	// if (mouse_within || is_selected)
	/*
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
    
    if (is_selected)
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
		
	draw_rectangle(border_left, border_top, border_right, 
		            border_bottom, true);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(xx, yy, text);
	
	// reseting
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(original_color);
	draw_set_alpha(original_alpha);
	
	/*
    	if (obj_game_controller.use_mouse_button_selection)
    	{
    		return (mouse_within && mouse_check_button_pressed(mb_left));
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
	draw_text(xx, yy, text);
	
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
		draw_set_color(hover_color);
		draw_set_alpha(1);
    }
    else
    {
        draw_set_color(color);
		draw_set_alpha(0.5);
    }
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(xx, yy, text);
	
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
	
	if (gamepad_button_check_pressed(global.device, gp_face1)) gp_last = gp_face1;
	if (gamepad_button_check_pressed(global.device, gp_face2)) gp_last = gp_face2;
	if (gamepad_button_check_pressed(global.device, gp_face3)) gp_last = gp_face3;
	if (gamepad_button_check_pressed(global.device, gp_face4)) gp_last = gp_face4;
	if (gamepad_button_check_pressed(global.device, gp_shoulderl)) gp_last = gp_shoulderl;
	if (gamepad_button_check_pressed(global.device, gp_shoulderlb)) gp_last = gp_shoulderlb;
	if (gamepad_button_check_pressed(global.device, gp_shoulderr)) gp_last = gp_shoulderr;
	if (gamepad_button_check_pressed(global.device, gp_shoulderrb)) gp_last = gp_shoulderrb;
	if (gamepad_button_check_pressed(global.device, gp_select)) gp_last = gp_select;
	if (gamepad_button_check_pressed(global.device, gp_start)) gp_last = gp_start;
	if (gamepad_button_check_pressed(global.device, gp_stickl)) gp_last = gp_stickl;
	if (gamepad_button_check_pressed(global.device, gp_stickr)) gp_last = gp_stickr;
	if (gamepad_button_check_pressed(global.device, gp_padu)) gp_last = gp_padu;
	if (gamepad_button_check_pressed(global.device, gp_padd)) gp_last = gp_padd;
	if (gamepad_button_check_pressed(global.device, gp_padl)) gp_last = gp_padl;
	if (gamepad_button_check_pressed(global.device, gp_padr)) gp_last = gp_padr;
	
	if ((gp_last == current_gp)
	    || (gp_last != global.PLAYER_up_gp 
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
	if (gamepad_button_check_pressed(global.device, gp_face1)
		|| gamepad_button_check_pressed(global.device, gp_face2)
		|| gamepad_button_check_pressed(global.device, gp_face3)
		|| gamepad_button_check_pressed(global.device, gp_face4)
		|| gamepad_button_check_pressed(global.device, gp_shoulderl)
		|| gamepad_button_check_pressed(global.device, gp_shoulderlb)
		|| gamepad_button_check_pressed(global.device, gp_shoulderr)
		|| gamepad_button_check_pressed(global.device, gp_shoulderrb)
		|| gamepad_button_check_pressed(global.device, gp_select)
		|| gamepad_button_check_pressed(global.device, gp_start)
		|| gamepad_button_check_pressed(global.device, gp_stickl)
		|| gamepad_button_check_pressed(global.device, gp_stickr)
		|| gamepad_button_check_pressed(global.device, gp_padu)
		|| gamepad_button_check_pressed(global.device, gp_padd)
		|| gamepad_button_check_pressed(global.device, gp_padl)
		|| gamepad_button_check_pressed(global.device, gp_padr))
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
		case ord("Q"):		 key_string = "Q"; break;
		case ord("W"):		 key_string = "W"; break;
		case ord("E"):		 key_string = "E"; break;
		case ord("R"):		 key_string = "R"; break;
		case ord("T"):		 key_string = "T"; break;
		case ord("Y"):		 key_string = "Y"; break;
		case ord("U"):		 key_string = "U"; break;
		case ord("I"):		 key_string = "I"; break;
		case ord("O"):		 key_string = "O"; break;
		case ord("P"):		 key_string = "P"; break;
		case ord("A"):		 key_string = "A"; break;
		case ord("S"):		 key_string = "S"; break;
		case ord("D"):		 key_string = "D"; break;
		case ord("F"):		 key_string = "F"; break;
		case ord("G"):		 key_string = "G"; break;
		case ord("H"):		 key_string = "H"; break;
		case ord("J"):		 key_string = "J"; break;
		case ord("K"):		 key_string = "K"; break;
		case ord("L"):		 key_string = "L"; break;
		case ord("Ç"):		 key_string = "Ç"; break;
		case ord("Z"):		 key_string = "Z"; break;
		case ord("X"):		 key_string = "X"; break;
		case ord("C"):		 key_string = "C"; break;
		case ord("V"):		 key_string = "V"; break;
		case ord("B"):		 key_string = "B"; break;
		case ord("N"):		 key_string = "N"; break;
		case ord("M"):		 key_string = "M"; break;
		case vk_left:        key_string = "left arrow"; break;
		case vk_right:       key_string = "right arrow"; break;
		case vk_up:          key_string = "up arrow"; break;
		case vk_down:        key_string = "down arrow"; break;
		case vk_enter:       key_string = "enter"; break;
		case vk_escape:      key_string = "escape"; break;
		case vk_space:       key_string = "space"; break;
		case vk_shift:       key_string = "shift"; break;
		case vk_rcontrol:    key_string = " right control"; break;
		case vk_lcontrol:    key_string = "left control"; break;
		case vk_alt:         key_string = "alt"; break;
		case vk_backspace:   key_string = "backspace"; break;
		case vk_tab:         key_string = "tab"; break;
		case vk_home:        key_string = "home"; break;
		case vk_end:         key_string = "end"; break;
		case vk_delete:      key_string = "delete"; break;
		case vk_insert:      key_string = "insert"; break;
		case vk_pageup:      key_string = "pageup"; break;
		case vk_pagedown:    key_string = "pagedown"; break;
		case vk_pause:       key_string = "pause"; break;
		case vk_printscreen: key_string = "printscreen"; break;
		case vk_f1:          key_string = "f1"; break;
		case vk_f2:          key_string = "f2"; break;
		case vk_f3:          key_string = "f3"; break;
		case vk_f4:          key_string = "f4"; break;
		case vk_f5:          key_string = "f5"; break;
		case vk_f6:          key_string = "f6"; break;
		case vk_f7:          key_string = "f7"; break;
		case vk_f8:          key_string = "f8"; break;
		case vk_f9:          key_string = "f9"; break;
		case vk_f10:         key_string = "f10"; break;
		case vk_f11:         key_string = "f11"; break;
		case vk_f12:         key_string = "f12"; break;
		case vk_numpad0:     key_string = "0"; break;
		case vk_numpad1:     key_string = "1"; break;
		case vk_numpad2:     key_string = "2"; break;
		case vk_numpad3:     key_string = "3"; break;
		case vk_numpad4:     key_string = "4"; break;
		case vk_numpad5:     key_string = "5"; break;
		case vk_numpad6:     key_string = "6"; break;
		case vk_numpad7:     key_string = "7"; break;
		case vk_numpad8:     key_string = "8"; break;
		case vk_numpad9:     key_string = "9"; break;
		case vk_multiply:    key_string = "multiply"; break;
		case vk_divide:      key_string = "divide"; break;
		case vk_add:         key_string = "add"; break;
		case vk_subtract:    key_string = "subtract"; break;
		case vk_decimal:     key_string = "decimal"; break;
		default:             key_string = "unknown";
	}
		
	return key_string;
}

function get_gamepad_gp_string(var_to_get_from)
{
	var gp_string = "";
	
	switch (var_to_get_from)
	{
		case gp_face1:		 gp_string = "A"; break;
		case gp_face2:		 gp_string = "B"; break;
		case gp_face3:		 gp_string = "X"; break;
		case gp_face4:		 gp_string = "Y"; break;
		case gp_shoulderl:	 gp_string = "shoulderl"; break;
		case gp_shoulderlb:	 gp_string = "shoulderlb"; break;
		case gp_shoulderr:	 gp_string = "shoulderr"; break;
		case gp_shoulderrb:	 gp_string = "shoulderrb"; break;
		case gp_select:		 gp_string = "select"; break;
		case gp_start:		 gp_string = "start"; break;
		case gp_stickl:		 gp_string = "stickl"; break;
		case gp_stickr:		 gp_string = "stickr"; break;
		case gp_padu:		 gp_string = "padu"; break;
		case gp_padd:		 gp_string = "padd"; break;
		case gp_padl:		 gp_string = "padl"; break;
		case gp_padr:		 gp_string = "padr"; break;
		default:             gp_string = "unknown";
	}
		
	return gp_string;
}