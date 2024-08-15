// camera offset stuff
camera_xoffset_to_set = 0;
camera_yoffset_to_set = 0;

// layer stuff
general_bg_layer_id = layer_get_id("general_bg");
bg_1_layer_id       = layer_get_id("bg_1");
bg_2_layer_id       = layer_get_id("bg_2");
bg_3_layer_id       = layer_get_id("bg_3");

// getting layers
default_colliders_layer         = layer_get_id("default_colliders");
death_colliders_layer           = layer_get_id("death_colliders");
directs_layer                   = layer_get_id("directs");
falling_platforms_layer         = layer_get_id("falling_platforms");
jumpers_layer                   = layer_get_id("jumpers");
ropes_layer                     = layer_get_id("ropes");
timed_slabs_layer               = layer_get_id("timed_slabs");
level_changers_layer            = layer_get_id("level_changers");
foreground_scene_bloom_layer    = layer_get_id("foreground_scene_bloom");
foreground_scene_bloom_vignette = layer_get_id("foreground_scene_bloom_vignette");
// falling_death_colliders         = layer_get_id("falling_death_colliders");
// death_collider_counters         = layer_get_id("death_collider_counters");

x = global.cam_target.x;
y = global.cam_target.y;

// lidando com a camera no inicio de cada room.
global.cam_x_min = 0;
global.cam_x_max = room_width - global.cam_width;
global.cam_y_min = 0;
global.cam_y_max = room_height - global.cam_height;

cam_x_min_lerp = 0;
cam_x_max_lerp = room_width - global.cam_width;
cam_y_min_lerp = 0;
cam_y_max_lerp = room_height - global.cam_height;

room_mask_collision = instance_position(global.cam_target.x, global.cam_target.y, obj_camera_mask);
											 
global.camx = (global.cam_target.x - (global.cam_width/2));
global.camy = ((global.cam_target.y - 
(sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) - (global.cam_height/2));

if (room_mask_collision)
{
	global.cam_x_min = room_mask_collision.x;
	global.cam_x_max = 
	((room_mask_collision.x + (global.cam_width * room_mask_collision.image_xscale)) 
	- global.cam_width);
	
	global.cam_y_min = room_mask_collision.y;
	global.cam_y_max = 
	((room_mask_collision.y + (global.cam_height * room_mask_collision.image_yscale)) 
	- global.cam_height);
} 
else 
{
	// quando o player fora de uma camera_mask. Soh calculamos isso quando o player esta no death_state,
    // pra que a camera siga ele quando etiver voltando pra posicao do ultimo checkpoint.
    if (obj_player.player_state == obj_player.death_state)
    {
        global.cam_x_min = 0;
    	global.cam_x_max = room_width - global.cam_width;
    	
    	global.cam_y_min = 0;
    	global.cam_y_max = room_height - global.cam_height;
    }
}

cam_x_min_lerp = global.cam_x_min;
cam_x_max_lerp = global.cam_x_max;
cam_y_min_lerp = global.cam_y_min;
cam_y_max_lerp = global.cam_y_max;

global.camx = clamp(global.camx, cam_x_min_lerp, cam_x_max_lerp);
global.camy = clamp(global.camy, cam_y_min_lerp, cam_y_max_lerp);

camera_set_view_pos(global.current_camera, global.camx, global.camy);