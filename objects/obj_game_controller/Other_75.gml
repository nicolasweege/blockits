switch(async_load[? "event_type"]){
	case "gamepad discovered":
		global.gp_slot = async_load[? "pad_index"];
		gamepad_set_axis_deadzone(global.gp_slot, 0.2);
		gamepad_set_button_threshold(global.gp_slot, 0.1);
	break;
	
	case "gamepad lost": global.gp_slot = async_load[? "pad_index"]; break;
}