set_initial_game_stuff();

// layer stuff
layer_set_visible("default_colliders", false);
layer_set_visible("death_colliders", false);
layer_set_visible("checkpoints", false);
layer_set_visible("level_changers", false);
layer_set_visible("camera_masks", false);
can_show_debug_layers = false;

// debug stuff
show_debug_overlay(false);
show_debug_info = false;


// setting up audio stuff
audio_falloff_set_model(audio_falloff_linear_distance);
audio_listener_orientation(0, 1, 0, 0, 0, 1);

// ambience sound testing
// audio_play_sound(snd_mountain_ambience_1, 1, 1);

/*
current_song = choose(snd_a_song_for_the_empty_world,
	                      snd_ghost, 
						  snd_good_piano_song_1, 
						  snd_sky_lantern, 
						  snd_the_rain_that_never_stops, 
						  snd_the_spring_is_far);

audio_play_sound(current_song, 1, 0);
*/


// menu stuff
change_vk_keybind = false;
change_gp_keybind = false;
keybind_to_change = PLAYER_keybinds.none;

menu_index = 1;
current_button_options = 0;
use_mouse_button_selection = true;

#region gamepad menu
gamepad_menu = function()
{
	#region buttons
	// UP button
	var up_button = blockits_draw_button(global.cam_width / 2 - 40, 
			                             global.cam_height / 2 - 60, 
										 "up: ", 
		                                 80, 15, 
										 c_white, c_white, c_white);
										
	// DOWN button
	var down_button = blockits_draw_button(global.cam_width / 2 - 40, 
			                               global.cam_height / 2 - 40, 
										   "down: ", 
		                                   80, 15, 
										   c_white, c_white, c_white);
										
	// RIGHT button
	var right_button = blockits_draw_button(global.cam_width / 2 - 40, 
			                                global.cam_height / 2 - 20, 
										    "right: ", 
		                                    80, 15, 
										    c_white, c_white, c_white);
										
	// LEFT button
	var left_button = blockits_draw_button(global.cam_width / 2 - 40, 
				                           global.cam_height / 2, 
										   "left: ", 
			                               80, 15, 
										   c_white, c_white, c_white);
										   
	// JUMP button
	var jump_button = blockits_draw_button(global.cam_width / 2 - 40, 
				                           global.cam_height / 2 + 20, 
										   "jump: ", 
			                               80, 15, 
										   c_white, c_white, c_white);
										   
	// DASH button
	var dash_button = blockits_draw_button(global.cam_width / 2 - 40, 
				                           global.cam_height / 2 + 40, 
										   "dash: ", 
			                               80, 15, 
										   c_white, c_white, c_white);
										
	// back button
	var back_button = blockits_draw_button(global.cam_width / 2, 
						                   global.cam_height / 2 + 60, 
										   "back", 
					                       80, 15, 
										   c_white, c_white, c_white);
	#endregion
										   
	#region drawing keybinds text
	// UP
	if (keybind_to_change == PLAYER_keybinds.up)
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2 - 60, 
								"{ }",
								c_white);
	}
	else
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2 - 60, 
								get_gamepad_gp_string(global.PLAYER_up_gp),
								c_gray);
	}
	// DOWN
	if (keybind_to_change == PLAYER_keybinds.down)
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2 - 40, 
								"{ }",
								c_white);
	}
	else
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2 - 40, 
								get_gamepad_gp_string(global.PLAYER_down_gp),
								c_gray);
	}
	// RIGHT
	if (keybind_to_change == PLAYER_keybinds.right)
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2 - 20, 
								"{ }",
								c_white);
	}
	else
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2 - 20, 
								get_gamepad_gp_string(global.PLAYER_right_gp),
								c_gray);
	}
	// LEFT
	if (keybind_to_change == PLAYER_keybinds.left)
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2, 
								"{ }",
								c_white);
	}
	else
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2, 
								get_gamepad_gp_string(global.PLAYER_left_gp),
								c_gray);
	}
	// JUMP
	if (keybind_to_change == PLAYER_keybinds.jump)
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2 + 20, 
								"{ }",
								c_white);
	}
	else
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2 + 20, 
								get_gamepad_gp_string(global.PLAYER_jump_gp),
								c_gray);
	}
	// DASH
	if (keybind_to_change == PLAYER_keybinds.dash)
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2 + 40, 
								"{ }",
								c_white);
	}
	else
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2 + 40, 
								get_gamepad_gp_string(global.PLAYER_dash_gp),
								c_gray);
	}
	#endregion
	
	if (change_gp_keybind)
	{
		if (keyboard_check_pressed(global.MENU_exit_key))
		{
			audio_play_sound(snd_click, 1, 0);
			keybind_to_change = PLAYER_keybinds.none;
			change_gp_keybind = false;
		}
		
		if (check_gamepad_keybind_input())
		{
			switch (keybind_to_change)
			{
				case PLAYER_keybinds.up: 
					var new_keybind = get_gamepad_new_keybind(global.PLAYER_up_gp);
					if (new_keybind != -1)
					{
						global.PLAYER_up_gp = new_keybind;
						save_game_options_data();
						audio_play_sound(snd_click, 1, 0);
						keybind_to_change = PLAYER_keybinds.none;
						change_gp_keybind = false;
					}
					break;
				case PLAYER_keybinds.down:
					var new_keybind = get_gamepad_new_keybind(global.PLAYER_down_gp);
					if (new_keybind != -1)
					{
						global.PLAYER_down_gp = new_keybind;
						save_game_options_data();
						audio_play_sound(snd_click, 1, 0);
						keybind_to_change = PLAYER_keybinds.none;
						change_gp_keybind = false;
					}
					break;	
				case PLAYER_keybinds.right: 
					var new_keybind = get_gamepad_new_keybind(global.PLAYER_right_gp);
					if (new_keybind != -1)
					{
						global.PLAYER_right_gp = new_keybind;
						save_game_options_data();
						audio_play_sound(snd_click, 1, 0);
						keybind_to_change = PLAYER_keybinds.none;
						change_gp_keybind = false;
					}
					break;	
				case PLAYER_keybinds.left: 
					var new_keybind = get_gamepad_new_keybind(global.PLAYER_left_gp);
					if (new_keybind != -1)
					{
						global.PLAYER_left_gp = new_keybind;
						save_game_options_data();
						audio_play_sound(snd_click, 1, 0);
						keybind_to_change = PLAYER_keybinds.none;
						change_gp_keybind = false;
					}
					break;
				case PLAYER_keybinds.jump: 
					var new_keybind = get_gamepad_new_keybind(global.PLAYER_jump_gp);
					if (new_keybind != -1)
					{
						global.PLAYER_jump_gp = new_keybind;
						save_game_options_data();
						audio_play_sound(snd_click, 1, 0);
						keybind_to_change = PLAYER_keybinds.none;
						change_gp_keybind = false;
					}
					break;
				case PLAYER_keybinds.dash: 
					var new_keybind = get_gamepad_new_keybind(global.PLAYER_dash_gp);
					if (new_keybind != -1)
					{
						global.PLAYER_dash_gp = new_keybind;
						save_game_options_data();
						audio_play_sound(snd_click, 1, 0);
						keybind_to_change = PLAYER_keybinds.none;
						change_gp_keybind = false;
					}
					break;
			}
		}
	}
	else
	{	
		if (up_button)
		{
			keybind_to_change = PLAYER_keybinds.up;
			audio_play_sound(snd_click, 1, 0);
			change_gp_keybind = true;
		}
		if (down_button)
		{
			keybind_to_change = PLAYER_keybinds.down;
			audio_play_sound(snd_click, 1, 0);
			change_gp_keybind = true;
		}
		if (right_button)
		{
			keybind_to_change = PLAYER_keybinds.right;
			audio_play_sound(snd_click, 1, 0);
			change_gp_keybind = true;
		}
		if (left_button)
		{
			keybind_to_change = PLAYER_keybinds.left;
			audio_play_sound(snd_click, 1, 0);
			change_gp_keybind = true;
		}
		if (jump_button)
		{
			keybind_to_change = PLAYER_keybinds.jump;
			audio_play_sound(snd_click, 1, 0);
			change_gp_keybind = true;
		}
		if (dash_button)
		{
			keybind_to_change = PLAYER_keybinds.dash;
			audio_play_sound(snd_click, 1, 0);
			change_gp_keybind = true;
		}
		
		if (back_button
		|| keyboard_check_pressed(global.MENU_exit_key)
		|| gamepad_button_check_pressed(global.device, global.MENU_exit_gp))
		{
			audio_play_sound(snd_click, 1, 0);
			keybind_to_change = PLAYER_keybinds.none;
			change_gp_keybind = false;
			current_menu = options_menu;
		}
	}
}
#endregion

