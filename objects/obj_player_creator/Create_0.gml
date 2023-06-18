if (!instance_exists(obj_player))
{				  
	instance_create_layer(x, y, PLAYER_LAYER_NAME, obj_player);
}