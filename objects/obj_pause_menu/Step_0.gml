if (!global.pause){ exit; }

var _ds_grid = menu_pages_list[page];
var _ds_height = ds_grid_height(_ds_grid);

var _input_vk_select_p, _input_gp_select_p, _input_vk_rl_p, _input_gp_rl_p, _input_vk_du_p, _input_gp_du_p, _input_axis_lh, _input_axis_lv;
_input_vk_select_p	= keyboard_check_pressed(global.input_vk_select);
_input_gp_select_p	= gamepad_button_check_pressed(global.gp_slot, global.input_gp_select);
_input_vk_rl_p		= keyboard_check_pressed(global.input_vk_right) - keyboard_check_pressed(global.input_vk_left);
_input_gp_rl_p		= gamepad_button_check_pressed(global.gp_slot, global.input_gp_right) - gamepad_button_check_pressed(global.gp_slot, global.input_gp_left);
_input_vk_du_p		= keyboard_check_pressed(global.input_vk_down) - keyboard_check_pressed(global.input_vk_up);
_input_gp_du_p		= gamepad_button_check_pressed(global.gp_slot, global.input_gp_down) - gamepad_button_check_pressed(global.gp_slot, global.input_gp_up);
_input_axis_lh		= gamepad_axis_value(global.gp_slot, global.input_gp_lh_analog);
_input_axis_lv		= gamepad_axis_value(global.gp_slot, global.input_gp_lv_analog);

var _change_option_h = 0; var _value = 0;
if (_input_vk_rl_p != 0)			{ _change_option_h = _input_vk_rl_p; }
if (_input_gp_rl_p != 0)			{ _change_option_h = _input_gp_rl_p; }
if (_input_axis_lh > 0 && reset_lh)	{ _change_option_h = 1; _value = 1; reset_lh = false; }
if (_input_axis_lh < 0 && reset_lh)	{ _change_option_h = -1; _value = -1; reset_lh = false; }
if (_input_axis_lh == 0)			{ reset_lh = true; }

var _change_option_v = 0;
if (_input_vk_du_p != 0)			{ _change_option_v = _input_vk_du_p; }
if (_input_gp_du_p != 0)			{ _change_option_v = _input_gp_du_p; }
if (_input_axis_lv > 0 && reset_lv)	{ _change_option_v = 1; reset_lv = false; }
if (_input_axis_lv < 0 && reset_lv)	{ _change_option_v = -1; reset_lv = false; }
if (_input_axis_lv == 0)			{ reset_lv = true; }

