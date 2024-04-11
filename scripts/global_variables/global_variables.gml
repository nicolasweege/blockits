// UI / buttons stuff

global.initial_button_green_color = 255;
global.initial_button_blue_color  = 255;
global.initial_button_red_color   = 255;

global.button_green_color_to      = 200;
global.button_blue_color_to       = 80;
global.button_red_color_to        = 200;

global.button_green_color         = global.initial_button_green_color;
global.button_blue_color          = global.initial_button_blue_color;
global.button_red_color           = global.initial_button_red_color;

// yellow color
/*
    global.button_green_color_to = 242;
    global.button_blue_color_to  = 50;
    global.button_red_color_to   = 255;
*/

// font stuff
global.karmina_regular_font               = 0;
global.noto_sans_mono_cjk_jp_regular_font = 0;
// global.karmina_regular_japanese_font = 0;

// language stuff
enum MENU_current_language
{
	english = 0,
	portuguese_brazil,
	french,
	italian,
	german,
	spanish_spain,
	japanese,
	korean,
	russian,
	simplified_chinese,
	count
}

global.current_language_in_use             = MENU_current_language.english;

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


// keys and gp buttons / KEYBINDS
// menu
global.MENU_left_key = vk_left;
global.MENU_left_gp = gp_padl;
		
global.MENU_right_key = vk_right;
global.MENU_right_gp = gp_padr;
		
global.MENU_down_key = vk_down;
global.MENU_down_gp = gp_padd;
		
global.MENU_up_key = vk_up;
global.MENU_up_gp = gp_padu;

global.MENU_pause_key = vk_escape;
global.MENU_pause_gp = gp_start;

global.MENU_select_key = vk_enter;
global.MENU_select_gp = gp_face1;

global.MENU_exit_key = vk_escape;
global.MENU_exit_gp = gp_face2;

// player
global.PLAYER_left_key = ord("A");
global.PLAYER_left_gp = gp_padl;
		
global.PLAYER_right_key = ord("D");
global.PLAYER_right_gp = gp_padr;
		
global.PLAYER_down_key = ord("S");
global.PLAYER_down_gp = gp_padd;
		
global.PLAYER_up_key = ord("W");
global.PLAYER_up_gp = gp_padu;
		
global.PLAYER_jump_key = ord("K");
global.PLAYER_jump_gp = gp_face1;

global.PLAYER_dash_key = ord("J");
global.PLAYER_dash_gp = gp_face2

enum PLAYER_keybinds
{
	none,
	up,
	down,
	right,
	left,
	jump,
	dash
}

// game options
global.master_volume = 1.0;
global.is_fullscreen = false;
global.screen_shake_is_enabled = true;

// water effect
global.u_pixelh_wave = shader_get_uniform(sh_water, "pixelh");
global.u_pixelw_wave = shader_get_uniform(sh_water, "pixelw");
global.u_spring_count = shader_get_uniform(sh_water, "spring_count");
global.u_springs = shader_get_uniform(sh_water, "springs");
global.u_time = shader_get_uniform(sh_water, "time");


// saving and loading stuff
enum saves
{
	save_01,
	save_02,
	save_03
}

global.current_save_slot = saves.save_01;

// @debug stuff
global.debug_mode = false;
global.DEBUG_amount_of_objects_selected = 0;

// misc
global.use_scene_bloom_and_vignette = true;
global.use_main_menu = true;
global.is_paused = false;
global.target_delta = (1/60);
global.actual_delta = (delta_time / 1000000);
global.delta = (global.actual_delta / global.target_delta);
// global.discord_app_is_active = false;
global.use_instance_deactivation = true;
global.player_changing_rooms = false;

// areas
global.activate_jungle_area = false;
global.activate_library_area = false;
global.activate_mountain_area = false;
global.activate_playground_area = false;
global.activate_bonus_1_area = false;
global.activate_bonus_2_area = false;

// player
global.player = noone;
global.player_can_move = true;
global.player_dust_particles_layer = "player_dust_particles";
global.player_momentum_x = 0;
global.player_momentum_y = 0;
global.player_momentum_speed = 0;
global.player_belt_current_dir = 0;

// input
global.device = 0;
global.player_input_enable = true;
global.menu_input_enable = true;

// checkpoint system
global.checkpoint_id = noone;
global.checkpoint_room = 0;
global.checkpoint_x = 0;
global.checkpoint_y = 0;

/*
global.game_initial_room = rm_nexus;
global.game_initial_xpos = 200;
global.game_initial_ypos = 872;
*/

// camera
global.current_camera = view_camera[0];
global.camx = 0;
global.camy = 0;
global.cam_width = 320;
global.cam_height = 180;
global.cam_target = noone;
global.cam_x_min = 0;
global.cam_x_max = 0;
global.cam_y_min = 0;
global.cam_y_max = 0;

// camera shake
global.shake_length = 0;
global.shake_magnitude = 0;
global.shake_remain = 0;
global.screen_shake_x_enabled = true;
global.screen_shake_y_enabled = true;
global.screen_shake_xdir = 0;
global.screen_shake_ydir = 0;
global.screen_shake_dashing = false;
// global.screen_shake_random_seed = random_get_seed();