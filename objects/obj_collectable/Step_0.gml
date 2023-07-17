if (global.is_paused 
    || !instance_exists(obj_player))
{
	exit;	
}

if (obj_player.player_state == obj_player.god_mode_state)
{
	exit;
}

if (place_meeting(x, y, obj_player) && !follow_player && !can_collect)
{
	follow_player = true;
}

if (follow_player && instance_exists(obj_player))
{
	x = lerp(x, obj_player.x - 20, 0.1);
	y = lerp(y, obj_player.y - 30, 0.1);
	
	with (obj_player)
	{
		if (on_floor 
		    && !place_meeting(x, y + 1, obj_jumper)
			&& !place_meeting(x, y + 1, obj_timed_slab))
		{
			other.follow_player = false;
			other.can_collect = true;
		}
	}
	
	/*
	if (obj_player.on_floor)
	{
		follow_player = false;
		can_collect = true;
	}
	*/
}

if (follow_player && !instance_exists(obj_player) && !go_back_to_start_pos && !can_collect)
{
	follow_player = false;
	can_collect = false;
	go_back_to_start_pos = true;
}

if (go_back_to_start_pos)
{
	x = lerp(x, start_x, 0.1);
	y = lerp(y, start_y, 0.1);
	
	if (x == start_x && y == start_y)
	{
		go_back_to_start_pos = false;
	}
}

if (can_collect)
{
	image_angle = 180;
	alarm_set(0, 60);
	can_collect = false;
}