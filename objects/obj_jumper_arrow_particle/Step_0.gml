if (global.is_paused 
	|| !global.player_can_move)
{
	speed = 0;
	exit;
}

if (image_alpha > 0)
{
	image_alpha -= alpha_speed;	
}
else
{
	instance_destroy();	
}

// speed = original_speed;
speed = lerp(speed, original_speed, 0.2);