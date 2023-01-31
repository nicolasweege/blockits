function update_player_inputs() 
{
	left = keyboard_check(ord("A"))
			|| keyboard_check(vk_left)
			|| gamepad_button_check(global.device, gp_padl);
			
	right = keyboard_check(ord("D"))
			|| keyboard_check(vk_right)
			|| gamepad_button_check(global.device, gp_padr);
			
	jump = keyboard_check_pressed(ord("K"))
			|| keyboard_check_pressed(ord("W"))
			|| keyboard_check_pressed(vk_up)
			|| keyboard_check_pressed(vk_space)
			|| gamepad_button_check_pressed(global.device, gp_padu)
			|| gamepad_button_check_pressed(global.device, gp_face1)
			|| gamepad_button_check_pressed(global.device, gp_face2)
			|| gamepad_button_check_pressed(global.device, gp_face3)
			|| gamepad_button_check_pressed(global.device, gp_face4);
			
	jump_r = keyboard_check_released(ord("K"))
			|| keyboard_check_released(ord("W"))
			|| keyboard_check_released(vk_up)
			|| keyboard_check_released(vk_space)
			|| gamepad_button_check_released(global.device, gp_padu)
			|| gamepad_button_check_released(global.device, gp_face1)
			|| gamepad_button_check_released(global.device, gp_face2)
			|| gamepad_button_check_released(global.device, gp_face3)
			|| gamepad_button_check_released(global.device, gp_face4);

	if (abs(gamepad_axis_value(global.device, gp_axislh)) > .5)
	{
		right = ceil(max(gamepad_axis_value(global.device, gp_axislh), 0));
		left = ceil(abs(min(gamepad_axis_value(global.device, gp_axislh), 0)));
	}
	
	/*
	if (abs(gamepad_axis_value(global.device, gp_axislv)) > .2)
	{
		down = ceil(max(gamepad_axis_value(global.device, gp_axislv), 0));
		up = ceil(abs(min(gamepad_axis_value(global.device, gp_axislv), 0)));
	}
	*/
}

function create_player_death_particle(dir, is_last_par)
{
	var particle = instance_create_depth(x, y, depth, obj_player_death_par);
	particle.speed = .5;
	particle.direction = dir;
	particle.image_blend = DEATH_COLLIDER_COLOR;
	particle.x_to = global.checkpoint_x;
	particle.y_to = global.checkpoint_y;
	
	if (is_last_par)
	{
		particle.is_last_par = true;
	}
	
	global.cam_target = particle;
}