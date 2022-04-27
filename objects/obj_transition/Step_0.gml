var time = .08;

if (!is_transition_finished)
	alpha += time;

if (alpha >= 1)
{
	is_transition_finished = true;
	global.menu.draw_redefined_inputs = true;
}

if (is_transition_finished)
	alpha -= time;

if (is_transition_finished && alpha == 0)
	instance_destroy();
