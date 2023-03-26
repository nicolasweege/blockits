// image_angle += 1;

if (time < duration)
{
	hover = ease_in_and_out(time, start, dest - start, duration);
	time++;
}
else
{
	var temp_start = start;
	start = dest;
	dest = temp_start;
	time = 0;
}

if (instance_exists(obj_player))
{
	x = lerp(x, obj_player.x - 20, 0.1);
	y = lerp(y, obj_player.y - 30, 0.1);
}