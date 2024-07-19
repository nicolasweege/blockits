// debug stuff
show_debug_overlay(false);

// debug_general_text_size = 0.085;
debug_general_text_size = 0.09;
// debug_info_text_size    = 0.085;
debug_info_text_size    = 0.09;
show_debug_info         = false;
icon_buttons_size       = 0.1;
buttons_yoffset_buffer  = 7;

layer_buttons_xoffset   = 0;
layer_buttons_yoffset   = 0;

// rooms menu
room_buttons_xoffset = 0;
room_buttons_yoffset = 0;

// deactivating layers
layer_set_visible(DEFAULT_COLLIDERS_LAYER, false);
layer_set_visible(DEATH_COLLIDERS_LAYER, false);
layer_set_visible(CHECKPOINTS_LAYER, false);
layer_set_visible(LEVEL_CHANGERS_LAYER, false);

layer_set_visible(CAMERA_MASKS_LAYER, false);
layer_set_visible(CAMERA_OFFSET_MASKS_LAYER, false);

layer_set_visible(FOREGROUND_SCENE_BLOOM_LAYER, false);
layer_set_visible(FOREGROUND_SCENE_VIGNETTE_LAYER, false);
layer_set_visible(BACKGROUND_SCENE_VIGNETTE_LAYER, false);
can_show_debug_layers = false;



//                         ---=== MENUS ===---

// @room debug menu
rooms_menu_state = function()
{
    draw_set_halign(fa_right);
    
    room_buttons_xoffset = 5;
    room_buttons_yoffset = 10;
    
    // BONUS_1 button
    EDITOR_handle_and_draw_rooms_button((VIEW_W - room_buttons_xoffset), room_buttons_yoffset,
                                        BONUS_1_ROOM_NAME, debug_general_text_size,
                                        80, 5,
                                        BONUS_1_ROOM,
                                        true,
                                        false);
    
    // BONUS_2 button
    room_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_rooms_button((VIEW_W - room_buttons_xoffset), room_buttons_yoffset,
                                        BONUS_2_ROOM_NAME, debug_general_text_size,
                                        80, 5,
                                        BONUS_2_ROOM,
                                        true,
                                        false);
    
    // RM_CAPSULE_BONUS button
    room_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_rooms_button((VIEW_W - room_buttons_xoffset), room_buttons_yoffset,
                                        CAPSULE_BONUS_ROOM_NAME, debug_general_text_size,
                                        80, 5,
                                        CAPSULE_BONUS_ROOM,
                                        true,
                                        false);

    // RM_DESTROY_BLOCKS_BONUS button
    room_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_rooms_button((VIEW_W - room_buttons_xoffset), room_buttons_yoffset,
                                        DESTROY_BLOCK_BONUS_ROOM_NAME, debug_general_text_size,
                                        80, 5,
                                        DESTROY_BLOCK_BONUS_ROOM,
                                        true,
                                        false);
    
    // RM_LASER_BEAM_BONUS button
    room_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_rooms_button((VIEW_W - room_buttons_xoffset), room_buttons_yoffset,
                                        LASER_BEAM_BONUS_ROOM_NAME, debug_general_text_size,
                                        80, 5,
                                        LASER_BEAM_BONUS_ROOM,
                                        true,
                                        false);
    
    // RM_MAZE_BONUS button
    room_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_rooms_button((VIEW_W - room_buttons_xoffset), room_buttons_yoffset,
                                        MAZE_BONUS_ROOM_NAME, debug_general_text_size,
                                        80, 5,
                                        MAZE_BONUS_ROOM,
                                        true,
                                        false);
    
    // RM_WALL_DASH_COLLIDER_BONUS button
    room_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_rooms_button((VIEW_W - room_buttons_xoffset), room_buttons_yoffset,
                                        WALL_DASH_COLLIDER_BONUS_ROOM_NAME, debug_general_text_size,
                                        80, 5,
                                        WALL_DASH_COLLIDER_BONUS_ROOM,
                                        true,
                                        false);
    
    // RM_SECRET_1 button
    room_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_rooms_button((VIEW_W - room_buttons_xoffset), room_buttons_yoffset,
                                        SECRET_1_ROOM_NAME, debug_general_text_size,
                                        80, 5,
                                        SECRET_1_ROOM,
                                        true,
                                        false);
    
    // DEBUG_1 button
    room_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_rooms_button((VIEW_W - room_buttons_xoffset), room_buttons_yoffset,
                                        DEBUG_1_ROOM_NAME, debug_general_text_size,
                                        80, 5,
                                        DEBUG_1_ROOM,
                                        true,
                                        false);
    
    // JUNGLE button
    room_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_rooms_button((VIEW_W - room_buttons_xoffset), room_buttons_yoffset,
                                        JUNGLE_ROOM_NAME, debug_general_text_size,
                                        80, 5,
                                        JUNGLE_ROOM,
                                        true,
                                        false);
    
    // LIBRARY button
    room_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_rooms_button((VIEW_W - room_buttons_xoffset), room_buttons_yoffset,
                                        LIBRARY_ROOM_NAME, debug_general_text_size,
                                        80, 5,
                                        LIBRARY_ROOM,
                                        true,
                                        false);
    
    // MOUNTAIN button
    room_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_rooms_button((VIEW_W - room_buttons_xoffset), room_buttons_yoffset,
                                        MOUNTAIN_ROOM_NAME, debug_general_text_size,
                                        80, 5,
                                        MOUNTAIN_ROOM,
                                        true,
                                        false);
    
    // NEXUS button
    room_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_rooms_button((VIEW_W - room_buttons_xoffset), room_buttons_yoffset,
                                        NEXUS_ROOM_NAME, debug_general_text_size,
                                        80, 5,
                                        NEXUS_ROOM,
                                        true,
                                        false);
    
    // PLAYGROUND button
    room_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_rooms_button((VIEW_W - room_buttons_xoffset), room_buttons_yoffset,
                                        PLAYGROUND_ROOM_NAME, debug_general_text_size,
                                        80, 5,
                                        PLAYGROUND_ROOM,
                                        true,
                                        false);

    draw_set_halign(fa_left);
}

