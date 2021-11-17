function transition_place_sequence(type){
	if (layer_exists("Transitions")) layer_destroy("Transitions");
	var _layer = layer_create(-9999, "Transitions");
	layer_sequence_create(_layer, 0, 0, type);
}

function transition_start(room_target, type_out, type_in){
	if (!global.mid_transition){
		global.mid_transition = true;
		global.room_target = room_target;
		transition_place_sequence(type_out);
		layer_set_target_room(room_target);
		transition_place_sequence(type_in);
		layer_reset_target_room();
		return true;
	} else return false;
}