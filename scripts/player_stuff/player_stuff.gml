function update_player_inputs()
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
	|| gamepad_button_check_pressed(global.device, gp_face1);
			
	jump_released = keyboard_check_released(ord("K"))
	|| keyboard_check_released(vk_space)
	|| gamepad_button_check_released(global.device, gp_face1);
			
	dash_pressed = keyboard_check_pressed(ord("J"))
    || gamepad_button_check_pressed(global.device, gp_face2);

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

function create_player_death_particle(dir, is_last_par, xscale)
{
	var particle = instance_create_depth(x, y, depth, obj_player_death_par);
	particle.speed = .5;
	particle.direction = dir;
	particle.image_blend = DEATH_COLLIDER_COLOR;
	// particle.image_xscale = xscale;
	particle.x_to = global.checkpoint_x;
	particle.y_to = global.checkpoint_y;
	
	if (is_last_par)
	{
		particle.is_last_par = true;
	}
	
	global.cam_target = particle;
}

function create_player_dust_particle(particle_count, xx, yy, draw_layer, particle_object, 
                                     particle_dir = random_range(20, 100), 
									 particle_speed = random_range(0.1, 0.15))
{
	for (var i = 0; i < particle_count; i++)
	{
		// var xx = random_range(x - (sprite_width / 3), x + (sprite_width / 3));
		var particle = instance_create_depth(xx, yy, draw_layer, particle_object);
		particle.direction = particle_dir;
		particle.speed = particle_speed;
	}	
}