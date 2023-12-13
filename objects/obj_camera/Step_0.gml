camera_lerp = lerp(camera_lerp, current_camera_lerp, cam_stick_speed);
x = lerp(x, global.cam_target.x, camera_lerp);
y = lerp(y, (global.cam_target.y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), camera_lerp);

if (distance_to_object(obj_player) > camera_stick_range)
{	
	current_camera_lerp = 0.1;
	cam_stick_speed = 0.0005;
}
else
{
	current_camera_lerp = original_camera_lerp;
	cam_stick_speed = original_cam_stick_speed;
}

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



if (!global.cam_target 
    || global.is_paused)
{
	exit;
}


// based as if the cam_target is the obj_player
var player_h_speed = sign(obj_player.h_speed);
var player_v_speed = sign(obj_player.v_speed);
var player_right_ypos = (global.cam_target.y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2));
var xx = global.cam_target.x;
var yy = (global.cam_target.y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2));
var xbuffer = 2;
var ybuffer = 3;

if (player_h_speed == 1)
{
	xx = (global.cam_target.x + (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2)) - xbuffer;
}
else
{
	xx = (global.cam_target.x - (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2)) + xbuffer;
}

if (player_v_speed == 1)
{
	yy = (player_right_ypos + (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) - ybuffer;
}
else
{
	yy = (player_right_ypos - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) + ybuffer;
}

var _room_mask_collision = instance_position(xx, yy, obj_camera_mask);



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
	/*
	cam_x_min_lerp += (((global.cam_x_min - cam_x_min_lerp) * camera_swap_lerp) * global.delta);
	cam_x_max_lerp += (((global.cam_x_max - cam_x_max_lerp) * camera_swap_lerp) * global.delta);
	cam_y_min_lerp += (((global.cam_y_min - cam_y_min_lerp) * camera_swap_lerp) * global.delta);
	cam_y_max_lerp += (((global.cam_y_max - cam_y_max_lerp) * camera_swap_lerp) * global.delta);
	*/
	
	cam_x_min_lerp += (((global.cam_x_min - cam_x_min_lerp) * camera_swap_lerp));
	cam_x_max_lerp += (((global.cam_x_max - cam_x_max_lerp) * camera_swap_lerp));
	cam_y_min_lerp += (((global.cam_y_min - cam_y_min_lerp) * camera_swap_lerp));
	cam_y_max_lerp += (((global.cam_y_max - cam_y_max_lerp) * camera_swap_lerp));

	// pausing the player while the camera's transition to the new level is not complete
	/*
	if (cam_x_min_lerp >= (global.cam_x_min + (5 * global.delta)) 
		|| cam_x_min_lerp <= (global.cam_x_min - (5 * global.delta))
		|| cam_y_min_lerp >= (global.cam_y_min + (5 * global.delta)) 
		|| cam_y_min_lerp <= (global.cam_y_min - (5 * global.delta)))
		*/
	
	if (cam_x_min_lerp >= (global.cam_x_min + 5) 
		|| cam_x_min_lerp <= (global.cam_x_min - 5)
		|| cam_y_min_lerp >= (global.cam_y_min + 5) 
		|| cam_y_min_lerp <= (global.cam_y_min - 5))
	{	
		with (obj_player)
		{
			if (player_state != death_state)
			{
				global.player_can_move = false;
			}
			
			if (on_floor)
			{
				if (player_h_speed == 1)
				{
					h_speed = 7;
				}
				else
				{
					h_speed = -7;
				}
			}
			else
			{	
				if (player_v_speed == -1)
				{
					v_speed = -4;
				}	
			}
		}
	}
	else
	{
		// makes the camera follow its target
		// global.camx = lerp(global.camx, (global.cam_target.x - (global.cam_width/2)), (camera_lerp * global.delta));
		global.camx = lerp(global.camx, (global.cam_target.x - (global.cam_width/2)), camera_lerp);
		/*
		global.camy = lerp(global.camy, 
				            ((global.cam_target.y - 
							(sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) 
							- (global.cam_height/2)), 
							(camera_lerp * global.delta));
							*/
		global.camy = lerp(global.camy, 
				            ((global.cam_target.y - 
							(sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) 
							- (global.cam_height/2)), 
							camera_lerp);
		
		global.player_can_move = true;
	}
	
	// direct camera stuff
	if (obj_player.player_state == obj_player.pre_direct_state)
	{
		update_player_inputs();
		
		// global.camx = lerp(global.camx, global.camx + ((right - left) * 15), (0.2 * global.delta));
		global.camx = lerp(global.camx, global.camx + ((right - left) * 15), 0.2);
		// global.camy = lerp(global.camy, global.camy + ((down - up) * 15), (0.2 * global.delta));
		global.camy = lerp(global.camy, global.camy + ((down - up) * 15), 0.2);
	}
	
	// clamping the camera
	global.camx = clamp(global.camx, cam_x_min_lerp, cam_x_max_lerp);
	global.camy = clamp(global.camy, cam_y_min_lerp, cam_y_max_lerp);

	// camera shake stuff
	if (global.screen_shake_is_enabled
	    && global.shake_remain != 0)
	{
		if (global.screen_shake_x_enabled)
		{
			// global.camx += irandom_range(-global.shake_remain, global.shake_remain);
			// global.camx += random_range(-global.shake_remain, global.shake_remain);
			global.camx += sin(global.shake_remain * 3);
		}
		if (global.screen_shake_y_enabled)
		{
			// global.camy += irandom_range(-global.shake_remain, global.shake_remain);
			// global.camy += random_range(-global.shake_remain, global.shake_remain);
			global.camy += sin(global.shake_remain * 3);
		}

		global.shake_remain = max(0, 
		                          (global.shake_remain - 
								  ((1/global.shake_length) * global.shake_magnitude)));
	}

	// moving camera
	global.camx -= global.camx mod 0.01;
	global.camy -= global.camy mod 0.01;
	camera_set_view_pos(global.current_camera, global.camx, global.camy);
}
else // we are in god mode
{
	cam_x_min_lerp += (global.cam_x_min - cam_x_min_lerp);
	cam_x_max_lerp += (global.cam_x_max - cam_x_max_lerp);
	cam_y_min_lerp += (global.cam_y_min - cam_y_min_lerp);
	cam_y_max_lerp += (global.cam_y_max - cam_y_max_lerp);
	
	global.player_can_move = true;
	// global.camx = lerp(global.camx, (global.cam_target.x - (global.cam_width/2)), (camera_lerp * global.delta));
	global.camx = lerp(global.camx, (global.cam_target.x - (global.cam_width/2)), camera_lerp);
	// global.camy = lerp(global.camy, (global.cam_target.y - (global.cam_height/2)), (camera_lerp * global.delta));
	global.camy = lerp(global.camy, (global.cam_target.y - (global.cam_height/2)), camera_lerp);
	
	// global.camx = clamp(global.camx, 0, room_width - global.cam_width);
	// global.camy = clamp(global.camy, 0, room_height - global.cam_height);
	
	with (obj_player)
	{
		x = clamp(x, 0, room_width);	
		y = clamp(y, 0, room_height);
	}
	
	global.camx -= global.camx mod 0.01;
	global.camy -= global.camy mod 0.01;
	camera_set_view_pos(global.current_camera, global.camx, global.camy);
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