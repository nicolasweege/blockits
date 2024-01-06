
sprite_to_draw = spr_totem_plate;

activate_state = function()
{
	switch (area_to_activate)
	{
		case "jungle":
			if (!global.activate_jungle_area)
			{
				global.activate_jungle_area = true;
				save_game_data(global.current_save_slot);
				audio_play_sound(snd_teleporter_enter, 1, 0);
			}
			break;
		
		case "library":
			if (!global.activate_library_area)
			{
				global.activate_library_area = true;
				save_game_data(global.current_save_slot);
				audio_play_sound(snd_teleporter_enter, 1, 0);
			}
			break;
			
		case "mountain":
			if (!global.activate_mountain_area)
			{
				global.activate_mountain_area = true;
				save_game_data(global.current_save_slot);
				audio_play_sound(snd_teleporter_enter, 1, 0);
			}
			break;
			
		case "playground":
			if (!global.activate_playground_area)
			{
				global.activate_playground_area = true;
				save_game_data(global.current_save_slot);
				audio_play_sound(snd_teleporter_enter, 1, 0);
			}
			break;
			
		case "bonus_1":
			if (!global.activate_bonus_1_area)
			{
				global.activate_bonus_1_area = true;
				save_game_data(global.current_save_slot);
				audio_play_sound(snd_teleporter_enter, 1, 0);
			}
			break;
			
		case "bonus_2":
			if (!global.activate_bonus_2_area)
			{
				global.activate_bonus_2_area = true;
				save_game_data(global.current_save_slot);
				audio_play_sound(snd_teleporter_enter, 1, 0);
			}
			break;
	}
}

default_state = function()
{
	if (place_meeting(x, y - 1, obj_player))
	{
		current_state = activate_state;
	}
}

current_state = default_state;