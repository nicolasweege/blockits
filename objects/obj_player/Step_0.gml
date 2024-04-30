// pausing
if (global.app_state == states.PAUSE_MENU
    || !global.player_can_move)
{
	if (!has_paused)
	{
		part_system_automatic_update(dash_particle_system, false);
		
		// timers
		if (time_source_get_state(set_player_belt_momentum_timer) == time_source_state_active)
		{
			time_source_pause(set_player_belt_momentum_timer);
		}
		if (time_source_get_state(going_back_to_checkpoint_timer) == time_source_state_active)
		{
			time_source_pause(going_back_to_checkpoint_timer);
		}
		if (time_source_get_state(set_player_rope_momentum_timer) == time_source_state_active)
		{
			time_source_pause(set_player_rope_momentum_timer);
		}
		if (time_source_get_state(timed_direct_timer) == time_source_state_active)
		{
			time_source_pause(timed_direct_timer);
		}
		if (time_source_get_state(can_enter_timed_direct_timer) == time_source_state_active)
		{
			time_source_pause(can_enter_timed_direct_timer);
		}
		if (time_source_get_state(bounce_player_destroy_block_timer) == time_source_state_active)
		{
			time_source_pause(bounce_player_destroy_block_timer);
		}
		
		has_paused = true;
		has_unpaused = false;
	}
	
	exit;
}
else
{
	if (!has_unpaused)
	{
		part_system_automatic_update(dash_particle_system, true);
		
		// timers
		if (time_source_get_state(set_player_belt_momentum_timer) == time_source_state_paused)
		{
			time_source_resume(set_player_belt_momentum_timer);
		}
		if (time_source_get_state(going_back_to_checkpoint_timer) == time_source_state_paused)
		{
			time_source_resume(going_back_to_checkpoint_timer);
		}
		if (time_source_get_state(set_player_rope_momentum_timer) == time_source_state_paused)
		{
			time_source_resume(set_player_rope_momentum_timer);
		}
		if (time_source_get_state(timed_direct_timer) == time_source_state_paused)
		{
			time_source_resume(timed_direct_timer);
		}
		if (time_source_get_state(can_enter_timed_direct_timer) == time_source_state_paused)
		{
			time_source_resume(can_enter_timed_direct_timer);
		}
		if (time_source_get_state(bounce_player_destroy_block_timer) == time_source_state_paused)
		{
			time_source_resume(bounce_player_destroy_block_timer);
		}
		
		has_unpaused = true;
		has_paused = false;
	}
}

update_player_inputs();

player_dir = point_direction(0, 0, right-left, down-up);

on_wall = (place_meeting(x + 1, y, obj_default_collider) 
          - place_meeting(x - 1, y, obj_default_collider));

// landing
temp_on_floor = place_meeting(x, y + 1, obj_default_collider);
if (temp_on_floor 
    && !on_floor 
	&& v_speed >= 0 
	&& player_state != god_mode_state
	&& player_state != death_state)
{

    var _on_timed_slab = place_meeting(x, y + 1, obj_timed_slab) 
                         || place_meeting(x, y + 1, obj_library_timed_slab);
        
    var _on_destroy_block = place_meeting(x, y + 1, obj_destroy_block)
                            || place_meeting(x, y + 1, obj_destroy_dash_bonus_block);
    
    if (!_on_timed_slab 
        && !_on_destroy_block)
    {
        can_collect_collectable = true;
    }
    
	xscale = 1.2;
	yscale = 0.7;
	can_dash = 1;
	can_direct = 1;
	jumper_object_can_jump_release = true;
	
	if (!global.player_changing_rooms)
	{
		if (place_meeting(x, y + 1, obj_totem_plate))
		{
			audio_play_sound(snd_click, 1, 0);	
		}
		else
		{
			audio_play_sound(choose(snd_player_default_land_1,
								snd_player_default_land_3,
								snd_player_default_land_5,
								snd_player_default_land_6,
								snd_player_default_land_7,
								snd_player_default_land_8), 
					     1, 
						 0);
		}
		
		// different landing sounds on different materials
		/*
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
		else if (place_meeting(x, y + 1, obj_totem_plate))
		{
			audio_play_sound(snd_click, 1, 0);	
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
		}
		*/
		
		if (!place_meeting(x + 1, y, obj_jumper))
		{
			var xx = random_range(x - (sprite_width / 3), x + (sprite_width / 3));
			create_player_dust_particle(1, xx, y, 
					                    PLAYER_DUST_PARTICLES_LAYER, 
										choose(obj_player_dust_particle_1, obj_player_dust_particle_2));
		}
	}
}

on_floor = place_meeting(x, y + 1, obj_default_collider);

if (!on_floor)
{
    obj_player.can_collect_collectable = false;
}

on_slab = place_meeting(x, y + 1, obj_timed_slab) || place_meeting(x, y + 1, obj_library_timed_slab);
on_roof = place_meeting(x, y - 1, obj_default_collider);
on_destroy_block = place_meeting(x, y + 1, obj_destroy_block);

