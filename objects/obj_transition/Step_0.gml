global.player_can_move = false;

alpha += room_changed ? -.03 : .03;

if (room_changed && alpha == 0){
	global.player_can_move = true;
	instance_destroy();
}

if (alpha >= 1) room_goto(global.room_target);