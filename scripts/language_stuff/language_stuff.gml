function MENU_change_language(current_language)
{
    switch (current_language)
    {
        case MENU_current_language.english:
            draw_set_font(global.karmina_regular_font);
            
            global.MENU_current_back_text              = "Back";
            global.MENU_current_on_text                = "On";
            global.MENU_current_off_text               = "Off";
            global.MENU_current_language_text          = "Language";
            global.MENU_current_language_in_use_text   = "English";
            
            // main menu
            global.MENU_current_play_text              = "Play";
            // global.MENU_current_resume_text         = "Resume";
            global.MENU_current_nexus_text             = "Nexus";
            global.MENU_current_options_text           = "Options";
            global.MENU_current_exit_to_main_menu_text = "Main Menu";
            global.MENU_current_exit_text              = "Exit";
            global.MENU_current_exit_game_text         = "Exit Game";
            
            // saves menu
            global.MENU_current_save1_text             = "Slot 1";
            global.MENU_current_save2_text             = "Slot 2";
            global.MENU_current_save3_text             = "Slot 3";
            
            // options menu
            global.MENU_current_fullscreen_text        = "Fullscreen";
            global.MENU_current_screen_shake_text      = "Screen Shake";
            global.MENU_current_volume_text            = "Volume";
            global.MENU_current_keyboard_text          = "Keyboard";
            global.MENU_current_gamepad_text           = "Gamepad";
            
            // keyboard / gamepad menu
            global.MENU_current_up_text                = "Up";
            global.MENU_current_down_text              = "Down";
            global.MENU_current_right_text             = "Right";
            global.MENU_current_left_text              = "Left";
            global.MENU_current_jump_text              = "Jump";
            global.MENU_current_dash_text              = "Dash";
        break;
        
        case MENU_current_language.portuguese_brazil:
            draw_set_font(global.karmina_regular_font);
            
            global.MENU_current_back_text              = "Voltar";
            global.MENU_current_on_text                = "Sim";
            global.MENU_current_off_text               = "Não";
            global.MENU_current_language_text          = "Idioma";
            global.MENU_current_language_in_use_text   = "Português";
            
            // main menu
            global.MENU_current_play_text              = "Jogar";
            // global.MENU_current_resume_text         = "Resumir";
            global.MENU_current_nexus_text             = "Nexus";
            global.MENU_current_options_text           = "Opções";
            global.MENU_current_exit_to_main_menu_text = "Menu Principal";
            global.MENU_current_exit_text              = "Sair";
            global.MENU_current_exit_game_text         = "Sair do Jogo";
            
            // saves menu
            global.MENU_current_save1_text             = "Espaço 1";
            global.MENU_current_save2_text             = "Espaço 2";
            global.MENU_current_save3_text             = "Espaço 3";
            
            // options menu
            global.MENU_current_fullscreen_text        = "Tela Cheia";
            global.MENU_current_screen_shake_text      = "Vibração de Tela";
            global.MENU_current_volume_text            = "Volume";
            global.MENU_current_keyboard_text          = "Teclado";
            global.MENU_current_gamepad_text           = "Controle";
            
            // keyboard / gamepad menu
            global.MENU_current_up_text                = "Cima";
            global.MENU_current_down_text              = "Baixo";
            global.MENU_current_right_text             = "Direita";
            global.MENU_current_left_text              = "Esquerda";
            global.MENU_current_jump_text              = "Pular";
            global.MENU_current_dash_text              = "Usar Dash";
            // global.MENU_current_dash_text              = "Dash";
        break;
        
        case MENU_current_language.french:
            draw_set_font(global.karmina_regular_font);
            
            global.MENU_current_back_text              = "Retour";
            global.MENU_current_on_text                = "Oui";
            global.MENU_current_off_text               = "Non";
            global.MENU_current_language_text          = "Langue";
            global.MENU_current_language_in_use_text   = "Français";
            
            // main menu
            global.MENU_current_play_text              = "Jouer";
            // global.MENU_current_resume_text         = "Resume";
            global.MENU_current_nexus_text             = "Lien";
            global.MENU_current_options_text           = "Possibilités";
            global.MENU_current_exit_to_main_menu_text = "Menu principal";
            global.MENU_current_exit_text              = "Quitter";
            global.MENU_current_exit_game_text         = "Quitter le Jeu";
            
            // saves menu
            global.MENU_current_save1_text             = "Emplacement 1";
            global.MENU_current_save2_text             = "Emplacement 2";
            global.MENU_current_save3_text             = "Emplacement 3";
            
            // options menu
            global.MENU_current_fullscreen_text        = "Plein Écran";
            global.MENU_current_screen_shake_text      = "Effects de Tremblement D'écran";
            global.MENU_current_volume_text            = "Volume";
            global.MENU_current_keyboard_text          = "Clavier";
            global.MENU_current_gamepad_text           = "Manette";
            
            // keyboard / gamepad menu
            global.MENU_current_up_text                = "Haut";
            global.MENU_current_down_text              = "Bas";
            global.MENU_current_right_text             = "Droite";
            global.MENU_current_left_text              = "Gauche";
            global.MENU_current_jump_text              = "Sauter";
            global.MENU_current_dash_text              = "Sprinter";
        break;
        
        case MENU_current_language.italian:
            draw_set_font(global.karmina_regular_font);
            
            global.MENU_current_back_text              = "Indietro";
            global.MENU_current_on_text                = "Sì";
            global.MENU_current_off_text               = "No";
            global.MENU_current_language_text          = "Lingua";
            global.MENU_current_language_in_use_text   = "Italiano";
            
            // main menu
            global.MENU_current_play_text              = "Giocare";
            // global.MENU_current_resume_text         = "Riprendere";
            global.MENU_current_nexus_text             = "Nesso";
            global.MENU_current_options_text           = "Opzioni";
            global.MENU_current_exit_to_main_menu_text = "Menu principale";
            global.MENU_current_exit_text              = "Esci";
            // global.MENU_current_exit_game_text         = "Exit Game";
            global.MENU_current_exit_game_text         = "Esci";
            
            // saves menu
            global.MENU_current_save1_text             = "Slot 1";
            global.MENU_current_save2_text             = "Slot 2";
            global.MENU_current_save3_text             = "Slot 3";
            
            // options menu
            global.MENU_current_fullscreen_text        = "Schermo Intero";
            global.MENU_current_screen_shake_text      = "Effetto Vibrazione Dello Schermo";
            global.MENU_current_volume_text            = "Volume";
            global.MENU_current_keyboard_text          = "Tastiera";
            global.MENU_current_gamepad_text           = "Controller";
            
            // keyboard / gamepad menu
            global.MENU_current_up_text                = "Su";
            global.MENU_current_down_text              = "Giù";
            global.MENU_current_right_text             = "Destra";
            global.MENU_current_left_text              = "Sinistra";
            global.MENU_current_jump_text              = "Salta";
            global.MENU_current_dash_text              = "Scatta";
        break;
        
        case MENU_current_language.german:
            draw_set_font(global.karmina_regular_font);
            
            global.MENU_current_back_text              = "Zurück";
            global.MENU_current_on_text                = "Ein";
            global.MENU_current_off_text               = "Aus";
            global.MENU_current_language_text          = "Sprache";
            global.MENU_current_language_in_use_text   = "Deutsch";
            
            // main menu
            global.MENU_current_play_text              = "Spielen";
            // global.MENU_current_resume_text         = "Resume";
            global.MENU_current_nexus_text             = "Nexus";
            global.MENU_current_options_text           = "Optionen";
            global.MENU_current_exit_to_main_menu_text = "Hauptmenü";
            // global.MENU_current_exit_text              = "Ausfahrt";
            global.MENU_current_exit_text              = "Beenden";
            global.MENU_current_exit_game_text         = "Beenden";
            
            // saves menu
            global.MENU_current_save1_text             = "Schlitz 1";
            global.MENU_current_save2_text             = "Schlitz 2";
            global.MENU_current_save3_text             = "Schlitz 3";
            
            // options menu
            global.MENU_current_fullscreen_text        = "Vollbild";
            global.MENU_current_screen_shake_text      = "Bildschirmwackeln";
            global.MENU_current_volume_text            = "Volumen";
            global.MENU_current_keyboard_text          = "Tastenbelegung";
            global.MENU_current_gamepad_text           = "Controller-belegung";
            
            // keyboard / gamepad menu
            global.MENU_current_up_text                = "Hoch";
            global.MENU_current_down_text              = "Runter";
            global.MENU_current_right_text             = "Rechts";
            global.MENU_current_left_text              = "Links";
            global.MENU_current_jump_text              = "Springen";
            global.MENU_current_dash_text              = "Sprinten";
        break;
        
        case MENU_current_language.spanish_spain:
            draw_set_font(global.karmina_regular_font);
            
            global.MENU_current_back_text              = "Atrás";
            global.MENU_current_on_text                = "En";
            global.MENU_current_off_text               = "Apagado";
            global.MENU_current_language_text          = "Idioma";
            global.MENU_current_language_in_use_text   = "Español España";
            
            // main menu
            global.MENU_current_play_text              = "Jugar";
            // global.MENU_current_resume_text         = "Reanudar";
            global.MENU_current_nexus_text             = "Nexo";
            global.MENU_current_options_text           = "Opciones";
            global.MENU_current_exit_to_main_menu_text = "Menú Principal";
            global.MENU_current_exit_text              = "Salida";
            global.MENU_current_exit_game_text         = "Salir del Juego";
            
            // saves menu
            global.MENU_current_save1_text             = "Ranura 1";
            global.MENU_current_save2_text             = "Ranura 2";
            global.MENU_current_save3_text             = "Ranura 3";
            
            // options menu
            global.MENU_current_fullscreen_text        = "Pantalla Completa";
            global.MENU_current_screen_shake_text      = "Movimiento de Pantalla";
            global.MENU_current_volume_text            = "Volumen";
            global.MENU_current_keyboard_text          = "Teclado";
            global.MENU_current_gamepad_text           = "Mando";
            
            // keyboard / gamepad menu
            global.MENU_current_up_text                = "Arriba";
            global.MENU_current_down_text              = "Abajo";
            global.MENU_current_right_text             = "Derecha";
            global.MENU_current_left_text              = "Izquierda";
            global.MENU_current_jump_text              = "Aaltar";
            global.MENU_current_dash_text              = "Estrellarse";
        break;
        
        case MENU_current_language.japanese:
            draw_set_font(global.noto_sans_mono_cjk_jp_regular_font);
            
            global.MENU_current_back_text              = "戻る";
            global.MENU_current_on_text                = "の上";
            global.MENU_current_off_text               = "オフ";
            global.MENU_current_language_text          = "言語";
            global.MENU_current_language_in_use_text   = "日本語";
            
            // main menu
            global.MENU_current_play_text              = "遊ぶ";
            // global.MENU_current_resume_text         = "再開する";
            global.MENU_current_nexus_text             = "つながり";
            global.MENU_current_options_text           = "オプション";
            global.MENU_current_exit_to_main_menu_text = "メインメニュー";
            global.MENU_current_exit_text              = "出口";
            global.MENU_current_exit_game_text         = "ゲームを終了します";
            
            // saves menu
            global.MENU_current_save1_text             = "スロット1";
            global.MENU_current_save2_text             = "スロット2";
            global.MENU_current_save3_text             = "スロット3";
            
            // options menu
            global.MENU_current_fullscreen_text        = "全画面表示";
            global.MENU_current_screen_shake_text      = "画面の揺れ";
            global.MENU_current_volume_text            = "音量";
            global.MENU_current_keyboard_text          = "キーボード";
            global.MENU_current_gamepad_text           = "ゲームパッド";
            
            // keyboard / gamepad menu
            global.MENU_current_up_text                = "上";
            global.MENU_current_down_text              = "下";
            global.MENU_current_right_text             = "右";
            global.MENU_current_left_text              = "左";
            global.MENU_current_jump_text              = "ジャンプ";
            global.MENU_current_dash_text              = "ダッシュ";
        break;
        
        case MENU_current_language.korean:
            draw_set_font(global.noto_sans_mono_cjk_jp_regular_font);
            
            global.MENU_current_back_text              = "뒤쪽에";
            global.MENU_current_on_text                = "~에";
            global.MENU_current_off_text               = "끄다";
            global.MENU_current_language_text          = "언어";
            global.MENU_current_language_in_use_text   = "한국인";
            
            // main menu
            global.MENU_current_play_text              = "놀다";
            // global.MENU_current_resume_text         = "재개하다";
            global.MENU_current_nexus_text             = "연결점";
            global.MENU_current_options_text           = "옵션";
            global.MENU_current_exit_to_main_menu_text = "메인 메뉴";
            global.MENU_current_exit_text              = "출구";
            global.MENU_current_exit_game_text         = "게임 종료";
            
            // saves menu
            global.MENU_current_save1_text             = "슬롯 1";
            global.MENU_current_save2_text             = "슬롯 2";
            global.MENU_current_save3_text             = "슬롯 3";
            
            // options menu
            global.MENU_current_fullscreen_text        = "전체 화면";
            global.MENU_current_screen_shake_text      = "화면 흔들림";
            global.MENU_current_volume_text            = "용량";
            global.MENU_current_keyboard_text          = "건반";
            global.MENU_current_gamepad_text           = "게임패드";
            
            // keyboard / gamepad menu
            global.MENU_current_up_text                = "위로";
            global.MENU_current_down_text              = "아래에";
            global.MENU_current_right_text             = "오른쪽";
            global.MENU_current_left_text              = "왼쪽";
            global.MENU_current_jump_text              = "도약";
            global.MENU_current_dash_text              = "대시";
        break;
        
        case MENU_current_language.russian:
            draw_set_font(global.noto_sans_mono_cjk_jp_regular_font);
        
            global.MENU_current_back_text              = "назад";
            global.MENU_current_on_text                = "на";
            global.MENU_current_off_text               = "выключенный";
            global.MENU_current_language_text          = "язык";
            global.MENU_current_language_in_use_text   = "русский";
            
            // main menu
            global.MENU_current_play_text              = "играть";
            // global.MENU_current_resume_text         = "резюме";
            global.MENU_current_nexus_text             = "связь";
            global.MENU_current_options_text           = "параметры";
            global.MENU_current_exit_to_main_menu_text = "главное меню";
            global.MENU_current_exit_text              = "Выход";
            global.MENU_current_exit_game_text         = "выйти из игры";
            
            // saves menu
            global.MENU_current_save1_text             = "слот 1";
            global.MENU_current_save2_text             = "слот 2";
            global.MENU_current_save3_text             = "слот 3";
            
            // options menu
            global.MENU_current_fullscreen_text        = "полноэкранный";
            global.MENU_current_screen_shake_text      = "дрожание экрана";
            global.MENU_current_volume_text            = "объем";
            global.MENU_current_keyboard_text          = "клавиатура";
            global.MENU_current_gamepad_text           = "геймпад";
            
            // keyboard / gamepad menu
            global.MENU_current_up_text                = "вверх";
            global.MENU_current_down_text              = "вниз";
            global.MENU_current_right_text             = "верно";
            global.MENU_current_left_text              = "левый";
            global.MENU_current_jump_text              = "Прыгать";
            global.MENU_current_dash_text              = "бросаться";
        break;
        
        case MENU_current_language.simplified_chinese:
            draw_set_font(global.noto_sans_mono_cjk_jp_regular_font);
            
            global.MENU_current_back_text              = "后退";
            global.MENU_current_on_text                = "在";
            global.MENU_current_off_text               = "离开";
            global.MENU_current_language_text          = "语言";
            global.MENU_current_language_in_use_text   = "简体中文";
            
            // main menu
            global.MENU_current_play_text              = "玩";
            // global.MENU_current_resume_text         = "恢复";
            global.MENU_current_nexus_text             = "关系";
            global.MENU_current_options_text           = "选项";
            global.MENU_current_exit_to_main_menu_text = "主菜单";
            global.MENU_current_exit_text              = "出口";
            global.MENU_current_exit_game_text         = "退出游戏";
            
            // saves menu
            global.MENU_current_save1_text             = "插槽1";
            global.MENU_current_save2_text             = "插槽2";
            global.MENU_current_save3_text             = "插槽3";
            
            // options menu
            global.MENU_current_fullscreen_text        = "全屏";
            global.MENU_current_screen_shake_text      = "屏幕抖动";
            global.MENU_current_volume_text            = "体积";
            global.MENU_current_keyboard_text          = "键盘";
            global.MENU_current_gamepad_text           = "游戏手柄";
            
            // keyboard / gamepad menu
            global.MENU_current_up_text                = "向上";
            global.MENU_current_down_text              = "向下";
            global.MENU_current_right_text             = "正确的";
            global.MENU_current_left_text              = "左边";
            global.MENU_current_jump_text              = "跳";
            global.MENU_current_dash_text              = "短跑";
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