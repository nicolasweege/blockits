if (place_meeting(x, y, obj_player))
{
    sprite_to_draw = spr_teleport_laser_beam_highlight;
}
else
{
    sprite_to_draw = original_sprite_to_draw;
}

draw_sprite_ext(sprite_to_draw, image_index,
                x, y,
                image_xscale, image_yscale,
                image_angle, image_blend, image_alpha);


// teleporting to the right, then drawing the box to the left
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