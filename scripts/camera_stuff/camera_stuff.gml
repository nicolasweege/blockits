function screen_shake(magnitude, length)
{
	if (magnitude > global.shake_remain)
	{
		global.shake_magnitude = magnitude;
		global.shake_remain = global.shake_magnitude;
		global.shake_length = length;
	}
}