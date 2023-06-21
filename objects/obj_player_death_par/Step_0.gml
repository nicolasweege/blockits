if (global.is_paused
    || global.console_enabled)
{
	exit;
}

// going back to the checkpoint spot
if (back_to_checkpoint 
    && !came_back)
{
	speed = 0;
	var dir = point_direction(x, y, x_to, y_to);
	x += (lengthdir_x(spd, dir));
	y += (lengthdir_y(spd, dir));
	
	if (abs(x - x_to) < 5 && abs(y - y_to) < 5)
	{
		came_back = true;
	}
}

// back to playing
if (is_last_par 
    && came_back)
{
	global.player = instance_create_layer(global.checkpoint_x, 
	                                      global.checkpoint_y, 
										  "Player", 
										  obj_player);
										  
	screen_shake(5, 10, true, true);
	global.cam_target = obj_player;
	
	if (instance_exists(obj_player_death_par)) 
	{	
		instance_destroy(obj_player_death_par);
	}
}