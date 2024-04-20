if (room == rm_main_menu)
{
	exit;
}

// handling menu when pausing
if (global.app_state == states.PAUSE_MENU)
{
	// pause background
	draw_set_alpha(0.95);
	draw_rectangle_color(0, 0, global.cam_width, global.cam_height, 
	                     c_black, c_black, c_black, c_black, 
						 0);
	draw_set_alpha(1);
	
	// draw_sprite(spr_menu_border, 0, 0, 0);
	
	update_menu_inputs();
	
	if (menu_exit_page)
	{
	    global.button_green_color = global.initial_button_green_color;
        global.button_blue_color  = global.initial_button_blue_color;
        global.button_red_color   = global.initial_button_red_color;
	}
	
	if (!change_vk_keybind
        && !change_gp_keybind)
    {
        if (menu_select)
        {
            global.button_green_color = global.initial_button_green_color;
            global.button_blue_color  = global.initial_button_blue_color;
            global.button_red_color   = global.initial_button_red_color;
        }
    
        if (menu_up)
        {
            global.button_green_color = global.initial_button_green_color;
            global.button_blue_color  = global.initial_button_blue_color;
            global.button_red_color   = global.initial_button_red_color;
            
        	audio_play_sound(snd_button_selected, 1, 0);
        	menu_index -= 1;	
        }
        
        if (menu_down)
        {
            global.button_green_color = global.initial_button_green_color;
            global.button_blue_color  = global.initial_button_blue_color;
            global.button_red_color   = global.initial_button_red_color;
            
        	audio_play_sound(snd_button_selected, 1, 0);
        	menu_index += 1;
        }
        
        if (menu_index < 1)
        {
        	menu_index = current_button_options;
        }
        
        if (menu_index > current_button_options)
        {
        	menu_index = 1;	
        }
    }
    
    switch (global.current_language_in_use)
    {
        case MENU_current_language.english:
            draw_set_font(global.karmina_regular_font);
        break;
        
        case MENU_current_language.portuguese_brazil:
            draw_set_font(global.karmina_regular_font);
        break;
        
        case MENU_current_language.french:
            draw_set_font(global.karmina_regular_font);
        break;
        
        case MENU_current_language.italian:
            draw_set_font(global.karmina_regular_font);
        break;
        
        case MENU_current_language.german:
            draw_set_font(global.karmina_regular_font);
        break;
        
        case MENU_current_language.spanish_spain:
            draw_set_font(global.karmina_regular_font);
        break;
        
        case MENU_current_language.japanese:
            draw_set_font(global.noto_sans_mono_cjk_jp_regular_font);
        break;
        
        case MENU_current_language.korean:
            draw_set_font(global.noto_sans_mono_cjk_jp_regular_font);
        break;
        
        case MENU_current_language.russian:
            draw_set_font(global.noto_sans_mono_cjk_jp_regular_font);
        break;
        
        case MENU_current_language.simplified_chinese:
            draw_set_font(global.noto_sans_mono_cjk_jp_regular_font);
        break;
    }
    
	current_menu();
	draw_set_font(-1);
}