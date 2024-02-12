if (global.is_paused 
	|| !global.player_can_move)
{
	image_speed = 0;
	speed = 0;
	exit;
}

image_speed = original_image_speed;
speed = original_speed;