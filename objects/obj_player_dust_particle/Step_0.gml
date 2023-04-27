if (!global.player_can_move || global.is_paused)
{
	exit;	
}

image_alpha -= 0.025;
if (image_alpha <= 0)
{
	instance_destroy();
}