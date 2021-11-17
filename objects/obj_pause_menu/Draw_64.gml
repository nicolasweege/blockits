if (!global.pause)exit;

var _ds_grid		= menu_pages_list[page];
var _ds_height		= ds_grid_height(_ds_grid);

var _view_width		= global.view_width;
var _view_height	= global.view_height;

var _c				= c_black;
var _y_buffer		= 32;
var _txt_xscale		= .5;
var _txt_yscale		= .5;
var _xsp			= _view_width;
var _ysp			= (_view_height/2) - ((((_ds_height-1)/2) * _y_buffer));

var _icon_width = sprite_get_width(icon_spr);

draw_set_alpha(.85); draw_rectangle_color(0, 0, _view_width, _view_height, _c, _c, _c, _c, false); draw_set_alpha(1);
draw_set_font(fnt_menu); draw_set_valign(fa_middle);

var _left_txt_y_pos;
var _yy = 0;
repeat(_ds_height){
	_left_txt_y_pos = _ysp + (_yy*_y_buffer);
	_c = c_dkgray;
	
	switch(menu_pages_list[page]){
		case 0:
			_xsp = _view_width*.1;
			if (_yy == menu_option[page]){
				_c = c_white;
				draw_sprite_ext(icon_spr, 0, _xsp-(_icon_width/2), _left_txt_y_pos, 2, 2, 0, _c, 1);
			}
			draw_text_ext_transformed_color(_xsp, _left_txt_y_pos, _ds_grid[# 0, _yy], 0, _view_width, _txt_xscale, _txt_yscale, 0, _c, _c, _c, _c, 1);
		break;
		
		case 1:
			_xsp = _view_width*.1;
			if (_yy == menu_option[page]){
				_c = c_white;
				draw_sprite_ext(icon_spr, 0, _xsp-(_icon_width/2), _left_txt_y_pos, 2, 2, 0, _c, 1);
			}
			draw_text_ext_transformed_color(_xsp, _left_txt_y_pos, _ds_grid[# 0, _yy], 0, _view_width, _txt_xscale, _txt_yscale, 0, _c, _c, _c, _c, 1);
		break;
		
		case 4:
			if (_yy == menu_option[page]){
				_c = c_white;
				switch(_yy){
					case 0:
						_xsp = _view_width*.1;
						draw_sprite_ext(icon_spr, 0, _xsp-(_icon_width/2), _left_txt_y_pos, 2, 2, 0, _c, 1);
					break;
					
					case 1:
						_xsp = _view_width*.25;
						draw_sprite_ext(icon_spr, 0, _xsp-(_icon_width/2), _ysp, 2, 2, 0, _c, 1);
					break;
				}
			}
			switch(_yy){
				case 0:
					_xsp = _view_width*.1;
					draw_text_ext_transformed_color(_xsp, _left_txt_y_pos, _ds_grid[# 0, _yy], 0, _view_width, _txt_xscale, _txt_yscale, 0, _c, _c, _c, _c, 1);
				break;
				
				case 1:
					_xsp = _view_width*.25;
					draw_text_ext_transformed_color(_xsp, _ysp, _ds_grid[# 0, _yy], 0, _view_width, _txt_xscale, _txt_yscale, 0, _c, _c, _c, _c, 1);
				break;
			}
		break;
		
		default:
			_xsp = _view_width*.1;
			if (_yy == menu_option[page]){
				_c = c_white;
				draw_sprite_ext(icon_spr, 0, _xsp-(_icon_width/2), _left_txt_y_pos, 2, 2, 0, _c, 1);
			}
			draw_text_ext_transformed_color(_xsp, _left_txt_y_pos, _ds_grid[# 0, _yy], 0, _view_width, _txt_xscale, _txt_yscale, 0, _c, _c, _c, _c, 1);
	}
	_yy++;
}

switch(menu_pages_list[page]){
	case 1:
		_c = c_white;
		draw_text_ext_transformed_color(_xsp, _left_txt_y_pos-_y_buffer*5, "Options", 0, _view_width, _txt_xscale, _txt_yscale, 0, _c, _c, _c, _c, 1);
	break;
			
	case 2:
		_c = c_white;
		_xsp = _view_width*.1;
		draw_text_ext_transformed_color(_xsp, _left_txt_y_pos-_y_buffer*6, "Keyboard", 0, _view_width, _txt_xscale, _txt_yscale, 0, _c, _c, _c, _c, 1);
	break;
	
	case 3:
		_c = c_white;
		_xsp = _view_width*.1;
		draw_text_ext_transformed_color(_xsp, _left_txt_y_pos-_y_buffer*6, "Gamepad", 0, _view_width, _txt_xscale, _txt_yscale, 0, _c, _c, _c, _c, 1);
	break;
	
	case 4:
		_c = c_white;
		_xsp = _view_width*.1;
		draw_text_ext_transformed_color(_xsp, _left_txt_y_pos-_y_buffer*2, "Quit Game?", 0, _view_width, _txt_xscale, _txt_yscale, 0, _c, _c, _c, _c, 1);
	break;
}

var _right_txt_y_pos;
_yy = 0;
repeat(_ds_height){
	_right_txt_y_pos = _ysp + (_yy*_y_buffer);
	
	switch(_ds_grid[# 1, _yy]){
		case menu_element_type.slider:
			var _current_value = _ds_grid[# 3, _yy];
			var _current_array = _ds_grid[# 4, _yy];
			var _circle_position = ((_current_value - _current_array[0]) / (_current_array[1] - _current_array[0]));
			_c = c_dkgray;
			_xsp = _view_width*.35;
			if (_yy == menu_option[page]){ _c = c_white; }
			draw_text_ext_transformed_color(_xsp, _right_txt_y_pos, string(floor(_circle_position*100))+"%", 0, _view_width, _txt_xscale, _txt_yscale, 0, _c, _c, _c, _c, 1);
		break;
		
		case menu_element_type.toggle:
			var _current_value = _ds_grid[# 3, _yy];
			var _current_array = _ds_grid[# 4, _yy];
			_c = c_dkgray;
			_xsp = _view_width*.35;
			if (_yy == menu_option[page]){ _c = c_white; }
			draw_text_ext_transformed_color(_xsp, _right_txt_y_pos, _current_array[_current_value], 0, _view_width, _txt_xscale, _txt_yscale, 0, _c, _c, _c, _c, 1);
		break;
		
		case menu_element_type.vk_input:
			var _current_value = _ds_grid[# 3, _yy];
			var _string_value;
			switch(_current_value){
				case ord("0"):			_string_value = "0";			break;
				case ord("1"):			_string_value = "1";			break;
				case ord("2"):			_string_value = "2";			break;
				case ord("3"):			_string_value = "3";			break;
				case ord("4"):			_string_value = "4";			break;
				case ord("5"):			_string_value = "5";			break;
				case ord("6"):			_string_value = "6";			break;
				case ord("7"):			_string_value = "7";			break;
				case ord("8"):			_string_value = "8";			break;
				case ord("9"):			_string_value = "9";			break;
				case ord("Q"):			_string_value = "Q";			break;
				case ord("W"):			_string_value = "W";			break;
				case ord("E"):			_string_value = "E";			break;
				case ord("R"):			_string_value = "R";			break;
				case ord("T"):			_string_value = "T";			break;
				case ord("Y"):			_string_value = "Y";			break;
				case ord("U"):			_string_value = "U";			break;
				case ord("I"):			_string_value = "I";			break;
				case ord("O"):			_string_value = "O";			break;
				case ord("P"):			_string_value = "P";			break;
				case ord("A"):			_string_value = "A";			break;
				case ord("S"):			_string_value = "S";			break;
				case ord("D"):			_string_value = "D";			break;
				case ord("F"):			_string_value = "F";			break;
				case ord("G"):			_string_value = "G";			break;
				case ord("H"):			_string_value = "H";			break;
				case ord("J"):			_string_value = "J";			break;
				case ord("K"):			_string_value = "K";			break;
				case ord("L"):			_string_value = "L";			break;
				case ord("Z"):			_string_value = "Z";			break;
				case ord("X"):			_string_value = "X";			break;
				case ord("C"):			_string_value = "C";			break;
				case ord("V"):			_string_value = "V";			break;
				case ord("B"):			_string_value = "B";			break;
				case ord("N"):			_string_value = "N";			break;
				case ord("M"):			_string_value = "M";			break;
				case vk_left:			_string_value = "Left Arrow";	break;
				case vk_right:			_string_value = "Right Arrow";	break;
				case vk_up:				_string_value = "Up Arrow";		break;
				case vk_down:			_string_value = "Down Arrow";	break;
				case vk_escape:			_string_value = "Esc";			break;
				case vk_space:			_string_value = "Space";		break;
				case vk_shift:			_string_value = "Shift";		break;
				case vk_lcontrol:		_string_value = "L Ctrl";		break;
				case vk_rcontrol:		_string_value = "R Ctrl";		break;
				case vk_lalt:			_string_value = "L Alt";		break;
				case vk_ralt:			_string_value = "R Alt";		break;
				case vk_backspace:		_string_value = "Backspace";	break;
				case vk_tab:			_string_value = "Tab";			break;
				case vk_home:			_string_value = "Home";			break;
				case vk_end:			_string_value = "End";			break;
				case vk_delete:			_string_value = "Del";			break;
				case vk_insert:			_string_value = "Ins";			break;
				case vk_pageup:			_string_value = "PgUp";			break;
				case vk_pagedown:		_string_value = "PgDn";			break;
				case vk_pause:			_string_value = "Puase";		break;
				case vk_f1:				_string_value = "F1";			break;
				case vk_f2:				_string_value = "F2";			break;
				case vk_f3:				_string_value = "F3";			break;
				case vk_f4:				_string_value = "F4";			break;
				case vk_f5:				_string_value = "F5";			break;
				case vk_f6:				_string_value = "F6";			break;
				case vk_f7:				_string_value = "F7";			break;
				case vk_f8:				_string_value = "F8";			break;
				case vk_f9:				_string_value = "F9";			break;
				case vk_f10:			_string_value = "F10";			break;
				case vk_f11:			_string_value = "F11";			break;
				case vk_f12:			_string_value = "F12";			break;
				case vk_numpad0:		_string_value = "Numpad 0";		break;
				case vk_numpad1:		_string_value = "Numpad 1";		break;
				case vk_numpad2:		_string_value = "Numpad 2";		break;
				case vk_numpad3:		_string_value = "Numpad 3";		break;
				case vk_numpad4:		_string_value = "Numpad 4";		break;
				case vk_numpad5:		_string_value = "Numpad 5";		break;
				case vk_numpad6:		_string_value = "Numpad 6";		break;
				case vk_numpad7:		_string_value = "Numpad 7";		break;
				case vk_numpad8:		_string_value = "Numpad 8";		break;
				case vk_numpad9:		_string_value = "Numpad 9";		break;
				default:				_string_value = "Unknown";
			}
			_c = c_dkgray;
			_xsp = _view_width*.35;
			if (_yy == menu_option[page] && inputting){ _c = c_white; }
			draw_set_halign(fa_center);
			draw_text_ext_transformed_color(_xsp, _right_txt_y_pos, _string_value, 0, _view_width, _txt_xscale, _txt_yscale, 0, _c, _c, _c, _c, 1);
			draw_set_halign(fa_left);
		break;
		
		case menu_element_type.gp_input:
			var _current_value = _ds_grid[# 3, _yy];
			var _string_value;
			var _spr_input_icon;
			switch(_current_value){
				case gp_face1:		_string_value = ""; _spr_input_icon = spr_a_button_icon;	break;
				case gp_face2:		_string_value = ""; _spr_input_icon = spr_b_button_icon;	break;
				case gp_face3:		_string_value = ""; _spr_input_icon = spr_x_button_icon;	break;
				case gp_face4:		_string_value = ""; _spr_input_icon = spr_y_button_icon;	break;
				case gp_shoulderl:	_string_value = "LB";		break;
				case gp_shoulderlb: _string_value = "LT";		break;
				case gp_shoulderr:	_string_value = "RB";		break;
				case gp_shoulderrb:	_string_value = "RT";		break;
				case gp_select:		_string_value = "Back";		break;
				case gp_start:		_string_value = ""; _spr_input_icon = spr_start_button_icon;	break;
				case gp_stickl:		_string_value = "StickL";	break;
				case gp_stickr:		_string_value = "StrickR";	break;
				case gp_padu:		_string_value = "Up";		break;
				case gp_padd:		_string_value = "Down";		break;
				case gp_padl:		_string_value = "Left";		break;
				case gp_padr:		_string_value = "Right";	break;
				default:			_string_value = "Unknown";
			}
			_c = c_dkgray;
			_xsp = _view_width*.35;
			if (_yy == menu_option[page] && inputting){ _c = c_white; }
			draw_set_halign(fa_center);
			draw_text_ext_transformed_color(_xsp, _right_txt_y_pos, _string_value, 0, _view_width, _txt_xscale, _txt_yscale, 0, _c, _c, _c, _c, 1);
			if (_current_value == gp_face1){ var _sprite_height = sprite_get_height(_spr_input_icon); draw_sprite_ext(_spr_input_icon, 0, _xsp, _right_txt_y_pos+(_sprite_height/2), 1.3, 1.3, 0, _c, 1); }
			if (_current_value == gp_face2){ var _sprite_height = sprite_get_height(_spr_input_icon); draw_sprite_ext(_spr_input_icon, 0, _xsp, _right_txt_y_pos+(_sprite_height/2), 1.3, 1.3, 0, _c, 1); }
			if (_current_value == gp_face3){ var _sprite_height = sprite_get_height(_spr_input_icon); draw_sprite_ext(_spr_input_icon, 0, _xsp, _right_txt_y_pos+(_sprite_height/2), 1.3, 1.3, 0, _c, 1); }
			if (_current_value == gp_face4){ var _sprite_height = sprite_get_height(_spr_input_icon); draw_sprite_ext(_spr_input_icon, 0, _xsp, _right_txt_y_pos+(_sprite_height/2), 1.3, 1.3, 0, _c, 1); }
			if (_current_value == gp_start){ var _sprite_height = sprite_get_height(_spr_input_icon); draw_sprite_ext(_spr_input_icon, 0, _xsp, _right_txt_y_pos+(_sprite_height/2), 1.3, 1.3, 0, _c, 1); }
			draw_set_halign(fa_left);
		break;
	}
	_yy++;
}

draw_set_font(-1); draw_set_valign(fa_top);