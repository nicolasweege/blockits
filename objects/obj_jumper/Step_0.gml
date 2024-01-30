if (obj_player.player_state == obj_player.god_mode_state
    || obj_player.player_state == obj_player.death_state)
{
	exit;	
}

if (obj_player.dash_pressed 
    && (obj_player.dash_dir == 225 
	    || obj_player.dash_dir == 270 
		|| obj_player.dash_dir == 315))
{
	dash_buffer_counter = dash_buffer_max;
}

if (dash_buffer_counter > 0)
{
	dash_buffer_counter -= 1;
	// dash_buffer_counter -= global.delta;
}

if (place_meeting(x, y - 1, obj_player))
{	
	with (obj_player)
	{
		if (other.dash_buffer_counter > 0)
		{
			v_speed = -8;
			screen_shake(4, 7, false, true);
			audio_play_sound(snd_boosted_spring, 1, 0);
			player_state = free_state;
		}
		else
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
		can_jumper_dash_timer = time_to_can_jumper_dash;
		
		// player dust particles
		var xx = random_range(x - (sprite_width / 3), x + (sprite_width / 3));
		create_player_dust_particle(1, xx, y, 
		                            global.player_dust_particles_layer, 
									choose(obj_player_dust_particle_1, obj_player_dust_particle_2));
	}
}