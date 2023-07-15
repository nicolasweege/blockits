if (!instance_exists(obj_player))
{
	exit;	
}

if (obj_player.player_state == obj_player.god_mode_state)
{
	exit;	
}

h_speed = (hdir * current_speed);

if (place_meeting(x, y - 1, obj_player))
{
	with (obj_player)
	{
		x += other.h_speed;
	}
}