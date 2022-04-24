function move_camera()
{
	var playerx, playery;
	
	playerx = (x div CAM_W) * CAM_W;
	playery = (y div CAM_H) * CAM_H;
	
	var camerax = lerp(camera_get_view_x(view_camera[0]), playerx, .08);
	var cameray = lerp(camera_get_view_y(view_camera[0]), playery, .08);
	
	camerax += random_range(-shake_remain, shake_remain);
	cameray += random_range(-shake_remain, shake_remain);

	shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));
	
	camera_set_view_pos(view_camera[0], camerax, cameray);
}

function screen_shake(magnitude, length)
{
	with (global.player)
	{
		if (magnitude > shake_remain)
		{
			shake_magnitude = magnitude;
			shake_remain = shake_magnitude;
			shake_length = length;
		}
	}
}
