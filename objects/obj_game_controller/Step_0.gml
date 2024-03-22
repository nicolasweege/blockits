if (room == rm_main_menu)
{
	exit;
}

// pausing
if ((keyboard_check_pressed(global.MENU_pause_key)
    || gamepad_button_check_pressed(global.device, global.MENU_pause_gp))
	&& !global.is_paused)
{
	global.is_paused = true;
	exit;
}

if ((keyboard_check_pressed(global.MENU_exit_key)
    || gamepad_button_check_pressed(global.device, global.MENU_exit_gp))
    && global.is_paused
	&& current_menu == default_menu)
{
	audio_resume_all();
	global.is_paused = false;
}

// debug keybindings
// turning on/off colliders and checkpoit triggers
if (keyboard_check_pressed(vk_f1))
{
	can_show_debug_layers = !can_show_debug_layers;
	
	layer_set_visible("default_colliders", can_show_debug_layers);
	layer_set_visible("death_colliders", can_show_debug_layers);
	layer_set_visible("checkpoints", can_show_debug_layers);
	layer_set_visible("level_changers", can_show_debug_layers);
	layer_set_visible("camera_offset_masks", can_show_debug_layers);
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

// toggle using scene bloom effects
if (keyboard_check_pressed(vk_f4))
{
	global.use_scene_bloom_and_vignette = !global.use_scene_bloom_and_vignette;
	
	if (layer_exists("foreground_scene_bloom"))
	{
		layer_set_visible("foreground_scene_bloom", !layer_get_visible("foreground_scene_bloom"));
	}
	if (layer_exists("foreground_scene_bloom_vignette"))
	{
		layer_set_visible("foreground_scene_bloom_vignette", !layer_get_visible("foreground_scene_bloom_vignette"));
	}
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


// showing cursor
if (global.is_paused)
{
	window_set_cursor(cr_default);
}
else
{
	window_set_cursor(cr_none);
}