// glowing
if (time < duration)
{
	glow = ease_in_and_out(time, start, dest - start, duration);
	time++;
}
else
{
	var temp_start = start;
	start = dest;
	dest = temp_start;
	time = 0;
}

alpha = (0 + (glow/10));