if (obj_player.player_state == obj_player.god_mode_state
    || obj_player.player_state == obj_player.death_state)
{
	exit;	
}

if (place_meeting(x + sign(hdir), y, obj_player))
{
	with (obj_player)
	{
		if (player_state == dash_state)
		{
			v_speed = -6;
			screen_shake(4, 7, true, false);
			audio_play_sound(snd_boosted_spring, 1, 0);
			global.player_momentum_x = other.hdir;
			global.player_momentum_speed = 8;
			player_state = lock_state;
			time_source_start(other.set_player_momentum_timer);
		}
		else if (player_state = free_state)
		{
			v_speed = -4;
			audio_play_sound(snd_spring, 1, 0);
			global.player_momentum_x = other.hdir;
			global.player_momentum_speed = 6;
			player_state = lock_state;
			time_source_start(other.set_player_momentum_timer);
		}
		
		if (can_dash <= 0)
		{
			can_dash = 1;
		}
		
		// jumper_object_can_jump_release = false; 
		// coyote_can_jump = 0;
		xscale = 1.4;
		yscale = 0.6;
		
		var xx = random_range(x - (sprite_width / 3), x + (sprite_width / 3));
		create_player_dust_particle(1, xx, y, 
			                        global.player_dust_particles_layer, 
									choose(obj_player_dust_particle_1, obj_player_dust_particle_2));
	}
}