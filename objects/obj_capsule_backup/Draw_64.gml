if (global.debug_mode)
{
    draw_set_color(c_yellow);
	draw_set_font(global.karmina_regular_font);
	draw_set_alpha(0.6);
	
	/*
        draw_text_transformed((x - (sprite_get_width(sprite_index) / 2)), 
                              ((y - sprite_get_height(sprite_index)) - 5),
                              string(current_state_string), 
                              0.1, 0.1, 0);
    */

    /*                    
        draw_text_transformed(280, 150,
                              string(current_state_string), 
                              0.1, 0.1, 0);
    */
    
    draw_set_color(c_white);
	draw_set_font(-1);
	draw_set_alpha(1);
}