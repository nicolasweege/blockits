function get_keyboard_key_string(var_to_get_from)
{
	var key_string = "";
	
	switch (var_to_get_from)
	{
		case ord("A"): key_string = "A"; break;
		case vk_left:        key_string = "left arrow"; break;
		case vk_right:       key_string = "right arrow"; break;
		case vk_up:          key_string = "."; break;
		case vk_down:        key_string = "."; break;
		case vk_enter:       key_string = "."; break;
		// case vk_escape:   break; -- for now.. this will be a static keybind to open the menu
		case vk_space:       key_string = "."; break;
		case vk_shift	:    key_string = "."; break;
		case vk_control:     key_string = "."; break;
		case vk_alt:         key_string = "."; break;
		case vk_backspace:   key_string = "."; break;
		case vk_tab:         key_string = "."; break;
		case vk_home:        key_string = "."; break;
		case vk_end:         key_string = "."; break;
		case vk_delete:      key_string = "."; break;
		case vk_insert:      key_string = "."; break;
		case vk_pageup:      key_string = "."; break;
		case vk_pagedown:    key_string = "."; break;
		case vk_pause:       key_string = "."; break;
		case vk_printscreen: key_string = "."; break;
		case vk_f1:          key_string = "."; break;
		case vk_f2:          key_string = "."; break;
		case vk_f3:          key_string = "."; break;
		case vk_f4:          key_string = "."; break;
		case vk_f5:          key_string = "."; break;
		case vk_f6:          key_string = "."; break;
		case vk_f7:          key_string = "."; break;
		case vk_f8:          key_string = "."; break;
		case vk_f9:          key_string = "."; break;
		case vk_f10:         key_string = "."; break;
		case vk_f11:         key_string = "."; break;
		case vk_f12:         key_string = "."; break;
		case vk_numpad0:     key_string = "."; break;
		case vk_numpad1:     key_string = "."; break;
		case vk_numpad2:     key_string = "."; break;
		case vk_numpad3:     key_string = "."; break;
		case vk_numpad4:     key_string = "."; break;
		case vk_numpad5:     key_string = "."; break;
		case vk_numpad6:     key_string = "."; break;
		case vk_numpad7:     key_string = "."; break;
		case vk_numpad8:     key_string = "."; break;
		case vk_numpad9:     key_string = "."; break;
		case vk_multiply:    key_string = "."; break;
		case vk_divide:      key_string = "."; break;
		case vk_add:         key_string = "."; break;
		case vk_subtract:    key_string = "."; break;
		case vk_decimal:     key_string = "."; break;
		default: key_string = "unknown";
	}
		
	return key_string;
}