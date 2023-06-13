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
		if (player_state == dash_state)
		{
			v_speed = -8;
			player_state = free_state;
		}
		else
		{
			v_speed = -6;
		}
		
		// v_speed = 0;
		if (can_dash <= 0)
		{
			can_dash = 1;
		}
		
		xscale = 0.5;
		yscale = 1.5;
		audio_play_sound(snd_spring, 1, 0);
		
		var xx = random_range(x - (sprite_width / 3), x + (sprite_width / 3));
		create_player_dust_particle(1, xx, y, 
		                            global.player_dust_particles_layer, 
									choose(obj_player_dust_particle_1, obj_player_dust_particle_2));
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