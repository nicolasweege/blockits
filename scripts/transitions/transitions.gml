function start_transition(room_target){
	global.room_target = room_target;
	if (!instance_exists(obj_transition)){
		var transition = instance_create_depth(0, 0, -9999, obj_transition);
		transition.spd = .05;
		transition._color = c_black;
	}
}