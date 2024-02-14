if (global.is_paused 
	|| obj_player.player_state == obj_player.god_mode_state)
{
	exit;
}

depth = obj_player.depth + 1;

rotation += 0.5;

alpha -= alpha_speed;

if (alpha <= 0)
{
	obj_player.use_dash_boom_color = false;
	instance_destroy();
}