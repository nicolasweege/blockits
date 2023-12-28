function screen_shake(magnitude, length, x_shake, y_shake)
{
	if (magnitude > global.shake_remain)
	{
		global.shake_magnitude = magnitude;
		global.shake_remain = global.shake_magnitude;
		global.shake_length = length;
	}
	
	global.screen_shake_x_enabled = x_shake;
	global.screen_shake_y_enabled = y_shake;
}

function screen_shake_dash(magnitude, length, x_shake, y_shake, xdir, ydir)
{
	if (magnitude > global.shake_remain)
	{
		global.shake_magnitude = magnitude;
		global.shake_remain = global.shake_magnitude;
		global.shake_length = length;
	}
	
	global.screen_shake_x_enabled = x_shake;
	global.screen_shake_y_enabled = y_shake;
	global.screen_shake_xdir = xdir;
	global.screen_shake_ydir = ydir;
	
	global.screen_shake_dashing = true;
}