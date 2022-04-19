function screen_shake(val1, val2)
{
	with (global.camera)
	{
		if (val1 > shake_remain)
		{
			shake_magnitude = val1;
			shake_remain = shake_magnitude;
			shake_length = val2;
		}
	}
}
