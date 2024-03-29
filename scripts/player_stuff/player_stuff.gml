function update_player_inputs()
{
	if (global.player_input_enable)
	{	
		left = keyboard_check(global.PLAYER_left_key)
		|| gamepad_button_check(global.device, global.PLAYER_left_gp);
			
		right = keyboard_check(global.PLAYER_right_key)
		|| gamepad_button_check(global.device, global.PLAYER_right_gp);
			
		down = keyboard_check(global.PLAYER_down_key)
		|| gamepad_button_check(global.device, global.PLAYER_down_gp);
	
		up = keyboard_check(global.PLAYER_up_key) 
		|| gamepad_button_check(global.device, global.PLAYER_up_gp);
			
		jump_pressed = keyboard_check_pressed(global.PLAYER_jump_key)
		|| gamepad_button_check_pressed(global.device, global.PLAYER_jump_gp);
			
		jump_released = keyboard_check_released(global.PLAYER_jump_key)
		|| gamepad_button_check_released(global.device, global.PLAYER_jump_gp);
			
		dash_pressed = keyboard_check_pressed(global.PLAYER_dash_key)
	    || gamepad_button_check_pressed(global.device, global.PLAYER_dash_gp);

		if (abs(gamepad_axis_value(global.device, gp_axislh)) > .5)
		{
			right = ceil(max(gamepad_axis_value(global.device, gp_axislh), 0));
			left = ceil(abs(min(gamepad_axis_value(global.device, gp_axislh), 0)));
		}
	
		if (abs(gamepad_axis_value(global.device, gp_axislv)) > .2)
		{
			down = ceil(max(gamepad_axis_value(global.device, gp_axislv), 0));
			up = ceil(abs(min(gamepad_axis_value(global.device, gp_axislv), 0)));
		}
	}
	else
	{
		left = 0;
		right = 0;
		down = 0;
		up = 0;
		jump_pressed = 0;
		jump_released = 0;
		dash_pressed = 0;
	}
}

function update_menu_inputs()
{
	if (global.menu_input_enable)
	{	
		menu_left = keyboard_check_pressed(global.MENU_left_key)
		|| gamepad_button_check_pressed(global.device, global.MENU_left_gp);
			
		menu_right = keyboard_check_pressed(global.MENU_right_key)
		|| gamepad_button_check_pressed(global.device, global.MENU_right_gp);
			
		menu_down = keyboard_check_pressed(global.MENU_down_key)
		|| gamepad_button_check_pressed(global.device, global.MENU_down_gp);
	
		menu_up = keyboard_check_pressed(global.MENU_up_key) 
		|| gamepad_button_check_pressed(global.device, global.MENU_up_gp);
		
		menu_select = keyboard_check_pressed(global.MENU_select_key) 
		|| gamepad_button_check_pressed(global.device, global.MENU_select_gp);
		
		menu_exit_page = keyboard_check_pressed(global.MENU_exit_key) 
		|| gamepad_button_check_pressed(global.device, global.MENU_exit_gp);
		
		/*
		if (abs(gamepad_axis_value(global.device, gp_axislh)) > .5)
		{
			menu_right = ceil(max(gamepad_axis_value(global.device, gp_axislh), 0));
			menu_left = ceil(abs(min(gamepad_axis_value(global.device, gp_axislh), 0)));
		}
	
		if (abs(gamepad_axis_value(global.device, gp_axislv)) > .2)
		{
			menu_down = ceil(max(gamepad_axis_value(global.device, gp_axislv), 0));
			menu_up = ceil(abs(min(gamepad_axis_value(global.device, gp_axislv), 0)));
		}
		*/
	}
	else
	{
		menu_left = 0;
		menu_right = 0;
		menu_down = 0;
		menu_up = 0;
		menu_select = 0;
		menu_exit_page = 0;
	}
}

