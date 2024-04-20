switch (async_load[? "event_type"])
{
	case "gamepad discovered":
	{
		global.gamepad_device = async_load[? "pad_index"];
		gamepad_set_axis_deadzone(global.gamepad_device, 0.2);
		gamepad_set_button_threshold(global.gamepad_device, 0.1);
	}
	break;

	case "gamepad lost":
	{
		global.gamepad_device = async_load[? "pad_index"];
	}
	break;
}