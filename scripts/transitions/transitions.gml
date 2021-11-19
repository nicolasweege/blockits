function start_transition(room_target){
	global.room_target = room_target;
	instance_create_layer(0, 0, "Controllers", obj_transition);
}