// @TODO @Incomplete: do not let the player enter the teleporter and
// change rooms if it is inside a obj_capsule

has_paused   = false;
has_unpaused = false;

alpha = 0;

transition_state = function()
{
	if (!instance_exists(obj_room_transition))
	{
		var transition = instance_create_layer(0, 0, 
				                                "controllers", 
												obj_room_transition);
		transition.room_to_go = room_to;
		transition.xto = xto;
		transition.yto = yto;
		// transition.teleporter_id = id;
		
		obj_player.h_speed = 0;
		obj_player.v_speed = 0;
		obj_player.jump_pressed = 0;
		obj_player.coyote_can_jump = 0;
		obj_player.jump_buffer_counter = 0;
	}
	
	/*
    	room_goto(room_to);
    	obj_player.x = xto;
    	obj_player.y = yto;
	*/
}

open_door_state = function()
{
	if (image_index >= image_number - 1)
	{
		sprite_index = spr_teleporter_1;
		global.player_changing_rooms = false;
		current_state = change_player_anim_state_2;
	}
}

close_door_state = function()
{
	if (image_index >= image_number - 1)
	{
		image_speed = 0;
		current_state = transition_state;
	}
}

lock_state = function()
{
	
}

change_player_anim_state_2 = function()
{
	if (!instance_exists(obj_player_room_transition_3))
	{
		var player_anim = instance_create_depth(obj_player.x, obj_player.y, 
					                            obj_player.depth, 
												obj_player_room_transition_3);
		
		player_anim.teleporter_id = id;
		current_state = lock_state;
	}
}

change_player_anim_state = function()
{
	if (obj_player.on_floor)
	{
		if (!instance_exists(obj_player_room_transition))
		{
			layer_set_visible("player", false);
			var player_anim = instance_create_depth(obj_player.x, obj_player.y, 
					                                obj_player.depth, 
													obj_player_room_transition);
		
			player_anim.teleporter_id = id;
			current_state = lock_state;
		}
		
		// screen_shake(2, 5, false, true);
	}
	else
	{
		if (!instance_exists(obj_player_room_transition_2))
		{
			layer_set_visible("player", false);
			var player_anim = instance_create_depth(obj_player.x, obj_player.y, 
					                                obj_player.depth, 
													obj_player_room_transition_2);
		
			player_anim.teleporter_id = id;
			current_state = lock_state;
		}
	}
}

default_state = function()
{
    if (place_meeting(x, y, obj_player))
    {
        update_menu_inputs();
        
        var enter_teleporter_input = keyboard_check_pressed(vk_enter) 
        || gamepad_button_check_pressed(global.device, gp_face4);
        
        // if (menu_select)
        if (enter_teleporter_input
            && global.player_input_enable
            && obj_player.player_state != obj_player.death_state
            && obj_player.player_state != obj_player.on_capsule_state)
        {
            if (obj_player.player_state == obj_player.god_mode_state)
            {
                // resetting camera position and size.
        		global.camx = (global.cam_target.x - (global.cam_width/2));
        				
                global.camy = ((global.cam_target.y - 
                               (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) 
                               - (global.cam_height/2));
                
                camera_set_view_pos(global.current_camera, global.camx, global.camy);
                camera_set_view_size(global.current_camera, VIEW_W, VIEW_H);
            }
            
            with (obj_camera)
            {
                new_cam_width  = VIEW_W;
                new_cam_height = VIEW_H;
            }
            
            with (obj_player)
            {
                xscale                  = 1;
                yscale                  = 1;
                h_speed                 = 0;
                v_speed                 = 0;
                jump_pressed            = 0;
                coyote_can_jump         = 0;
                jump_buffer_counter     = 0;
                player_state            = obj_player.lock_state;
                god_mode_movement_speed = original_god_mode_movement_speed;
            }
            
            audio_play_sound(snd_teleporter_enter, 1, 0);
            // screen_shake(2, 5, false, true);
            
            global.player_changing_rooms = true;
            global.player_input_enable   = false;
            current_state                = change_player_anim_state;
        }
    }
}

current_state = default_state;