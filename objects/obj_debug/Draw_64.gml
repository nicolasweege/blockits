// Pausing
if (global.app_state == states.MAIN_MENU
    || room == MAIN_MENU_ROOM)
{
    exit;
}

draw_set_font(global.karmina_regular_font);

// @TODO @Incomplete: maybe move this to the obj_level_editor?
// Layers editor menu
if (global.app_state == states.EDITOR)
{
    global.mouse_within_debug_button = false;
    
    handle_main_debug_menu();
    current_debug_menu_state();
}

draw_set_font(-1);







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

// Scene blooms and vignettes (maybe we're going this way,
// instead of placing individual sprites in the rooms).

// vignette
/*
    draw_sprite_ext(spr_bloom_gradient, 0, global.cam_width, 0, 1, 1, 0, c_black, 0.4);
    draw_sprite_ext(spr_bloom_gradient, 0, 0, 0, 1, 1, 0, c_black, 0.4);
    
    draw_sprite_ext(spr_bloom_gradient, 0, global.cam_width, global.cam_height, 1, 1, 0, c_black, 0.4);
    draw_sprite_ext(spr_bloom_gradient, 0, 0, global.cam_height, 1, 1, 0, c_black, 0.4);
*/

/*
    if (room == rm_jungle)
    {
        gpu_set_blendmode(bm_add);
        // green bloom
        // draw_sprite_ext(spr_bloom_gradient, 0, 0 + 30, 0 + 30, 1, 1, 0, make_colour_rgb(169, 255, 0), 0.1);
        
        // purple bloom
        draw_sprite_ext(spr_bloom_gradient, 0, (global.cam_width / 2), 
                        (global.cam_height / 1.7) - 100, 1, 1, 0, make_colour_rgb(55, 00, 255), 0.1);
        
        gpu_set_blendmode(bm_normal); 
    }
*/