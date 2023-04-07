if (instance_place(x, y, obj_player) && !can_destroy)
{
	with (obj_player)
	{
		can_dash += 1;
	}
	
	screen_shake(3, 7);
	can_destroy = true;
	alarm_set(0, 1);
}

if (can_destroy == false)
{
	sprite_index = base_sprite;
	
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
}