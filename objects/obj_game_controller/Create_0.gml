set_initial_game_stuff();

// layer stuff
layer_set_visible("default_colliders", false);
layer_set_visible("death_colliders", false);
layer_set_visible("checkpoints", false);
layer_set_visible("level_changers", false);
layer_set_visible("camera_masks", false);
layer_set_visible("camera_offset_masks", false);
can_show_debug_layers = false;

if (global.use_scene_bloom_and_vignette)
{
	if (layer_exists("foreground_scene_bloom"))
	{
		layer_set_visible("foreground_scene_bloom", true);
	}
	if (layer_exists("foreground_scene_bloom_vignette"))
	{
		layer_set_visible("foreground_scene_bloom_vignette", true);
	}
}

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

// debug information draw stuff
debug_info_text_size = 0.15;

// menu stuff
change_vk_keybind = false;
change_gp_keybind = false;
keybind_to_change = PLAYER_keybinds.none;

menu_index                 = 1;
current_button_options     = 0;
current_language_option    = global.current_language_in_use;
use_mouse_button_selection = false;

// @gamepad menu
gamepad_menu = function()
{
	current_button_options = 7;
	
	var up_button_selected    = false;
	var down_button_selected  = false;
	var right_button_selected = false;
	var left_button_selected  = false;
	var jump_button_selected  = false;
	var dash_button_selected  = false;
	var back_button_selected  = false;
	
	switch (menu_index)
	{
        case 1:
            up_button_selected = true;
        break;
        
        case 2:
            down_button_selected = true;
        break;
        
        case 3:
            right_button_selected = true;
        break;
        
        case 4:
            left_button_selected = true;
        break;
        
        case 5:
            jump_button_selected = true;
        break;
        
        case 6:
            dash_button_selected = true;
        break;
        
        case 7:
            back_button_selected = true;
        break;
	}
	
	// buttons
	// UP button
	var up_button = blockits_draw_button(global.cam_width / 2 - 40, 
			                             global.cam_height / 2 - 60, 
										 global.MENU_current_up_text + ": ", 
		                                 80, 15, 
										 c_white, c_white, c_white,
										 up_button_selected);
										
	// DOWN button
	var down_button = blockits_draw_button(global.cam_width / 2 - 40, 
			                               global.cam_height / 2 - 40, 
										   global.MENU_current_down_text + ": ", 
		                                   80, 15, 
										   c_white, c_white, c_white,
										   down_button_selected);
										
	// RIGHT button
	var right_button = blockits_draw_button(global.cam_width / 2 - 40, 
			                                global.cam_height / 2 - 20, 
										    global.MENU_current_right_text + ": ", 
		                                    80, 15, 
										    c_white, c_white, c_white,
											right_button_selected);
										
	// LEFT button
	var left_button = blockits_draw_button(global.cam_width / 2 - 40, 
				                           global.cam_height / 2, 
										   global.MENU_current_left_text + ": ", 
			                               80, 15, 
										   c_white, c_white, c_white,
										   left_button_selected);
										   
	// JUMP button
	var jump_button = blockits_draw_button(global.cam_width / 2 - 40, 
				                           global.cam_height / 2 + 20, 
										   global.MENU_current_jump_text + ": ", 
			                               80, 15, 
										   c_white, c_white, c_white,
										   jump_button_selected);
										   
	// DASH button
	var dash_button = blockits_draw_button(global.cam_width / 2 - 40, 
				                           global.cam_height / 2 + 40, 
										   global.MENU_current_dash_text + ": ", 
			                               80, 15, 
										   c_white, c_white, c_white,
										   dash_button_selected);
										
	// back button
	var back_button = blockits_draw_button(global.cam_width / 2, 
						                   global.cam_height / 2 + 60, 
										   global.MENU_current_back_text, 
					                       80, 15, 
										   c_white, c_white, c_white,
										   back_button_selected);
										   
	// drawing keybinds text
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
                        exit;
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
                        exit;
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
                        exit;
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
                        exit;
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
                        exit;
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
                        exit;
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
			menu_index = 1;
			current_menu = options_menu;
		}
	}
}

