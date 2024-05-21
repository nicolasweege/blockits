if (place_meeting(x, y, obj_player)
    && obj_player.player_state == obj_player.dash_state)
{
    if (laser_direction == 1)
    {
        with (obj_player)
        {
            h_speed               = 0;
            v_speed               = 0;
            jump_pressed          = 0;
            coyote_can_jump       = 0;
            jump_buffer_counter   = 0;
            can_jumper_dash_timer = 0;
            can_dash              = 1;
            
            x = (other.bbox_right - (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
            y = other.bbox_bottom;
            
            player_state = free_state;
        }
    }
    else if (laser_direction == -1)
    {
        with (obj_player)
        {
            h_speed               = 0;
            v_speed               = 0;
            jump_pressed          = 0;
            coyote_can_jump       = 0;
            jump_buffer_counter   = 0;
            can_jumper_dash_timer = 0;
            can_dash              = 1;
            
            x = (other.bbox_left + (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
            y = other.bbox_bottom;
            
            player_state = free_state;
        }
    }
    else if (laser_direction == 0)
    {
        show_debug_message("laser_direction is 0!");
    }
}