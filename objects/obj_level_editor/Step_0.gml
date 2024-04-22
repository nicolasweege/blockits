if (global.app_state == states.PAUSE_MENU
    || global.app_state == states.MAIN_MENU
    || obj_player.player_state != obj_player.god_mode_state
    || !obj_debug.can_show_debug_layers)
{
    exit;
}

obj_to_grab = instance_position(mouse_x, mouse_y, obj_default_collider);

if (obj_to_grab
    && !obj_camera.can_drag_camera)
{
    // mouse selection
    if (mouse_check_button_pressed(mb_left))
    {
        if (real_obj_to_grab)
        {
            if (real_obj_to_grab != obj_to_grab)
            {
                real_obj_to_grab.image_blend = c_white;
                
                real_obj_to_grab             = obj_to_grab;
                mouse_dragged_obj            = true;
                obj_xx                       = (real_obj_to_grab.x - mouse_x);
                obj_yy                       = (real_obj_to_grab.y - mouse_y);
                real_obj_to_grab.image_blend = c_green;
            }
            else
            {
                mouse_dragged_obj = true;
                obj_xx            = (real_obj_to_grab.x - mouse_x);
                obj_yy            = (real_obj_to_grab.y - mouse_y);
            }
        }
        else
        {
            real_obj_to_grab             = obj_to_grab;
            mouse_dragged_obj            = true;
            obj_xx                       = (real_obj_to_grab.x - mouse_x);
            obj_yy                       = (real_obj_to_grab.y - mouse_y);
            real_obj_to_grab.image_blend = c_green;
        }
    }
}

if (!obj_to_grab && real_obj_to_grab)
{
    if (mouse_check_button_pressed(mb_left)
        && !obj_camera.can_drag_camera)
    {
        real_obj_to_grab.image_blend = c_white;
        real_obj_to_grab             = 0;
    }
}

if (mouse_check_button_released(mb_left)
    && !obj_camera.can_drag_camera)
{
    mouse_dragged_obj = false;
}

// dragging object with mouse
if (mouse_dragged_obj
    && real_obj_to_grab)
{
    with (real_obj_to_grab)
    {
        // snaping object position
        if (global.DEGUB_snap_to_grid)
        {
            x = (((mouse_x + other.obj_xx) 
            div global.DEBUG_grid_x_value) * global.DEBUG_grid_x_value);
            
            y = (((mouse_y + other.obj_yy) 
            div global.DEBUG_grid_y_value) * global.DEBUG_grid_y_value);
        }
        else
        {
            x = (mouse_x + other.obj_xx);
            y = (mouse_y + other.obj_yy);
        }
    }
}

