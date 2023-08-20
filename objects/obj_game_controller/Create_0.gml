game_set_speed(60, gamespeed_fps);
randomize();

display_set_gui_size(VIEW_W, VIEW_H);


// layer stuff
layer_set_visible("default_colliders", false);
layer_set_visible("checkpoints", false);
layer_set_visible("camera_masks", false);


// debug stuff
show_debug_overlay(false);
show_debug_info = false;


// setting up audio stuff
audio_falloff_set_model(audio_falloff_linear_distance);
audio_listener_orientation(0, 1, 0, 0, 0, 1);

// ambience sound testing
// audio_play_sound(snd_endscene, 1, 1);
current_song = choose(snd_a_song_for_the_empty_world,
	                      snd_ghost, 
						  snd_good_piano_song_1, 
						  snd_sky_lantern, 
						  snd_the_rain_that_never_stops, 
						  snd_the_spring_is_far);

// audio_play_sound(current_song, 1, 0);





