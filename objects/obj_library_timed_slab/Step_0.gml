if (!instance_exists(obj_player))
{
	exit;	
}

if (obj_player.player_state == obj_player.god_mode_state
    || obj_player.player_state == obj_player.death_state)
{
	exit;	
}

if (obj_player.y > y) 
{
	sprite_index = -1;
}
else 
{
	if (place_meeting(x, y - 1, obj_player) && !can_destroy)
	{
		can_destroy = true;
		time_source_start(destroy_timer);
	}
	else if (!can_destroy)
	{
		sprite_index = sprite_to_draw;
	}
}