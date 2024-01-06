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
		
		if (menu_select && global.player_input_enable)
		{
			global.player_changing_rooms = true;
			global.player_input_enable = false;
			obj_player.xscale = 1;
			obj_player.yscale = 1;
			obj_player.h_speed = 0;
			obj_player.v_speed = 0;
			obj_player.player_state = obj_player.lock_state;
			current_state = change_player_anim_state;
			audio_play_sound(snd_teleporter_enter, 1, 0);
			// screen_shake(2, 5, false, true);
		}
	}
}

current_state = default_state;