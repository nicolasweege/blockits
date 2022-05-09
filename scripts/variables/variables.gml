global.pause = false;
global.can_player_move = true;
global.device = 0;
global.is_gamepad = false;

global.checkpoint_id = noone;
global.checkpoint_room = 0;
global.checkpoint_x = 0;
global.checkpoint_y = 0;

global.shake_length = 0;
global.shake_magnitude = 0;
global.shake_remain = 0;

#region Keyboard Inputs
global.input_vk_right = DEFAULT_INPUT_VK_RIGHT;
global.input_vk_left = DEFAULT_INPUT_VK_LEFT;
global.input_vk_jump = DEFAULT_INPUT_VK_JUMP;
global.input_vk_switch_colliders = DEFAULT_INPUT_VK_SWITCH_COLLIDERS;
#endregion

#region Gamepad Inputs
global.input_gp_right = DEFAULT_INPUT_GP_RIGHT;
global.input_gp_left = DEFAULT_INPUT_GP_LEFT;
global.input_gp_jump = DEFAULT_INPUT_GP_JUMP;
global.input_gp_switch_colliders = DEFAULT_INPUT_GP_SWITCH_COLLIDERS;
#endregion
