set_initial_game_stuff();

// Player
if (!instance_exists(obj_player))
{
	var player = instance_create_layer(0, 0, PLAYER_LAYER, obj_player);
	player.player_state = player.lock_state;
}

// Game controller
if (!instance_exists(obj_game_controller))
{
	instance_create_layer(0, 0, "controllers", obj_game_controller);
}

// Level editor
if (!instance_exists(obj_level_editor))
{
	instance_create_layer(0, 0, "controllers", obj_level_editor);
}

/*
    if (!instance_exists(obj_main_menu))
    {
    	instance_create_layer(0, 0, "controllers", obj_main_menu);
    }
*/

// Pause menu
if (!instance_exists(obj_pause_menu))
{
	instance_create_layer(0, 0, "controllers", obj_pause_menu);
}

// Debugging
if (!instance_exists(obj_debug))
{
	instance_create_layer(0, 0, "controllers", obj_debug);
}

// Camera
if (!instance_exists(obj_camera))
{
	instance_create_layer(0, 0, "camera", obj_camera);
}

// Discord stuff
if (!instance_exists(objNekoPresenceDemo))
{
	instance_create_layer(0, 0, "controllers", objNekoPresenceDemo);	
}

global.app_state = states.MAIN_MENU;

room_goto(rm_main_menu);
// room_goto(rm_nexus);
// room_goto(rm_jungle);
// room_goto(rm_library);
// room_goto(rm_mountain);
// room_goto(rm_playground);
// room_goto(rm_bonus_1);
// room_goto(rm_bonus_2);