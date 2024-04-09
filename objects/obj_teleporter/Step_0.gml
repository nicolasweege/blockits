if (global.is_paused)
{
	if (!has_paused)
	{
		image_speed = 0;
		has_paused = true;
		has_unpaused = false;
	}
	
	exit;
}
else
{
	if (!has_unpaused)
	{
		image_speed = 1;
		has_unpaused = true;
		has_paused = false;
	}
}


current_state();