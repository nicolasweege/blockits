
// misc
global.console_enabled = false;
global.is_paused = false;
global.target_delta = (1/60);
global.actual_delta = (delta_time / 1000000);
global.delta = (global.actual_delta / global.target_delta);

// player
global.player = noone;
global.player_can_move = true;
global.player_input_enable = true;
global.player_dust_particles_layer = "player_dust_particles";

// input
global.device = 0;

// checkpoint system
global.checkpoint_id = noone;
global.checkpoint_room = 0;
global.checkpoint_x = 0;
global.checkpoint_y = 0;

// camera
global.current_camera = view_camera[0];
global.camx = 0;
global.camy = 0;
global.cam_width = 0;
global.cam_height = 0;
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
// global.screen_shake_random_seed = random_get_seed();