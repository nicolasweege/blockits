draw_set_font(fnt_default);

update_menu_inputs();

if (!change_vk_keybind
    && !change_gp_keybind)
{
    if (menu_up)
    {
    	audio_play_sound(snd_button_selected, 1, 0);
    	menu_index -= 1;	
    }
    
    if (menu_down)
    {
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