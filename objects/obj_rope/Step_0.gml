if (instance_place(x, y, obj_player)
    && obj_player.player_state != obj_player.rope_swing_state)
{
	with (obj_player)
	{
		grapple_x = other.x;
		grapple_y = other.y;
		rope_x = x;
		rope_y = y;
		rope_angle_vel = 0;
		rope_angle = point_direction(grapple_x, grapple_y, x, y);
		rope_length = point_distance(grapple_x, grapple_y, x, y);
		player_state = rope_swing_state;
	}
}