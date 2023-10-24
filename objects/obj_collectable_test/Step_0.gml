if (global.is_paused
    && obj_player.player_state == obj_player.death_state)
{
	exit;
}

if (obj_to_follow_id != noone)
{
	x = lerp(x, obj_to_follow_id.x + x_distance, horizontal_stick_speed);
	y = lerp(y, obj_to_follow_id.y + y_distance, vertical_stick_speed);
}

// when the player IS in pre_direct_state
if (obj_player.player_state == obj_player.pre_direct_state)
{
	update_player_inputs();
	general_dist_lerp_speed = 0.7;
	
	if (left && !right)
	{
		xdir = -1;
	}
	else if (right && !left)
	{
		xdir = 1;
	}
	
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
	
	// choosing player horizintal offpoint to stick
	if (obj_player.side_to_look == 1)
	{
		x_distance = lerp(x_distance, -original_x_distance, general_dist_lerp_speed);
	}
	else
	{
		x_distance = lerp(x_distance, original_x_distance, general_dist_lerp_speed);
	}

	// choosing player vertical offpoint to stick
	if (sign(obj_player.v_speed) == 1)
	{
		y_distance = lerp(y_distance, -original_y_distance, general_dist_lerp_speed);
	}
	else if (sign(obj_player.v_speed) == -1)
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