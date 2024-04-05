function set_initial_game_stuff()
{
    window_set_cursor(cr_none);
	game_set_speed(60, gamespeed_fps);
	// display_reset(0, true);
	gpu_set_texfilter(false);
	randomize();
	display_set_gui_size(VIEW_W, VIEW_H);
	load_game_options_data();
}