if (obj_debug.show_debug_info) draw_debug_stuff = true;
else draw_debug_stuff = false;

if (global.app_state == states.PAUSE_MENU || global.app_state == states.EDITOR)
{
    exit;
}

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

// killing the player if colliding with it
if (colliding_with_player && obj_player.player_state != obj_player.death_state)
{
    with (obj_player)
    {
        screen_shake(5, 10, true, true);
        PLAYER_goto_death_state();
    }
}