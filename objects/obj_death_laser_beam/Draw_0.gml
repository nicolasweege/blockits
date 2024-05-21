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