// capsule stuff
// @TODO @Complete: fix this bug where the player starts flying away from the current capsule
// (it probably has to do with the variables and conditions to get inside the capsule,
// witch are controlled by the capsule itself).
//
// @TODO @Complete: make a timer for the player to be able to  dash or jump to get out of the capsule.

if (player_state != on_capsule_state
    && current_player_capsule)
{
    current_player_capsule = 0;
}

// @OBS: I'll let this here fow now, maybe it can be usefull in the future...
/*
    if (current_player_capsule)
    {
        if (!place_meeting(x, y, obj_capsule)
            && current_player_capsule.current_state != current_player_capsule.free_state
            && player_state == on_capsule_state)
        {
            current_player_capsule.current_state = current_player_capsule.free_state;
            current_player_capsule = 0;
            player_state = free_state;
        }
    }
*/

// dash destroy block buffer stuff
// @TODO: make so that the player can dash even if it is on top of the destroy block
// (unless it is trying do dash downwards).
if (dash_pressed && can_dash > 0)
{
    /*
        if (place_meeting(x, y + 1, obj_destroy_block)
           && (dash_dir == 135 || dash_dir == 90 || dash_dir == 45))
        {
            
        }
        
        if (place_meeting(x + 1, y, obj_destroy_block)
           && (dash_dir == 135 || dash_dir == 180 || dash_dir == 225))
        {
            
        }
        
        if (place_meeting(x - 1, y, obj_destroy_block)
           && (dash_dir == 45 || dash_dir == 0 || dash_dir == 315))
        {
            
        }
    */
    
    if (!place_meeting(x + 1, y, obj_destroy_block)
        && !place_meeting(x - 1, y, obj_destroy_block)
        && !place_meeting(x, y + 1, obj_destroy_block)
        && !place_meeting(x, y - 1, obj_destroy_block))
    {
        dash_destroy_block_buffer_counter = dash_destroy_block_buffer_max;
    }
}

if (dash_destroy_block_buffer_counter > 0)
{
	dash_destroy_block_buffer_counter -= 1;
	// dash_destroy_block_buffer_counter -= global.delta;
}

// dash amount color feedback
switch (can_dash)
{
	case 0:
	{
		if (on_floor && player_state == dash_state)
		{
			// yellow color
			player_color_green = lerp(player_color_green, 255, change_player_dash_boom_color_speed);
			player_color_blue = lerp(player_color_blue, 50, change_player_dash_boom_color_speed);
			player_color_red = lerp(player_color_red, 255, change_player_dash_boom_color_speed);
		}
		else if (use_dash_boom_color)
		{
			// yellow color
			player_color_green = lerp(player_color_green, 255, change_player_dash_boom_color_speed);
			player_color_blue = lerp(player_color_blue, 50, change_player_dash_boom_color_speed);
			player_color_red = lerp(player_color_red, 255, change_player_dash_boom_color_speed);
		}
		else
		{
			// gray color
			player_color_green = lerp(player_color_green, 100, change_player_color_speed);
			player_color_blue = lerp(player_color_blue, 100, change_player_color_speed);
			player_color_red = lerp(player_color_red, 100, change_player_color_speed);
		}
	} break;
	
	case 1:
	{
		if (on_floor && player_state == dash_state)
		{
			// yellow color
			player_color_green = lerp(player_color_green, 255, change_player_dash_boom_color_speed);
			player_color_blue = lerp(player_color_blue, 50, change_player_dash_boom_color_speed);
			player_color_red = lerp(player_color_red, 255, change_player_dash_boom_color_speed);
		}
		else if (use_dash_boom_color)
		{
			// yellow color
			player_color_green = lerp(player_color_green, 255, change_player_dash_boom_color_speed);
			player_color_blue = lerp(player_color_blue, 50, change_player_dash_boom_color_speed);
			player_color_red = lerp(player_color_red, 255, change_player_dash_boom_color_speed);
		}
		else
		{
			// white color
			player_color_green = lerp(player_color_green, 255, change_player_color_speed);
			player_color_blue = lerp(player_color_blue, 255, change_player_color_speed);
			player_color_red = lerp(player_color_red, 255, change_player_color_speed);
		}
	} break;
	
	default:
	{
		if (on_floor && use_dash_boom_color)
		{
			// yellow color
			player_color_green = lerp(player_color_green, 255, change_player_dash_boom_color_speed);
			player_color_blue = lerp(player_color_blue, 50, change_player_dash_boom_color_speed);
			player_color_red = lerp(player_color_red, 255, change_player_dash_boom_color_speed);
		}
		else if (use_dash_boom_color)
		{
			// yellow color
			player_color_green = lerp(player_color_green, 255, change_player_dash_boom_color_speed);
			player_color_blue = lerp(player_color_blue, 50, change_player_dash_boom_color_speed);
			player_color_red = lerp(player_color_red, 255, change_player_dash_boom_color_speed);
		}
		else
		{
			// yellow color
			player_color_green = lerp(player_color_green, 255, change_player_color_speed);
			player_color_blue = lerp(player_color_blue, 50, change_player_color_speed);
			player_color_red = lerp(player_color_red, 255, change_player_color_speed);
		}
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

xscale = lerp(xscale, 1, 0.08);
yscale = lerp(yscale, 1, 0.08);

player_state();







