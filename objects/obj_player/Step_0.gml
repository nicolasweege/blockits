on_floor = place_meeting(x, y + 1, obj_default_collider);
on_right_wall = place_meeting(x + 1, y, obj_wall_collider);
on_left_wall = place_meeting(x - 1, y, obj_wall_collider);

if (on_floor) {
	jump_timer = jump_limit;
}

	
if (!on_floor && jump_timer > 0) {
   	jump_timer--;
}

if (on_left_wall || on_right_wall) {
	last_wall = on_left_wall ? 0 : 1;
	wall_timer = wall_limit;
}

if (!on_left_wall && !on_right_wall && wall_timer > 0) {
	wall_timer--;
}

default_accel = on_floor ? floor_accel : air_accel;

update_player_inputs();

_h_speed = (right - left) * max_h_speed;

update_player_state();
set_player_state();

if (place_meeting(x + h_speed, y, obj_default_collider)) {
	var sign_h = sign(h_speed);

	while (!place_meeting(x + sign_h, y, obj_default_collider)) {
		x += sign_h;
	}
	
	h_speed = 0;
}

x += h_speed;

if (place_meeting(x, y + v_speed, obj_default_collider)) {
	var sign_v = sign(v_speed);

	while (!place_meeting(x, y + sign_v, obj_default_collider)) {
		y += sign_v;
	}
	
	v_speed = 0;
}

y += v_speed;

move_player_camera();