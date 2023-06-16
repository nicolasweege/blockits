if (!instance_exists(obj_player))
{
	exit;
}

if (place_meeting(x, y - 1, obj_player) && obj_player.v_speed >= 0)
{	
	with (obj_player)
	{	
		if (player_state == dash_state)
		{
			v_speed = -8;
			
		}
		else
		{
			v_speed = -6;
		}
		
		player_state = free_state;
		
		if (can_dash <= 0)
		{
			can_dash = 1;
		}
		
		xscale = 0.6;
		yscale = 1.4;
		audio_play_sound(snd_spring, 1, 0);
		
		var xx = random_range(x - (sprite_width / 3), x + (sprite_width / 3));
		create_player_dust_particle(1, xx, y, 
		                            global.player_dust_particles_layer, 
									choose(obj_player_dust_particle_1, obj_player_dust_particle_2));
	}
}