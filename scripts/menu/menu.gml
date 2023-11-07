function change_keyboard_keybind(_keybind_to_change)
{
	var vk_last = keyboard_lastkey;
	if (vk_last != global.PLAYER_down_key 
		&& vk_last != global.PLAYER_left_key 
		&& vk_last != global.PLAYER_right_key
		&& vk_last != global.PLAYER_jump_key
		&& vk_last != global.PLAYER_dash_key
		&& vk_last != global.MENU_select_key
		&& vk_last != global.MENU_exit_key
		&& vk_last != global.MENU_pause_key)
	{
		_keybind_to_change = vk_last;
		save_game_options_data();
		audio_play_sound(snd_click, 1, 0);
		keybind_to_change = PLAYER_keybinds.none;
		change_vk_keybind = false;
	}
}

function get_keyboard_key_string(var_to_get_from)
{
	var key_string = "";
	
	switch (var_to_get_from)
	{
		case ord("Q"):		 key_string = "Q"; break;
		case ord("W"):		 key_string = "W"; break;
		case ord("E"):		 key_string = "E"; break;
		case ord("R"):		 key_string = "R"; break;
		case ord("T"):		 key_string = "T"; break;
		case ord("Y"):		 key_string = "Y"; break;
		case ord("U"):		 key_string = "U"; break;
		case ord("I"):		 key_string = "I"; break;
		case ord("O"):		 key_string = "O"; break;
		case ord("P"):		 key_string = "P"; break;
		case ord("A"):		 key_string = "A"; break;
		case ord("S"):		 key_string = "S"; break;
		case ord("D"):		 key_string = "D"; break;
		case ord("F"):		 key_string = "F"; break;
		case ord("G"):		 key_string = "G"; break;
		case ord("H"):		 key_string = "H"; break;
		case ord("J"):		 key_string = "J"; break;
		case ord("K"):		 key_string = "K"; break;
		case ord("L"):		 key_string = "L"; break;
		case ord("Ç"):		 key_string = "Ç"; break;
		case ord("Z"):		 key_string = "Z"; break;
		case ord("X"):		 key_string = "X"; break;
		case ord("C"):		 key_string = "C"; break;
		case ord("V"):		 key_string = "V"; break;
		case ord("B"):		 key_string = "B"; break;
		case ord("N"):		 key_string = "N"; break;
		case ord("M"):		 key_string = "M"; break;
		case vk_left:        key_string = "left arrow"; break;
		case vk_right:       key_string = "right arrow"; break;
		case vk_up:          key_string = "up arrow"; break;
		case vk_down:        key_string = "down arrow"; break;
		case vk_enter:       key_string = "enter"; break;
		case vk_escape:      key_string = "escape"; break;
		case vk_space:       key_string = "space"; break;
		case vk_shift:       key_string = "shift"; break;
		case vk_rcontrol:    key_string = " right control"; break;
		case vk_lcontrol:    key_string = "left control"; break;
		case vk_alt:         key_string = "alt"; break;
		case vk_backspace:   key_string = "backspace"; break;
		case vk_tab:         key_string = "tab"; break;
		case vk_home:        key_string = "home"; break;
		case vk_end:         key_string = "end"; break;
		case vk_delete:      key_string = "delete"; break;
		case vk_insert:      key_string = "insert"; break;
		case vk_pageup:      key_string = "pageup"; break;
		case vk_pagedown:    key_string = "pagedown"; break;
		case vk_pause:       key_string = "pause"; break;
		case vk_printscreen: key_string = "printscreen"; break;
		case vk_f1:          key_string = "f1"; break;
		case vk_f2:          key_string = "f2"; break;
		case vk_f3:          key_string = "f3"; break;
		case vk_f4:          key_string = "f4"; break;
		case vk_f5:          key_string = "f5"; break;
		case vk_f6:          key_string = "f6"; break;
		case vk_f7:          key_string = "f7"; break;
		case vk_f8:          key_string = "f8"; break;
		case vk_f9:          key_string = "f9"; break;
		case vk_f10:         key_string = "f10"; break;
		case vk_f11:         key_string = "f11"; break;
		case vk_f12:         key_string = "f12"; break;
		case vk_numpad0:     key_string = "0"; break;
		case vk_numpad1:     key_string = "1"; break;
		case vk_numpad2:     key_string = "2"; break;
		case vk_numpad3:     key_string = "3"; break;
		case vk_numpad4:     key_string = "4"; break;
		case vk_numpad5:     key_string = "5"; break;
		case vk_numpad6:     key_string = "6"; break;
		case vk_numpad7:     key_string = "7"; break;
		case vk_numpad8:     key_string = "8"; break;
		case vk_numpad9:     key_string = "9"; break;
		case vk_multiply:    key_string = "multiply"; break;
		case vk_divide:      key_string = "divide"; break;
		case vk_add:         key_string = "add"; break;
		case vk_subtract:    key_string = "subtract"; break;
		case vk_decimal:     key_string = "decimal"; break;
		default:             key_string = "unknown";
	}
		
	return key_string;
}