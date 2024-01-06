if (place_meeting(x, y - 1, obj_player))
{
	image_index = 1;
}
else
{
	current_state = default_state;
	image_index = 0;
}

if (obj_player.y > y) 
{
	sprite_index = -1;
}
else 
{
	sprite_index = sprite_to_draw;
}

current_state();