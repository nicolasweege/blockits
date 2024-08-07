function set_initial_game_stuff()
{
    // GMLive stuff
    // blockits_gmlive_set_rooms_to_update();
    // blockits_gmlive_set_sprites_to_update();
    
    // @OBS: não vamos usar isso por enquanto
    /*
    if (!load_and_set_image_assets())
    {
        // log
    }
    */
    
    if (!load_and_set_fonts())
    {
        // log
    }
    
    game_set_speed(60, gamespeed_fps);
    
    // display_set_timing_method(tm_sleep);
    display_set_timing_method(tm_countvsyncs); // default for all supported platforms
    display_set_sleep_margin(10);              // default value for windows is 10 milliseconds
    
    scheduler_resolution_set(1); // default value is 1 millisecond
    
    display_reset(0, true);
    
    gpu_set_texfilter(false);
    
    // randomize();
    
    // window and resolution stuff
    window_set_cursor(cr_none);
    display_set_gui_size(VIEW_W, VIEW_H);
    window_set_min_width(VIEW_W);
    window_set_min_height(VIEW_H);
    
    /*
    window_set_position(((display_get_width() / 2) - (window_get_width() / 2)), 
                        ((display_get_height() / 2) - (window_get_height() / 2)));
    */
    window_center();
    
    // se não deixarmos isso ligado, quando reiniciamos a room o jogo não desaloca a memoria, 
    // provavelmente existem certos recursos que tao alocando memoria sem o nosso controle. 
    // Entao provavelmente nao tem como nao usar garbage collector sem correr esse risco. 
    gc_enable(true);
    
    load_game_options_data();
}

function load_and_set_fonts()
{
    var fonts_path = "data/fonts/";
    
    // normal base font
    global.karmina_regular_font = 
    font_add(fonts_path + "karmina_regular.ttf", 40, false, false, 32, 128);
    
        
    if (global.karmina_regular_font)
    {
        font_enable_sdf(global.karmina_regular_font, true);
        // global.karmina_regular_font = fnt_default;
    }
    else
    {
        // log
        global.karmina_regular_font = fnt_default;
    }
    
    // japanese hiragana / katakana font
    // Noto Sans Mono CJK JP Regular
    // 12352 - 12543
    global.noto_sans_mono_cjk_jp_regular_font =
    font_add(fonts_path + "noto_sans_mono_cjk_jp_regular.otf", 40, false, false, 32, 128);
    
    
    if (global.noto_sans_mono_cjk_jp_regular_font)
    {
        font_enable_sdf(global.noto_sans_mono_cjk_jp_regular_font, true);
        // global.noto_sans_mono_cjk_jp_regular_font = fnt_default_japanese;
    }
    else
    {
        // log
        global.noto_sans_mono_cjk_jp_regular_font = fnt_default_japanese;
    }
    
    return (true);
}

