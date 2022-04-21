if (global.pause || !global.player_can_move)
	exit;

player_landing();

update_player_collision_variables();

update_player_jump_limit();

update_player_dash_cooldown();

update_player_walls_collision();

update_player_default_accel();

update_player_inputs();

_h_speed = (right - left) * max_h_speed;

update_player_state();

set_player_state();
	
x_scale = lerp(x_scale, 1, .10);
y_scale = lerp(y_scale, 1, .10);

update_player_collision();

var on_changing_room = place_meeting(x, y, CHANGE_ROOM_COLLIDER);

x += !on_changing_room ? h_speed : CHANGE_ROOM_COLLIDER.x;
y += !on_changing_room ? v_speed : CHANGE_ROOM_COLLIDER.y;