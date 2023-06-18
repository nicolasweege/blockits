if (instance_exists(obj_player))
{
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
			sprite_index = spr_timed_slab;
		}
	}
}