if (!global.cam_target) 
{
	exit;
}

// based if the cam_target is the obj_player
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
	global.cam_x_min = 0;
	global.cam_x_max = room_width - global.cam_width;
	
	global.cam_y_min = 0;
	global.cam_y_max = room_height - global.cam_height;
}


// pausing the player while the camera's transition to the new level is not ready
if (cam_x_min_lerp >= (global.cam_x_min + 5) || cam_x_min_lerp <= (global.cam_x_min - 5)
    || cam_y_min_lerp >= (global.cam_y_min + 5) || cam_y_min_lerp <= (global.cam_y_min - 5))
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
	global.camx = lerp(global.camx, (global.cam_target.x - (global.cam_width/2)), camera_lerp);
	global.camy = lerp(global.camy, (global.cam_target.y - (global.cam_height/2)), camera_lerp);
	
	global.player_can_move = true;
}

// transitioning the camera's position to a new level
//motion_add(dir, speed);
cam_x_min_lerp += (global.cam_x_min - cam_x_min_lerp) * camera_swap_lerp;
cam_y_min_lerp += (global.cam_y_min - cam_y_min_lerp) * camera_swap_lerp;

cam_x_max_lerp += (global.cam_x_max - cam_x_max_lerp) * camera_swap_lerp;
cam_y_max_lerp += (global.cam_y_max - cam_y_max_lerp) * camera_swap_lerp;

/*
cam_x_min_lerp = lerp(cam_x_min_lerp, global.cam_x_min, camera_swap_lerp);
cam_y_min_lerp = lerp(cam_y_min_lerp, global.cam_y_min, camera_swap_lerp);

cam_x_max_lerp = lerp(cam_x_max_lerp, global.cam_x_max, camera_swap_lerp);
cam_y_max_lerp = lerp(cam_y_max_lerp, global.cam_y_max, camera_swap_lerp);
*/

global.camx = clamp(global.camx, cam_x_min_lerp, cam_x_max_lerp);
global.camy = clamp(global.camy, cam_y_min_lerp, cam_y_max_lerp);


// camera shake stuff
global.camx += random_range(-global.shake_remain, global.shake_remain);
// global.camy += random_range(-global.shake_remain, global.shake_remain);
global.shake_remain = max(0, 
                          (global.shake_remain - 
						  ((1/global.shake_length) * global.shake_magnitude)));

// moving camera
camera_set_view_pos(global.current_camera, global.camx, global.camy);

/*
camera_set_view_pos(global.current_camera, 
                    floor(global.camx - (VIEW_W * 0.5)), 
					floor(global.camy - (VIEW_H * 0.5)));
					*/
					
// some testing backround parallax effects
if (layer_exists(bg_1_layer_id))
{
	layer_x(bg_1_layer_id, (global.camx - (global.cam_width / 2)) / 8);
	// layer_y(bg_1_layer_id, global.camy / 4);
}

if (layer_exists(bg_2_layer_id))
{
	layer_x(bg_2_layer_id, (global.camx - (global.cam_width / 2)) / 6);
	// layer_y(bg_2_layer_id, global.camy / 2);
}
// -------------

if (layer_exists(a1))
{
	layer_x(a1, (global.camx - (global.cam_width / 2)) / 18);
	// layer_y(bg_1_layer_id, global.camy / 4);
}