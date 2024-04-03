
if (current_state != destroy_state)
{
    draw_self();
}

if (obj_game_controller.show_debug_info)
{
    depth = 9999;
    draw_set_color(c_yellow);
	draw_set_font(fnt_debug);
	draw_set_alpha(0.6);
	
    draw_text_transformed((x - (sprite_get_width(sprite_index) / 2)), 
                          (y - sprite_get_height(sprite_index)),
                          string(current_state_string), 
                          0.2, 0.2, 0);
    
    depth = original_depth;
    draw_set_color(c_white);
	draw_set_font(-1);
	draw_set_alpha(1);
}