// @layers debug menu
layers_menu_state = function()
{
    draw_set_halign(fa_right);
    
    // Layer buttons
    // Checkpoints
    layer_buttons_xoffset = 5;
    layer_buttons_yoffset = 10;
    EDITOR_handle_and_draw_layer_button((VIEW_W - layer_buttons_xoffset), layer_buttons_yoffset,
                                        CHECKPOINTS_LAYER, debug_general_text_size,
                                        80, 5,
                                        CHECKPOINTS_LAYER,
                                        true,
                                        false);
    
    // Level changers
    layer_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_layer_button((VIEW_W - layer_buttons_xoffset), layer_buttons_yoffset,
                                        LEVEL_CHANGERS_LAYER, debug_general_text_size,
                                        80, 5,
                                        LEVEL_CHANGERS_LAYER,
                                        true,
                                        false);
                                        
    // Camera masks
    layer_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_layer_button((VIEW_W - layer_buttons_xoffset), layer_buttons_yoffset,
                                        CAMERA_MASKS_LAYER, debug_general_text_size,
                                        80, 5,
                                        CAMERA_MASKS_LAYER,
                                        true,
                                        false);
    
    // Default colliders
    layer_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_layer_button((VIEW_W - layer_buttons_xoffset), layer_buttons_yoffset,
                                        DEFAULT_COLLIDERS_LAYER, debug_general_text_size,
                                        80, 5,
                                        DEFAULT_COLLIDERS_LAYER,
                                        true,
                                        false);
    
    // Death colliders
    layer_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_layer_button((VIEW_W - layer_buttons_xoffset), layer_buttons_yoffset,
                                        DEATH_COLLIDERS_LAYER, debug_general_text_size,
                                        80, 5,
                                        DEATH_COLLIDERS_LAYER,
                                        true,
                                        false);
    
    // Player
    layer_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_layer_button((VIEW_W - layer_buttons_xoffset), layer_buttons_yoffset,
                                        PLAYER_LAYER, debug_general_text_size,
                                        80, 5,
                                        PLAYER_LAYER,
                                        true,
                                        false);
    
    // Foreground scene bloom
    layer_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_layer_button((VIEW_W - layer_buttons_xoffset), layer_buttons_yoffset,
                                        FOREGROUND_SCENE_BLOOM_LAYER, debug_general_text_size,
                                        80, 5,
                                        FOREGROUND_SCENE_BLOOM_LAYER,
                                        true,
                                        false);
    
    // Foreground scene vignette
    layer_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_layer_button((VIEW_W - layer_buttons_xoffset), layer_buttons_yoffset,
                                        FOREGROUND_SCENE_VIGNETTE_LAYER, debug_general_text_size,
                                        80, 5,
                                        FOREGROUND_SCENE_VIGNETTE_LAYER,
                                        true,
                                        false);
    
    draw_set_halign(fa_left);    
}

