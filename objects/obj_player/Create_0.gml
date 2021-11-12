grav = .8;
h_speed = 0;
player_vertical_speed = 0;
max_player_horizontal_speed = 6;
max_player_vertical_speed = 18;
player_floor_accel = .4;
player_air_accel = .2;
player_default_accel = player_floor_accel;
slide = 2;
player_state = "idle";
player_trail_time_to_count = 5;
player_trail_timer_to_create = player_trail_time_to_count;

on_floor = false;
on_left_wall = false;
on_right_wall = false;
last_wall = 0;

player_jump_limit = 8;
player_jump_timer = 0;
wall_limit = 10;
wall_timer = 0;

player_dash_timer = room_speed / 4;
player_dash_direction = 0;
player_dash_speed = 16;
player_dash_cooldown = 1;

x_scale = 1;
y_scale = 1;
side = 1;

landing_sound = snd_landing;
jump_sound = snd_jump;
wall_jump_sound = snd_wall_jump;
foot_steps_sound = snd_foot_steps;
dash_sound = snd_dash;
wall_slide_sound = snd_wall_slide;

controller = false;

if (!instance_exists(obj_camera)){
	var camera = instance_create_layer(0, 0, "Camera", obj_camera);
	camera.following_object = id;
}

if (!instance_exists(obj_game_controller)) instance_create_layer(0, 0, "Controllers", obj_game_controller);

if (!instance_exists(obj_inputs_controller)) instance_create_layer(0, 0, "Controllers", obj_inputs_controller);

if (!instance_exists(obj_debug_controller)) instance_create_layer(0, 0, "Controllers", obj_debug_controller);

if (!instance_exists(obj_menu)) instance_create_layer(0, 0, "Controllers", obj_menu);