function save_game_data(current_save_slot)
{	
	var file_name = "save_" + string(current_save_slot + 1) + ".json";
	
	var data =
	{
		current_room : global.checkpoint_room,
		
		player_data : 
		{
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
		is_fullscreen : global.is_fullscreen,
		screenshake_is_enabled : global.screen_shake_is_enabled,
		
		// keybinds:
		MENU_left_vk_keybind : global.MENU_left_key,
		MENU_left_gp_keybind : global.MENU_left_gp,
		
		MENU_right_vk_keybind : global.MENU_right_key,
		MENU_right_gp_keybind : global.MENU_right_gp,
		
		MENU_down_vk_keybind : global.MENU_down_key,
		MENU_down_gp_keybind : global.MENU_down_gp,
		
		MENU_up_vk_keybind : global.MENU_up_key,
		MENU_up_gp_keybind : global.MENU_up_gp,

		MENU_pause_vk_keybind : global.MENU_pause_key,
		MENU_pause_gp_keybind : global.MENU_pause_gp,

		MENU_select_vk_keybind : global.MENU_select_key,
		MENU_select_gp_keybind : global.MENU_select_gp,

		MENU_exit_vk_keybind : global.MENU_exit_key,
		MENU_exit_gp_keybind : global.MENU_exit_gp,

		// player
		PLAYER_left_vk_keybind : global.PLAYER_left_key,
		PLAYER_left_gp_keybind : global.PLAYER_left_gp,
		
		PLAYER_right_vk_keybind : global.PLAYER_right_key,
		PLAYER_right_gp_keybind : global.PLAYER_right_gp,
		
		PLAYER_down_vk_keybind : global.PLAYER_down_key,
		PLAYER_down_gp_keybind : global.PLAYER_down_gp,
		
		PLAYER_up_vk_keybind : global.PLAYER_up_key,
		PLAYER_up_gp_keybind : global.PLAYER_up_gp,
		
		PLAYER_jump_vk_keybind : global.PLAYER_jump_key,
		PLAYER_jump_gp_keybind : global.PLAYER_jump_gp,

		PLAYER_dash_vk_keybind : global.PLAYER_dash_key,
		PLAYER_dash_gp_keybind : global.PLAYER_dash_gp
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
		
		global.screen_shake_is_enabled = game_data.screenshake_is_enabled;
		
		// keybinds:
		global.MENU_left_key = game_data.MENU_left_vk_keybind;
		global.MENU_left_gp = game_data.MENU_left_gp_keybind;
		
		global.MENU_right_key = game_data.MENU_right_vk_keybind;
		global.MENU_right_gp = game_data.MENU_right_gp_keybind;
		
		global.MENU_down_key = game_data.MENU_down_vk_keybind;
		global.MENU_down_gp = game_data.MENU_down_gp_keybind;
		
		global.MENU_up_key = game_data.MENU_up_vk_keybind;
		global.MENU_up_gp = game_data.MENU_up_gp_keybind
		
		global.MENU_pause_key = game_data.MENU_pause_vk_keybind;
		global.MENU_pause_gp = game_data.MENU_pause_gp_keybind;

		global.MENU_select_key = game_data.MENU_select_vk_keybind;
		global.MENU_select_gp = game_data.MENU_select_gp_keybind;

		global.MENU_exit_key = game_data.MENU_exit_vk_keybind;
		global.MENU_exit_gp = game_data.MENU_exit_gp_keybind;

		// player
		global.PLAYER_left_key = game_data.PLAYER_left_vk_keybind;
		global.PLAYER_left_gp = game_data.PLAYER_left_gp_keybind;
		
		global.PLAYER_right_key = game_data.PLAYER_right_vk_keybind;
		global.PLAYER_right_gp = game_data.PLAYER_right_gp_keybind;
		
		global.PLAYER_down_key = game_data.PLAYER_down_vk_keybind;
		global.PLAYER_down_gp = game_data.PLAYER_down_gp_keybind;
		
		global.PLAYER_up_key = game_data.PLAYER_up_vk_keybind;
		global.PLAYER_up_gp = game_data.PLAYER_up_gp_keybind;
		
		global.PLAYER_jump_key = game_data.PLAYER_jump_vk_keybind;
		global.PLAYER_jump_gp = game_data.PLAYER_jump_gp_keybind;

		global.PLAYER_dash_key = game_data.PLAYER_dash_vk_keybind;
		global.PLAYER_dash_gp = game_data.PLAYER_dash_gp_keybind;
		
		show_debug_message("game options loaded!");
	}
	else
	{
		show_debug_message("ERROR! game options not loaded!");
		save_game_options_data();
	}
	
	return json_save_file;
}