#region keyboard menu
keyboard_menu = function()
{
	#region buttons
	// UP button
	var up_button = blockits_draw_button(global.cam_width / 2 - 40, 
			                             global.cam_height / 2 - 60, 
										 "up: ", 
		                                 80, 15, 
										 c_white, c_white, c_white);
										
	// DOWN button
	var down_button = blockits_draw_button(global.cam_width / 2 - 40, 
			                               global.cam_height / 2 - 40, 
										   "down: ", 
		                                   80, 15, 
										   c_white, c_white, c_white);
										
	// RIGHT button
	var right_button = blockits_draw_button(global.cam_width / 2 - 40, 
			                                global.cam_height / 2 - 20, 
										    "right: ", 
		                                    80, 15, 
										    c_white, c_white, c_white);
										
	// LEFT button
	var left_button = blockits_draw_button(global.cam_width / 2 - 40, 
				                           global.cam_height / 2, 
										   "left: ", 
			                               80, 15, 
										   c_white, c_white, c_white);
										   
	// JUMP button
	var jump_button = blockits_draw_button(global.cam_width / 2 - 40, 
				                           global.cam_height / 2 + 20, 
										   "jump: ", 
			                               80, 15, 
										   c_white, c_white, c_white);
										   
	// DASH button
	var dash_button = blockits_draw_button(global.cam_width / 2 - 40, 
				                           global.cam_height / 2 + 40, 
										   "dash: ", 
			                               80, 15, 
										   c_white, c_white, c_white);
										
	// back button
	var back_button = blockits_draw_button(global.cam_width / 2, 
						                   global.cam_height / 2 + 60, 
										   "back", 
					                       80, 15, 
										   c_white, c_white, c_white);
	#endregion
										   
	#region drawing keybinds text
	// UP
	if (keybind_to_change == PLAYER_keybinds.up)
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2 - 60, 
								"{ }",
								c_white);
	}
	else
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2 - 60, 
								get_keyboard_key_string(global.PLAYER_up_key),
								c_gray);
	}
	// DOWN
	if (keybind_to_change == PLAYER_keybinds.down)
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2 - 40, 
								"{ }",
								c_white);
	}
	else
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2 - 40, 
								get_keyboard_key_string(global.PLAYER_down_key),
								c_gray);
	}
	// RIGHT
	if (keybind_to_change == PLAYER_keybinds.right)
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2 - 20, 
								"{ }",
								c_white);
	}
	else
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2 - 20, 
								get_keyboard_key_string(global.PLAYER_right_key),
								c_gray);
	}
	// LEFT
	if (keybind_to_change == PLAYER_keybinds.left)
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2, 
								"{ }",
								c_white);
	}
	else
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2, 
								get_keyboard_key_string(global.PLAYER_left_key),
								c_gray);
	}
	// JUMP
	if (keybind_to_change == PLAYER_keybinds.jump)
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2 + 20, 
								"{ }",
								c_white);
	}
	else
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2 + 20, 
								get_keyboard_key_string(global.PLAYER_jump_key),
								c_gray);
	}
	// DASH
	if (keybind_to_change == PLAYER_keybinds.dash)
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2 + 40, 
								"{ }",
								c_white);
	}
	else
	{
		blockits_draw_menu_text(global.cam_width / 2 + 40, 
								global.cam_height / 2 + 40, 
								get_keyboard_key_string(global.PLAYER_dash_key),
								c_gray);
	}
	#endregion
	
	if (change_vk_keybind)
	{
		if (menu_exit_page)
		{
			audio_play_sound(snd_click, 1, 0);
			keybind_to_change = PLAYER_keybinds.none;
			change_vk_keybind = false;
		}
		
		if (keyboard_check_pressed(vk_anykey))
		{
			switch (keybind_to_change)
			{
				case PLAYER_keybinds.up: 
					var new_keybind = get_keyboard_new_keybind(global.PLAYER_up_key);
					if (new_keybind != vk_nokey)
					{
						global.PLAYER_up_key = new_keybind;
						save_game_options_data();
						audio_play_sound(snd_click, 1, 0);
						keybind_to_change = PLAYER_keybinds.none;
						change_vk_keybind = false;
					}
					break;
				case PLAYER_keybinds.down:
					var new_keybind = get_keyboard_new_keybind(global.PLAYER_down_key);
					if (new_keybind != vk_nokey)
					{
						global.PLAYER_down_key = new_keybind;
						save_game_options_data();
						audio_play_sound(snd_click, 1, 0);
						keybind_to_change = PLAYER_keybinds.none;
						change_vk_keybind = false;
					}
					break;	
				case PLAYER_keybinds.right: 
					var new_keybind = get_keyboard_new_keybind(global.PLAYER_right_key);
					if (new_keybind != vk_nokey)
					{
						global.PLAYER_right_key = new_keybind;
						save_game_options_data();
						audio_play_sound(snd_click, 1, 0);
						keybind_to_change = PLAYER_keybinds.none;
						change_vk_keybind = false;
					}
					break;	
				case PLAYER_keybinds.left: 
					var new_keybind = get_keyboard_new_keybind(global.PLAYER_left_key);
					if (new_keybind != vk_nokey)
					{
						global.PLAYER_left_key = new_keybind;
						save_game_options_data();
						audio_play_sound(snd_click, 1, 0);
						keybind_to_change = PLAYER_keybinds.none;
						change_vk_keybind = false;
					}
					break;
				case PLAYER_keybinds.jump: 
					var new_keybind = get_keyboard_new_keybind(global.PLAYER_jump_key);
					if (new_keybind != vk_nokey)
					{
						global.PLAYER_jump_key = new_keybind;
						save_game_options_data();
						audio_play_sound(snd_click, 1, 0);
						keybind_to_change = PLAYER_keybinds.none;
						change_vk_keybind = false;
					}
					break;
				case PLAYER_keybinds.dash: 
					var new_keybind = get_keyboard_new_keybind(global.PLAYER_dash_key);
					if (new_keybind != vk_nokey)
					{
						global.PLAYER_dash_key = new_keybind;
						save_game_options_data();
						audio_play_sound(snd_click, 1, 0);
						keybind_to_change = PLAYER_keybinds.none;
						change_vk_keybind = false;
					}
					break;
			}
		}
	}
	else
	{	
		if (up_button)
		{
			keybind_to_change = PLAYER_keybinds.up;
			audio_play_sound(snd_click, 1, 0);
			change_vk_keybind = true;
		}
		if (down_button)
		{
			keybind_to_change = PLAYER_keybinds.down;
			audio_play_sound(snd_click, 1, 0);
			change_vk_keybind = true;
		}
		if (right_button)
		{
			keybind_to_change = PLAYER_keybinds.right;
			audio_play_sound(snd_click, 1, 0);
			change_vk_keybind = true;
		}
		if (left_button)
		{
			keybind_to_change = PLAYER_keybinds.left;
			audio_play_sound(snd_click, 1, 0);
			change_vk_keybind = true;
		}
		if (jump_button)
		{
			keybind_to_change = PLAYER_keybinds.jump;
			audio_play_sound(snd_click, 1, 0);
			change_vk_keybind = true;
		}
		if (dash_button)
		{
			keybind_to_change = PLAYER_keybinds.dash;
			audio_play_sound(snd_click, 1, 0);
			change_vk_keybind = true;
		}
		
		if (back_button
		|| keyboard_check_pressed(global.MENU_exit_key)
		|| gamepad_button_check_pressed(global.device, global.MENU_exit_gp))
		{
			audio_play_sound(snd_click, 1, 0);
			keybind_to_change = PLAYER_keybinds.none;
			change_vk_keybind = false;
			current_menu = options_menu;
		}
	}
}
#endregion

