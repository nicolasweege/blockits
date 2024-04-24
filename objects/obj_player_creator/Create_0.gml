if (!instance_exists(obj_player))
{				  
	var _player = instance_create_layer(x, y, PLAYER_LAYER, obj_player);
	_player.player_state = _player.free_state;
}
else
{
    /*
        if (room_previous == rm_main_menu)
        obj_player.x            = x;
        obj_player.y            = (y - 5);
        obj_player.player_state = obj_player.free_state;
        
        global.player_can_move  = true;
    */
}