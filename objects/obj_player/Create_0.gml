grav				= .8;
h_speed				= 0;
v_speed				= 0;
max_hspeed			= 6;
max_vspeed			= 18;
floor_accel			= .4;
air_accel			= .2;
default_accel		= floor_accel;
slide				= 2;
state				= "idle";
trail_time_count	= 5;
trail_create_timer	= trail_time_count;
on_floor			= false;
on_left_wall		= false;
on_right_wall		= false;
last_wall			= 0;
jump_limit			= 8;
jump_timer			= 0;
wall_limit			= 10;
wall_timer			= 0;
dash_timer			= room_speed / 4;
dash_direction		= 0;
dash_speed			= 16;
dash_cooldown		= 1;
x_scale				= 1;
y_scale				= 1;
side				= 1;
controller			= false;
landing_sound		= snd_landing;
jump_sound			= snd_jump;
wall_jump_sound		= snd_wall_jump;
foot_steps_sound	= snd_foot_steps;
dash_sound			= snd_dash;
wall_slide_sound	= snd_wall_slide;

if (!instance_exists(obj_camera)){
	var camera = instance_create_layer(0, 0, "Camera", obj_camera);
	camera.following_obj = id;
}

if (!instance_exists(obj_game_controller)) instance_create_layer(0, 0, "Controllers", obj_game_controller);

if (!instance_exists(obj_debug_controller)) instance_create_layer(0, 0, "Controllers", obj_debug_controller);

if (!instance_exists(obj_pause_menu)) instance_create_layer(0, 0, "Controllers", obj_pause_menu);