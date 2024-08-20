if (current_state != destroy_state)
{
    draw_self();
}

if (global.app_state == states.EDITOR
    && obj_player.player_state == obj_player.god_mode_state)
{
    draw_set_color(c_yellow);
	draw_set_font(global.karmina_regular_font);
	draw_set_alpha(0.6);
	
    draw_text_transformed((x - (sprite_get_width(sprite_index) / 2)), 
                          ((y - sprite_get_height(sprite_index)) - 5),
                          string(current_state_string), 
                          0.15, 0.15, 0);

    /*
        draw_text_transformed(280, 150,
                              string(current_state_string), 
                              0.1, 0.1, 0);
    */
	
    draw_set_color(c_green);
    
    draw_rectangle((x - (distance_from_player_to_check - sprite_get_width(PLAYER_COLLISION_MASK_SPRITE))), 
                   (y - (distance_from_player_to_check - sprite_get_height(PLAYER_COLLISION_MASK_SPRITE))), 
                   (x + (distance_from_player_to_check - sprite_get_width(PLAYER_COLLISION_MASK_SPRITE))), 
                   (y + (distance_from_player_to_check - sprite_get_height(PLAYER_COLLISION_MASK_SPRITE))), 
                   true);
                   
    draw_set_color(c_white);
	draw_set_font(-1);
	draw_set_alpha(1);
}