// @default debug menu
default_menu_state = function()
{
    
}

// @main debug menu
handle_main_debug_menu = function()
{
    var button_start_ypos = 5;
    
    // exit burron
    var exit_button = EDITOR_draw_icon_button(((VIEW_W / 2) + 12), button_start_ypos,
                                              global.SPRITE_EDITOR_exit_button_icon, 0, 
                                              icon_buttons_size, icon_buttons_size, 
                                              c_white, c_green);
    
    if (exit_button)
    {
        game_end();
    }
    
    // fullscreen burron
    var fullscreen_button = EDITOR_draw_icon_button(((VIEW_W / 2) + 24), button_start_ypos,
                                                    global.SPRITE_EDITOR_fullscreen_button_icon, 0, 
                                                    icon_buttons_size, icon_buttons_size, 
                                                    c_white, c_green);
    
    if (fullscreen_button)
    {
        if (!global.is_fullscreen)
        {
            global.is_fullscreen = true;
            window_set_fullscreen(global.is_fullscreen);
            display_set_gui_size(VIEW_W, VIEW_H);
            
            // @OBS: deveriamos salvar isso?
            // save_game_options_data();
        }
        else
        {
            global.is_fullscreen = false;
            window_set_fullscreen(global.is_fullscreen);
            display_set_gui_size(VIEW_W, VIEW_H);
            window_set_size((VIEW_W * 5), (VIEW_H * 5)); // rezising the window to 1600x900.
            
            // repositioning the window in the center of the monitor.
            window_set_position(((display_get_width() / 2) - (window_get_width() / 2)), 
                                ((display_get_height() / 2) - (window_get_height() / 2)));
            
            // @OBS: deveriamos salvar isso?
            // save_game_options_data();
        }
    }
    
    // grid burron
    var grid_button = EDITOR_draw_icon_button(((VIEW_W / 2) + 36), button_start_ypos,
                                              global.SPRITE_EDITOR_grid_button_icon_icon, 0, 
                                              icon_buttons_size, icon_buttons_size, 
                                              c_white, c_green);
    
    if (grid_button)
    {
        global.DEBUG_use_grid = !global.DEBUG_use_grid;
    }
    
    // debug info
    var debug_info_button = EDITOR_draw_icon_button((VIEW_W / 2), button_start_ypos,
                                                    global.SPRITE_EDITOR_info_button_icon, 0,
                                                    icon_buttons_size, icon_buttons_size,
                                                    c_white, c_green);
    
    if (debug_info_button)
    {
        if (show_debug_info)
        {
            show_debug_info = false;
        }
        else
        {
            show_debug_info = true;
        }
        
        show_debug_overlay(show_debug_info);
    }
    
    // layers menu
    var layers_menu_button = EDITOR_draw_icon_button(((VIEW_W / 2) - 12), button_start_ypos,
                                                   global.SPRITE_EDITOR_layers_buttons_icon, 0,
                                                   icon_buttons_size, icon_buttons_size,
                                                   c_white, c_green);
    
    if (layers_menu_button)
    {
        if (current_debug_menu_state == layers_menu_state)
        {
            current_debug_menu_state = default_menu_state;
        }
        else
        {
            current_debug_menu_state = layers_menu_state;
        }
    }
    
    // room menu
    var rooms_menu_button = EDITOR_draw_icon_button(((VIEW_W / 2) - 24), button_start_ypos,
                                                   global.SPRITE_EDITOR_rooms_button_icon, 0,
                                                   icon_buttons_size, icon_buttons_size,
                                                   c_white, c_green);
    
    if (rooms_menu_button)
    {
        if (current_debug_menu_state == rooms_menu_state)
        {
            current_debug_menu_state = default_menu_state;
        }
        else
        {
            current_debug_menu_state = rooms_menu_state;
        }
    }
}

current_debug_menu_state = default_menu_state;