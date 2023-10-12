// water effect
/*
global.u_pixelh_wave = 0;
global.u_pixelw_wave = 0;
global.u_spring_count = 0;
global.u_springs = 0;
global.u_time = 0;
*/

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

// misc
global.use_main_menu = true;
global.console_enabled = false;
global.is_paused = false;
global.target_delta = (1/60);
global.actual_delta = (delta_time / 1000000);
global.delta = (global.actual_delta / global.target_delta);
// global.discord_app_is_active = false;
global.use_instance_deactivation = false;

// player
global.player = noone;
global.player_can_move = true;
global.player_input_enable = true;
global.player_dust_particles_layer = "player_dust_particles";

global.player_momentum_x = 0;
global.player_momentum_y = 0;
global.player_momentum_speed = 0;

// input
global.device = 0;

// checkpoint system
global.checkpoint_id = noone;
global.checkpoint_room = 0;
global.checkpoint_x = 0;
global.checkpoint_y = 0;

global.game_initial_room = rm_nexus;
global.game_initial_xpos = 200;
global.game_initial_ypos = 872;

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
global.screen_shake_is_enabled = true;
global.shake_length = 0;
global.shake_magnitude = 0;
global.shake_remain = 0;
global.screen_shake_x_enabled = true;
global.screen_shake_y_enabled = true;
// global.screen_shake_random_seed = random_get_seed();