if (instance_exists(obj_player))
{
	if (place_meeting(x, y, obj_player)
	    && obj_player.on_floor)
	{
		global.checkpoint_id = id;
		global.checkpoint_room = room;
		global.checkpoint_x = x;

		// global.checkpoint_y = y;
		global.checkpoint_y = y - 5;
	}
}