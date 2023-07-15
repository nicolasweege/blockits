if (!instance_exists(obj_player))
{
	exit;	
}

if (obj_player.player_state == obj_player.god_mode_state)
{
	exit;	
}

if (instance_place(x, y, obj_player) && !can_destroy)
{
	with (obj_player)
	{
		dash_timer = 0;
		can_dash += 1;
	}
	
	// screen_shake(5, 10, true, false);
	can_destroy = true;
	alarm_set(0, 1);
}

if (can_destroy == false)
{
	sprite_index = spr_dash_bonus_item;
	
	/*
	if (time < duration)
	{
		hover = ease_in_and_out(time, start, dest - start, duration);
		time++;
	}
	else
	{
		var temp_start = start;
		start = dest;
		dest = temp_start;
		time = 0;
	}
	*/
}