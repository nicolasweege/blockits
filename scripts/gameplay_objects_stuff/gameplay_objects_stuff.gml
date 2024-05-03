// Not needed actually =/
function LASER_BEAM_raycast(xfrom,
                            yfrom,
                            ray_distance,
                            object_to_check_collision,
                            draw_debug_line = 0)
{
    for (var i = 0; i < ray_distance; i++)
    {
        var xx     = xfrom + lengthdir_x(i, 0);
        var yy     = yfrom + lengthdir_y(i, 0);
        
        var object = collision_line(xfrom, yfrom, xx, yy,
                                    object_to_check_collision,
                                    0, 0);
        
        if (draw_debug_line)
        {
            draw_line_colour(xfrom, yfrom, xx, yy, c_white, c_white);
        }
        
        if (object)
        {
            break;
            return object;
        }
    }
    
    return false;
}