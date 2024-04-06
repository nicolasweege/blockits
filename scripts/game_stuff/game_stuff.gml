function set_initial_game_stuff()
{
    game_set_speed(60, gamespeed_fps);
    // display_reset(0, true);
    gpu_set_texfilter(false);
    randomize();
    
    // window and res stuff
    window_set_cursor(cr_none);
    display_set_gui_size(VIEW_W, VIEW_H);
    window_set_min_width(VIEW_W);
    window_set_min_height(VIEW_H);
    
    // repositioning the window in the center of the monitor.
    window_set_position(((display_get_width() / 2) - (window_get_width() / 2)), 
                        ((display_get_height() / 2) - (window_get_height() / 2)));
    
    load_game_options_data();
}