// if we call this, we have to do it inside the player
function PLAYER_goto_death_state()
{
	/*
	if (!right && !left)
	{
		h_speed = -2;
	}
	else
	{
		h_speed = (left - right) * 2;
	}
	
	if (!up && !down)
	{
		v_speed = -2;
	}
	else
	{
		v_speed = (up - down) * 2;	
	}
	
	time_source_start(going_back_to_checkpoint_timer);
	*/
	
	h_speed = 0;
	v_speed = 0;
	xscale = 1.2;
	yscale = 1.2;
	if (keep_horizontal_jumper_momentum)
	{
		keep_horizontal_jumper_momentum = false;
	}
	
	var time_source_state = time_source_get_state(going_back_to_checkpoint_timer);
	if (time_source_state == time_source_state_active
	    || time_source_state == time_source_state_paused)
		{
			time_source_stop(going_back_to_checkpoint_timer);
		}
	time_source_start(going_back_to_checkpoint_timer);
	
	player_got_to_checkpoint = false;
	going_back_to_checkpoint = false;
	audio_play_sound(snd_player_death, 1, 0);
	screen_shake(15, 10, true, true);
	player_state = death_state;
}

function create_player_dash_particle(particle_count, xx, yy, layer_to_draw, particle_object, 
                                     particle_dir = random_range(20, 100), 
									 particle_speed = random_range(0.1, 0.15),
									 particle_color = c_white)
{
	for (var i = 0; i < particle_count; i++)
	{
		// var xx = random_range(x - (sprite_width / 3), x + (sprite_width / 3));
		var particle = instance_create_layer(xx, yy, layer_to_draw, particle_object);
		particle.direction = particle_dir;
		particle.speed = particle_speed;
		particle.original_speed = particle_speed;
		particle.image_blend = particle_color;
	}	
}

function create_player_dust_particle(particle_count, xx, yy, layer_to_draw, particle_object, 
                                     particle_dir = random_range(20, 100), 
									 particle_speed = random_range(0.1, 0.15))
{
	for (var i = 0; i < particle_count; i++)
	{
		// var xx = random_range(x - (sprite_width / 3), x + (sprite_width / 3));
		var particle = instance_create_layer(xx, yy, layer_to_draw, particle_object);
		particle.direction = particle_dir;
		particle.speed = particle_speed;
		particle.original_speed = particle_speed;
	}	
}

function PLAYER_get_dash_bonus_item()
{
	if (place_meeting(x, y, obj_dash_bonus_item))
	{
		var dash_item = instance_place(x, y, obj_dash_bonus_item);
		if (dash_item.current_state == dash_item.default_state)
		{
			dash_timer = 0;
			if (can_dash < 2)
			{
				can_dash += 1;
			}
			
			screen_shake(3, 7, true, true);
			audio_play_sound_on(dash_item.audio_emitter, 
								choose(snd_diamond_touch_01, snd_diamond_touch_02, snd_diamond_touch_03),
								0, 
								1);
			dash_item.current_state = dash_item.destroy_state;
			time_source_start(dash_item.showup_timer);
		}
	}
}

function PLAYER_get_collectable()
{
	if (place_meeting(x, y, obj_collectable))
	{
		var collectable = instance_place(x, y, obj_collectable);
		if (collectable.current_state == collectable.free_state)
		{
			audio_play_sound(snd_collectable_touch, 1, 0);
			collectable.current_state = collectable.follow_state;
		}
	}
}

function PLAYER_handle_rope()
{
	if (instance_place(x, y, obj_rope)
	    && player_state != rope_swing_state
	    && player_state != death_state
	    && player_state != god_mode_state)
	{
		var rope = instance_place(x, y, obj_rope);
		if (rope)
		{
			grapple_x = rope.x;
			grapple_y = rope.y;
			rope_x = x;
			rope_y = y;
			rope_angle_vel = 0;
			rope_angle = point_direction(grapple_x, grapple_y, x, y);
		
			if (sign(h_speed) > 0)
			{
				rope_angle = 180;
			}
			if (sign(h_speed) < 0)
			{
				rope_angle = 359;
			}
			if (sign(h_speed) == 0)
			{
				rope_angle = 270;	
			}
		
			rope_length = point_distance(grapple_x, grapple_y, x, y);
			player_state = rope_swing_state;
		}
	}
}

