function player_landing()
{
	var temp = place_meeting(x, y + 1, DEFAULT_COLLIDER);
	
	if (temp && !on_floor)
	{
		x_scale = 1.7;
		y_scale = .3;
		audio_play_sound(PLAYER_LANDING_SOUND, 1, false);
	}
}

function update_player_collision_variables()
{	
	on_floor = place_meeting(x, y + 1, DEFAULT_COLLIDER);
	on_walls = place_meeting(x + side, y, DEFAULT_COLLIDER);
	on_left_wall = place_meeting(x - 1, y, WALL_COLLIDER);
	on_right_wall = place_meeting(x + 1, y, WALL_COLLIDER);
}

function update_player_jump_limit()
{
	if (on_floor)
		jump_timer = jump_limit;
		
	if (!on_floor && jump_timer > 0)
		jump_timer--;
}

function update_player_dash_cooldown()
{
	if (state == "dash")
		return;
		
	if (time_to_dash > 0)
		time_to_dash--;
	
	if (on_floor || on_left_wall || on_right_wall)
		dash_cooldown = 1;
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
			
	up = keyboard_check(global.input_vk_up)
			|| gamepad_button_check(global.device, global.input_gp_up);
			
	down = keyboard_check(global.input_vk_down)
			|| gamepad_button_check(global.device, global.input_gp_down);
			
	jump = keyboard_check_pressed(global.input_vk_jump)
			|| gamepad_button_check_pressed(global.device, global.input_gp_jump);
			
	jump_r = keyboard_check_released(global.input_vk_jump)
			|| gamepad_button_check_released(global.device, global.input_gp_jump);
			
	dash = keyboard_check_pressed(global.input_vk_dash)
			|| gamepad_button_check_pressed(global.device, global.input_gp_dash);

	if (right || left || down || up)
		global.is_gamepad = false;

	if (abs(gamepad_axis_value(global.device, global.input_gp_lh_analog)) > .2)
	{
		right = ceil(max(gamepad_axis_value(global.device, global.input_gp_lh_analog), 0));
		left = ceil(abs(min(gamepad_axis_value(global.device, global.input_gp_lh_analog), 0)));
		global.is_gamepad = true;
	}

	if (abs(gamepad_axis_value(global.device, global.input_gp_lv_analog)) > .2)
	{
		down = ceil(max(gamepad_axis_value(global.device, global.input_gp_lv_analog), 0));
		up = ceil(abs(min(gamepad_axis_value(global.device, global.input_gp_lv_analog), 0)));
		global.is_gamepad = true;
	}
}

function handle_player_collision()
{
	var bbox_side;
	
	#region Horizontal Collision
	if (h_speed > 0)
		bbox_side = bbox_right;
	if (h_speed <= 0)
		bbox_side = bbox_left;
	
	if (tilemap_get_at_pixel(collision_tilemap_id, bbox_side + h_speed, bbox_top) != 0 || tilemap_get_at_pixel(collision_tilemap_id, bbox_side + h_speed, bbox_bottom) != 0)
	{
		if (h_speed > 0)
			x = x - (x % 32) + 31 - (bbox_right - x);
		if (h_speed <= 0)
			x = x - (x % 32) - (bbox_left - x);
			
		h_speed = 0;
	}
	#endregion
	
	#region Vertical Collision
	if (v_speed > 0)
		bbox_side = bbox_bottom;
	if (v_speed <= 0)
		bbox_side = bbox_top;
	
	if (tilemap_get_at_pixel(collision_tilemap_id, bbox_left, bbox_side + v_speed) != 0 || tilemap_get_at_pixel(collision_tilemap_id, bbox_right, bbox_side + v_speed) != 0)
	{
		if (v_speed > 0)
			y = y - (y % 32) + 31 - (bbox_bottom - y);
		if (v_speed <= 0)
			y = y - (y % 32) - (bbox_top - y);
			
		v_speed = 0;
	}
	#endregion
}

function update_player_collision()
{
	if (place_meeting(x + h_speed, y, DEFAULT_COLLIDER))
	{
		var sign_h_speed = sign(h_speed);
		
		while (!place_meeting(x + sign_h_speed, y, DEFAULT_COLLIDER))
			x += sign_h_speed;
			
		h_speed = 0;
	}
	
	if (place_meeting(x, y + v_speed, DEFAULT_COLLIDER))
	{
		var sign_v_speed = sign(v_speed);
		
		while (!place_meeting(x, y + sign_v_speed, DEFAULT_COLLIDER))
			y += sign_v_speed;
		
		v_speed = 0;
	}	
}

function update_player_state()
{
	if (v_speed == 0
		&& h_speed <= max_h_speed
		&& h_speed >= -max_h_speed)
		state = "idle";
		
	if (state == "idle" && (abs(h_speed) > 0 || abs(v_speed) > 0 || left || right || jump))
		state = "moving";
	
	if (on_walls)
		return;
	
	if (dash && dash_cooldown > 0 && time_to_dash <= 0)
	{
		dash_direction = (left || right) ? point_direction(0, 0, right - left, 0) : point_direction(0, 0, side, 0);
		time_to_dash = default_time_to_dash;
		dash_cooldown--;
		x_scale = 1.7;
		y_scale = .3;
		screen_shake(8, 10);
		audio_play_sound(PLAYER_DASH_SOUND, 1, false);
		state = "dash";
	}
		
	if (state == "dash" && dash_timer <= 0)
	{
		h_speed = (max_h_speed * sign(h_speed)) * .5;
		v_speed = (max_v_speed * sign(v_speed)) * .5;
		dash_timer = room_speed / 4;
		state = "idle";
	}
}
