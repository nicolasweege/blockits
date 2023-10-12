if (keyboard_check_pressed(vk_f5))
{
	if (global.use_instance_deactivation)
	{
		global.use_instance_deactivation = false;
		instance_activate_all();
	}
	else
	{
		global.use_instance_deactivation = true;
	}
}



if (!global.cam_target || global.is_paused) 
{
	exit;
}

if (!instance_exists(obj_player))
{
	exit;
}


// based as if the cam_target is the obj_player
var _room_mask_collision = instance_position(global.cam_target.x, 
	                                         (global.cam_target.y - 
											 (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), 
											 obj_camera_mask);

// getting new camera's position
if (_room_mask_collision)
{
	global.cam_x_min = _room_mask_collision.x;
	global.cam_x_max = 
	((_room_mask_collision.x + (global.cam_width * _room_mask_collision.image_xscale)) 
	- global.cam_width);
	
	global.cam_y_min = _room_mask_collision.y;
	global.cam_y_max = 
	((_room_mask_collision.y + (global.cam_height * _room_mask_collision.image_yscale)) 
	- global.cam_height);
} 
else 
{
	/*
	global.cam_x_min = 0;
	global.cam_x_max = room_width - global.cam_width;
	
	global.cam_y_min = 0;
	global.cam_y_max = room_height - global.cam_height;
	*/
}

if (obj_player.player_state != obj_player.god_mode_state)
{

	// transitioning the camera's position to a new level
	//motion_add(dir, speed);
	cam_x_min_lerp += (((global.cam_x_min - cam_x_min_lerp) * camera_swap_lerp) * global.delta);
	cam_x_max_lerp += (((global.cam_x_max - cam_x_max_lerp) * camera_swap_lerp) * global.delta);
	cam_y_min_lerp += (((global.cam_y_min - cam_y_min_lerp) * camera_swap_lerp) * global.delta);
	cam_y_max_lerp += (((global.cam_y_max - cam_y_max_lerp) * camera_swap_lerp) * global.delta);
	
	/*
	cam_x_min_lerp = round(cam_x_min_lerp);
	cam_x_max_lerp = round(cam_x_max_lerp);
	cam_y_min_lerp = round(cam_y_min_lerp);
	cam_y_max_lerp = round(cam_y_max_lerp);
	*/

	// pausing the player while the camera's transition to the new level is not complete
	if (cam_x_min_lerp >= (global.cam_x_min + (5 * global.delta)) 
		|| cam_x_min_lerp <= (global.cam_x_min - (5 * global.delta))
		|| cam_y_min_lerp >= (global.cam_y_min + (5 * global.delta)) 
		|| cam_y_min_lerp <= (global.cam_y_min - (5 * global.delta)))
	{	
		if (instance_exists(obj_player))
		{
			if (obj_player.player_state != obj_player.death_state)
			{
				global.player_can_move = false;
			}
		}
	}
	else
	{
		// makes the camera follow its target
		global.camx = lerp(global.camx, (global.cam_target.x - (global.cam_width/2)), (camera_lerp * global.delta));
		global.camy = lerp(global.camy, 
				            ((global.cam_target.y - 
							(sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) 
							- (global.cam_height/2)), 
							(camera_lerp * global.delta));	
		
		global.player_can_move = true;
	}	
	
	global.camx = clamp(global.camx, cam_x_min_lerp, cam_x_max_lerp);
	global.camy = clamp(global.camy, cam_y_min_lerp, cam_y_max_lerp);

	// camera shake stuff
	if (global.screen_shake_is_enabled)
	{
		if (global.screen_shake_x_enabled)
		{
			// global.camx += irandom_range(-global.shake_remain, global.shake_remain);
			global.camx += random_range(-global.shake_remain, global.shake_remain);
		}
		if (global.screen_shake_y_enabled)
		{
			// global.camy += irandom_range(-global.shake_remain, global.shake_remain);
			global.camy += random_range(-global.shake_remain, global.shake_remain);
		}

		global.shake_remain = max(0, 
		                          (global.shake_remain - 
								  ((1/global.shake_length) * global.shake_magnitude)));
	}

	// moving camera
	camera_set_view_pos(global.current_camera, global.camx, global.camy);
	// camera_set_view_pos(global.current_camera, floor(global.camx - (global.cam_width * 0.5)), floor(global.camy - (global.cam_height * 0.5)));
}
else // we are in god mode
{
	cam_x_min_lerp += (global.cam_x_min - cam_x_min_lerp);
	cam_x_max_lerp += (global.cam_x_max - cam_x_max_lerp);
	cam_y_min_lerp += (global.cam_y_min - cam_y_min_lerp);
	cam_y_max_lerp += (global.cam_y_max - cam_y_max_lerp);
	
	global.player_can_move = true;
	global.camx = lerp(global.camx, (global.cam_target.x - (global.cam_width/2)), (camera_lerp * global.delta));
	global.camy = lerp(global.camy, (global.cam_target.y - (global.cam_height/2)), (camera_lerp * global.delta));
	
	// global.camx = clamp(global.camx, 0, room_width - global.cam_width);
	// global.camy = clamp(global.camy, 0, room_height - global.cam_height);
	
	with (obj_player)
	{
		x = clamp(x, 0, room_width);	
		y = clamp(y, 0, room_height);
	}
	
	
	camera_set_view_pos(global.current_camera, global.camx, global.camy);
	// camera_set_view_pos(global.current_camera, floor(global.camx - (global.cam_width * 0.5)), floor(global.camy - (global.cam_height * 0.5)));
}



#region some testing backround parallax effects
/*
if (layer_exists(bg_1_layer_id))
{
	// layer_x(bg_1_layer_id, (global.camx - (global.cam_width / 2)) / 8);
	layer_x(bg_1_layer_id, lerp(0, camera_get_view_x(global.current_camera), 0.1));
	// layer_y(bg_1_layer_id, lerp(0, camera_get_view_y(global.current_camera), 0.1));
}

if (layer_exists(bg_2_layer_id))
{
	// layer_x(bg_2_layer_id, (global.camx - (global.cam_width / 2)) / 6);
	layer_x(bg_2_layer_id, lerp(0, camera_get_view_x(global.current_camera), 0.2));
	// layer_y(bg_2_layer_id, lerp(0, camera_get_view_y(global.current_camera), 0.2));
}
*/
// -------------
if (layer_exists(general_bg_layer_id))
{
	layer_x(general_bg_layer_id, (global.camx * 0.7));
	layer_y(general_bg_layer_id, (global.camy * 0.7));
}


if (layer_exists(bg_1_layer_id))
{
	layer_x(bg_1_layer_id, global.camx / 6);
	layer_y(bg_1_layer_id, global.camy);
}

if (layer_exists(bg_2_layer_id))
{
	layer_x(bg_2_layer_id, global.camx / 4);
	layer_y(bg_2_layer_id, global.camy);
}

if (layer_exists(bg_3_layer_id))
{
	layer_x(bg_3_layer_id, global.camx / 2);
	layer_y(bg_3_layer_id, global.camy);
}
#endregion