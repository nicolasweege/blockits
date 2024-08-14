if (place_meeting(x, y, obj_player))
{
    sprite_to_draw = spr_teleport_laser_beam_vertical_highlight;
}
else
{
    sprite_to_draw = original_sprite_to_draw;
}

draw_sprite_ext(sprite_to_draw, image_index,
                x, y,
                image_xscale, image_yscale,
                image_angle, image_blend, image_alpha);

// desenhando a box, na base contraria a direcao do teleporte
// top
if (laser_direction == 1)
{
    draw_sprite_ext(box_sprite_to_draw, 0,
                    x, (bbox_bottom - sprite_get_height(box_sprite_to_draw)),
                    1, 1,
                    0, c_white, 1);
}
// bottom
else if (laser_direction == -1)
{
    draw_sprite_ext(box_sprite_to_draw, 0,
                    x, (bbox_top + sprite_get_height(box_sprite_to_draw)),
                    1, -1,
                    0, c_white, 1);
}