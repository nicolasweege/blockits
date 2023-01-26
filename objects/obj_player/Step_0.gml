on_floor = place_meeting(x, y + 1, obj_default_collider);
on_right_wall = place_meeting(x + 1, y, obj_wall_collider);
on_left_wall = place_meeting(x - 1, y, obj_wall_collider);

update_player_inputs();

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

_h_speed = (right - left) * max_h_speed;

set_player_state();
update_player_state();

// horizontal collision
repeat (abs(h_speed)) {
	var sign_h_speed = sign(h_speed);
	
	if (place_meeting(x + sign_h_speed, y, obj_default_collider) && 
		!place_meeting(x + sign_h_speed, y - 1, obj_default_collider)) { y--; }
		
	if (!place_meeting(x + sign_h_speed, y, obj_default_collider) && 
		!place_meeting(x + sign_h_speed, y + 1, obj_default_collider) &&
		place_meeting(x + sign_h_speed, y + 2, obj_default_collider)) { y++; }
	
	if (place_meeting(x + sign_h_speed, y, obj_default_collider)) {
		h_speed = 0;
		break;
	} else { x += sign_h_speed; }
}

// vertical collision
repeat (abs(v_speed)) {
	var sign_v_speed = sign(v_speed);
	
	if (place_meeting(x, y + sign_v_speed, obj_default_collider)) {
		v_speed = 0;
		break;
	} else { y += sign_v_speed; }
}