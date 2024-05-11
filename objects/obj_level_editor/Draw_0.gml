if (global.app_state == states.MAIN_MENU
    || obj_player.player_state != obj_player.god_mode_state
    || room == MAIN_MENU_ROOM)
{
    exit;
}

if (obj_player.h_speed != 0 || obj_player.v_speed != 0)
{
    if (grid_alpha > 0)
	{
		grid_alpha -= grid_alpha_buffer;
	}
}

// drawing the grid
if (obj_player.h_speed == 0 && obj_player.v_speed == 0)
{
    // turning grid off if the zoom out is to big
    if (obj_camera.new_cam_width > (VIEW_W * 4)
        && obj_camera.new_cam_height > (VIEW_H * 4))
    {
        if (grid_alpha > 0)
        {
        	grid_alpha -= grid_alpha_buffer;
        }
        
        BLOCKITS_draw_grid(global.DEBUG_grid_x_value,
                           global.DEBUG_grid_y_value,
                           c_white,
                           c_white,
                           1,
                           grid_alpha);
    }
    else
    {
        if (grid_alpha < grid_max_alpha)
    	{
    		grid_alpha += grid_alpha_buffer;
    	}
    }
    
    if (obj_camera.new_cam_width <= VIEW_W
        && obj_camera.new_cam_height <= VIEW_H)
    {
        BLOCKITS_draw_grid(global.DEBUG_grid_x_value,
                           global.DEBUG_grid_y_value,
                           c_white,
                           c_white,
                           0.2,
                           grid_alpha);
    }
    
    if (obj_camera.new_cam_width <= (VIEW_W * 2) && obj_camera.new_cam_width > VIEW_W
        && obj_camera.new_cam_height <= (VIEW_H * 2) && obj_camera.new_cam_height > VIEW_H)
    {
        BLOCKITS_draw_grid(global.DEBUG_grid_x_value,
                           global.DEBUG_grid_y_value,
                           c_white,
                           c_white,
                           0.5,
                           grid_alpha);
    }
    
    if (obj_camera.new_cam_width <= (VIEW_W * 4) && obj_camera.new_cam_width > (VIEW_W * 2)
        && obj_camera.new_cam_height <= (VIEW_H * 4) && obj_camera.new_cam_height > (VIEW_H * 2))
    {
        BLOCKITS_draw_grid(global.DEBUG_grid_x_value,
                           global.DEBUG_grid_y_value,
                           c_white,
                           c_white,
                           1,
                           grid_alpha);
    }
}

// This is temporary.
if (!layer_get_visible(DEFAULT_COLLIDERS_LAYER))
{
    exit;
}

if (global.mouse_within_debug_button)
{
    exit;
}

// highlighting the current selected object
if (real_obj_to_grab)
{
    /*
        if (real_obj_to_grab.image_blend != c_white)
        {
            // 
        }
    */
    
    draw_rectangle_colour(real_obj_to_grab.bbox_left,
                          real_obj_to_grab.bbox_top,
                          (real_obj_to_grab.bbox_right - 1),
                          (real_obj_to_grab.bbox_bottom - 1),
                          selection_color,
                          selection_color,
                          selection_color,
                          selection_color,
                          true);
}
else if (obj_to_grab
         && !obj_camera.can_drag_camera)
{
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

// drawing the sprite of the object to create holding ALT key
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








/*
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
            
            // highlithing the borders of the current selected object
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
*/