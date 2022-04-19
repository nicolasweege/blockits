switch (async_load[? "event_type"])
{
	case "gamepad discovered":
		global.device = async_load[? "pad_index"];
		gamepad_set_axis_deadzone(global.device, 0.2);
		gamepad_set_button_threshold(global.device, 0.1);
	break;
	
	case
		"gamepad lost": global.device = async_load[? "pad_index"];
	break;
}
