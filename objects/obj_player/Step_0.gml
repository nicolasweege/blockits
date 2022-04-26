if (global.pause)
	exit;

player_landing();

on_floor = place_meeting(x, y + 1, DEFAULT_COLLIDER);
on_right_wall = place_meeting(x + 1, y, WALL_COLLIDER);
on_left_wall = place_meeting(x - 1, y, WALL_COLLIDER);

update_player_jump_limit();

update_player_walls_collision();

update_player_default_accel();

update_player_inputs();

_h_speed = (right - left) * max_h_speed;

update_player_state();

set_player_state();

h_speed_final = h_speed + h_speed_f;
h_speed_f = h_speed_final - floor(abs(h_speed_final)) * sign(h_speed_final);
h_speed_final -= h_speed_f;

v_speed_final = v_speed + v_speed_f;
v_speed_f = v_speed_final - floor(abs(v_speed_final)) * sign(v_speed_final);
v_speed_final -= v_speed_f;

update_player_collision();

move_camera();
