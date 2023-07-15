if (!instance_exists(obj_player))
{
	exit;
}

if (place_meeting(x, y - 1, obj_player))
{	
	with (obj_player)
	{	
		if (player_state == dash_state)
		{
			v_speed = -8;
			audio_play_sound(snd_boosted_spring, 1, 0);
			player_state = free_state;
		}
		else if (player_state = free_state)
		{
			v_speed = -6;
			audio_play_sound(snd_spring, 1, 0);
		}
		
		if (can_dash <= 0)
		{
			can_dash = 1;
		}
		
		jumper_object_can_jump_release = false; 
		coyote_can_jump = 0;
		xscale = 0.6;
		yscale = 1.4;
		
		var xx = random_range(x - (sprite_width / 3), x + (sprite_width / 3));
		create_player_dust_particle(1, xx, y, 
		                            global.player_dust_particles_layer, 
									choose(obj_player_dust_particle_1, obj_player_dust_particle_2));
	}
}