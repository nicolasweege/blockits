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
		global.checkpoint_room = global.game_initial_room;
		global.checkpoint_x = global.game_initial_xpos;
		global.checkpoint_y = global.game_initial_ypos;
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
	}
	
	return json_save_file;
}