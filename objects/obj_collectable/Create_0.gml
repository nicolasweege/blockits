// @TODO @Incomplete: adicionar animação com audio quando o player pousar em alguma superfice que 
// não o deixe coletar o obj_collectable.

// @TODO @Incomplete: make the collectables do not gather with each other 
// when there is more then one instance following the player.

// @TODO @Incomplete: make the collectable teleport near to the player
// in a fast way (smooth or not), when transitioning from one 
// camera mask to another. To appear on the screen as soon as possible.

original_depth = depth;

has_paused   = false;
has_unpaused = false;

obj_to_follow_id = obj_player;

original_x_distance = 20;
original_y_distance = 25;
x_distance = -original_x_distance;
y_distance = -original_y_distance;

original_h_stick_speed = 0.03;
original_v_stick_speed = 0.02;
horizontal_stick_speed = original_h_stick_speed;
vertical_stick_speed = original_v_stick_speed;

original_general_dist_lerp_speed = 0.06;
general_dist_lerp_speed = original_general_dist_lerp_speed;
general_vel_lerp_speed = 0.01;

xdir = 1;
ydir = 1;

initial_sprite = spr_collectable_normal_1;
get_sprite = spr_collectable_get_1;
sprite_index = initial_sprite;

destroy_timer = time_source_create(time_source_game,
                                   2,
								   time_source_units_seconds,
								   function()
								   {					   
									   instance_destroy();
								   }, [], 1);

lock_state = function()
{
	
}

final_state = function()
{
	y = lerp(y, obj_to_follow_id.y, 0.008);
	
	if (image_index >= (image_number - 1))
	{
		image_speed = 0;
		time_source_start(destroy_timer);
		current_state = lock_state;
	}
}

free_state = function()
{	
	depth = original_depth;
	
	x = lerp(x, xstart, horizontal_stick_speed);
	y = lerp(y, ystart, vertical_stick_speed);
}

// FOLLOW STATE
follow_state = function()
{
    // @OBS: this is an arbitrary 'depth setting' for when the collectable is
    // following the player. We just use 'foreground_particles_1' layer because
    // it is in the same depth that we want the collectable to be in.
	if (layer_get_id("foreground_particles_1"))
	{
		depth = layer_get_depth(layer_get_id("foreground_particles_1"));
	}
	
	// Collecting the collectable object.
	/*
    	repeat (abs(obj_player.v_speed))
        {
        	with (obj_player)
        	{
                var _on_timed_slab = place_meeting(x, y + 1, obj_timed_slab) 
                                         || place_meeting(x, y + 1, obj_library_timed_slab);
                    
                var _on_destroy_block = place_meeting(x, y + 1, obj_destroy_block)
                                        || place_meeting(x, y + 1, obj_destroy_dash_bonus_block);
                
                if (temp_on_floor
                    && v_speed >= 0
                    && player_state != god_mode_state
                    && player_state != death_state
                    && !_on_timed_slab
                    && !_on_destroy_block)
                {
                    
                    
                    other.sprite_index = other.get_sprite;
                	other.image_index = 0;
                	other.current_state = other.final_state;
                }
        	}
        }
    */
    
    if (obj_player.can_collect_collectable)
    {   
        // @TODO @Incomplete: use an emitter and play sound in a '3D' way?
        audio_play_sound(snd_collectable_get, 1, 0);
		sprite_index = get_sprite;
		image_index = 0;
		current_state = final_state;
		
		obj_player.can_collect_collectable = false;
    }
	
	/*
    	if (obj_player.on_floor
    	    && obj_player.v_speed >= 0
    		&& obj_player.player_state != obj_player.god_mode_state
    		&& obj_player.player_state != obj_player.death_state
    		&& !obj_player.on_slab
    		&& !obj_player.on_destroy_block)
    	{
    		audio_play_sound(snd_collectable_get, 1, 0);
    							
    		sprite_index = get_sprite;
    		image_index = 0;
    		current_state = final_state;
    	}
	*/
	
	if (obj_player.player_state == obj_player.death_state)
	{
		current_state = free_state;
		exit;
	}
	
	if (left && !right && obj_player.on_wall != -1)
	{
		xdir = -1;
	}
	else if (right && !left && obj_player.on_wall != 1)
	{
		xdir = 1;
	}

	if (!obj_player.on_floor)
	{
		if (up && !down)
		{
			ydir = -1;
		}
		else if (down && !up)
		{
			ydir = 1;
		}	
	}

	if (obj_to_follow_id != noone)
	{
		x = lerp(x, obj_to_follow_id.x + x_distance, horizontal_stick_speed);
		y = lerp(y, obj_to_follow_id.y + y_distance, vertical_stick_speed);
	}

	// when the player IS in pre_direct_state
	if (obj_player.player_state == obj_player.pre_direct_state)
	{
		general_dist_lerp_speed = 0.3;
		horizontal_stick_speed = 0.1;
		vertical_stick_speed = 0.1;
	
		if (xdir == 1)
		{
			x_distance = lerp(x_distance, -original_x_distance, general_dist_lerp_speed);
		}
		else
		{
			x_distance = lerp(x_distance, original_x_distance, general_dist_lerp_speed);
		}
	
		y_distance = lerp(y_distance, 
		                  -5, 
						  general_dist_lerp_speed);
	}
	else // when the player IS NOT in pre_direct_state
	{
		general_dist_lerp_speed = original_general_dist_lerp_speed;
		horizontal_stick_speed = original_h_stick_speed;
		vertical_stick_speed = original_v_stick_speed;
	
		// choosing player horizintal offpoint to stick
		if (xdir == 1)
		{
			x_distance = lerp(x_distance, -original_x_distance, general_dist_lerp_speed);
		}
		else
		{
			x_distance = lerp(x_distance, original_x_distance, general_dist_lerp_speed);
		}
	
		if (ydir == 1)
		{
			y_distance = lerp(y_distance, -original_y_distance, general_dist_lerp_speed);
		}
		else
		{
			y_distance = lerp(y_distance, original_y_distance, general_dist_lerp_speed);
		}
	}

	// changing velocity based on distance to the player
	if (distance_to_object(obj_player) > 60)
	{
		horizontal_stick_speed = lerp(horizontal_stick_speed, 0.1, general_vel_lerp_speed);
		vertical_stick_speed = lerp(vertical_stick_speed, 0.1, general_vel_lerp_speed);
	}
	else
	{
		horizontal_stick_speed = lerp(horizontal_stick_speed, original_h_stick_speed, general_vel_lerp_speed);
		vertical_stick_speed = lerp(vertical_stick_speed, original_v_stick_speed, general_vel_lerp_speed);	
	}
}

current_state = free_state;