// @keyboard menu
keyboard_menu = function()
{
	current_button_options = 7;
	
	var up_button_selected    = false;
	var down_button_selected  = false;
	var right_button_selected = false;
	var left_button_selected  = false;
	var jump_button_selected  = false;
	var dash_button_selected  = false;
	var back_button_selected  = false;
	
	switch (menu_index)
	{
        case 1:
            up_button_selected = true;
        break;
        
        case 2:
            down_button_selected = true;
        break;
        
        case 3:
            right_button_selected = true;
        break;
        
        case 4:
            left_button_selected = true;
        break;
        
        case 5:
            jump_button_selected = true;
        break;
        
        case 6:
            dash_button_selected = true;
        break;
        
        case 7:
            back_button_selected = true;
        break;
	}
	
	// buttons
	// UP button
	var up_button = blockits_draw_button(global.cam_width / 2 - 40, 
			                             global.cam_height / 2 - 60, 
										 global.MENU_current_up_text + ": ", 
		                                 80, 15, 
										 c_white, c_white, c_white,
										 up_button_selected);
										
	// DOWN button
	var down_button = blockits_draw_button(global.cam_width / 2 - 40, 
			                               global.cam_height / 2 - 40, 
										   global.MENU_current_down_text + ": ", 
		                                   80, 15, 
										   c_white, c_white, c_white,
										   down_button_selected);
										
	// RIGHT button
	var right_button = blockits_draw_button(global.cam_width / 2 - 40, 
			                                global.cam_height / 2 - 20, 
										    global.MENU_current_right_text + ": ", 
		                                    80, 15, 
										    c_white, c_white, c_white,
											right_button_selected);
										
	// LEFT button
	var left_button = blockits_draw_button(global.cam_width / 2 - 40, 
				                           global.cam_height / 2, 
										   global.MENU_current_left_text + ": ", 
			                               80, 15, 
										   c_white, c_white, c_white,
										   left_button_selected);
										   
	// JUMP button
	var jump_button = blockits_draw_button(global.cam_width / 2 - 40, 
				                           global.cam_height / 2 + 20, 
										   global.MENU_current_jump_text + ": ", 
			                               80, 15, 
										   c_white, c_white, c_white,
										   jump_button_selected);
										   
	// DASH button
	var dash_button = blockits_draw_button(global.cam_width / 2 - 40, 
				                           global.cam_height / 2 + 40, 
										   global.MENU_current_dash_text + ": ", 
			                               80, 15, 
										   c_white, c_white, c_white,
										   dash_button_selected);
										
	// back button
	var back_button = blockits_draw_button(global.cam_width / 2, 
						                   global.cam_height / 2 + 60, 
										   global.MENU_current_back_text, 
					                       80, 15, 
										   c_white, c_white, c_white,
										   back_button_selected);								   
	// drawing keybinds text
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
                        exit;
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
                        exit;
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
                        exit;
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
                        exit;
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
                        exit;
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
                        exit;
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
			menu_index = 1;
			current_menu = options_menu;
		}
	}
}

