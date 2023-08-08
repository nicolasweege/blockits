function update_player_inputs()
{
	if (global.player_input_enable)
	{
		left = keyboard_check(ord("A"))
		|| keyboard_check(vk_left)
		|| gamepad_button_check(global.device, gp_padl);
			
		right = keyboard_check(ord("D"))
		|| keyboard_check(vk_right)
		|| gamepad_button_check(global.device, gp_padr);
			
		down = keyboard_check(ord("S"))
		|| keyboard_check(vk_down)
		|| gamepad_button_check(global.device, gp_padd);
	
		up = keyboard_check(ord("W")) 
		|| keyboard_check(vk_up)
		|| gamepad_button_check(global.device, gp_padu);
			
		jump_pressed = keyboard_check_pressed(ord("K"))
		|| keyboard_check_pressed(vk_space)
		|| gamepad_button_check_pressed(global.device, gp_face1)
		// || keyboard_check_pressed(ord("W"));
			
		jump_released = keyboard_check_released(ord("K"))
		|| keyboard_check_released(vk_space)
		|| gamepad_button_check_released(global.device, gp_face1)
		// || keyboard_check_released(ord("W"));
			
		dash_pressed = keyboard_check_pressed(ord("J"))
	    || gamepad_button_check_pressed(global.device, gp_face2)
	    || gamepad_button_check_pressed(global.device, gp_face3)
	    || gamepad_button_check_pressed(global.device, gp_shoulderr)
	    || gamepad_button_check_pressed(global.device, gp_shoulderrb)
	    || gamepad_button_check_pressed(global.device, gp_shoulderl)
	    || gamepad_button_check_pressed(global.device, gp_shoulderlb);

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

// if we call this, we have to do it inside the player, or using the "with" keyword
function PLAYER_goto_death_state()
{
	going_back_to_checkpoint = false;
	player_got_to_checkpoint = false;
	time_source_start(going_back_to_checkpoint_timer);
	player_state = death_state;
}

function create_player_death_particle(dir, is_last_par)
{
	var particle = instance_create_depth(x, y, -9999, obj_player_death_par);
	particle.speed = .3;
	particle.direction = dir;
	particle.image_blend = c_red;
	particle.x_to = global.checkpoint_x;
	particle.y_to = global.checkpoint_y;
	
	if (is_last_par)
	{
		particle.is_last_par = true;
	}
	
	global.cam_target = particle;
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