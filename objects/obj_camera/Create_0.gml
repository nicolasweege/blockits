bg_1_layer_id = layer_get_id("bg_1");
bg_2_layer_id = layer_get_id("bg_2");
bg_3_layer_id = layer_get_id("bg_3");
// ------------------

// player direct state stuff
direct_camx_lookat = 0;
direct_camy_lookat = 0;

original_camera_lerp = 0.06;
camera_lerp = original_camera_lerp;
// camera_swap_lerp = 0.12;
camera_swap_lerp = 0.11;

global.current_camera = view_camera[0];
global.cam_target = obj_player;
global.cam_width = camera_get_view_width(global.current_camera);
global.cam_height = camera_get_view_height(global.current_camera);

global.cam_x_min = 0;
global.cam_x_max = room_width - global.cam_width;
global.cam_y_min = 0;
global.cam_y_max = room_height - global.cam_height;

cam_x_min_lerp = 0;
cam_x_max_lerp = room_width - global.cam_width;
cam_y_min_lerp = 0;
cam_y_max_lerp = room_height - global.cam_height;

var _room_mask_collision = instance_position(global.cam_target.x, 
                                             global.cam_target.y, 
											 obj_camera_mask);
											 
global.camx = (global.cam_target.x - (global.cam_width/2));
global.camy = (global.cam_target.y - (global.cam_height/2));
											 
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

cam_x_min_lerp = global.cam_x_min;
cam_x_max_lerp = global.cam_x_max;
cam_y_min_lerp = global.cam_y_min;
cam_y_max_lerp = global.cam_y_max;

global.camx = clamp(global.camx, cam_x_min_lerp, cam_x_max_lerp);
global.camy = clamp(global.camy, cam_y_min_lerp, cam_y_max_lerp);

// move camera to the player's position
camera_set_view_pos(global.current_camera, global.camx, global.camy);