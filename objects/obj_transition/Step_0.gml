var time = .08;

if (!transition_finished)
{
	alpha += time;
}

if (alpha >= 1)
{
	transition_finished = true;
	global.menu.draw_redefined_inputs = true;
}

if (transition_finished)
{
	alpha -= time;
}

if (transition_finished && alpha == 0)
{
	instance_destroy();
}
