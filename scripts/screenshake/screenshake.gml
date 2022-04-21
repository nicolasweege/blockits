function screen_shake(magnitude, length)
{
	with (global.camera)
	{
		if (magnitude > shake_remain)
		{
			shake_magnitude = magnitude;
			shake_remain = shake_magnitude;
			shake_length = length;
		}
	}
}
