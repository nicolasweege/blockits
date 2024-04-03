// @TODO @Incomplete: fix the bug that get the player stuck transitioning
// from the 'death_state' to the 'horizontal_jumper_momentum_state' state
// when colliding on top of the bounding box of the jumper object.

if (obj_player.player_state == obj_player.god_mode_state
    || obj_player.player_state == obj_player.death_state
	|| global.is_paused)
{
	exit;
}

// impulse animation stuff
if (can_back_anim_timer > 0)
{
	can_back_anim_timer -= 1;	
	// can_back_anim_timer -= global.delta;
}

if (place_meeting(x + sign(hdir), y, obj_player)
    || place_meeting(x, y - 1, obj_player))
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

if (obj_player.dash_pressed 
	&& obj_player.can_dash > 0
    && obj_player.dash_dir != 90
	&& obj_player.dash_dir != 270)
{
	dash_buffer_counter = dash_buffer_max;
}

if (dash_buffer_counter > 0)
{
	dash_buffer_counter -= 1;
	// dash_buffer_counter -= global.delta;
}

/*
|| place_meeting(x, y - 1, obj_player)
|| place_meeting(x, y + 1, obj_player)
*/
if (place_meeting(x + sign(hdir), y, obj_player)
    || place_meeting(x, y - 1, obj_player))
{
	with (obj_player)
	{
		if (other.dash_buffer_counter > 0)
		{
			v_speed = -6;
			screen_shake(4, 7, true, false);
			audio_play_sound(snd_boosted_spring, 1, 0);
			global.player_momentum_x = other.hdir;
			global.player_momentum_speed = 8;
			player_state = horizontal_jumper_momentum_state;
			time_source_start(other.set_player_momentum_timer);
			// color stuff (yellow)
			other.red = 255;
			other.green = 242;
			other.blue = 0;
			other.arrow_object_to_use = obj_jumper_dash_arrow_particle_2;
			
			instance_create_depth(x, y, obj_player.depth + 1, obj_player_dash_boom_effect);
		}
		else
		{
			v_speed = -4;
			audio_play_sound(snd_spring, 1, 0);
			global.player_momentum_x = other.hdir;
			global.player_momentum_speed = 6;
			player_state = horizontal_jumper_momentum_state;
			time_source_start(other.set_player_momentum_timer);
			// color stuff (purple)
			other.red = 122;
			other.green = 54;
			other.blue = 123;
			other.arrow_object_to_use = obj_jumper_arrow_particle_2;
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
	
	// jumper impulse particle
	
	if (hdir == 1)
	{
		var particle = instance_create_depth((x + sprite_width), y, (depth - 1), arrow_object_to_use);
		particle.direction = 0;	
		particle.image_xscale = sign(hdir);
		particle.original_speed = 0.5;
		particle.alpha_speed = 0.03;
	}
	else
	{
		var particle = instance_create_depth((x + sprite_width), y, (depth - 1), arrow_object_to_use);
		particle.direction = 180;
		particle.image_xscale = sign(hdir);
		particle.original_speed = 0.5;
		particle.alpha_speed = 0.03;
	}
}

// color stuff
green = lerp(green, 255, change_color_speed);
blue = lerp(blue, 255, change_color_speed);
red = lerp(red, 255, change_color_speed);
main_color = make_color_rgb(red, green, blue);