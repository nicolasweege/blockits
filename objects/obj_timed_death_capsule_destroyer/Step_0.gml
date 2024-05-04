/*
    if (place_meeting(x, y, obj_capsule)
        && obj_player.current_player_capsule
        && current_state != destroy_state)
    {
        // capsule stuff
        var capsule_instance = instance_place(x, y, obj_capsule);
        if (capsule_instance)
        {
            with (capsule_instance)
            {
                handle_capsule_destroy_state_transition();
                
                reappear_timer           = time_to_reappear;
                sprite_index             = -1;
                player_can_enter_capsule = false;
                obj_player.player_state  = obj_player.free_state;
                current_state            = destroy_state;
            }
        }
        
        // destroyer stuff
        handle_transition_to_destroy_state();
    }
*/