
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