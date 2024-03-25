
if (obj_player.player_state == obj_player.god_mode_state
    || obj_player.player_state == obj_player.death_state
	|| global.is_paused)
{
	exit;
}

/*
temp_colliding_with_player = place_meeting(x, y, obj_player);
if (temp_colliding_with_player
    && !colliding_with_player)
{
    obj_player.player_on_capsule_state = false;
}
*/

current_state();