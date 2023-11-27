if (global.is_paused
	|| obj_player.player_state == obj_player.god_mode_state)
{
	exit;
}

update_player_inputs();

current_state();