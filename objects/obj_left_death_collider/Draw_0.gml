var obj_color = c_white;

/*
    if (sprite_index == spr_top_death_collider)
    {
        obj_color = c_white;
    }
*/
if (sprite_index == -1)
{
    obj_color = c_green;
}

draw_sprite_ext(spr_left_death_collider, 0,
                x, y,
				image_xscale, image_yscale,
				image_angle, obj_color, image_alpha);