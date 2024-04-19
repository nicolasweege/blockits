mouse_dragged_obj            = false;
obj_xx                       = 0;
obj_yy                       = 0;
obj_to_grab                  = 0;
real_obj_to_grab             = 0;
is_mouse_inside_obj          = false;
mouse_in_left_border         = 0;
mouse_in_right_border        = 0;
mouse_in_top_border          = 0;
mouse_in_bottom_border       = 0;
can_create_instance          = false;

mouse_dragged_border_left    = false;
mouse_dragged_border_right   = false;
mouse_dragged_border_top     = false;
mouse_dragged_border_bottom  = false;

default_collider_button      = 0;
death_collider_button        = 0;
can_use_default_collider_obj = false;

game_objects = [obj_default_collider, obj_death_collider];
obj_index = -1;

default_draw_state = function()
{
    if (default_collider_button)
    {
        obj_index = 0;
    }
    
    if (death_collider_button)
    {
        obj_index = 1;
    }
    
    if (obj_index != -1)
    {
        var object_sprite = 
        object_get_sprite(game_objects[obj_index]);
        
        if (object_sprite)
        {
            draw_sprite(object_sprite, 0, mouse_x, mouse_y);
        }
        else
        {
            draw_set_color(c_white);
            draw_circle(mouse_x, mouse_y, 10, 1);
        }
        
        if (mouse_check_button_pressed(mb_left))
        {
            if (obj_index != -1)
            {
                var layer_to_create_object = 0;
                
                switch (game_objects[obj_index])
                {
                    case obj_default_collider:
                        layer_to_create_object = layer_get_id("default_colliders");
                    break;
                    
                    case obj_death_collider:
                        layer_to_create_object = layer_get_id("death_colliders");
                    break;
                    
                    default:
                        layer_to_create_object = "controllers";
                }
                
                var instance = instance_create_layer(mouse_x, mouse_y, 
                                      layer_to_create_object, 
                                      game_objects[obj_index]);
                if (instance)
                {
                    show_debug_message("instance created");
                }
            }
        }
        
        if (keyboard_check_pressed(vk_escape))
        {
            obj_index = -1;
        }
    }
}

current_draw_state = default_draw_state;