switch(menu_pages_list[page]){
	case 2:
		if (_input_vk_select_p || _input_gp_select_p){
			if (menu_option[page] != 5){
				if (menu_option[page] == 4){ audio_play_sound(_snd_select, 1, false); }
				else{ inputting = !inputting; audio_play_sound(_snd_click, 1, false); }
			}
		}
		if (draw_redefined_inputs){
			_ds_grid[# 3, 0] = ord("W");
			_ds_grid[# 3, 1] = ord("A");
			_ds_grid[# 3, 2] = ord("S");
			_ds_grid[# 3, 3] = ord("D");
			_ds_grid[# 3, 4] = vk_shift;
			variable_global_set(_ds_grid[# 2, 0], ord("W"));
			variable_global_set(_ds_grid[# 2, 1], ord("A"));
			variable_global_set(_ds_grid[# 2, 2], ord("S"));
			variable_global_set(_ds_grid[# 2, 3], ord("D"));
			variable_global_set(_ds_grid[# 2, 4], vk_shift);
			draw_redefined_inputs = false;
		}
	break;
	
	case 3:
		if (_input_vk_select_p || _input_gp_select_p){
			if (menu_option[page] != 5){
				if (menu_option[page] == 4){ audio_play_sound(_snd_select, 1, false); }
				else{ inputting = !inputting; audio_play_sound(_snd_click, 1, false); }
			}
		}
		if (draw_redefined_inputs){
			_ds_grid[# 3, 0] = gp_padu;
			_ds_grid[# 3, 1] = gp_padl;
			_ds_grid[# 3, 2] = gp_padd;
			_ds_grid[# 3, 3] = gp_padr;
			_ds_grid[# 3, 4] = gp_shoulderr;
			variable_global_set(_ds_grid[# 2, 0], gp_padu);
			variable_global_set(_ds_grid[# 2, 1], gp_padl);
			variable_global_set(_ds_grid[# 2, 2], gp_padd);
			variable_global_set(_ds_grid[# 2, 3], gp_padr);
			variable_global_set(_ds_grid[# 2, 4], gp_shoulderr);
			draw_redefined_inputs = false;
		}
	break;
	
	case 4:
		if (_input_vk_rl_p != 0)			{ _change_option_h = _input_vk_rl_p; }
		if (_input_gp_rl_p != 0)			{ _change_option_h = _input_gp_rl_p; }
		if (_input_axis_lh > 0 && reset_lh)	{ _change_option_h = 1; _value = 1; reset_lh = false; }
		if (_input_axis_lh < 0 && reset_lh)	{ _change_option_h = -1; _value = -1; reset_lh = false; }
		if (_input_axis_lh == 0)			{ reset_lh = true; }
	break;
	
	default:
		if (_change_option_v != 0 && inputting){ inputting = false; }
		if ((_input_vk_rl_p != 0 || _input_gp_rl_p != 0 || _input_axis_lh != 0) && !inputting){ inputting = true; }
}

if (inputting){
	switch(_ds_grid[# 1, menu_option[page]]){
		case menu_element_type.slider:
			if (_input_vk_rl_p != 0 || _input_gp_rl_p != 0 || _value != 0){
				_ds_grid[# 3, menu_option[page]] += _input_vk_rl_p*.1;
				_ds_grid[# 3, menu_option[page]] += _input_gp_rl_p*.1;
				_ds_grid[# 3, menu_option[page]] += _value*.1;
				_ds_grid[# 3, menu_option[page]] = clamp(_ds_grid[# 3, menu_option[page]], 0, 1);
				script_execute(_ds_grid[# 2, menu_option[page]], _ds_grid[# 3, menu_option[page]], menu_option[page]);
				audio_play_sound(_snd_click, 1, false);
			}
		break;
		
		case menu_element_type.toggle:
			if (_input_vk_rl_p != 0 || _input_gp_rl_p != 0 || _value != 0){
				_ds_grid[# 3, menu_option[page]] += _input_vk_rl_p;
				_ds_grid[# 3, menu_option[page]] += _input_gp_rl_p;
				_ds_grid[# 3, menu_option[page]] += _value;
				if (_ds_grid[# 3, menu_option[page]] > array_length_1d(_ds_grid[# 4, menu_option[page]])-1){ _ds_grid[# 3, menu_option[page]] = 0; }
				if (_ds_grid[# 3, menu_option[page]] < 0){ _ds_grid[# 3, menu_option[page]] = array_length_1d(_ds_grid[# 4, menu_option[page]])-1; }
				if (inputting){ script_execute(_ds_grid[# 2, menu_option[page]], _ds_grid[# 3, menu_option[page]]); }
				audio_play_sound(_snd_click, 1, false);
			}
		break;
		
		case menu_element_type.vk_input:
			var _last_key_pressed = keyboard_lastkey;
			switch(_last_key_pressed){
				case ord("0"):
				case ord("1"):
				case ord("2"):
				case ord("3"):
				case ord("4"):
				case ord("5"):
				case ord("6"):
				case ord("7"):
				case ord("8"):
				case ord("9"):
				case ord("Q"):
				case ord("W"):
				case ord("E"):
				case ord("R"):
				case ord("T"):
				case ord("Y"):
				case ord("U"):
				case ord("I"):
				case ord("O"):
				case ord("P"):
				case ord("A"):
				case ord("S"):
				case ord("D"):
				case ord("F"):
				case ord("G"):
				case ord("H"):
				case ord("J"):
				case ord("K"):
				case ord("L"):
				case ord("Z"):
				case ord("X"):
				case ord("C"):
				case ord("V"):
				case ord("B"):
				case ord("N"):
				case ord("M"):
				case vk_left:
				case vk_right:
				case vk_up:
				case vk_down:
				case vk_escape:
				case vk_space:
				case vk_shift:
				case vk_lcontrol:
				case vk_rcontrol:
				case vk_lalt:
				case vk_ralt:
				case vk_backspace:
				case vk_tab:
				case vk_home:
				case vk_end:
				case vk_delete:
				case vk_insert:
				case vk_pageup:
				case vk_pagedown:
				case vk_pause:
				case vk_f1:
				case vk_f2:
				case vk_f3:
				case vk_f4:
				case vk_f5:
				case vk_f6:
				case vk_f7:
				case vk_f8:
				case vk_f9:
				case vk_f10:
				case vk_f11:
				case vk_f12:
				case vk_numpad0:
				case vk_numpad1:
				case vk_numpad2:
				case vk_numpad3:
				case vk_numpad4:
				case vk_numpad5:
				case vk_numpad6:
				case vk_numpad7:
				case vk_numpad8:
				case vk_numpad9:	key_is_known = true; break;
				default:			key_is_known = false;
			}
			if (key_is_known && _last_key_pressed != global.input_vk_select && _last_key_pressed != global.input_vk_right && _last_key_pressed != global.input_vk_left && _last_key_pressed != global.input_vk_down && _last_key_pressed != global.input_vk_up && _last_key_pressed != global.input_vk_pause){
				_ds_grid[# 3, menu_option[page]] = _last_key_pressed;
				variable_global_set(_ds_grid[# 2, menu_option[page]], _last_key_pressed);
				inputting = false;
				audio_play_sound(_snd_click, 1, false);
			}
		break;
		
		case menu_element_type.gp_input:
			var _last_button_pressed = -1;
			if (gamepad_button_check_pressed(global.gp_slot, gp_face1))			{ _last_button_pressed = gp_face1; }
			if (gamepad_button_check_pressed(global.gp_slot, gp_face2))			{ _last_button_pressed = gp_face2; }
			if (gamepad_button_check_pressed(global.gp_slot, gp_face3))			{ _last_button_pressed = gp_face3; }
			if (gamepad_button_check_pressed(global.gp_slot, gp_face4))			{ _last_button_pressed = gp_face4; }
			if (gamepad_button_check_pressed(global.gp_slot, gp_shoulderl))		{ _last_button_pressed = gp_shoulderl; }
			if (gamepad_button_check_pressed(global.gp_slot, gp_shoulderlb))	{ _last_button_pressed = gp_shoulderlb; }
			if (gamepad_button_check_pressed(global.gp_slot, gp_shoulderr))		{ _last_button_pressed = gp_shoulderr; }
			if (gamepad_button_check_pressed(global.gp_slot, gp_shoulderrb))	{ _last_button_pressed = gp_shoulderrb; }
			if (gamepad_button_check_pressed(global.gp_slot, gp_select))		{ _last_button_pressed = gp_select; }
			if (gamepad_button_check_pressed(global.gp_slot, gp_start))			{ _last_button_pressed = gp_start; }
			if (gamepad_button_check_pressed(global.gp_slot, gp_stickl))		{ _last_button_pressed = gp_stickl; }
			if (gamepad_button_check_pressed(global.gp_slot, gp_stickr))		{ _last_button_pressed = gp_stickr; }
			if (gamepad_button_check_pressed(global.gp_slot, gp_padu))			{ _last_button_pressed = gp_padu; }
			if (gamepad_button_check_pressed(global.gp_slot, gp_padd))			{ _last_button_pressed = gp_padd; }
			if (gamepad_button_check_pressed(global.gp_slot, gp_padl))			{ _last_button_pressed = gp_padl; }
			if (gamepad_button_check_pressed(global.gp_slot, gp_padr))			{ _last_button_pressed = gp_padr; }
			
			switch(_last_button_pressed){
				case gp_face1:
				case gp_face2:
				case gp_face3:
				case gp_face4:
				case gp_shoulderl:
				case gp_shoulderlb:
				case gp_shoulderr:
				case gp_shoulderrb:
				case gp_select:
				case gp_start:
				case gp_stickl:
				case gp_stickr:
				case gp_padu:
				case gp_padd:
				case gp_padl:
				case gp_padr:	button_is_known = true;	break;
				default:		button_is_known = false;
			}
			
			if (button_is_known && _last_button_pressed != global.input_gp_right && _last_button_pressed != global.input_gp_left && _last_button_pressed != global.input_gp_down && _last_button_pressed != global.input_gp_up && _last_button_pressed != global.input_gp_select && _last_button_pressed != global.input_gp_pause && _last_button_pressed != global.input_gp_back){
				_ds_grid[# 3, menu_option[page]] = _last_button_pressed;
				variable_global_set(_ds_grid[# 2, menu_option[page]], _last_button_pressed);
				inputting = false;
				audio_play_sound(_snd_click, 1, false);
			}
		break;
	}
} else{
	if (_change_option_v != 0 || _change_option_h != 0){
		switch(menu_pages_list[page]){
			case 4:
				menu_option[page] += _change_option_h;
				if (menu_option[page] > _ds_height-1){ menu_option[page] = 0; }
				if (menu_option[page] < 0){ menu_option[page] = _ds_height-1; }
				if (_change_option_h != 0){ audio_play_sound(_snd_change_option, 1, false); }
			break;
		
			default:
				menu_option[page] += _change_option_v;
				if (menu_option[page] > _ds_height-1){ menu_option[page] = 0; }
				if (menu_option[page] < 0){ menu_option[page] = _ds_height-1; }
				if (_change_option_v != 0){ audio_play_sound(_snd_change_option, 1, false); }
		}
	}
}

if (_input_vk_select_p || _input_gp_select_p){
	switch(_ds_grid[# 1, menu_option[page]]){
		case menu_element_type.script_runner:
			script_execute(_ds_grid[# 2, menu_option[page]]);
			if (menu_pages_list[page] != 2 && menu_pages_list[page] != 3){ audio_play_sound(_snd_select, 1, false); }
		break;
		
		case menu_element_type.page_transfer:
			page = _ds_grid[# 2, menu_option[page]];
			menu_option[page] = 0;
			if (inputting){ inputting = false; }
			audio_play_sound(_snd_select, 1, false);
		break;
	}
}

var _input_pause_menu_p = keyboard_check_pressed(global.input_vk_pause) || gamepad_button_check_pressed(global.gp_slot, global.input_gp_back);
if (_input_pause_menu_p){
	switch(menu_pages_list[page]){
		case 0: break;
		
		case 2:
		case 3:
			if (inputting){ inputting = false; }
			else{ page = _ds_grid[# 2, _ds_height-1]; }
			audio_play_sound(_snd_change_option, 1, false);
		break;
		
		default:
			page = _ds_grid[# 2, _ds_height-1];
			audio_play_sound(_snd_change_option, 1, false);
	}
}