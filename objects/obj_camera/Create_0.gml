room_mask_collision = 0;

// direct camera stuff
pre_direct_cam_lerp = 0.1; // 0.2
pre_direct_xto_dist = 30;  // 15
pre_direct_yto_dist = 30;  // 15

// camera offset stuff
camera_offset_lerp_speed        = 0.01;
camera_xoffset_to_set           = 0;
camera_yoffset_to_set           = 0;
camera_xoffset_default_distance = 60;
camera_yoffset_default_distance = 60;

// layer stuff
image_bg_layer_id = layer_get_id("image_background");
bg_1_layer_id     = layer_get_id("bg_1");
bg_2_layer_id     = layer_get_id("bg_2");
bg_3_layer_id     = layer_get_id("bg_3");

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

// instances_buffer            = 100;
// instances_buffer            = 150;
instances_buffer            = 200;
instances_deactivation_time = 0.05;

deactivate_instances_timer = time_source_create(time_source_game,
	                                            instances_deactivation_time,
												time_source_units_seconds,
												function()
												{
													if (global.use_instance_deactivation)
													{
														instance_deactivate_layer(default_colliders_layer);
														instance_deactivate_layer(death_colliders_layer);
														instance_deactivate_layer(directs_layer);
														instance_deactivate_layer(falling_platforms_layer);
														instance_deactivate_layer(jumpers_layer);
														instance_deactivate_layer(ropes_layer);
														instance_deactivate_layer(timed_slabs_layer);
														instance_deactivate_layer(level_changers_layer);
														instance_deactivate_layer(foreground_scene_bloom_layer);
														instance_deactivate_layer(foreground_scene_bloom_vignette);
														// instance_deactivate_layer(falling_death_colliders);
														// instance_deactivate_layer(death_collider_counters);

														var camera_left = camera_get_view_x(global.current_camera);
														var camera_top  = camera_get_view_y(global.current_camera);
														
														instance_activate_region(camera_left - instances_buffer,
														                         camera_top - instances_buffer, 
																				 instances_buffer + (global.cam_width + instances_buffer), 
																				 instances_buffer + (global.cam_height + instances_buffer),
																				 true);
													}
												}, [], -1);

time_source_start(deactivate_instances_timer);

// mouse click and drag stuff
drag_room_x              = 0;
drag_room_y              = 0;
mouse_drag_x             = 0;
mouse_drag_y             = 0;
real_mouse_x             = 0;
real_mouse_y             = 0;
can_drag_camera          = false;

// general camera stuff
original_camera_lerp     = 0.055;
current_camera_lerp      = original_camera_lerp;
camera_lerp              = current_camera_lerp;
camera_stick_range       = 65;
original_cam_stick_speed = 1;
cam_stick_speed          = original_cam_stick_speed;
new_cam_width            = VIEW_W;
new_cam_height           = VIEW_H;

global.current_camera    = view_camera[0];
global.cam_target        = obj_player;
global.cam_width         = camera_get_view_width(global.current_camera);
global.cam_height        = camera_get_view_height(global.current_camera);

original_camera_swap_lerp = 1;
camera_swap_lerp          = original_camera_swap_lerp;

// lidando com a camera no inicio do jogo.
global.cam_x_min         = 0;
global.cam_x_max         = room_width - global.cam_width;
global.cam_y_min         = 0;
global.cam_y_max         = room_height - global.cam_height;

cam_x_min_lerp           = 0;
cam_x_max_lerp           = room_width - global.cam_width;
cam_y_min_lerp           = 0;
cam_y_max_lerp           = room_height - global.cam_height;

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