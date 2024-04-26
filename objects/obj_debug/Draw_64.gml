// Pausing
if (global.app_state == states.MAIN_MENU
    || room == MAIN_MENU_ROOM)
{
    exit;
}

// @TODO @Incomplete: move this to the obj_level_editor when possible (maybe?)
// Layers editor menu
if (global.app_state == states.EDITOR)
{
    layer_menu_state();
}







/*
    if (obj_player.player_state == obj_player.god_mode_state)
    {
        draw_set_alpha(0.1);
        
        draw_line_width_colour(0, (VIEW_H / 2), (VIEW_W / 2), (VIEW_H / 2), 0.5, c_white, c_white);
        draw_line_width_colour((VIEW_W / 2), (VIEW_H / 2), VIEW_W, (VIEW_H / 2), 0.5, c_white, c_white);
        
        draw_line_width_colour((VIEW_W / 2), 0, (VIEW_W / 2), (VIEW_H / 2), 0.5, c_white, c_white);
        draw_line_width_colour((VIEW_W / 2), (VIEW_H / 2), (VIEW_W / 2), VIEW_H, 0.5, c_white, c_white);
        
        draw_set_alpha(1);
    }
*/

/*
    // Scene blooms and vignettes (maybe we're going this way,
    // instead of placing individual sprites in the rooms).
    switch (room)
    {
        case rm_jungle:
            gpu_set_blendmode(bm_add);
            // green bloom
            draw_sprite_ext(spr_bloom_gradient, 0, 0 + 30, 0 + 30, 1, 1, 0, make_colour_rgb(169, 255, 0), 0.1);
            
            // purple bloom
            draw_sprite_ext(spr_bloom_gradient, 0, global.cam_width, global.cam_height, 1, 1, 0, make_colour_rgb(55, 00, 255), 0.1);
            
            gpu_set_blendmode(bm_normal); 
            
            // vignette
            draw_sprite_ext(spr_bloom_gradient, 0, global.cam_width - 50, 0, 1, 1, 0, c_black, 0.4);
            draw_sprite_ext(spr_bloom_gradient, 0, 0 + 50, global.cam_height, 1, 1, 0, c_black, 0.4);   
        break;
        
        case rm_library:
            // vignette
            draw_sprite_ext(spr_bloom_gradient, 0, global.cam_width - 50, 0, 1, 1, 0, c_black, 0.5);
            draw_sprite_ext(spr_bloom_gradient, 0, 0 + 50, global.cam_height, 1, 1, 0, c_black, 0.5);
        break;
        
        case rm_playground:
            gpu_set_blendmode(bm_add);
            draw_sprite_ext(spr_bloom_gradient, 0, 0, 0, 1, 1, 0, c_purple, .4);
            gpu_set_blendmode(bm_normal);
            
            // vignette
            draw_sprite_ext(spr_bloom_gradient, 0, global.cam_width - 50, 0, 1, 1, 0, c_black, 0.4);
            draw_sprite_ext(spr_bloom_gradient, 0, 0 + 50, global.cam_height, 1, 1, 0, c_black, 0.4);
        break;
        
        case rm_nexus:
            // vignette
            draw_sprite_ext(spr_bloom_gradient, 0, global.cam_width - 50, 0, 1, 1, 0, c_black, 0.4);
            draw_sprite_ext(spr_bloom_gradient, 0, 0 + 50, global.cam_height, 1, 1, 0, c_black, 0.4);
        break;
    }
*/