function load_and_set_image_assets()
{
    // loading sprites
    var editor_icons_path = "data/sprites/editor/icons/";
    var player_sprites_path = "data/sprites/player/";
    
    global.SPRITE_EDITOR_exit_button_icon = 
    sprite_add(editor_icons_path + "spr_exit_button_icon.png", 1, false, true, 0, 0);
    
    global.SPRITE_EDITOR_fullscreen_button_icon = 
    sprite_add(editor_icons_path + "spr_fullscreen_button_icon.png", 1, false, true, 0, 0);
    
    global.SPRITE_EDITOR_grid_button_icon_icon = 
    sprite_add(editor_icons_path + "spr_grid_button_icon.png", 1, false, true, 0, 0);
    
    global.SPRITE_EDITOR_info_button_icon = 
    sprite_add(editor_icons_path + "spr_info_button_icon.png", 1, false, true, 0, 0);
    
    global.SPRITE_EDITOR_layers_buttons_icon = 
    sprite_add(editor_icons_path + "spr_layers_buttons_icon.png", 1, false, true, 0, 0);
    
    global.SPRITE_EDITOR_rooms_button_icon = 
    sprite_add(editor_icons_path + "spr_rooms_button_icon.png", 1, false, true, 0, 0);
    
    //
    // como a gente define a collision_mask usando 'object_set_mask()', não precisamos definir o 
    // boundind_box mode pra sprite do player em si, somente pra sprite da sua collision mask.
    //
    // sprite_set_bbox_mode(global.SPRITE_PLAYER_default, bboxmode_manual);
    
    global.SPRITE_PLAYER_collision_mask = 
    sprite_add(player_sprites_path + "spr_player_collision_mask.png", 1, false, true, 0, 0);
    
    if (global.SPRITE_PLAYER_collision_mask)
    {
        sprite_set_bbox_mode(global.SPRITE_PLAYER_collision_mask, bboxmode_automatic);
        object_set_mask(obj_player, global.SPRITE_PLAYER_collision_mask);
        
        global.SPRITE_PLAYER_default = 
        sprite_add(player_sprites_path + "spr_player.png", 1, false, true, 0, 0);
        
        if (global.SPRITE_PLAYER_default)
        {   
            // offset
            sprite_set_offset(global.SPRITE_PLAYER_default, 
                              (sprite_get_width(global.SPRITE_PLAYER_default) / 2), 
                              sprite_get_height(global.SPRITE_PLAYER_default));
            
            // nineslice
            var player_nineslice = sprite_nineslice_create();
            player_nineslice.enabled = true;
            player_nineslice.left    = 4;
            player_nineslice.right   = 4;
            player_nineslice.top     = 8;
            player_nineslice.bottom  = 1;    
            sprite_set_nineslice(global.SPRITE_PLAYER_default, player_nineslice);
            
            object_set_sprite(obj_player, global.SPRITE_PLAYER_default);
        }
        else
        {
            // log
            // object_set_sprite(obj_player, 0);
        }
    }
    else
    {
        // log
    }
    
    //
    // vou deixar isso aqui por enquanto, talvez seja util no futuro quando eu descobrir pra que isso 
    // realmente serve.
    //
    /*
    sprites_to_fetch[0] = global.SPRITE_PLAYER_default;
    sprites_to_fetch[1] = global.SPRITE_PLAYER_collision_mask;
    sprites_to_fetch[2] = global.SPRITE_EDITOR_exit_button_icon;
    sprites_to_fetch[3] = global.SPRITE_EDITOR_fullscreen_button_icon;
    sprites_to_fetch[4] = global.SPRITE_EDITOR_grid_button_icon_icon;
    sprites_to_fetch[5] = global.SPRITE_EDITOR_info_button_icon;
    sprites_to_fetch[6] = global.SPRITE_EDITOR_layers_buttons_icon;
    sprites_to_fetch[7] = global.SPRITE_EDITOR_rooms_button_icon;
    
    if (sprite_prefetch_multi(sprites_to_fetch))
    {
        show_debug_message("sprite prefetching done!");
    }
    else
    {
        show_debug_message("sprite prefetching not done!");
    }
    
    if (sprite_flush_multi(sprites_to_fetch))
    {
        show_debug_message("sprite flushing done!");
    }
    else
    {
        show_debug_message("sprite flushing not done!");
    }
    */
    
    return (true);
}

// GMLive stuff
/*
function blockits_gmlive_set_rooms_to_update()
{
    room_set_live(rm_debug_1, true);
    
    room_set_live(rm_bonus_1, false);
    room_set_live(rm_bonus_2, false);
    room_set_live(rm_destroy_block_bonus, false);
    
    room_set_live(rm_jungle, false);
    room_set_live(rm_library, false);
    room_set_live(rm_mountain, false);
    room_set_live(rm_nexus, false);
    room_set_live(rm_playground, false);
}

function blockits_gmlive_set_sprites_to_update()
{
    // sprite_set_live(spr_player, true);
}
*/