// @options menu
options_menu = function()
{
	current_button_options = 7;
	
	var language_button_selected           = false;
	var language_left_button_selected      = false;
    var language_right_button_selected     = false;
	
	var fullscreen_buttons_selected        = false;
	var fullscreen_right_button_selected   = false;
	var fullscreen_left_button_selected    = false;
	
	var screen_shake_buttons_selected      = false;
	var screen_shake_right_button_selected = false;
	var screen_shake_left_button_selected  = false;
	
	var volume_buttons_selected            = false
	var volume_right_button_selected       = false;
	var volume_left_button_selected        = false;
	
	var keyboard_button_selected           = false;
	var gamepad_button_selected            = false;
	var back_button_selected               = false;
	
    switch (menu_index)
    {
        case 1:
            language_button_selected = true;
            
            if (menu_right)
            {
                language_left_button_selected  = false;
                language_right_button_selected = true;
            }
            else if (menu_left)
            {
                language_left_button_selected  = true;
                language_right_button_selected = false;
            }
            else
            {
                language_left_button_selected  = false;
                language_right_button_selected = false;
            }
        break;
        
        case 2:
            fullscreen_buttons_selected = true;
            
            if (menu_right)
            {
                fullscreen_left_button_selected  = false;
                fullscreen_right_button_selected = true;
            }
            else if (menu_left)
            {
                fullscreen_left_button_selected  = true;
                fullscreen_right_button_selected = false;
            }
            else
            {
                fullscreen_left_button_selected  = false;
                fullscreen_right_button_selected = false;
            }
        break;
        
        case 3:
            screen_shake_buttons_selected = true;
            
            if (menu_right)
            {
                screen_shake_left_button_selected  = false;
                screen_shake_right_button_selected = true;
            }
            else if (menu_left)
            {
                screen_shake_left_button_selected  = true;
                screen_shake_right_button_selected = false;
            }
            else
            {
                screen_shake_left_button_selected  = false;
                screen_shake_right_button_selected = false;
            }
        break;
        
        case 4:
            volume_buttons_selected = true;
            
            if (menu_right)
            {
                volume_left_button_selected  = false;
                volume_right_button_selected = true;
            }
            else if (menu_left)
            {
                volume_left_button_selected  = true;
                volume_right_button_selected = false;
            }
            else
            {
                volume_left_button_selected  = false;
                volume_right_button_selected = false;
            }
        break;
        
        case 5:
            keyboard_button_selected = true;
        break;
        
        case 6:
            gamepad_button_selected = true;
        break;
        
        case 7:
            back_button_selected = true;
        break;
    }
	
	// language button
	var language_button = blockits_draw_button(global.cam_width / 2, 
		                                       global.cam_height / 2 - 60, 
											   global.MENU_current_language_text + 
											   ": " + global.MENU_current_language_in_use_text, 
	                                           80, 15, 
											   c_white, c_white, c_white,
											   language_button_selected);
    
    if (language_right_button_selected)
    {
        if (current_language_option >= (MENU_current_language.count - 1))
        {
            current_language_option = 0;
        }
        else
        {
            current_language_option += 1;
        }
        
        global.current_language_in_use = current_language_option;
        MENU_change_language(global.current_language_in_use);
        
        save_game_options_data();
        audio_play_sound(snd_click, 1, 0);
    }
    
    if (language_left_button_selected)
    {
        if (current_language_option <= 0)
        {
            current_language_option = (MENU_current_language.count - 1);
        }
        else
        {
            current_language_option -= 1;
        }
        
        global.current_language_in_use = current_language_option;
        MENU_change_language(global.current_language_in_use);
        
        save_game_options_data();
        audio_play_sound(snd_click, 1, 0);
    }
	
	// fullscreen button
	var fullscreen_text = window_get_fullscreen() ? global.MENU_current_on_text 
	: global.MENU_current_off_text;
	
	var fullscreen_button = blockits_draw_button(global.cam_width / 2, 
			                                     global.cam_height / 2 - 40, 
												 global.MENU_current_fullscreen_text + 
												 ": " + fullscreen_text, 
		                                         80, 15, 
												 c_white, c_white, c_white,
												 fullscreen_buttons_selected);
	
    if (fullscreen_right_button_selected
        && !global.is_fullscreen)
    {
        global.is_fullscreen = true;
        window_set_fullscreen(global.is_fullscreen);
        display_set_gui_size(VIEW_W, VIEW_H);
        
        save_game_options_data();
        audio_play_sound(snd_click, 1, 0);
    }
    
    if (fullscreen_left_button_selected
        && global.is_fullscreen)
    {
        global.is_fullscreen = false;
        window_set_fullscreen(global.is_fullscreen);
        display_set_gui_size(VIEW_W, VIEW_H);
        window_set_size((VIEW_W * 5), (VIEW_H * 5)); // rezising the window to 1600x900.
        
        // repositioning the window in the center of the monitor.
        window_set_position(((display_get_width() / 2) - (window_get_width() / 2)), 
                            ((display_get_height() / 2) - (window_get_height() / 2)));
        
        save_game_options_data();
        audio_play_sound(snd_click, 1, 0);
    }
	
	// screen shake button
	var screen_shake_text = global.screen_shake_is_enabled ? global.MENU_current_on_text 
	: global.MENU_current_off_text;
	
	var screen_shake_button = blockits_draw_button(global.cam_width / 2, 
			                                       global.cam_height / 2 - 20, 
												   global.MENU_current_screen_shake_text + 
												   ": " + screen_shake_text, 
		                                           100, 15, 
												   c_white, c_white, c_white,
												   screen_shake_buttons_selected);

    /*
    	if (screen_shake_button)
    	{
    		global.shake_length = 0;
    		global.shake_magnitude = 0;
    		global.shake_remain = 0;
    		global.screen_shake_is_enabled = !global.screen_shake_is_enabled;
    		save_game_options_data();
    		audio_play_sound(snd_click, 1, 0);
    	}
	*/
	
	if (screen_shake_right_button_selected
	    && !global.screen_shake_is_enabled)
	{
		global.shake_length = 0;
		global.shake_magnitude = 0;
		global.shake_remain = 0;
		global.screen_shake_is_enabled = true;
		save_game_options_data();
		audio_play_sound(snd_click, 1, 0);
	}
	
	if (screen_shake_left_button_selected
	    && global.screen_shake_is_enabled)
    {
        global.shake_length = 0;
		global.shake_magnitude = 0;
		global.shake_remain = 0;
		global.screen_shake_is_enabled = false;
		save_game_options_data();
		audio_play_sound(snd_click, 1, 0);
    }
	
	// volume
	var master_volume_down_button = blockits_draw_button(global.cam_width / 2 - 45, 
			                                             global.cam_height / 2, 
												         "-", 
		                                                 30, 15, 
												         c_white, c_white, c_white,
												         volume_buttons_selected);
	
	var master_volume_up_button = blockits_draw_button(global.cam_width / 2 + 45, 
					                                   global.cam_height / 2, 
													   "+", 
				                                       30, 15, 
													   c_white, c_white, c_white,
													   volume_buttons_selected);
    
    if (volume_right_button_selected
	    && global.master_volume < 1)
	{
		global.master_volume += 0.1;
		global.master_volume = clamp(global.master_volume, 0, 1);
		audio_master_gain(global.master_volume);
		save_game_options_data();
		audio_play_sound(snd_click, 1, 0);
	}
    
	if (volume_left_button_selected
	    && global.master_volume > 0)
	{
		global.master_volume -= 0.1;
		global.master_volume = clamp(global.master_volume, 0, 1);
		audio_master_gain(global.master_volume);
		save_game_options_data();
		audio_play_sound(snd_click, 1, 0);
	}
	
	var volume_string = string(round(global.master_volume * 10));
						    
    blockits_draw_selectable_menu_text(global.cam_width / 2, 
                                       global.cam_height / 2, 
                                       global.MENU_current_volume_text + 
                                       ": " + volume_string, 
                                       c_white, c_white, c_white, 
                                       volume_buttons_selected)
	
	// keyboard button
	var keyboard_button = blockits_draw_button(global.cam_width / 2, 
						                       global.cam_height / 2 + 20, 
										       global.MENU_current_keyboard_text, 
					                           80, 15, 
										       c_white, c_white, c_white,
										       keyboard_button_selected);
	if (keyboard_button)
	{
		audio_play_sound(snd_click, 1, 0);
		menu_index = 1;
		current_menu = keyboard_menu;
	}
		
	// gamepad button
	var gamepad_button = blockits_draw_button(global.cam_width / 2, 
						                      global.cam_height / 2 + 40, 
										      global.MENU_current_gamepad_text, 
					                          80, 15, 
										      c_white, c_white, c_white,
										      gamepad_button_selected);
	if (gamepad_button)
	{
		audio_play_sound(snd_click, 1, 0);
		menu_index = 1;
		current_menu = gamepad_menu;
	}
	
	// back button
	var back_button = blockits_draw_button(global.cam_width / 2, 
						                   global.cam_height / 2 + 60, 
										   global.MENU_current_back_text, 
					                       80, 15, 
										   c_white, c_white, c_white,
										   back_button_selected);
	if (back_button
		|| keyboard_check_pressed(global.MENU_exit_key)
		|| gamepad_button_check_pressed(global.device, global.MENU_exit_gp))
    {
    	audio_play_sound(snd_click, 1, 0);
    	menu_index = 1;
    	current_menu = default_menu;
    }
}

