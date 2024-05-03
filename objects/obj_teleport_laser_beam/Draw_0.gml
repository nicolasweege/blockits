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







// Raycast code that is not useful anymore.
/*
    var ray_collider_object = 
    LASER_BEAM_raycast(x,
                       (y + (sprite_get_height(sprite_index) / 2)),
                       ray_distance_in_pixels,
                       ray_collision_object,
                       1);
    
    // drawing the ray sprite
        draw_sprite_ext(spr_default_laser_beam_ray,
                        0,
                        x,
                        y,
                        (ray_distance_in_pixels / 0.1),
                        1,
                        0,
                        c_white,
                        1);
    
    var ray_color = make_colour_rgb(145, 0, 255);
    var ray_xto   = 0;
    var ray_yto   = ((y + sprite_get_height(sprite_index)) - 1);
    
    if (ray_collider_object)
    {
        ray_xto = ray_collider_object.bbox_left;
    }
    else
    {
        ray_xto = (x + ray_distance_in_pixels);
    }
    
    // drawing the ray rectangles
    draw_set_alpha(0.2);
    
    draw_rectangle_colour(x, y,
                          ray_xto, ray_yto,
                          ray_color, ray_color, ray_color, ray_color,
                          0);
    
    draw_set_alpha(1);
    
    draw_rectangle_colour(x, y,
                          ray_xto, ray_yto,
                          ray_color, ray_color, ray_color, ray_color,
                          1);
*/