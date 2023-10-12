if (room == rm_main_menu)
{
	exit;
}

if (keyboard_check_pressed(vk_escape)
    || gamepad_button_check_pressed(global.device, gp_start))
{
	if (global.console_enabled)
	{
		global.console_enabled = false;
	}
	else
	{
		global.is_paused = !global.is_paused;
		
		if (!global.is_paused)
		{
			audio_resume_all();
		}
		else
		{
			audio_pause_all();
		}
	}
}

if (global.is_paused 
    && gamepad_button_check_pressed(global.device, gp_face2))
{
	global.is_paused = false;
	audio_resume_all();
}

// enabling console
/*
if (keyboard_check_pressed(vk_f7) && instance_exists(obj_console) 
    && !global.is_paused)
{
	global.console_enabled = !global.console_enabled;
}
*/

// fullscreen
if (keyboard_check_pressed(vk_f4))
{
	window_set_fullscreen(!window_get_fullscreen());
}

// debug keybindings
// turning on/off colliders and checkpoit triggers
if (keyboard_check_pressed(vk_f1))
{
	can_show_debug_layers = !can_show_debug_layers;
	
	layer_set_visible("default_colliders", can_show_debug_layers);
	layer_set_visible("death_colliders", can_show_debug_layers);
	layer_set_visible("checkpoints", can_show_debug_layers);
}

// turning on/off player
if (keyboard_check_pressed(vk_f2))
{
	layer_set_visible("player", !layer_get_visible("player"));
}

// showing debug overlay
if (keyboard_check_pressed(vk_f3))
{
	show_debug_info = !show_debug_info;
	show_debug_overlay(show_debug_info);
}


// audio stuff
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


if (instance_exists(obj_player))
{
	audio_listener_position(obj_player.x, obj_player.y, 0);
}


// boring stuff
if (global.is_paused)
{
	window_set_cursor(cr_default);
}
else
{
	if (gamepad_button_check_pressed(global.device, gp_face1)         || gamepad_button_check(global.device, gp_face1)
	    || gamepad_button_check_pressed(global.device, gp_face2)      || gamepad_button_check(global.device, gp_face2)
		|| gamepad_button_check_pressed(global.device, gp_face3)      || gamepad_button_check(global.device, gp_face3)
		|| gamepad_button_check_pressed(global.device, gp_face4)      || gamepad_button_check(global.device, gp_face4)
		|| gamepad_button_check_pressed(global.device, gp_shoulderl)  || gamepad_button_check(global.device, gp_shoulderl)
		|| gamepad_button_check_pressed(global.device, gp_shoulderlb) || gamepad_button_check(global.device, gp_shoulderlb)
		|| gamepad_button_check_pressed(global.device, gp_shoulderr)  || gamepad_button_check(global.device, gp_shoulderr)
		|| gamepad_button_check_pressed(global.device, gp_shoulderrb) || gamepad_button_check(global.device, gp_shoulderrb)
		|| gamepad_button_check_pressed(global.device, gp_select)     || gamepad_button_check(global.device, gp_select)
		|| gamepad_button_check_pressed(global.device, gp_start)      || gamepad_button_check(global.device, gp_start)
		|| gamepad_button_check_pressed(global.device, gp_stickl)     || gamepad_button_check(global.device, gp_stickl)
		|| gamepad_button_check_pressed(global.device, gp_stickr)     || gamepad_button_check(global.device, gp_stickr)
		|| gamepad_button_check_pressed(global.device, gp_padu)       || gamepad_button_check(global.device, gp_padu)
		|| gamepad_button_check_pressed(global.device, gp_padd)       || gamepad_button_check(global.device, gp_padd)
		|| gamepad_button_check_pressed(global.device, gp_padl)       || gamepad_button_check(global.device, gp_padl)
		|| gamepad_button_check_pressed(global.device, gp_padr)       || gamepad_button_check(global.device, gp_padr)
		|| keyboard_check_pressed(vk_anykey)                          || keyboard_check(vk_anykey))
	{
		window_set_cursor(cr_none);
	}
	else if (mouse_check_button_released(mb_any))
	{
		window_set_cursor(cr_default);
	}	
}