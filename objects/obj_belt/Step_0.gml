h_speed = (hdir * current_speed);

if (place_meeting(x, y - 1, obj_player))
{
	with (obj_player)
	{
		x += other.h_speed;
	}
}