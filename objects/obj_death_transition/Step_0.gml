

if (fade_in && alpha < 1)
{
	alpha += transition_speed;
}

if (alpha >= 1 && fade_in)
{
	time_source_start(transition_timer);
	fade_in = false;
}

if (fade_out && alpha > 0)
{
	alpha -= transition_speed;
}

if (fade_out && alpha <= 0)
{
	global.player_input_enable = true;
	instance_destroy();
}