/*
    if (obj_to_grab
        && !can_create_instance)
    {
        is_mouse_inside_obj = point_in_rectangle(mouse_x, 
                                                 mouse_y, 
                                                 obj_to_grab.bbox_left, 
                                                 obj_to_grab.bbox_top, 
                                                 obj_to_grab.bbox_right + 1,
                                                 obj_to_grab.bbox_bottom + 1);
        
        if (is_mouse_inside_obj)
        {
            // mouse selection
            if (mouse_check_button_pressed(mb_left)
                && !obj_camera.can_drag_camera
                && !mouse_in_left_border
                && !mouse_in_right_border
                && !mouse_in_top_border
                && !mouse_in_bottom_border)
            {
                if (real_obj_to_grab)
                {
                    real_obj_to_grab.image_blend = c_white;
                }
                
                real_obj_to_grab             = obj_to_grab;
                
                mouse_dragged_obj            = true;
                obj_xx                       = (real_obj_to_grab.x - mouse_x);
                obj_yy                       = (real_obj_to_grab.y - mouse_y);
                real_obj_to_grab.image_blend = c_green;
            }
            
            // handling mouse cursor selection on borders
            if (!obj_camera.can_drag_camera)
            {
                var hbuffer_to_check = 2;
                var vbuffer_to_check = 2;
                
                mouse_in_left_border = point_in_rectangle(mouse_x,
                                                          mouse_y,
                                                          real_obj_to_grab.bbox_left - 1,
                                                          real_obj_to_grab.bbox_top,
                                                          real_obj_to_grab.bbox_left + hbuffer_to_check,
                                                          real_obj_to_grab.bbox_bottom);
                
                mouse_in_right_border = point_in_rectangle(mouse_x,
                                                           mouse_y,
                                                           real_obj_to_grab.bbox_right - hbuffer_to_check,
                                                           real_obj_to_grab.bbox_top,
                                                           real_obj_to_grab.bbox_right + 1,
                                                           real_obj_to_grab.bbox_bottom);
                
                mouse_in_top_border = point_in_rectangle(mouse_x,
                                                         mouse_y,
                                                         real_obj_to_grab.bbox_left,
                                                         real_obj_to_grab.bbox_top - 1,
                                                         real_obj_to_grab.bbox_right,
                                                         real_obj_to_grab.bbox_top + vbuffer_to_check);
                
                mouse_in_bottom_border = point_in_rectangle(mouse_x,
                                                            mouse_y,
                                                            real_obj_to_grab.bbox_left,
                                                            real_obj_to_grab.bbox_bottom - vbuffer_to_check,
                                                            real_obj_to_grab.bbox_right,
                                                            real_obj_to_grab.bbox_bottom + 1);
                                                                
                if (mouse_in_left_border && mouse_in_top_border)
                {
                    window_set_cursor(cr_size_nwse);
                }
                
                if (mouse_in_left_border && mouse_in_bottom_border)
                {
                    window_set_cursor(cr_size_nesw);
                }
                
                if (mouse_in_right_border && mouse_in_top_border)
                {
                    window_set_cursor(cr_size_nesw);
                }
                
                if (mouse_in_right_border && mouse_in_bottom_border)
                {
                    window_set_cursor(cr_size_nwse);
                }
                
                if (!mouse_dragged_obj)
                {
                    if (!mouse_in_top_border
                        && !mouse_in_bottom_border)
                    {
                        if (mouse_in_left_border)
                        {
                            window_set_cursor(cr_size_we);
                            
                            if (mouse_check_button_pressed(mb_left))
                            {
                                mouse_dragged_border_left   = true;
                                mouse_dragged_border_right  = false;
                            }
                        }
                        else if (mouse_in_right_border)
                        {
                            window_set_cursor(cr_size_we);
                            
                            if (mouse_check_button_pressed(mb_left))
                            {
                                mouse_dragged_border_left   = false;
                                mouse_dragged_border_right  = true;
                            }
                        }
                    }
                    
                    if (!mouse_in_left_border
                        && !mouse_in_right_border)
                    {
                        if (mouse_in_top_border)
                        {
                            window_set_cursor(cr_size_ns);
                            
                            if (mouse_check_button_pressed(mb_left))
                            {
                                mouse_dragged_border_top    = true;
                                mouse_dragged_border_bottom = false;
                            }
                        }
                        else if (mouse_in_bottom_border)
                        {
                            window_set_cursor(cr_size_ns);
                            
                            if (mouse_check_button_pressed(mb_left))
                            {
                                mouse_dragged_border_top    = false;
                                mouse_dragged_border_bottom = true;
                            }
                        }
                    }
                    
                    if (!mouse_in_left_border
                        && !mouse_in_right_border
                        && !mouse_in_top_border
                        && !mouse_in_bottom_border)
                    {
                        window_set_cursor(cr_default);
                    }
                }
            }
        }
    }
    else
    {
        if (mouse_check_button_pressed(mb_left)
            && !obj_camera.can_drag_camera)
        {
            real_obj_to_grab.image_blend = c_white;
            real_obj_to_grab             = 0;
            mouse_dragged_obj            = false;
            mouse_dragged_border_left    = false;
            mouse_dragged_border_right   = false;
            mouse_dragged_border_top     = false;
            mouse_dragged_border_bottom  = false;
        }
    }
*/