// @default menu
default_menu = function()
{
    current_button_options = 4;
	
	var nexus_button_selected             = false;
	var options_button_selected           = false;
	var exit_to_main_menu_button_selected = false;
	var exit_button_selected              = false;
	
    switch (menu_index)
    {
        case 1:
            nexus_button_selected = true;
        break;
        
        case 2:
            options_button_selected = true;
        break;
        
        case 3:
            exit_to_main_menu_button_selected = true;
        break;
        
        case 4:
            exit_button_selected = true;
        break;
    }
	
	/*
    	// resume button
    	var resume_button = blockits_draw_button(global.cam_width / 2, 
    	                                         global.cam_height / 2 - 50, 
    											 global.MENU_current_resume_text, 
                                                 80, 15, 
    											 c_white, c_white, c_white);
    
    	if (resume_button)
    	{
    		audio_resume_all();
    		global.is_paused = false;
    		
    		audio_play_sound(snd_click, 1, 0);
    	}
	*/
	
	// nexus button
	var nexus_button = blockits_draw_button(global.cam_width / 2, 
	                                        global.cam_height / 2 - 30, 
											global.MENU_current_nexus_text, 
                                            80, 15, 
											c_white, c_white, c_white,
											nexus_button_selected);
    
    // @TODO @Incomplete: fix the bug when the player goes to the nexus area
    // from the menu option (related to the player being in the 'obj_capsule',
    // and the 'obj_slab_collider' trying to access the 'current_player_capsule' variable).
    if (nexus_button)
    {   
        if (room != rm_nexus)
        {
            with (obj_player)
            {
                h_speed = 0;
                v_speed = 0;
                jump_pressed = 0;
                coyote_can_jump = 0;
                jump_buffer_counter = 0;
                can_jumper_dash_timer = 0;
                can_dash = 1;
                
                if (current_player_capsule)
                {
                    current_player_capsule.current_state = 
                    current_player_capsule.lock_state;
                    current_player_capsule = 0;
                }
            }
        
            if (!instance_exists(obj_room_transition))
            {
                var transition = 
                instance_create_layer(0, 0, "controllers", obj_room_transition);
                
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
			                                  global.cam_height / 2 - 10, 
											  global.MENU_current_options_text, 
		                                      80, 15, 
											  c_white, c_white, c_white,
											  options_button_selected);

    if (options_button)
    {   
        audio_play_sound(snd_click, 1, 0);
        menu_index = 1;
        current_menu = options_menu;
    }
	

	// exit to main menu button
	var exit_to_main_menu_button = blockits_draw_button(global.cam_width / 2, 
				                                        global.cam_height / 2 + 10, 
													    global.MENU_current_exit_to_main_menu_text, 
			                                            80, 15, 
													    c_white, c_white, c_white,
													    exit_to_main_menu_button_selected);

    if (exit_to_main_menu_button)
    {   
        save_game_data(global.current_save_slot);
        
        room_goto(rm_main_menu);
        
        with (obj_player)
        {
            x = 0;
            y = 0;
            h_speed = 0;
            v_speed = 0;
            jump_pressed = 0;
        	coyote_can_jump = 0;
        	jump_buffer_counter = 0;
        	can_jumper_dash_timer = 0;
        	can_dash = 1;
        	player_state = on_main_menu_state;
        }
        
        global.is_paused = false;
        audio_play_sound(snd_click, 1, 0);
    }
	
	// exit game button
	var exit_button = blockits_draw_button(global.cam_width / 2, 
	                                       (global.cam_height / 2) + 30, 
										   global.MENU_current_exit_game_text, 
                                           80, 15, 
										   c_white, c_white, c_white,
										   exit_button_selected);

	if (exit_button)
	{
		game_end();
	}
}

current_menu = default_menu;