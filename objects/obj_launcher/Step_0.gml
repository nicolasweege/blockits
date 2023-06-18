// TODO: melhorar o impulso, fazer com que tenha um momentum no player
// apos ser lancado (talvez de pra usar point_direction pra isso, igual o dash)

h_speed = (hdir * current_speed);

if (place_meeting(x, y - 1, obj_player))
{
	with (obj_player)
	{
		// h_speed *= other.h_speed;
		x += other.h_speed;
	}
}