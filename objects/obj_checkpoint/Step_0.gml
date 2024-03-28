previous_checkpoint_id = global.checkpoint_id;

// We don't need to do this here anymore, were currently doing this
// in the player object
/*
if (place_meeting(x, y, obj_player)
	&& obj_player.on_floor
	&& obj_player.v_speed >= 0
	&& obj_player.player_state != obj_player.death_state
	&& obj_player.player_state != obj_player.god_mode_state)
{
	global.checkpoint_id = id;
	global.checkpoint_room = room;
	global.checkpoint_x = x;
	global.checkpoint_y = y - 5
		
	if (previous_checkpoint_id != id)
	{
		save_game_data(global.current_save_slot);
	}
}
*/