function PLAYER_handle_level_change()
{
	if (place_meeting(x, y, obj_level_changer_collider))
	{
		var level_changer = instance_place(x, y, obj_level_changer_collider);
		if (level_changer)
		{
			switch (level_changer.dir_to_change)
			{
				case "vertical":
					if (sign(v_speed) < 0)
					{
						v_speed = -4;
					}
					break;
				
				case "horizontal":
					if (sign(h_speed) > 0)
					{
						h_speed = 7;
					}
					
					if (sign(h_speed) < 0)
					{
						h_speed = -7;
					}
					break;
			}
		}
	}
}

function PLAYER_handle_destroy_block_x_collision(_sign_hspeed)
{
	if (dash_destroy_block_buffer_counter <= 0)
	{
		exit;
	}
	
	if (place_meeting(x + _sign_hspeed, y, obj_destroy_block))
	{	
		hspeed_to_bounce = 0;
		vspeed_to_bounce = 0;
		
		var destroy_block = instance_place(x + _sign_hspeed, y, obj_destroy_block);
		if (destroy_block.current_state == destroy_block.default_state)
		{
			audio_play_sound(choose(snd_diamond_touch_01, snd_diamond_touch_02, snd_diamond_touch_03),
								0, 
								0);
			screen_shake(15, 10, true, true);
			destroy_block.current_state = destroy_block.destroy_state;
			time_source_start(destroy_block.time_togo_default_state);
		}
		
		// bouncing player when destroying the block
		// var _player_dir = point_direction(0, 0, right-left, down-up);
		
		switch (dash_dir)
		{
			case 0:
				if (place_meeting(x + 1, y, obj_destroy_block))
				{
					hspeed_to_bounce = -12;
					vspeed_to_bounce = -4;
				}
				break;
				
			case 45:
				if (place_meeting(x + 1, y, obj_destroy_block))
				{
					hspeed_to_bounce = -8;
					vspeed_to_bounce = -5;
				}
				else if (place_meeting(x, y - 1, obj_destroy_block))
				{
					hspeed_to_bounce = 8;
					vspeed_to_bounce = 2;
				}
				break;
				
			case 90:
				if (place_meeting(x, y - 1, obj_destroy_block))
				{
					// vspeed_to_bounce = 2;
					vspeed_to_bounce = 1.5;
				}
				break;
				
			case 135:
				if (place_meeting(x - 1, y, obj_destroy_block))
				{
					hspeed_to_bounce = 8;
					vspeed_to_bounce = -5;
				}
				else if (place_meeting(x, y - 1, obj_destroy_block))
				{
					hspeed_to_bounce = -8;
					vspeed_to_bounce = 2;
				}
				break;
				
			case 180:
				if (place_meeting(x - 1, y, obj_destroy_block))
				{
					hspeed_to_bounce = 12;
					vspeed_to_bounce = -4;
				}
				break;
				
			case 225:
				if (place_meeting(x - 1, y, obj_destroy_block))
				{
					hspeed_to_bounce = 8;
					vspeed_to_bounce = 2;
				}
				else if (place_meeting(x, y + 1, obj_destroy_block))
				{
					hspeed_to_bounce = -8;
					vspeed_to_bounce = -5;
				}
				break;
				
			case 270:
				if (place_meeting(x, y + 1, obj_destroy_block))
				{
					// vspeed_to_bounce = -5;
					vspeed_to_bounce = -6;
				}
				break;
				
			case 315:
				if (place_meeting(x + 1, y, obj_destroy_block))
				{
					hspeed_to_bounce = -8;
					vspeed_to_bounce = 2;
				}
				else if (place_meeting(x, y + 1, obj_destroy_block))
				{
					hspeed_to_bounce = 8;
					vspeed_to_bounce = -5;
				}
				break;
		}
		
		if (instance_place(x + _sign_hspeed, y, obj_destroy_dash_bonus_block))
		{
			can_dash = 2;
		}
		else if (instance_place(x + _sign_hspeed, y, obj_destroy_block))
		{
			if (can_dash < 1)
			{
				can_dash = 1;
			}
		}
		
		time_source_start(bounce_player_destroy_block_timer);
		
		player_state = free_state;
	}
}

