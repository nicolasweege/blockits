function create_menu_page(){
	var _arg;
	var _i = 0;
	repeat(argument_count){
		_arg[_i] = argument[_i];
		_i++;
	}

	var _ds_grid_id = ds_grid_create(5, argument_count);

	_i = 0;
	repeat(argument_count){
		var _array = _arg[_i];
		var _array_length_value = array_length_1d(_array);
	
		var _xx = 0;
		repeat(_array_length_value){
			_ds_grid_id[# _xx, _i] = _array[_xx];
			_xx++;
		}
		_i++;
	}
	return _ds_grid_id;
}

function change_window_mode(_value){
	switch(_value){
		case 0: window_set_fullscreen(true); break;
		case 1: window_set_fullscreen(false); break;
	}
}

function change_volume(_value, _sound_type){
	switch(_sound_type){
		case 0: audio_master_gain(_value); break;
	}
}

function reset_inputs(){
	obj_pause_menu.draw_redefined_inputs = true;
}

function exit_game(){
	game_end();
}

function resume_game(){
	global.pause = false;
}