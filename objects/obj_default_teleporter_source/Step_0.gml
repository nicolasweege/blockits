if (global.app_state == states.PAUSE_MENU
    || global.app_state == states.EDITOR
    || obj_player.player_state == obj_player.death_state
    || !pair_instance)
{
    exit;
}

if (!pair_instance.pair_instance)
{
    pair_instance.pair_instance = id;
}

if (place_meeting(x, y, obj_player) && !obj_player.current_player_capsule)
{
    with (obj_player)
    {
        default_teleporter_object_can_jump_release = false;
        
        player_state          = free_state;
        xscale                = 1;
    	yscale                = 1;
    	h_speed               = 0;
    	v_speed               = 0;
    	jump_pressed          = 0;
    	jump_released         = 0;
    	coyote_can_jump       = 0;
    	jump_buffer_counter   = 0;
    	can_jumper_dash_timer = 0;
        
        x = ((other.pair_instance.bbox_left + 1) + other.pair_instance.center_xpos);
        y = (other.pair_instance.bbox_bottom - 1);
        
        if (can_dash <= 1)
    	{
    	   can_dash = 1;
    	}
        
        v_speed = -5;
    }
}