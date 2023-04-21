if (!instance_exists(obj_player))
{
	exit;	
}

if (place_meeting(x, y - 1, obj_player))
{
	// image_speed = 24;
	/*
	if (image_index > image_number - 1)
	{
		
	}
	*/
	
	with (obj_player)
	{	
		// v_speed = 0;
		if (player_state == free_state)
		{
			if (can_dash <= 0)
			{
				can_dash = 1;
			}
			
			v_speed = -6;
			xscale = 1.2;
			yscale = 0.5;
			audio_play_sound(snd_spring, 1, 0);
		}
	}
}
else
{
	// image_speed = 0;
	// sprite_index = image_number - 3;
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