set_initial_game_stuff();

if (!instance_exists(obj_player))
{
	var player = instance_create_layer(0, 0, PLAYER_LAYER, obj_player);
	player.player_state = player.lock_state;
}

if (!instance_exists(obj_game_controller))
{
	instance_create_layer(0, 0, "controllers", obj_game_controller);
}

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

if (!instance_exists(obj_pause_menu))
{
	instance_create_layer(0, 0, "controllers", obj_pause_menu);
}

if (!instance_exists(obj_debug))
{
	instance_create_layer(0, 0, "controllers", obj_debug);
}

if (!instance_exists(obj_camera))
{
	instance_create_layer(0, 0, "camera", obj_camera);
}

// discord stuff
if (!instance_exists(objNekoPresenceDemo))
{
	instance_create_layer(0, 0, "controllers", objNekoPresenceDemo);	
}

global.app_state = states.MAIN_MENU;

room_goto(rm_main_menu);