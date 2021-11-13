if (global.pause) exit;

#macro VIEW view_camera[0]
camera_set_view_size(VIEW, global.view_width, global.view_height);

if (following_obj != noone){
	x_to = following_obj.x;
	y_to = following_obj.y;
	x += (x_to - x) / 10;
	y += (y_to - y) / 10;
	x = clamp(x, camera_width_half, room_width-camera_width_half);
	y = clamp(y, camera_height_half, room_height-camera_height_half);

	camera_set_view_pos(VIEW, x-camera_width_half, y-camera_height_half);
}