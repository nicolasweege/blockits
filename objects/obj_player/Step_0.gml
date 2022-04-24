if (global.pause)
{
	exit;
}

player_landing();

update_player_collision_variables();

update_player_jump_limit();

update_player_walls_collision();

update_player_default_accel();

update_player_inputs();

_h_speed = (right - left) * max_h_speed;

update_player_state();

set_player_state();

update_player_collision();

x += h_speed;
y += v_speed;

move_camera();
