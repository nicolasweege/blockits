if (global.app_state == states.PAUSE_MENU
    || global.app_state == states.MAIN_MENU
    || room == MAIN_MENU_ROOM)
{
    exit;
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