global.player = noone;
global.player_can_move = true;
global.console_enabled = false;

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