if (!global.pause){ exit; }

p_up_input =		keyboard_check_pressed(global.key_up);
p_down_input =		keyboard_check_pressed(global.key_down);
p_enter_input =		keyboard_check_pressed(global.key_enter);
p_select_input =	keyboard_check_pressed(global.key_right) - keyboard_check_pressed(global.key_left);

var _ds_grid = menu_pages_list[page], _ds_height = ds_grid_height(_ds_grid);

var change_option = p_down_input - p_up_input;
if (change_option != 0 && inputting) inputting = false;
if (p_select_input != 0 && !inputting) inputting = true;

if (inputting) {
	switch(_ds_grid[# 1, menu_option[page]]) {
		case menu_element_type.shift:
			var horizontal_input = keyboard_check_pressed(global.key_right) - keyboard_check_pressed(global.key_left);
			if (horizontal_input != 0) {
				_ds_grid[# 3, menu_option[page]] += horizontal_input;
				if (_ds_grid[# 3, menu_option[page]] > array_length_1d(_ds_grid[# 4, menu_option[page]])-1) { _ds_grid[# 3, menu_option[page]] = 0; }
				if (_ds_grid[# 3, menu_option[page]] < 0) { _ds_grid[# 3, menu_option[page]] = array_length_1d(_ds_grid[# 4, menu_option[page]])-1; }
				if (inputting) { script_execute(_ds_grid[# 2, menu_option[page]], _ds_grid[# 3, menu_option[page]]); }
			}
		break;
		
		case menu_element_type.slider:
			var horizontal_input = keyboard_check_pressed(global.key_right) - keyboard_check_pressed(global.key_left);
			if (horizontal_input != 0) {
				_ds_grid[# 3, menu_option[page]] += horizontal_input*.1;
				_ds_grid[# 3, menu_option[page]] = clamp(_ds_grid[# 3, menu_option[page]], 0, 1);
				script_execute(_ds_grid[# 2, menu_option[page]], _ds_grid[# 3, menu_option[page]], menu_option[page]);
			}
		break;
		
		case menu_element_type.toggle:
			var horizontal_input = keyboard_check_pressed(global.key_right) - keyboard_check_pressed(global.key_left);
			if (horizontal_input != 0) {
				_ds_grid[# 3, menu_option[page]] += horizontal_input;
				if (_ds_grid[# 3, menu_option[page]] > array_length_1d(_ds_grid[# 4, menu_option[page]])-1) { _ds_grid[# 3, menu_option[page]] = 0; }
				if (_ds_grid[# 3, menu_option[page]] < 0) { _ds_grid[# 3, menu_option[page]] = array_length_1d(_ds_grid[# 4, menu_option[page]])-1; }
				if (inputting) { script_execute(_ds_grid[# 2, menu_option[page]], _ds_grid[# 3, menu_option[page]]); }
			}
		break;
	}
} else {
	if (change_option != 0) {
		menu_option[page] += change_option;
		if (menu_option[page] > _ds_height-1) menu_option[page] = 0;
		if (menu_option[page] < 0) menu_option[page] = _ds_height-1;
	}
}

if (p_enter_input) {
	switch(_ds_grid[# 1, menu_option[page]]) {
		case menu_element_type.page_transfer:
			page = _ds_grid[# 2, menu_option[page]];
			menu_option[page] = 0;
		break;
		
		case menu_element_type.script_runner:
			script_execute(_ds_grid[# 2, menu_option[page]]);
		break;
	}
}

var pause_menu_buttom = keyboard_check_pressed(vk_escape);
if (pause_menu_buttom) {
	switch(menu_pages_list[page]) {
		case 0: menu_option[page] = 0; break;
		case 1:
		case 2:
		case 3:
		case 4: page = _ds_grid[# 2, _ds_height-1]; break;
	}
}