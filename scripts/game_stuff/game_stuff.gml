function set_initial_game_stuff()
{
	game_set_speed(60, gamespeed_fps);
	display_reset(0, true);
	gpu_set_texfilter(false);
	randomize();
	display_set_gui_size(VIEW_W, VIEW_H);
	
	audio_master_gain(0.0);
}