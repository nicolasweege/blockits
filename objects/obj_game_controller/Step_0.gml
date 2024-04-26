// handling cursor
if (obj_player.player_state == obj_player.god_mode_state)
{
    if (obj_camera.can_drag_camera)
    {
        window_set_cursor(cr_size_all);
        // window_set_cursor(cr_handpoint);
    }
    else
    {
        window_set_cursor(cr_default);
    }
}
else
{
    if (global.app_state == states.EDITOR)
    {
        window_set_cursor(cr_default);
    }
    else
    {
        window_set_cursor(cr_none);
    }
}

if (room == MAIN_MENU_ROOM)
{
    exit;
}

// Pausing
if ((keyboard_check_pressed(global.MENU_pause_key)
    || gamepad_button_check_pressed(global.gamepad_device, global.MENU_pause_gp))
	&& global.app_state == states.GAME)
{   
	global.app_state = states.PAUSE_MENU;
	exit;
}

/*
	if (!window_has_focus())
	{
		global.app_state = states.PAUSE_MENU;
	}
*/

if ((keyboard_check_pressed(global.MENU_exit_key)
    || gamepad_button_check_pressed(global.gamepad_device, global.MENU_exit_gp))
    && global.app_state == states.PAUSE_MENU
	&& obj_pause_menu.current_menu == obj_pause_menu.default_menu)
{
	audio_resume_all();
	global.app_state = states.GAME;
}

// audio stuff
audio_listener_position(obj_player.x, obj_player.y, 0);

/*
    if (!audio_is_playing(current_song))
    {
    	current_song = choose(snd_a_song_for_the_empty_world,
    	                      snd_ghost, 
    						  snd_good_piano_song_1, 
    						  snd_sky_lantern, 
    						  snd_the_rain_that_never_stops, 
    						  snd_the_spring_is_far);
    	
    	audio_play_sound(current_song, 1, 0);
    }
*/

/*    
    audio_listener_position(global.camx + (global.cam_width / 2), 
                            global.camy + (global.cam_height / 2), 
    						0);
*/