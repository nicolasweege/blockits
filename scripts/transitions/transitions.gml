function create_transition_layer(type){
	if (layer_exists("Transitions")) layer_destroy("Transitions");
	var _layer = layer_create(-9999, "Transitions");
	layer_sequence_create(_layer, 0, 0, type);
}

function start_transition(room_target, type_out, type_in){
	if (!global.mid_transition){
		global.mid_transition = true;
		global.room_target = room_target;
		create_transition_layer(type_out);
		layer_set_target_room(room_target);
		create_transition_layer(type_in);
		layer_reset_target_room();
		return true;
	} else return false;
}

function change_room(){
	room_goto(global.room_target);
}

function destroy_transition_layer(){
	layer_sequence_destroy(self.elementID);
	global.mid_transition = false;
}