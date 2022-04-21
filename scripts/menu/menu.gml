function create_menu_page()
{
	var arg;
	var ds_grid_id = ds_grid_create(5, argument_count);
	
	for (var i = 0; i < argument_count; i++)
	{
		arg[i] = argument[i];
		var array = arg[i];
		var array_length_value = array_length_1d(array);
		
		for (var xx = 0; xx < array_length_value; xx++)
			ds_grid_id[# xx, i] = array[xx];
	}
	
	return ds_grid_id;
}

function change_window_mode(value)
{
	switch(value)
	{
		case 0:
			window_set_fullscreen(true);
		break;
		
		case 1:
			window_set_fullscreen(false);
		break;
	}
}

function change_volume(value, sound_type)
{
	switch(sound_type)
	{
		case 0:
			audio_master_gain(value);
		break;
	}
}

function reset_inputs()
{
	global.menu.draw_redefined_inputs = true;
}

function exit_game()
{
	game_end();
}

function resume_game()
{
	global.pause = false;
}