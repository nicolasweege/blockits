
if (current_state != destroy_state)
{
    draw_self();
}

if (obj_game_controller.show_debug_info)
{
    // depth = 9999;
    draw_set_color(c_yellow);
	draw_set_font(fnt_debug);
	draw_set_alpha(0.6);
	
    draw_text_transformed((x - (sprite_get_width(sprite_index) / 2)), 
                          (y - sprite_get_height(sprite_index)),
                          string(current_state_string), 
                          0.2, 0.2, 0);
    
    draw_set_color(c_green);
    
    var _player_sprite_width 
    = sprite_get_width(PLAYER_COLLISION_MASK_SPRITE);
    
    draw_rectangle((x - (distance_from_player_to_check - sprite_get_width(PLAYER_COLLISION_MASK_SPRITE))), 
                   (y - (distance_from_player_to_check - sprite_get_height(PLAYER_COLLISION_MASK_SPRITE))), 
                   (x + (distance_from_player_to_check - sprite_get_width(PLAYER_COLLISION_MASK_SPRITE))), 
                   (y + (distance_from_player_to_check - sprite_get_height(PLAYER_COLLISION_MASK_SPRITE))), 
                   true);
    
    // depth = original_depth;
    draw_set_color(c_white);
	draw_set_font(-1);
	draw_set_alpha(1);
}