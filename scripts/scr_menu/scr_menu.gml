function create_menu_page() {
	var arg, i = 0;
	repeat(argument_count) {
		arg[i] = argument[i];
		i++;
	}

	var ds_grid_id = ds_grid_create(5, argument_count);

	i = 0;
	repeat(argument_count) {
		var array = arg[i];
		var array_length_value = array_length_1d(array);
	
		var xx = 0;
		repeat(array_length_value) {
			ds_grid_id[# xx, i] = array[xx];
			xx++;
		}
	
		i++;
	}
	return ds_grid_id;	
}

function change_window_mode(_value){
	switch(_value) {
		case 0: window_set_fullscreen(true); break;
		case 1: window_set_fullscreen(false); break;
	}
}

function change_resolution(_value) {
	switch(_value) {
		case 0: window_set_size(720, 400); break;
		case 1: window_set_size(1280, 720); break;
		case 2: window_set_size(1600, 900); break;
		case 3: window_set_size(1920, 1080); break;
	}
}

function change_volume(_value, _sound_type) {
	switch(_sound_type) {
		case 0: audio_master_gain(_value); break;
		case 1: audio_group_set_gain(audiogroup_soundeffects, _value, 0); break;
		case 2: audio_group_set_gain(audiogroup_music, _value, 0); break;
	}
}

function exit_game() {
	game_end();
}

function resume_game() {
	global.pause = false;
}