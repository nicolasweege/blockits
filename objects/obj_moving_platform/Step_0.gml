

h_speed = (dir * current_speed);

if (instance_place(x + h_speed, y, obj_platform_point)
    || instance_place(x + h_speed, y, obj_default_collider))
{
	dir *= -1;
}

if (place_meeting(x, y - 1, obj_player))
{
	with (obj_player)
	{
		if (!place_meeting(x + other.h_speed, y, obj_default_collider))
		{
			x += other.h_speed;
		}
	}
}

x += h_speed;