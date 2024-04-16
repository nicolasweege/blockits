if (obj_player.player_state == obj_player.god_mode_state
    && keyboard_check(vk_control))
{
    update_player_inputs();
    
    var ratio = (camera_get_view_width(global.current_camera) 
    / window_get_width());
    
    var real_mouse_x = (event_data[? "rawposX"] * ratio);
    var real_mouse_y = (event_data[? "rawposY"] * ratio);
    mouse_drag_x     = (drag_room_x - real_mouse_x);
    mouse_drag_y     = (drag_room_y - real_mouse_y);
    
    camera_set_view_pos(global.current_camera, mouse_drag_x, mouse_drag_y);
}