#region options menu
options_menu = function()
{
	// fullscreen button
	var fullscreen_text = window_get_fullscreen() ? "on" : "off";
	
	var fullscreen_button = blockits_draw_button(global.cam_width / 2, 
			                                     global.cam_height / 2 - 50, 
												 "fullscreen: " + fullscreen_text, 
		                                         80, 15, 
												 c_white, c_white, c_white);

	if (fullscreen_button)
	{
		global.is_fullscreen = !global.is_fullscreen;
		window_set_fullscreen(global.is_fullscreen);
		save_game_options_data();
		audio_play_sound(snd_click, 1, 0);
	}
	
	// screen shake button
	var screen_shake_text = global.screen_shake_is_enabled ? "on" : "off";
	
	var screen_shake_button = blockits_draw_button(global.cam_width / 2, 
			                                     global.cam_height / 2 - 30, 
												 "camera shake: " + screen_shake_text, 
		                                         100, 15, 
												 c_white, c_white, c_white);

	if (screen_shake_button)
	{
		global.screen_shake_is_enabled = !global.screen_shake_is_enabled;
		save_game_options_data();
		audio_play_sound(snd_click, 1, 0);
	}
	
	// volume
	var master_volume_down_button = blockits_draw_button(global.cam_width / 2 - 45, 
			                                     global.cam_height / 2 - 10, 
												 "-", 
		                                         30, 15, 
												 c_white, c_white, c_white);
	
	var master_volume_up_button = blockits_draw_button(global.cam_width / 2 + 45, 
					                                global.cam_height / 2 - 10, 
													"+", 
				                                    30, 15, 
													c_white, c_white, c_white);

	if (master_volume_down_button)
	{
		global.master_volume -= 0.1;
		global.master_volume = clamp(global.master_volume, 0, 1);
		audio_master_gain(global.master_volume);
		save_game_options_data();
		audio_play_sound(snd_click, 1, 0);
	}
	
	if (master_volume_up_button)
	{
		global.master_volume += 0.1;
		global.master_volume = clamp(global.master_volume, 0, 1);
		audio_master_gain(global.master_volume);
		save_game_options_data();
		audio_play_sound(snd_click, 1, 0);
	}
	
	var volume_string = string(round(global.master_volume * 10));
	
	blockits_draw_menu_text(global.cam_width / 2, 
					        global.cam_height / 2 - 10, 
						    "volume: " + volume_string,
						    c_white);
	
	// keyboard button
	var keyboard_button = blockits_draw_button(global.cam_width / 2 - 45, 
						                   global.cam_height / 2 + 10, 
										   "keyboard", 
					                       80, 15, 
										   c_white, c_white, c_white);
	if (keyboard_button)
	{
		audio_play_sound(snd_click, 1, 0);
		current_menu = keyboard_menu;
	}
		
	// gamepad button
	var gamepad_button = blockits_draw_button(global.cam_width / 2 + 45, 
						                   global.cam_height / 2 + 10, 
										   "gamepad", 
					                       80, 15, 
										   c_white, c_white, c_white);
	if (gamepad_button)
	{
		audio_play_sound(snd_click, 1, 0);
		current_menu = gamepad_menu;
	}
	
	
	// back button
	var back_button = blockits_draw_button(global.cam_width / 2, 
						                   global.cam_height / 2 + 30, 
										   "back", 
					                       80, 15, 
										   c_white, c_white, c_white);
	if (back_button
		|| keyboard_check_pressed(global.MENU_exit_key)
		|| gamepad_button_check_pressed(global.device, global.MENU_exit_gp))
		{
			audio_play_sound(snd_click, 1, 0);
			current_menu = default_menu;
		}
}
#endregion

