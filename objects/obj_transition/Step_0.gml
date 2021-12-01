if (!room_changed){
	alpha += spd;
	if (alpha >= 1){
		room_goto(global.room_target);
		obj_player.h_speed = 0;
		room_changed = true;
		alarm[0] = room_speed/3;
	}
}

if (room_changed && can_fade_out){
	alpha -= spd;
	if (alpha <= 0){
		global.player_can_move = true;
		instance_destroy();
	}
}