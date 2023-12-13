if (global.is_paused
	|| !global.player_can_move)
{
	exit;
}

if (obj_player.player_state == obj_player.god_mode_state
    || obj_player.player_state == obj_player.death_state)
{
	exit;
}

h_speed = (hdir * current_speed);

repeat (abs(h_speed)) // horizontal collision
{
	var h_speed_sign = sign(h_speed);
	
	if (place_meeting(x, y - 1, obj_player))
	{
		global.player_belt_current_dir = hdir;
		
		with (obj_player)
		{
			player_state = free_state;
			x += h_speed_sign;
		}
	}
}