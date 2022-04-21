grav = .8;

h_speed = 0;
v_speed = 0;
max_h_speed = 6;
max_v_speed = 18;

floor_accel = .8;
air_accel = .2;
default_accel = floor_accel;

slide = 2;
state = "idle";

on_floor = false;
on_left_wall = false;
on_right_wall = false;
last_wall = 0;
wall_limit = 10;
wall_timer = 0;

jump_limit = 8;
jump_timer = 0;

dash_timer = room_speed / 4;
dash_direction = 0;
dash_speed = 16;
dash_cooldown = 1;
default_time_to_dash = room_speed / 6;
time_to_dash = default_time_to_dash;

x_scale = 1;
y_scale = 1;
side = 1;
