if (!instance_exists(obj_player))
{
	exit;	
}

if (place_meeting(x, y - 1, obj_player))
{
	with (obj_player)
	{	
		if (can_dash <= 0)
		{
			can_dash = 1;
		}
		
		// v_speed = 0;
		v_speed = -6;
		xscale = 1.2;
		yscale = 0.5;
	}
}

/*
if (place_meeting(x - 1, y, obj_player))
{
	with (obj_player)
	{
		if (can_dash <= 0)
		{
			can_dash = 1;
		}
		
		h_speed = -10;
	}
	
	global.player_input_enable = false;
	alarm_set(0, 5);
}
*/