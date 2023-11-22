if (obj_player.player_state == obj_player.god_mode_state
    || obj_player.player_state == obj_player.death_state)
{
	exit;
}

depth = obj_player.depth + 1;

rotation += 0.5;