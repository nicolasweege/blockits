if (!instance_exists(obj_player))
{   
	set_initial_game_stuff();
	
	// GMLive
    /*
	if (!instance_exists(obj_gmlive))
    {
    	instance_create_layer(0, 0, CONTROLLERS_LAYER, obj_gmlive);
    }
    */

    // Player
    if (!instance_exists(obj_player))
    {
    	var player = instance_create_layer(x, y, PLAYER_LAYER, obj_player);
    	player.player_state = player.free_state;
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
    
    global.app_state = states.GAME;
}