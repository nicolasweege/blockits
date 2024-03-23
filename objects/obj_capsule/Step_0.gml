
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

colliding_with_player = place_meeting(x, y, obj_player);
if (colliding_with_player
    && obj_player.player_state != obj_player.on_capsule_state
    && obj_player.player_can_enter_capsule)
{
    with (obj_player)
	{
		x = other.x;
		y = (other.y + (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2));
		
		player_on_capsule_state = true;
		
		player_state = on_capsule_state;
	}
}