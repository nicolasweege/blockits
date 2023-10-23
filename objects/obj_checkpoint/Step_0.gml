var previous_checkpoint_id = global.checkpoint_id;
	
if (place_meeting(x, y, obj_player)
	&& obj_player.on_floor
	&& obj_player.player_state != obj_player.death_state
	&& obj_player.player_state != obj_player.god_mode_state)
{
	global.checkpoint_id = id;
	global.checkpoint_room = room;
	global.checkpoint_x = x;
	// global.checkpoint_y = y;
	global.checkpoint_y = y - 10;
		
	if (previous_checkpoint_id != id)
	{
		save_game_data(global.current_save_slot);
	}
}