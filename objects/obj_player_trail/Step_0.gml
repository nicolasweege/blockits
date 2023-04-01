if (!global.player_can_move)
{
	exit;	
}

image_alpha -= 0.05;
if (image_alpha <= 0)
{
	instance_destroy();	
}