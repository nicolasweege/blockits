draw_set_font(global.karmina_regular_font);

update_menu_inputs();

if (menu_select
    || menu_exit_page
    || menu_right
    || menu_left)
{
    global.button_green_color = global.initial_button_green_color;
    global.button_blue_color  = global.initial_button_blue_color;
    global.button_red_color   = global.initial_button_red_color;
}

if (!change_vk_keybind
    && !change_gp_keybind)
{
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

current_menu();

draw_set_font(-1);