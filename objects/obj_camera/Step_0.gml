if (!global.cam_target) 
{
	exit;
}

var _room_mask_collision = instance_position(global.cam_target.x, 
                                             global.cam_target.y, 
											 obj_camera_mask);

global.camx = lerp(global.camx, (global.cam_target.x - (global.cam_width/2)), camera_lerp);
global.camy = lerp(global.camy, (global.cam_target.y - (global.cam_height/2)), camera_lerp);

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

global.camx = clamp(global.camx, cam_x_min_lerp, cam_x_max_lerp);
global.camy = clamp(global.camy, cam_y_min_lerp, cam_y_max_lerp);

cam_x_min_lerp = lerp(cam_x_min_lerp, global.cam_x_min, 0.3);
cam_x_max_lerp = lerp(cam_x_max_lerp, global.cam_x_max, 0.3);
cam_y_min_lerp = lerp(cam_y_min_lerp, global.cam_y_min, 0.3);
cam_y_max_lerp = lerp(cam_y_max_lerp, global.cam_y_max, 0.3);

// camera shake stuff
global.camx += random_range(-global.shake_remain, global.shake_remain);
global.camy += random_range(-global.shake_remain, global.shake_remain);
global.shake_remain = max(0, 
                          (global.shake_remain - 
						  ((1/global.shake_length) * global.shake_magnitude)));

// moving camera
camera_set_view_pos(global.current_camera, global.camx, global.camy);