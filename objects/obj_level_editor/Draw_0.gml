if (global.app_state == states.PAUSE_MENU
    || obj_player.player_state != obj_player.god_mode_state
    || !obj_debug.can_show_debug_layers)
{
    exit;
}

/*
    if (global.debug_mode)
    {
        current_draw_state();
    }
*/

if (can_create_instance
    && !obj_camera.can_drag_camera)
{
    var _mouse_x = 0;
    var _mouse_y = 0;
    
    if (global.DEGUB_snap_to_grid)
    {
        _mouse_x = ((mouse_x div global.DEBUG_grid_x_value) * global.DEBUG_grid_x_value);
        _mouse_y = ((mouse_y div global.DEBUG_grid_y_value) * global.DEBUG_grid_y_value);
    }
    else
    {
        _mouse_x = mouse_x;
        _mouse_y = mouse_y;
    }
    
    var object_sprite = object_get_sprite(obj_default_collider);
    
    if (object_sprite)
    {   
        draw_sprite(object_sprite,
                    0,
                    _mouse_x,
                    _mouse_y);
    }
    else
    {
        draw_set_color(c_white);
        
        draw_circle(_mouse_X,
                    _mouse_y,
                    10,
                    1);
    }
}

if (real_obj_to_grab)
{
    if (real_obj_to_grab.image_blend != c_white)
    {
        // selection rectangle highlighting when object is selected
        draw_rectangle_colour(real_obj_to_grab.bbox_left,
                              real_obj_to_grab.bbox_top,
                              real_obj_to_grab.bbox_right - 1,
                              real_obj_to_grab.bbox_bottom - 1,
                              c_white,
                              c_white,
                              c_white,
                              c_white,
                              true);
        
        //
        /*
            var hbuffer_to_check = 2;
            var vbuffer_to_check = 2;
            
            // left
            draw_rectangle_colour(real_obj_to_grab.bbox_left - 1,
                                                          real_obj_to_grab.bbox_top,
                                                          real_obj_to_grab.bbox_left + hbuffer_to_check,
                                                          real_obj_to_grab.bbox_bottom,
                                  c_blue,
                                  c_blue,
                                  c_blue,
                                  c_blue,
                                  true);
    
            // right
            draw_rectangle_colour(real_obj_to_grab.bbox_right - hbuffer_to_check,
                                                           real_obj_to_grab.bbox_top,
                                                           real_obj_to_grab.bbox_right + 1,
                                                           real_obj_to_grab.bbox_bottom,
                                 c_blue,
                                 c_blue,
                                 c_blue,
                                 c_blue,
                                 true);
            
            // top             
            draw_rectangle_colour(real_obj_to_grab.bbox_left,
                                                         real_obj_to_grab.bbox_top - 1,
                                                         real_obj_to_grab.bbox_right,
                                                         real_obj_to_grab.bbox_top + vbuffer_to_check,
                                  c_blue,
                                  c_blue,
                                  c_blue,
                                  c_blue,
                                  true);
            
            // bottom
            draw_rectangle_colour(real_obj_to_grab.bbox_left,
                                                            real_obj_to_grab.bbox_bottom - vbuffer_to_check,
                                                            real_obj_to_grab.bbox_right,
                                                            real_obj_to_grab.bbox_bottom + 1,
                                  c_blue,
                                  c_blue,
                                  c_blue,
                                  c_blue,
                                  true);
        */
    }
}
else if (obj_to_grab
         && is_mouse_inside_obj
         && !obj_camera.can_drag_camera)
{
    // selection rectangle highlighting
    draw_rectangle_colour(obj_to_grab.bbox_left,
                          obj_to_grab.bbox_top,
                          obj_to_grab.bbox_right - 1,
                          obj_to_grab.bbox_bottom - 1,
                          c_white,
                          c_white,
                          c_white,
                          c_white,
                          true);
}