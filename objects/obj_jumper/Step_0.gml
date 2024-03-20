if (obj_player.player_state == obj_player.god_mode_state
    || obj_player.player_state == obj_player.death_state
	|| global.is_paused)
{
	exit;	
}

#region impulse animation stuff
if (can_back_anim_timer > 0)
{
	can_back_anim_timer -= 1;
	// can_back_anim_timer -= global.delta;
}

if (place_meeting(x, y - 1, obj_player))
{
	image_index = 1;
	can_back_anim_timer = time_to_back_anim;
}
else
{
	if (can_back_anim_timer <= 0)
	{
		image_index = 0;
	}
}
#endregion

if (obj_player.dash_pressed 
	&& obj_player.can_dash > 0
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
			// color stuff (yellow)
			other.red = 255;
			other.green = 242;
			other.blue = 0;
			other.arrow_object_to_use = obj_jumper_dash_arrow_particle;
			
			instance_create_depth(x, y, obj_player.depth + 1, obj_player_dash_boom_effect);
		}
		else
		{
			v_speed = -6;
			audio_play_sound(snd_spring, 1, 0);
			// color stuff (purple)
			other.red = 122;
			other.green = 54;
			other.blue = 123;
			other.arrow_object_to_use = obj_jumper_arrow_particle;
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
	
	// jumper impulse particle
	var particle = instance_create_depth(x, y, (depth - 1), arrow_object_to_use);
	particle.direction = 90;
	particle.original_speed = 0.5;
	particle.alpha_speed = 0.03;
}

// color stuff
green = lerp(green, 255, change_color_speed);
blue = lerp(blue, 255, change_color_speed);
red = lerp(red, 255, change_color_speed);
main_color = make_color_rgb(red, green, blue);