function save_game_data(current_save_slot)
{	
	var file_name = "save_" + string(current_save_slot + 1) + ".json";
	
	var data =
	{
		// current_room : room,
		current_room : global.checkpoint_room,
		
		player_data : 
		{
			// xpos : obj_player.x,
			// ypos : obj_player.y
			xpos : global.checkpoint_x,
			ypos : global.checkpoint_y
		}
	}
	
	var json_save_file = file_text_open_write(file_name);
	
	if (json_save_file)
	{
		var json_data_string = json_stringify(data);
		file_text_write_string(json_save_file, json_data_string);
	
		file_text_close(json_save_file);
		
		show_debug_message("game saved!");
	}
	else
	{
		show_debug_message("ERROR! game not saved");
	}
	
	return json_save_file;
}

function load_game_data(current_save_slot)
{	
	var file_name = "save_" + string(current_save_slot + 1) + ".json";
	
	var json_save_file = file_text_open_read(file_name);
	
	if (json_save_file)
	{
		var json_data_string = file_text_read_string(json_save_file);
		var game_data = json_parse(json_data_string);
		file_text_close(json_save_file);
		
		if (!instance_exists(obj_player))
		{				  
			instance_create_layer(0, 0, PLAYER_LAYER_NAME, obj_player);
		}
	
		// setting game data
		if (room != game_data.current_room)
		{
			room_goto(game_data.current_room);
		}
		
		obj_player.x = game_data.player_data.xpos;
		obj_player.y = game_data.player_data.ypos;
		obj_player.player_state = obj_player.free_state;
		
		global.is_paused = false;
		
		show_debug_message("game loaded!");
	}
	else
	{
		show_debug_message("ERROR! game not loaded!");
		save_game_data(global.current_save_slot);
	}
	
	return json_save_file;
}



function save_game_options_data()
{	
	var file_name = "game_options.json";
	
	var data =
	{
		master_volume : global.master_volume,
		is_fullscreen : global.is_fullscreen
	}
	
	var json_save_file = file_text_open_write(file_name);
	
	if (json_save_file)
	{
		var json_data_string = json_stringify(data);
		file_text_write_string(json_save_file, json_data_string);
	
		file_text_close(json_save_file);
		
		show_debug_message("game options saved!");
	}
	else
	{
		show_debug_message("ERROR! game options not saved");
	}
	
	return json_save_file;
}

function load_game_options_data()
{	
	var file_name = "game_options.json";
	
	var json_save_file = file_text_open_read(file_name);
	
	if (json_save_file)
	{
		var json_data_string = file_text_read_string(json_save_file);
		var game_data = json_parse(json_data_string);
		file_text_close(json_save_file);

		global.master_volume = game_data.master_volume;
		audio_master_gain(global.master_volume);
		
		global.is_fullscreen = game_data.is_fullscreen;
		window_set_fullscreen(global.is_fullscreen);
		
		show_debug_message("game options loaded!");
	}
	else
	{
		show_debug_message("ERROR! game options not loaded!");
		save_game_options_data();
	}
	
	return json_save_file;
}