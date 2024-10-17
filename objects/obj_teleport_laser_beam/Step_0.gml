if (obj_debug.show_debug_info) draw_debug_stuff = true;
else draw_debug_stuff = false;

// defining the player's teleport position if colliding with laser_block or not
var colliding_with_player = false;
if (place_meeting(x, y, obj_falling_laser_block))
{
    var laser_block = instance_place(x, y, obj_falling_laser_block);
    if (laser_block)
    {
        if (laser_direction == 1)
        {
            player_teleport_xpos = (laser_block.bbox_left - (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
            player_teleport_xpos_to_draw = laser_block.bbox_left;
        }
        else if (laser_direction == -1)
        {
            player_teleport_xpos = (laser_block.bbox_right + (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
            player_teleport_xpos_to_draw = laser_block.bbox_right;
        }
    }
}
else
{
    if (laser_direction == 1)
    {
        player_teleport_xpos = (other.bbox_right - (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
        player_teleport_xpos_to_draw = (other.bbox_right - (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
    }
    else if (laser_direction == -1)
    {
        player_teleport_xpos = (other.bbox_left + (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
        player_teleport_xpos_to_draw = (other.bbox_left + (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
    }
    
}

// checking for collisions with the player when the laser is colliding with a laser_block
if (place_meeting(x, y, obj_falling_laser_block))
{
    if (laser_direction == 1)
    {
        if (collision_rectangle(x, y, (player_teleport_xpos_to_draw - 1), ((y + sprite_get_height(sprite_to_draw)) - 1), 
                                obj_player, false, true))
        {
            colliding_with_player = true;
        }
    }
    else if (laser_direction == -1)
    {
        if (collision_rectangle(player_teleport_xpos_to_draw, y, (bbox_right - 1), ((y + sprite_get_height(sprite_to_draw)) - 1), 
                                obj_player, false, true))
        {
            colliding_with_player = true;
        }
    }
}
else // checking for collisions normally
{
    if (laser_direction == 1)
    {
        if (collision_rectangle(x, y, (bbox_right - 1), ((y + sprite_get_height(sprite_to_draw)) - 1), 
                                obj_player, false, true))
        {
            colliding_with_player = true;
        }
    }
    else if (laser_direction == -1)
    {
        if (collision_rectangle(bbox_left, y, (bbox_right - 1), ((y + sprite_get_height(sprite_to_draw)) - 1), 
                                obj_player, false, true))
        {
            colliding_with_player = true;
        }
    }
}

// teleporting the player when dashing
// place_meeting(x, y, obj_player)
if (colliding_with_player
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
            
            x = other.player_teleport_xpos;
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
            
            x = other.player_teleport_xpos;
            y = other.bbox_bottom;
            
            player_state = free_state;
        }
    }
    else if (laser_direction == 0)
    {
        show_debug_message("laser_direction is 0!");
    }
}