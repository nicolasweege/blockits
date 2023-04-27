if (!global.player_can_move || global.is_paused)
{
	exit;	
}

image_alpha -= 0.05;
if (image_alpha <= 0)
{
	instance_destroy();	
}