/*
    if (!obj_camera.can_drag_camera)
    {
        // creating instances holding ALT key
        if (keyboard_check(vk_alt))
        {
            can_create_instance = true;
        }
        else
        {
            can_create_instance = false;
        }
        
        if (can_create_instance
            && !obj_to_grab)
        {
            if (mouse_check_button_pressed(mb_left))
            {
                var instance = instance_create_layer(((mouse_x div 8) * 8), 
                                                     ((mouse_y div 8) * 8), 
                                                     "default_colliders", 
                                                     obj_default_collider);
                
                real_obj_to_grab = instance;
            }
        }
        
        // detroy instances using the DELETE key
        if (keyboard_check_pressed(vk_delete)
            && real_obj_to_grab)
        {
            if (obj_to_grab == real_obj_to_grab)
            {
                obj_to_grab = 0;
            }
            
            instance_destroy(real_obj_to_grab);
            real_obj_to_grab = 0;
        }
        
        // snaping objects into a grid
        if (keyboard_check(vk_shift))
        {
            resize_snap_to = true;
        }
        else
        {
            resize_snap_to = false;
        }
        
        if (real_obj_to_grab)
        {
            // handling mouse cursor resize objects on borders
            if (mouse_dragged_border_left)
            {
                // 
            }
            else if (mouse_dragged_border_right)
            {
                if (global.DEGUB_snap_to_grid)
                {
                    real_obj_to_grab.image_xscale += 
                    (((mouse_x - (real_obj_to_grab.bbox_right - 1)) div global.DEBUG_grid_x_value) 
                    * global.DEBUG_grid_x_value) / global.DEBUG_grid_x_value;
                    
                    // real_obj_to_grab.image_xscale -= real_obj_to_grab.image_xscale mod 1;
                }
                else
                {   
                    real_obj_to_grab.image_xscale += 
                    (mouse_x - (real_obj_to_grab.bbox_right - 1)) / 10;
                    
                    real_obj_to_grab.image_xscale -= real_obj_to_grab.image_xscale mod 0.01;
                }
                
                real_obj_to_grab.image_xscale = clamp(real_obj_to_grab.image_xscale, 1, room_width);
            }
            else if (mouse_dragged_border_top)
            {
                // 
            }
            else if (mouse_dragged_border_bottom)
            {
                if (global.DEGUB_snap_to_grid)
                {   
                    real_obj_to_grab.image_yscale += 
                    (((mouse_y - (real_obj_to_grab.bbox_bottom - 1)) div global.DEBUG_grid_y_value) 
                    * global.DEBUG_grid_y_value) / global.DEBUG_grid_y_value;
                    
                    // real_obj_to_grab.image_yscale -= real_obj_to_grab.image_yscale mod 1;
                }
                else
                {   
                    real_obj_to_grab.image_yscale += 
                    (mouse_y - (real_obj_to_grab.bbox_bottom - 1)) / 10;
                    
                    real_obj_to_grab.image_yscale -= real_obj_to_grab.image_yscale mod 0.01;
                }
                
                real_obj_to_grab.image_yscale = clamp(real_obj_to_grab.image_yscale, 1, room_height);
            }
            else if (mouse_dragged_obj) // dragging object with mouse
            {
                with (real_obj_to_grab)
                {
                    if (global.DEGUB_snap_to_grid)
                    {
                        x = (((mouse_x + other.obj_xx) 
                        div global.DEBUG_grid_x_value) * global.DEBUG_grid_x_value);
                        
                        y = (((mouse_y + other.obj_yy) 
                        div global.DEBUG_grid_y_value) * global.DEBUG_grid_y_value);
                    }
                    else
                    {
                        x = (mouse_x + other.obj_xx);
                        y = (mouse_y + other.obj_yy);
                    }
                }
            }
        }
    }
    
    if (mouse_check_button_released(mb_left)
        && !obj_camera.can_drag_camera)
    {
        mouse_dragged_obj           = false;
        mouse_dragged_border_left   = false;
        mouse_dragged_border_right  = false;
        mouse_dragged_border_top    = false;
        mouse_dragged_border_bottom = false;
    }
*/