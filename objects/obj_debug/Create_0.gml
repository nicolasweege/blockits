// debug stuff
show_debug_overlay(false);

debug_general_text_size = 0.085;
debug_info_text_size    = 0.085;
show_debug_info         = true;
show_debug_info         = false;
icon_buttons_size       = 0.4;
current_buttons_xoffset = 0;
current_buttons_yoffset = 0;
buttons_yoffset_buffer   = 7;

// layer stuff
layer_set_visible("default_colliders", false);
layer_set_visible("death_colliders", false);
layer_set_visible("checkpoints", false);
layer_set_visible("level_changers", false);
layer_set_visible("camera_masks", false);
layer_set_visible("camera_offset_masks", false);
can_show_debug_layers = false;



//                         ---=== MENUS ===---

// @layers menu
default_layer_state = function()
{
    draw_set_halign(fa_right);
    
    // Layer buttons
    // Checkpoints
    current_buttons_xoffset = 10
    current_buttons_yoffset = 10;
    EDITOR_handle_and_draw_layer_button((VIEW_W - current_buttons_xoffset), current_buttons_yoffset,
                                        CHECKPOINTS_LAYER, debug_general_text_size,
                                        80, 5,
                                        CHECKPOINTS_LAYER,
                                        true,
                                        false);
    
    // Level changers
    current_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_layer_button((VIEW_W - current_buttons_xoffset), current_buttons_yoffset,
                                        LEVEL_CHANGERS_LAYER, debug_general_text_size,
                                        80, 5,
                                        LEVEL_CHANGERS_LAYER,
                                        true,
                                        false);
                                        
    // Camera masks
    current_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_layer_button((VIEW_W - current_buttons_xoffset), current_buttons_yoffset,
                                        CAMERA_MASKS_LAYER, debug_general_text_size,
                                        80, 5,
                                        CAMERA_MASKS_LAYER,
                                        true,
                                        false);
    
    // Default colliders
    current_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_layer_button((VIEW_W - current_buttons_xoffset), current_buttons_yoffset,
                                        DEFAULT_COLLIDERS_LAYER, debug_general_text_size,
                                        80, 5,
                                        DEFAULT_COLLIDERS_LAYER,
                                        true,
                                        false);
    
    // Death colliders
    current_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_layer_button((VIEW_W - current_buttons_xoffset), current_buttons_yoffset,
                                        DEATH_COLLIDERS_LAYER, debug_general_text_size,
                                        80, 5,
                                        DEATH_COLLIDERS_LAYER,
                                        true,
                                        false);
    
    // Player
    current_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_layer_button((VIEW_W - current_buttons_xoffset), current_buttons_yoffset,
                                        PLAYER_LAYER, debug_general_text_size,
                                        80, 5,
                                        PLAYER_LAYER,
                                        true,
                                        false);
    
    // Foreground scene bloom
    current_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_layer_button((VIEW_W - current_buttons_xoffset), current_buttons_yoffset,
                                        FOREGROUND_SCENE_BLOOM_LAYER, debug_general_text_size,
                                        80, 5,
                                        FOREGROUND_SCENE_BLOOM_LAYER,
                                        true,
                                        false);
    
    // Foreground scene vignette
    current_buttons_yoffset += buttons_yoffset_buffer;
    EDITOR_handle_and_draw_layer_button((VIEW_W - current_buttons_xoffset), current_buttons_yoffset,
                                        FOREGROUND_SCENE_VIGNETTE_LAYER, debug_general_text_size,
                                        80, 5,
                                        FOREGROUND_SCENE_VIGNETTE_LAYER,
                                        true,
                                        false);
    
    draw_set_halign(fa_left);
    
    
    
    // debug info
    var debug_info_button = EDITOR_draw_icon_button((VIEW_W / 2), 10,
                                                    spr_debug_info, 0,
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
}

layer_menu_state = default_layer_state;