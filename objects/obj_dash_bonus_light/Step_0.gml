if (!instance_exists(obj_player))
{
	exit;	
}

if (obj_player.player_state == obj_player.god_mode_state)
{
	exit;	
}

rotation += 0.5;