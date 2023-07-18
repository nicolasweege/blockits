if (global.console_enabled 
    || global.is_paused 
	|| !global.player_can_move)
{
	part_system_automatic_update(dash_particle_system, false);
	
	exit;
}

part_system_automatic_update(dash_particle_system, true);

update_player_inputs();

on_wall = (place_meeting(x + 1, y, obj_default_collider) 
          - place_meeting(x - 1, y, obj_default_collider));

// landing
temp_on_floor = place_meeting(x, y + 1, obj_default_collider);
if (temp_on_floor 
    && !on_floor 
	&& v_speed >= 0 
	&& player_state != god_mode_state)
{
	xscale = 1.2;
	yscale = 0.7;
	can_dash = 1;
	jumper_object_can_jump_release = true;
	
	#region different landing sounds on different materials
		
	if (place_meeting(x, y + 1, obj_dirt_sound_collider)) // dirt
	{	
		audio_play_sound(choose(snd_debris_dirt_soft_01,
		                        snd_debris_dirt_soft_02,
								snd_debris_dirt_soft_03,
								snd_debris_dirt_soft_04,
								snd_debris_dirt_soft_05,
								snd_debris_dirt_soft_06), 
						 1, 
						 0);
	}
	else if (place_meeting(x, y + 1, obj_stone_sound_collider)) // stone
	{
		audio_play_sound(choose(snd_debris_stone_soft_01,
		                        snd_debris_stone_soft_02,
								snd_debris_stone_soft_03,
								snd_debris_stone_soft_04,
								snd_debris_stone_soft_05,
								snd_debris_stone_soft_06), 
						 1, 
						 0);
	}
	else if (place_meeting(x, y + 1, obj_wood_sound_collider) // wood
	         || place_meeting(x, y + 1, obj_timed_slab)
			 || place_meeting(x, y + 1, obj_moving_platform))
			 
	{
		audio_play_sound(choose(snd_debris_wood_soft_01,
		                        snd_debris_wood_soft_02,
								snd_debris_wood_soft_03,
								snd_debris_wood_soft_04,
								snd_debris_wood_soft_05,
								snd_debris_wood_soft_06), 
						 1, 
						 0);
	}
	else
	{
		audio_play_sound(choose(snd_debris_stone_soft_01,
		                        snd_debris_stone_soft_02,
								snd_debris_stone_soft_03,
								snd_debris_stone_soft_04,
								snd_debris_stone_soft_05,
								snd_debris_stone_soft_06), 
						 1, 
						 0);
						 
		/*
		audio_play_sound(choose(snd_debris_dirt_soft_01,
		                        snd_debris_dirt_soft_02,
								snd_debris_dirt_soft_03,
								snd_debris_dirt_soft_04,
								snd_debris_dirt_soft_05,
								snd_debris_dirt_soft_06), 
						 1, 
						 0);
		*/
	}
		
	#endregion
	
	var xx = random_range(x - (sprite_width / 3), x + (sprite_width / 3));
	create_player_dust_particle(1, xx, y, 
	                            global.player_dust_particles_layer, 
								choose(obj_player_dust_particle_1, obj_player_dust_particle_2));
}

on_floor = place_meeting(x, y + 1, obj_default_collider);
on_roof = place_meeting(x, y - 1, obj_default_collider);

#region dash amount color feedback
switch (can_dash)
{
	case 0:
	{
		// red color
		player_color_green = lerp(player_color_green, 100, change_player_color_speed);
		player_color_blue = lerp(player_color_blue, 100, change_player_color_speed);
		player_color_red = lerp(player_color_red, 100, change_player_color_speed);
	} break;
	
	case 1:
	{
		// white color
		player_color_green = lerp(player_color_green, 255, change_player_color_speed);
		player_color_blue = lerp(player_color_blue, 255, change_player_color_speed);
		player_color_red = lerp(player_color_red, 255, change_player_color_speed);
	} break;
	
	default:
	{
		// yellow color
		player_color_green = lerp(player_color_green, 255, change_player_color_speed);
		player_color_blue = lerp(player_color_blue, 50, change_player_color_speed);
		player_color_red = lerp(player_color_red, 255, change_player_color_speed);
	} break;
}

if (player_state == god_mode_state)
{
	// green color
	player_color_green = lerp(player_color_green, 10, change_player_color_speed);
	player_color_blue = lerp(player_color_blue, 10, change_player_color_speed);
	player_color_red = lerp(player_color_red, 10, change_player_color_speed);
}

player_color = make_color_rgb(player_color_red, player_color_green, player_color_blue);
#endregion

// updating player animation
xscale = lerp(xscale, 1, 0.08);
 yscale = lerp(yscale, 1, 0.08);

// updating player state
player_state();