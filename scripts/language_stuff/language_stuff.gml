function MENU_change_language(current_language)
{
    switch (current_language)
    {
        case MENU_current_language.english:
            global.MENU_current_back_text              = "back";
            global.MENU_current_on_text                = "on";
            global.MENU_current_off_text               = "off";
            global.MENU_current_language_text          = "language";
            global.MENU_current_language_in_use_text   = "english";
            
            // main menu
            global.MENU_current_play_text              = "play";
            // global.MENU_current_resume_text         = "resume";
            global.MENU_current_nexus_text             = "nexus";
            global.MENU_current_options_text           = "options";
            global.MENU_current_exit_to_main_menu_text = "main menu";
            global.MENU_current_exit_text              = "exit";
            global.MENU_current_exit_game_text         = "exit game";
            
            // saves menu
            global.MENU_current_save1_text             = "slot 1";
            global.MENU_current_save2_text             = "slot 2";
            global.MENU_current_save3_text             = "slot 3";
            
            // options menu
            global.MENU_current_fullscreen_text        = "fullscreen";
            global.MENU_current_screen_shake_text      = "screen shake";
            global.MENU_current_volume_text            = "volume";
            global.MENU_current_keyboard_text          = "keyboard";
            global.MENU_current_gamepad_text           = "gamepad";
            
            // keyboard / gamepad menu
            global.MENU_current_up_text                = "up";
            global.MENU_current_down_text              = "down";
            global.MENU_current_right_text             = "right";
            global.MENU_current_left_text              = "left";
            global.MENU_current_jump_text              = "jump";
            global.MENU_current_dash_text              = "dash";
        break;
        
        case MENU_current_language.portuguese_brazil:
            global.MENU_current_back_text              = "voltar";
            global.MENU_current_on_text                = "sim";
            global.MENU_current_off_text               = "não";
            global.MENU_current_language_text          = "idioma";
            global.MENU_current_language_in_use_text   = "portuguese - brazil";
            
            // main menu
            global.MENU_current_play_text              = "jogar";
            // global.MENU_current_resume_text         = "resumir";
            global.MENU_current_nexus_text             = "nexus";
            global.MENU_current_options_text           = "opções";
            global.MENU_current_exit_to_main_menu_text = "menu principal";
            global.MENU_current_exit_text              = "sair";
            global.MENU_current_exit_game_text         = "sair do jogo";
            
            // saves menu
            global.MENU_current_save1_text             = "slot 1";
            global.MENU_current_save2_text             = "slot 2";
            global.MENU_current_save3_text             = "slot 3";
            
            // options menu
            global.MENU_current_fullscreen_text        = "tela cheia";
            global.MENU_current_screen_shake_text      = "vibração da tela";
            global.MENU_current_volume_text            = "volume";
            global.MENU_current_keyboard_text          = "teclado";
            global.MENU_current_gamepad_text           = "controle";
            
            // keyboard / gamepad menu
            global.MENU_current_up_text                = "cima";
            global.MENU_current_down_text              = "baixo";
            global.MENU_current_right_text             = "direita";
            global.MENU_current_left_text              = "esquerda";
            global.MENU_current_jump_text              = "pular";
            global.MENU_current_dash_text              = "usar dash";
            // global.MENU_current_dash_text              = "dash";
        break;
        
        case MENU_current_language.french:
            global.MENU_current_back_text              = "retour";
            global.MENU_current_on_text                = "oui";
            global.MENU_current_off_text               = "non";
            global.MENU_current_language_text          = "language";
            global.MENU_current_language_in_use_text   = "french";
            
            // main menu
            global.MENU_current_play_text              = "jouer";
            // global.MENU_current_resume_text         = "resume";
            global.MENU_current_nexus_text             = "nexus";
            global.MENU_current_options_text           = "options";
            global.MENU_current_exit_to_main_menu_text = "main menu";
            global.MENU_current_exit_text              = "quitter";
            global.MENU_current_exit_game_text         = "quitter le jeu";
            
            // saves menu
            global.MENU_current_save1_text             = "slot 1";
            global.MENU_current_save2_text             = "slot 2";
            global.MENU_current_save3_text             = "slot 3";
            
            // options menu
            global.MENU_current_fullscreen_text        = "plein écran";
            global.MENU_current_screen_shake_text      = "effects de tremblement d'écran";
            global.MENU_current_volume_text            = "volume";
            global.MENU_current_keyboard_text          = "clavier";
            global.MENU_current_gamepad_text           = "manette";
            
            // keyboard / gamepad menu
            global.MENU_current_up_text                = "haut";
            global.MENU_current_down_text              = "bas";
            global.MENU_current_right_text             = "droite";
            global.MENU_current_left_text              = "gauche";
            global.MENU_current_jump_text              = "sauter";
            global.MENU_current_dash_text              = "sprinter";
        break;
        
        case MENU_current_language.italian:
            global.MENU_current_back_text              = "indietro";
            global.MENU_current_on_text                = "sì";
            global.MENU_current_off_text               = "no";
            global.MENU_current_language_text          = "language";
            global.MENU_current_language_in_use_text   = "italian";
            
            // main menu
            global.MENU_current_play_text              = "play";
            // global.MENU_current_resume_text         = "resume";
            global.MENU_current_nexus_text             = "nexus";
            global.MENU_current_options_text           = "opzioni";
            global.MENU_current_exit_to_main_menu_text = "main menu";
            global.MENU_current_exit_text              = "esci";
            // global.MENU_current_exit_game_text         = "exit game";
            global.MENU_current_exit_game_text         = "esci";
            
            // saves menu
            global.MENU_current_save1_text             = "slot 1";
            global.MENU_current_save2_text             = "slot 2";
            global.MENU_current_save3_text             = "slot 3";
            
            // options menu
            global.MENU_current_fullscreen_text        = "schermo intero";
            global.MENU_current_screen_shake_text      = "effetto vibrazione dello schermo";
            global.MENU_current_volume_text            = "volume";
            global.MENU_current_keyboard_text          = "tastiera";
            global.MENU_current_gamepad_text           = "controller";
            
            // keyboard / gamepad menu
            global.MENU_current_up_text                = "su";
            global.MENU_current_down_text              = "giù";
            global.MENU_current_right_text             = "destra";
            global.MENU_current_left_text              = "sinistra";
            global.MENU_current_jump_text              = "salta";
            global.MENU_current_dash_text              = "scatta";
        break;
        
        case MENU_current_language.german:
            global.MENU_current_back_text              = "zurück";
            global.MENU_current_on_text                = "ein";
            global.MENU_current_off_text               = "aus";
            global.MENU_current_language_text          = "language";
            global.MENU_current_language_in_use_text   = "german";
            
            // main menu
            global.MENU_current_play_text              = "spielen";
            // global.MENU_current_resume_text         = "resume";
            global.MENU_current_nexus_text             = "nexus";
            global.MENU_current_options_text           = "optionen";
            global.MENU_current_exit_to_main_menu_text = "hauptmenü";
            // global.MENU_current_exit_text              = "ausfahrt";
            global.MENU_current_exit_text              = "beenden";
            global.MENU_current_exit_game_text         = "beenden";
            
            // saves menu
            global.MENU_current_save1_text             = "slot 1";
            global.MENU_current_save2_text             = "slot 2";
            global.MENU_current_save3_text             = "slot 3";
            
            // options menu
            global.MENU_current_fullscreen_text        = "vollbild";
            global.MENU_current_screen_shake_text      = "bildschirmwackeln";
            global.MENU_current_volume_text            = "volumen";
            global.MENU_current_keyboard_text          = "tastenbelegung";
            global.MENU_current_gamepad_text           = "controller-belegung";
            
            // keyboard / gamepad menu
            global.MENU_current_up_text                = "hoch";
            global.MENU_current_down_text              = "runter";
            global.MENU_current_right_text             = "rechts";
            global.MENU_current_left_text              = "links";
            global.MENU_current_jump_text              = "springen";
            global.MENU_current_dash_text              = "sprinten";
        break;
        
        case MENU_current_language.spanish_spain:
            global.MENU_current_back_text              = "back";
            global.MENU_current_on_text                = "on";
            global.MENU_current_off_text               = "off";
            global.MENU_current_language_text          = "language";
            global.MENU_current_language_in_use_text   = "spanish - spain";
            
            // main menu
            global.MENU_current_play_text              = "play";
            // global.MENU_current_resume_text         = "resume";
            global.MENU_current_nexus_text             = "nexus";
            global.MENU_current_options_text           = "options";
            global.MENU_current_exit_to_main_menu_text = "main menu";
            global.MENU_current_exit_text              = "exit";
            global.MENU_current_exit_game_text         = "exit game";
            
            // saves menu
            global.MENU_current_save1_text             = "slot 1";
            global.MENU_current_save2_text             = "slot 2";
            global.MENU_current_save3_text             = "slot 3";
            
            // options menu
            global.MENU_current_fullscreen_text        = "fullscreen";
            global.MENU_current_screen_shake_text      = "screen shake";
            global.MENU_current_volume_text            = "volume";
            global.MENU_current_keyboard_text          = "keyboard";
            global.MENU_current_gamepad_text           = "gamepad";
            
            // keyboard / gamepad menu
            global.MENU_current_up_text                = "up";
            global.MENU_current_down_text              = "down";
            global.MENU_current_right_text             = "right";
            global.MENU_current_left_text              = "left";
            global.MENU_current_jump_text              = "jump";
            global.MENU_current_dash_text              = "dash";
        break;
        
        case MENU_current_language.japanese:
            global.MENU_current_back_text              = "back";
            global.MENU_current_on_text                = "on";
            global.MENU_current_off_text               = "off";
            global.MENU_current_language_text          = "language";
            global.MENU_current_language_in_use_text   = "japanese";
            
            // main menu
            global.MENU_current_play_text              = "play";
            // global.MENU_current_resume_text         = "resume";
            global.MENU_current_nexus_text             = "nexus";
            global.MENU_current_options_text           = "options";
            global.MENU_current_exit_to_main_menu_text = "main menu";
            global.MENU_current_exit_text              = "exit";
            global.MENU_current_exit_game_text         = "exit game";
            
            // saves menu
            global.MENU_current_save1_text             = "slot 1";
            global.MENU_current_save2_text             = "slot 2";
            global.MENU_current_save3_text             = "slot 3";
            
            // options menu
            global.MENU_current_fullscreen_text        = "fullscreen";
            global.MENU_current_screen_shake_text      = "screen shake";
            global.MENU_current_volume_text            = "volume";
            global.MENU_current_keyboard_text          = "keyboard";
            global.MENU_current_gamepad_text           = "gamepad";
            
            // keyboard / gamepad menu
            global.MENU_current_up_text                = "up";
            global.MENU_current_down_text              = "down";
            global.MENU_current_right_text             = "right";
            global.MENU_current_left_text              = "left";
            global.MENU_current_jump_text              = "jump";
            global.MENU_current_dash_text              = "dash";
        break;
        
        case MENU_current_language.korean:
            global.MENU_current_back_text              = "back";
            global.MENU_current_on_text                = "on";
            global.MENU_current_off_text               = "off";
            global.MENU_current_language_text          = "language";
            global.MENU_current_language_in_use_text   = "korean";
            
            // main menu
            global.MENU_current_play_text              = "play";
            // global.MENU_current_resume_text         = "resume";
            global.MENU_current_nexus_text             = "nexus";
            global.MENU_current_options_text           = "options";
            global.MENU_current_exit_to_main_menu_text = "main menu";
            global.MENU_current_exit_text              = "exit";
            global.MENU_current_exit_game_text         = "exit game";
            
            // saves menu
            global.MENU_current_save1_text             = "slot 1";
            global.MENU_current_save2_text             = "slot 2";
            global.MENU_current_save3_text             = "slot 3";
            
            // options menu
            global.MENU_current_fullscreen_text        = "fullscreen";
            global.MENU_current_screen_shake_text      = "screen shake";
            global.MENU_current_volume_text            = "volume";
            global.MENU_current_keyboard_text          = "keyboard";
            global.MENU_current_gamepad_text           = "gamepad";
            
            // keyboard / gamepad menu
            global.MENU_current_up_text                = "up";
            global.MENU_current_down_text              = "down";
            global.MENU_current_right_text             = "right";
            global.MENU_current_left_text              = "left";
            global.MENU_current_jump_text              = "jump";
            global.MENU_current_dash_text              = "dash";
        break;
        
        case MENU_current_language.russian:
            global.MENU_current_back_text              = "back";
            global.MENU_current_on_text                = "on";
            global.MENU_current_off_text               = "off";
            global.MENU_current_language_text          = "language";
            global.MENU_current_language_in_use_text   = "russian";
            
            // main menu
            global.MENU_current_play_text              = "play";
            // global.MENU_current_resume_text         = "resume";
            global.MENU_current_nexus_text             = "nexus";
            global.MENU_current_options_text           = "options";
            global.MENU_current_exit_to_main_menu_text = "main menu";
            global.MENU_current_exit_text              = "exit";
            global.MENU_current_exit_game_text         = "exit game";
            
            // saves menu
            global.MENU_current_save1_text             = "slot 1";
            global.MENU_current_save2_text             = "slot 2";
            global.MENU_current_save3_text             = "slot 3";
            
            // options menu
            global.MENU_current_fullscreen_text        = "fullscreen";
            global.MENU_current_screen_shake_text      = "screen shake";
            global.MENU_current_volume_text            = "volume";
            global.MENU_current_keyboard_text          = "keyboard";
            global.MENU_current_gamepad_text           = "gamepad";
            
            // keyboard / gamepad menu
            global.MENU_current_up_text                = "up";
            global.MENU_current_down_text              = "down";
            global.MENU_current_right_text             = "right";
            global.MENU_current_left_text              = "left";
            global.MENU_current_jump_text              = "jump";
            global.MENU_current_dash_text              = "dash";
        break;
        
        case MENU_current_language.simplified_chinese:
            global.MENU_current_back_text              = "back";
            global.MENU_current_on_text                = "on";
            global.MENU_current_off_text               = "off";
            global.MENU_current_language_text          = "language";
            global.MENU_current_language_in_use_text   = "simplified - chinese";
            
            // main menu
            global.MENU_current_play_text              = "play";
            // global.MENU_current_resume_text         = "resume";
            global.MENU_current_nexus_text             = "nexus";
            global.MENU_current_options_text           = "options";
            global.MENU_current_exit_to_main_menu_text = "main menu";
            global.MENU_current_exit_text              = "exit";
            global.MENU_current_exit_game_text         = "exit game";
            
            // saves menu
            global.MENU_current_save1_text             = "slot 1";
            global.MENU_current_save2_text             = "slot 2";
            global.MENU_current_save3_text             = "slot 3";
            
            // options menu
            global.MENU_current_fullscreen_text        = "fullscreen";
            global.MENU_current_screen_shake_text      = "screen shake";
            global.MENU_current_volume_text            = "volume";
            global.MENU_current_keyboard_text          = "keyboard";
            global.MENU_current_gamepad_text           = "gamepad";
            
            // keyboard / gamepad menu
            global.MENU_current_up_text                = "up";
            global.MENU_current_down_text              = "down";
            global.MENU_current_right_text             = "right";
            global.MENU_current_left_text              = "left";
            global.MENU_current_jump_text              = "jump";
            global.MENU_current_dash_text              = "dash";
        break;
    }
}

/*
    switch (current_language)
    {
        case MENU_current_language.english:
        break;
        
        case MENU_current_language.portuguese_brazil:
        break;
        
        case MENU_current_language.french:
        break;
        
        case MENU_current_language.italian:
        break;
        
        case MENU_current_language.german:
        break;
        
        case MENU_current_language.spanish_spain:
        break;
        
        case MENU_current_language.japanese:
        break;
        
        case MENU_current_language.korean:
        break;
        
        case MENU_current_language.russian:
        break;
        
        case MENU_current_language.simplified_chinese:
        break;
    }
*/