function move_player_camera()
{	
	playerx = (x div VIEW_W) * VIEW_W;
	playery = (y div VIEW_H) * VIEW_H;
	
	camerax = lerp(camera_get_view_x(view_camera[0]), playerx, 1);
	cameray = lerp(camera_get_view_y(view_camera[0]), playery, 1);
	
	camerax += random_range(-global.shake_remain, global.shake_remain);
	cameray += random_range(-global.shake_remain, global.shake_remain);
	global.shake_remain = max(0, global.shake_remain - ((1 / global.shake_length) * global.shake_magnitude));
	
	camera_set_view_pos(view_camera[0], camerax, cameray);
}

function screen_shake(magnitude, length)
{
	if (magnitude > global.shake_remain)
	{
		global.shake_magnitude = magnitude;
		global.shake_remain = global.shake_magnitude;
		global.shake_length = length;
	}
}
