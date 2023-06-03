if (global.is_paused)
{
	exit;	
}

if (timer_to_back > 0)
{
	// timer_to_back--;
	timer_to_back -= global.delta;
}

if (timer_to_back <= 0)
{
	back_to_checkpoint = true;
}

// going back to the checkpoint spot
if (back_to_checkpoint && !came_back)
{
	speed = 0;
	var dir = point_direction(x, y, x_to, y_to);
	x += (lengthdir_x(spd, dir) * global.delta);
	y += (lengthdir_y(spd, dir) * global.delta);
	
	if (abs(x - x_to) < 5 && abs(y - y_to) < 5)
	{
		came_back = true;
	}
}

// back to playing
if (is_last_par && came_back)
{
	global.player = instance_create_layer(global.checkpoint_x, 
	                                      global.checkpoint_y, 
										  "Player", 
										  obj_player);
										  
	screen_shake(5, 10, true, true);
										  
	// global.player.xscale = image_xscale;
	global.cam_target = obj_player;
	
	if (instance_exists(obj_player_death_par)) 
	{	
		instance_destroy(obj_player_death_par);
	}
}