#region default menu
default_menu = function()
{
	// resume button
	var resume_button = blockits_draw_button(global.cam_width / 2, 
	                                         global.cam_height / 2 - 40, 
											 "resume", 
                                             80, 15, 
											 c_white, c_white, c_white);

	if (resume_button)
	{
		audio_resume_all();
		global.is_paused = false;
		
		audio_play_sound(snd_click, 1, 0);
	}
	
	// nexus button
	var nexus_button = blockits_draw_button(global.cam_width / 2, 
	                                         global.cam_height / 2 - 20, 
											 "nexus", 
                                             80, 15, 
											 c_white, c_white, c_white);

	if (nexus_button)
	{
		if (room != rm_nexus)
		{
			if (!instance_exists(obj_room_transition))
			{
				var transition = instance_create_layer(0, 0, 
					                                "controllers", 
													obj_room_transition);
			
				transition.room_to_go = rm_nexus;
				switch (room)
				{
					case rm_jungle:
						transition.xto = 1228;
						transition.yto = 704;
						break;
					case rm_mountain:
						transition.xto = 156;
						transition.yto = 472;
						break;
					case rm_library:
						transition.xto = 800;
						transition.yto = 488;
						break;
					case rm_playground:
						transition.xto = 1476;
						transition.yto = 264;
						break;
					case rm_bonus_1:
						transition.xto = 200;
						transition.yto = 872;
						break;
					case rm_bonus_2:
						transition.xto = 200;
						transition.yto = 872;
						break;
				}
			}
		}
		global.is_paused = false;
		audio_play_sound(snd_click, 1, 0);
	}
	
	// options button
	var options_button = blockits_draw_button(global.cam_width / 2, 
			                                  global.cam_height / 2, 
											  "options", 
		                                      80, 15, 
											  c_white, c_white, c_white);

	if (options_button)
	{
		current_menu = options_menu;
		audio_play_sound(snd_click, 1, 0);
	}
	

	// exit to main menu button
	var exit_to_main_menu_button = blockits_draw_button(global.cam_width / 2, 
				                                       global.cam_height / 2 + 20, 
													   "main menu", 
			                                           80, 15, 
													   c_white, c_white, c_white);

	if (exit_to_main_menu_button)
	{
		save_game_data(global.current_save_slot);
		
		room_goto(rm_main_menu);
		obj_player.player_state = obj_player.on_main_menu_state;
		obj_player.x = 0;
		obj_player.y = 0;
		global.is_paused = false;
		
		audio_play_sound(snd_click, 1, 0);
	}
	
	// exit game button
	var exit_button = blockits_draw_button(global.cam_width / 2, 
	                                       (global.cam_height / 2) + 40, 
										   "exit game", 
                                           80, 15, 
										   c_white, c_white, c_white);

	if (exit_button)
	{
		game_end();
	}
}
#endregion

current_menu = default_menu;