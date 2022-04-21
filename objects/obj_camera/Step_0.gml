if (global.pause) exit;

if (instance_exists(follow))
{
	xto = follow.x;
	yto = follow.y;
}

x += (xto - x) / 10;
y += (yto - y) / 10;

x = clamp(x, cam_half_width, room_width-cam_half_width);
y = clamp(y, cam_half_height, room_height-cam_half_height);

x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);

shake_remain = max(0, shake_remain - ((1/shake_length) * shake_magnitude));

camera_set_view_pos(cam, x-cam_half_width, y-cam_half_height);
