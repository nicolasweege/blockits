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

function CAMERA_handle_screen_shake()
{
	if (global.screen_shake_is_enabled
	    && global.shake_remain != 0)
	{
		if (global.screen_shake_x_enabled)
		{
			if (global.screen_shake_dashing)
			{
				if (global.screen_shake_xdir == 1)
				{
					global.camx += sin(global.shake_remain * 3);
				}
				if (global.screen_shake_xdir == -1)
				{
					global.camx += sin(global.shake_remain * 3);
				}
			}
			else
			{
				global.camx += sin(global.shake_remain * 3);
			}
			// global.camx += irandom_range(-global.shake_remain, global.shake_remain);
			// global.camx += random_range(-global.shake_remain, global.shake_remain);
			
		}
		if (global.screen_shake_y_enabled)
		{
			if (global.screen_shake_dashing)
			{
				if (global.screen_shake_ydir == 1)
				{
					global.camy += sin(global.shake_remain * 3);
				}
				if (global.screen_shake_ydir == -1)
				{
					global.camy += sin(global.shake_remain * 3);
				}
			}
			else
			{
				global.camy += sin(global.shake_remain * 3);
			}
			// global.camy += irandom_range(-global.shake_remain, global.shake_remain);
			// global.camy += random_range(-global.shake_remain, global.shake_remain);
		}
		global.screen_shake_dashing = false;

		global.shake_remain = max(0, 
		                          (global.shake_remain - 
								  ((1/global.shake_length) * global.shake_magnitude)));
	}
}