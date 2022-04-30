grav = .32;
h_speed = 0;
h_speed_final = 0;
h_speed_f = 0;
max_h_speed = 2.2;

v_speed = 0;
v_speed_final = 0;
v_speed_f = 0;
max_v_speed = 5.5;

floor_accel = .9;
air_accel = .2;
default_accel = floor_accel;

slide = 1;
state = "idle";

on_floor = false;
on_left_wall = false;
on_right_wall = false;
last_wall = 0;
wall_limit = 10;
wall_timer = 0;

jump_limit = 8;
jump_timer = 0;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;

c = c_white;
x_scale = 1;
y_scale = 1;
