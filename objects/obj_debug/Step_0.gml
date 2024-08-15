if (global.app_state == states.PAUSE_MENU
    || global.app_state == states.MAIN_MENU
    || room == MAIN_MENU_ROOM)
{
    exit;
}

if (global.app_state == states.EDITOR)
{
    if (keyboard_check(vk_control))
    {
        if (mouse_check_button_released(mb_left))
        {
            with (obj_player)
            {
                global.app_state = states.GAME;
                if (!instance_place(x, y, obj_default_collider)
                    && !instance_place(x, y, obj_death_collider))
                {
                    god_mode_movement_speed = original_god_mode_movement_speed;
                    x = mouse_x;
                    y = mouse_y;
                    player_state = free_state;
                    
                    with (obj_camera)
                    {
                        new_cam_width  = VIEW_W;
                        new_cam_height = VIEW_H;
                    }
                
                    // resetando a posicao e o tamanho da camera
                	global.camx = (global.cam_target.x - (global.cam_width/2));
                			
                    global.camy = ((global.cam_target.y - 
                                   (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) 
                                   - (global.cam_height/2));
                    
                    camera_set_view_pos(global.current_camera, global.camx, global.camy);
                    camera_set_view_size(global.current_camera, VIEW_W, VIEW_H);
                    
                    global.use_instance_deactivation = true;
                    global.app_state = states.GAME;
                }
                else
                {
                    global.app_state = states.EDITOR;
                }
            }
        }
    }
    else if (mouse_check_button_released(mb_right))
    {
        with (obj_player)
        {
            x = mouse_x;
            y = mouse_y;
        }
    }
}

// reseting the current room
if (keyboard_check_pressed(vk_f5))
{
    room_restart();
    
    with (obj_player)
    {
        player_state = free_state;
        x            = obj_player_creator.x;
        y            = obj_player_creator.y;
        
        xscale                = 1;
    	yscale                = 1;
    	h_speed               = 0;
    	v_speed               = 0;
    	jump_pressed          = 0;
    	coyote_can_jump       = 0;
    	jump_buffer_counter   = 0;
    	can_jumper_dash_timer = 0;
    }
    
    global.app_state = states.GAME;
}

// reseting the game to the last checkpoint
if (keyboard_check(vk_shift)
    && keyboard_check_pressed(vk_f5))
{
    // talvez não seja uma boa chamar room_restart nesse caso, mas por enquanto vamos deixar assim.
    room_restart();
    
    if (room != global.checkpoint_room)
    {
        room_goto(global.checkpoint_room);
    }
    
    with (obj_player)
    {
        player_state = free_state;
        x            = global.checkpoint_x;
        y            = global.checkpoint_real_y;
        
        xscale                = 1;
    	yscale                = 1;
    	h_speed               = 0;
    	v_speed               = 0;
    	jump_pressed          = 0;
    	coyote_can_jump       = 0;
    	jump_buffer_counter   = 0;
    	can_jumper_dash_timer = 0;
    }
    
    global.app_state = states.GAME;
}