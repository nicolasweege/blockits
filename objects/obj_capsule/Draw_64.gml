if (obj_game_controller.show_debug_info)
{
    draw_set_color(c_white);
	draw_set_font(fnt_debug);
	draw_set_alpha(0.6);
	
    draw_text_transformed(x, y, 
                      "current_state: " + string(current_state_string), 
                      0.2, 0.2, 0);
    
    draw_set_color(c_white);
	draw_set_font(-1);
	draw_set_alpha(1);
}