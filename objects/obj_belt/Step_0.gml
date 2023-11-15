if (global.is_paused
    || obj_player.player_state == obj_player.god_mode_state)
	{
		exit;
	}

h_speed = (hdir * current_speed);

if (place_meeting(x, y - 1, obj_player))
{
	with (obj_player)
	{	
		// adding belt momentum to the player
		/*
		if (place_meeting(x, y + 1, obj_belt)
			&& jump_pressed)
		{
			global.player_momentum_x = hdir;
			global.player_momentum_speed = 4;
			player_state = belt_momentum_state;
			time_source_start(set_player_belt_momentum_timer);
		}
		*/
		
		player_state = free_state;
		x += other.h_speed;
	}
}