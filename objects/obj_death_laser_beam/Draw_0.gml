// drawing the laser according to the right or left limits if colliding with a laser_block
if (place_meeting(x, y, obj_falling_laser_block))
{
    if (laser_direction == 1)
    {
        draw_sprite_pos(sprite_to_draw, image_index, 
                        x, y, 
                        player_teleport_xpos_to_draw, y, 
                        player_teleport_xpos_to_draw, (y + sprite_get_height(sprite_to_draw)), 
                        x, (y + sprite_get_height(sprite_to_draw)), 
                        image_alpha);
        
        // debug
        if (draw_debug_stuff)
        {
            draw_rectangle(x, y, (player_teleport_xpos_to_draw - 1), ((y + sprite_get_height(sprite_to_draw)) - 1), true);
        }
    }
    else if (laser_direction == -1)
    {
        draw_sprite_pos(sprite_to_draw, image_index, 
                        player_teleport_xpos_to_draw, y, 
                        bbox_right, y, 
                        bbox_right, (y + sprite_get_height(sprite_to_draw)), 
                        player_teleport_xpos_to_draw, (y + sprite_get_height(sprite_to_draw)), 
                        image_alpha);
        
        // debug
        if (draw_debug_stuff)
        {
            draw_rectangle(player_teleport_xpos_to_draw, y, (bbox_right - 1), ((y + sprite_get_height(sprite_to_draw)) - 1), true);
        }
    }
}
else // drawing the laser normally
{
    draw_sprite_ext(sprite_to_draw, image_index,
                    x, y,
                    image_xscale, image_yscale,
                    image_angle, image_blend, image_alpha);

    // debug
    if (draw_debug_stuff)
    {
        if (laser_direction == 1)
        {
            draw_rectangle(x, y, (bbox_right - 1), ((y + sprite_get_height(sprite_to_draw)) - 1), true);
        }
        else if (laser_direction == -1)
        {
            draw_rectangle(bbox_left, y, (bbox_right - 1), ((y + sprite_get_height(sprite_to_draw)) - 1), true);
        }
    }
}

// drawing the triangle box
// teleporting to the right, so draw the box to the left
if (laser_direction == 1)
{
    draw_sprite_ext(box_sprite_to_draw, 0,
                    x, y,
                    1, 1,
                    0, c_white, 1);
}
// vice versa
else if (laser_direction == -1)
{
    draw_sprite_ext(box_sprite_to_draw, 0,
                    bbox_right, y,
                    -1, 1,
                    0, c_white, 1);
}