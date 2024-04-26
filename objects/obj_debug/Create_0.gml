// debug stuff
show_debug_overlay(false);

debug_general_text_size = 0.2;
debug_info_text_size    = 0.1;
show_debug_info         = true;
// show_debug_info         = false;
icon_buttons_size       = 0.4;

// layer stuff
layer_set_visible("default_colliders", false);
layer_set_visible("death_colliders", false);
layer_set_visible("checkpoints", false);
layer_set_visible("level_changers", false);
layer_set_visible("camera_masks", false);
layer_set_visible("camera_offset_masks", false);
can_show_debug_layers = false;

/*
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
*/



//                         ---=== MENUS ===---

// @layers menu
default_layer_state = function()
{
    EDITOR_handle_and_draw_layer_button((VIEW_W - 20), 10,
                                        PLAYER_LAYER, debug_general_text_size,
                                        20, 5,
                                        PLAYER_LAYER);
    
    EDITOR_handle_and_draw_layer_button((VIEW_W - 20), 16,
                                        DEFAULT_COLLIDERS_LAYER, debug_general_text_size,
                                        20, 5,
                                        DEFAULT_COLLIDERS_LAYER);
    
    /*
        // triggers
        var triggers_button = EDITOR_draw_icon_button(VIEW_W - 20, 10,
                                                      spr_triggers, 0,
                                                      icon_buttons_size, icon_buttons_size,
                                                      c_white, c_green);
        
        if (triggers_button)
        {
            if (can_show_debug_layers)
            {
                can_show_debug_layers = false;
            }
            else
            {
                can_show_debug_layers = true;
            }
            
            layer_set_visible("default_colliders", can_show_debug_layers);
        	layer_set_visible("death_colliders", can_show_debug_layers);
        	layer_set_visible("checkpoints", can_show_debug_layers);
        	layer_set_visible("level_changers", can_show_debug_layers);
        	layer_set_visible("camera_offset_masks", can_show_debug_layers);
        }
        
        // debug info
        var debug_info_button = EDITOR_draw_icon_button(VIEW_W - 10, 10,
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
        
        // blooms and vignettes
        var blooms_vignettes_button = EDITOR_draw_icon_button(VIEW_W - 10, 20,
                                                              spr_blooms_vignettes, 0,
                                                              icon_buttons_size, icon_buttons_size,
                                                              c_white, c_green);
        
        if (blooms_vignettes_button)
        {
            if (global.use_scene_bloom_and_vignette)
            {
                global.use_scene_bloom_and_vignette = false;
                
                if (layer_exists(FOREGROUND_SCENE_BLOOM_LAYER))
            	{
            		layer_set_visible(FOREGROUND_SCENE_BLOOM_LAYER, 
            		                  false);
            	}
            	
                if (layer_exists(FOREGROUND_SCENE_VIGNETTE_LAYER))
            	{
            		layer_set_visible(FOREGROUND_SCENE_VIGNETTE_LAYER, 
            		                  false);
            	}
            }
            else
            {
                global.use_scene_bloom_and_vignette = true;
                
                if (layer_exists(FOREGROUND_SCENE_BLOOM_LAYER))
            	{
            		layer_set_visible(FOREGROUND_SCENE_BLOOM_LAYER, 
            		                  true);
            	}
            	
                if (layer_exists(FOREGROUND_SCENE_VIGNETTE_LAYER))
            	{
            		layer_set_visible(FOREGROUND_SCENE_VIGNETTE_LAYER, 
            		                  true);
            	}
            }
        }
        
        var player_visibility_button = EDITOR_draw_icon_button(VIEW_W - 20, 20,
                                                              spr_player_visibility, 0,
                                                              icon_buttons_size, icon_buttons_size,
                                                              c_white, c_green);
        
        if (player_visibility_button)
        {
            layer_set_visible(PLAYER_LAYER, !layer_get_visible(PLAYER_LAYER));
        }
    */
}

layer_menu_state = default_layer_state;