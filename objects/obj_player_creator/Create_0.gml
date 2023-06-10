if (!instance_exists(obj_player))
{
	instance_create_layer(player_x_start_pos, 
	                      player_y_start_pos,
						  PLAYER_LAYER_NAME,
						  obj_player);	
}