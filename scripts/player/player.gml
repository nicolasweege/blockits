function player_landing()
{
	var temp = place_meeting(x, y + 1, DEFAULT_COLLIDER);
	
	if (temp && !on_floor)
	{
		x_scale = 1.5;
		y_scale = .5;
		audio_play_sound(PLAYER_LANDING_SOUND, 1, false);
	}
}

function update_player_collision_variables()
{
	on_floor = place_meeting(x, y + 1, DEFAULT_COLLIDER);
	on_right_wall = place_meeting(x + 1, y, WALL_COLLIDER);
	on_left_wall = place_meeting(x - 1, y, WALL_COLLIDER);
}

function update_player_jump_limit()
{
	if (on_floor)
		jump_timer = jump_limit;
		
	if (!on_floor && jump_timer > 0)
		jump_timer--;
}

function update_player_walls_collision()
{
	if (on_left_wall || on_right_wall)
	{
		last_wall = on_left_wall ? 0 : 1;
		wall_timer = wall_limit;
	}
	
	if (!on_left_wall && !on_right_wall && wall_timer > 0)
		wall_timer--;
}

function update_player_default_accel()
{
	default_accel = on_floor ? floor_accel : air_accel;
}

function update_player_inputs()
{
	left = keyboard_check(global.input_vk_left)
			|| gamepad_button_check(global.device, global.input_gp_left);
			
	right = keyboard_check(global.input_vk_right)
			|| gamepad_button_check(global.device, global.input_gp_right);
			
	jump = keyboard_check_pressed(global.input_vk_jump)
			|| gamepad_button_check_pressed(global.device, global.input_gp_jump);
			
	jump_r = keyboard_check_released(global.input_vk_jump)
			|| gamepad_button_check_released(global.device, global.input_gp_jump);

	if (right || left)
		global.is_gamepad = false;

	if (abs(gamepad_axis_value(global.device, DEFAULT_INPUT_GP_AXISLH)) > .2)
	{
		right = ceil(max(gamepad_axis_value(global.device, DEFAULT_INPUT_GP_AXISLH), 0));
		left = ceil(abs(min(gamepad_axis_value(global.device, DEFAULT_INPUT_GP_AXISLH), 0)));
		global.is_gamepad = true;
	}
	
	/*
	if (abs(gamepad_axis_value(global.device, DEFAULT_INPUT_GP_AXISLV)) > .2)
	{
		down = ceil(max(gamepad_axis_value(global.device, DEFAULT_INPUT_GP_AXISLV), 0));
		up = ceil(abs(min(gamepad_axis_value(global.device, DEFAULT_INPUT_GP_AXISLV), 0)));
		global.is_gamepad = true;
	}
	*/
}

function update_player_collision()
{
	if (place_meeting(x + h_speed_final, y, DEFAULT_COLLIDER))
	{
		var sign_h = sign(h_speed_final);
	
		while (!place_meeting(x + sign_h, y, DEFAULT_COLLIDER))
			x += sign_h;
		
		h_speed_final = 0;
		h_speed = 0;
	}
	
	x += h_speed_final;

	if (place_meeting(x, y + v_speed_final, DEFAULT_COLLIDER))
	{
		var sign_v = sign(v_speed_final);
	
		while (!place_meeting(x, y + sign_v, DEFAULT_COLLIDER))
			y += sign_v;
		
		v_speed_final = 0;
		v_speed = 0;
	}

	y += v_speed_final;
}

function update_player_state()
{
	if (h_speed == 0 && v_speed == 0)
		state = "idle";
		
	if (abs(h_speed) > 0 || abs(v_speed) > 0 || left || right || jump)
		state = "moving";
	
	if (place_meeting(x, y, obj_death_collider))
		state = "death";
}

function handle_player_color_feedback()
{
	switch (global.colliders_controller.show_collider)
	{
		case 1:
			global.player.c = PLATFORM_COLLIDER_COLOR;
		break;
	
		case 2:
			global.player.c = WALL_COLLIDER_COLOR;
		break;
	}
}