function PLAYER_handle_destroy_block_y_collision(_sign_vspeed)
{
	if (dash_destroy_block_buffer_counter <= 0)
	{
		exit;	
	}
	
	if (place_meeting(x, y + _sign_vspeed, obj_destroy_block))
	{	
		hspeed_to_bounce = 0;
		vspeed_to_bounce = 0;
		
		var destroy_block = instance_place(x, y + _sign_vspeed, obj_destroy_block);
		if (destroy_block.current_state == destroy_block.default_state)
		{
			audio_play_sound(choose(snd_diamond_touch_01, snd_diamond_touch_02, snd_diamond_touch_03),
								0, 
								0);
			screen_shake(15, 10, true, true);
			destroy_block.current_state = destroy_block.destroy_state;
			time_source_start(destroy_block.time_togo_default_state);
		}
		
		// bouncing player when destroying the block
		// var _player_dir = point_direction(0, 0, right-left, down-up);
		
		switch (dash_dir)
		{
			case 0:
				if (place_meeting(x + 1, y, obj_destroy_block))
				{
					hspeed_to_bounce = -12;
					vspeed_to_bounce = -4;
				}
				break;
				
			case 45:
				if (place_meeting(x + 1, y, obj_destroy_block))
				{
					hspeed_to_bounce = -8;
					vspeed_to_bounce = -5;
				}
				else if (place_meeting(x, y - 1, obj_destroy_block))
				{
					hspeed_to_bounce = 8;
					vspeed_to_bounce = 2;
				}
				break;
				
			case 90:
				if (place_meeting(x, y - 1, obj_destroy_block))
				{
					// vspeed_to_bounce = 2;
					vspeed_to_bounce = 1.5;
				}
				break;
				
			case 135:
				if (place_meeting(x - 1, y, obj_destroy_block))
				{
					hspeed_to_bounce = 8;
					vspeed_to_bounce = -5;
				}
				else if (place_meeting(x, y - 1, obj_destroy_block))
				{
					hspeed_to_bounce = -8;
					vspeed_to_bounce = 2;
				}
				break;
				
			case 180:
				if (place_meeting(x - 1, y, obj_destroy_block))
				{
					hspeed_to_bounce = 12;
					vspeed_to_bounce = -4;
				}
				break;
				
			case 225:
				if (place_meeting(x - 1, y, obj_destroy_block))
				{
					hspeed_to_bounce = 8;
					vspeed_to_bounce = 2;
				}
				else if (place_meeting(x, y + 1, obj_destroy_block))
				{
					hspeed_to_bounce = -8;
					vspeed_to_bounce = -5;
				}
				break;
				
			case 270:
				if (place_meeting(x, y + 1, obj_destroy_block))
				{
					// vspeed_to_bounce = -5;
					vspeed_to_bounce = -6;
				}
				break;
				
			case 315:
				if (place_meeting(x + 1, y, obj_destroy_block))
				{
					hspeed_to_bounce = -8;
					vspeed_to_bounce = 2;
				}
				else if (place_meeting(x, y + 1, obj_destroy_block))
				{
					hspeed_to_bounce = 8;
					vspeed_to_bounce = -5;
				}
				break;
		}
		
		if (instance_place(x, y + _sign_vspeed, obj_destroy_dash_bonus_block))
		{
			can_dash = 2;
		}
		else if (instance_place(x, y + _sign_vspeed, obj_destroy_block))
		{
			if (can_dash < 1)
			{
				can_dash = 1;
			}
		}
		
		time_source_start(bounce_player_destroy_block_timer);
		
		player_state = free_state;
	}
}

function PLAYER_handle_checkpoint_setting()
{
    if (place_meeting(x, y + 1, obj_default_collider))
    {
        var current_player_checkpoint = instance_place(x, y, obj_checkpoint);
    
        if (current_player_checkpoint
            && player_state != death_state
            && player_state != god_mode_state)
            {
                global.checkpoint_id = current_player_checkpoint.id;
                global.checkpoint_room = room;
                global.checkpoint_x = current_player_checkpoint.x;
                global.checkpoint_y = (current_player_checkpoint.y - 5);
                
                if (current_player_checkpoint.previous_checkpoint_id 
                    != current_player_checkpoint.id)
                {
                    save_game_data(global.current_save_slot);
                }
            }
    }
}




