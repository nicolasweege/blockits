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

// if we call this, we have to do it inside the player, or using the "with" keyword
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