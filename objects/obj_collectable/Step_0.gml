image_angle += 5;

if (place_meeting(x, y, obj_player))
{
	instance_destroy();
}



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