temp_colliding_with_player = place_meeting(x, y, obj_player);
if (temp_colliding_with_player
    && !colliding_with_player)
{
	with (obj_player)
	{
		player_on_direct_state = false;	
	}
}

colliding_with_player = place_meeting(x, y, obj_player);
if (colliding_with_player 
    && !obj_player.player_on_direct_state)
{
	with (obj_player)
	{
		x = other.x;
		y = (other.y + (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2));
		player_on_direct_state = true;
		player_state = pre_direct_state;
	}
}