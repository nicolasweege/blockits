set_initial_game_stuff();

// layer stuff
layer_set_visible("default_colliders", false);
layer_set_visible("death_colliders", false);
layer_set_visible("checkpoints", false);
layer_set_visible("camera_masks", false);
can_show_debug_layers = false;

// debug stuff
show_debug_overlay(false);
show_debug_info = false;


// setting up audio stuff
audio_falloff_set_model(audio_falloff_linear_distance);
audio_listener_orientation(0, 1, 0, 0, 0, 1);

// ambience sound testing
// audio_play_sound(snd_endscene, 1, 1);

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
#region gamepad menu
gamepad_menu = function()
{
	// UP button
	var up_button = blockits_draw_button(global.cam_width / 2, 
			                            global.cam_height / 2 - 10, 
										"up", 
		                                80, 15, 
										c_white, c_white, c_white);

	if (up_button)
	{
		
		audio_play_sound(snd_click, 1, 0);
	}
	
	// back button
	var back_button = blockits_draw_button(global.cam_width / 2, 
						                   global.cam_height / 2 + 10, 
										   "back", 
					                       80, 15, 
										   c_white, c_white, c_white);
	if (back_button
		|| keyboard_check_pressed(vk_escape)
		|| gamepad_button_check_pressed(global.device, gp_face1))
		{
			current_menu = options_menu;
			
			audio_play_sound(snd_click, 1, 0);
		}
}
#endregion

#region keyboard menu
keyboard_menu = function()
{
	// UP button
	var up_button = blockits_draw_button(global.cam_width / 2, 
			                            global.cam_height / 2 - 10, 
										"up", 
		                                80, 15, 
										c_white, c_white, c_white);

	if (up_button)
	{
		
		audio_play_sound(snd_click, 1, 0);
	}
	
	// back button
	var back_button = blockits_draw_button(global.cam_width / 2, 
						                   global.cam_height / 2 + 10, 
										   "back", 
					                       80, 15, 
										   c_white, c_white, c_white);
	if (back_button
		|| keyboard_check_pressed(vk_escape)
		|| gamepad_button_check_pressed(global.device, gp_face1))
		{
			current_menu = options_menu;
			
			audio_play_sound(snd_click, 1, 0);
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
		current_menu = keyboard_menu;
			
		audio_play_sound(snd_click, 1, 0);
	}
		
	// gamepad button
	var gamepad_button = blockits_draw_button(global.cam_width / 2 + 45, 
						                   global.cam_height / 2 + 10, 
										   "gamepad", 
					                       80, 15, 
										   c_white, c_white, c_white);
	if (gamepad_button)
	{
		current_menu = gamepad_menu;
			
		audio_play_sound(snd_click, 1, 0);
	}
	
	// back button
	var back_button = blockits_draw_button(global.cam_width / 2, 
						                   global.cam_height / 2 + 30, 
										   "back", 
					                       80, 15, 
										   c_white, c_white, c_white);
	if (back_button
		|| keyboard_check_pressed(vk_escape)
		|| gamepad_button_check_pressed(global.device, gp_face1))
		{
			current_menu = default_menu;
			
			audio_play_sound(snd_click, 1, 0);
		}
}
#endregion

#region default menu
default_menu = function()
{
	// resume button
	var resume_button = blockits_draw_button(global.cam_width / 2, 
	                                         global.cam_height / 2 - 30, 
											 "resume", 
                                             80, 15, 
											 c_white, c_white, c_white);

	if (resume_button)
	{
		audio_resume_all();
		global.is_paused = false;
		
		audio_play_sound(snd_click, 1, 0);
	}
	
	// options button
	var options_button = blockits_draw_button(global.cam_width / 2, 
			                                  global.cam_height / 2 - 10, 
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
	                                       global.cam_height / 2 + 10, 
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
	                                       (global.cam_height / 2) + 30, 
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