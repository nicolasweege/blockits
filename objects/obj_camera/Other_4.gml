// layer stuff
general_bg_layer_id = layer_get_id("general_bg");

bg_1_layer_id = layer_get_id("bg_1");
bg_2_layer_id = layer_get_id("bg_2");
bg_3_layer_id = layer_get_id("bg_3");
// ------------------

// getting layers
default_colliders_layer = layer_get_id("default_colliders");
death_colliders_layer = layer_get_id("death_colliders");
directs_layer = layer_get_id("directs");
falling_platforms_layer = layer_get_id("falling_platforms");
jumpers_layer = layer_get_id("jumpers");
ropes_layer = layer_get_id("ropes");
timed_slabs_layer = layer_get_id("timed_slabs");
water_layer = layer_get_id("water");


x = obj_player.x;
y = obj_player.y;


// placing the camera

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