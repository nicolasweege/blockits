if (global.pause) exit;

if (following_object != noone){
	x_to = following_object.x;
	y_to = following_object.y;
}

x += (x_to - x) / 10;
y += (y_to - y) / 10;

x = clamp(x, camera_width_half, room_width-camera_width_half);
y = clamp(y, camera_height_half, room_height-camera_height_half);

camera_set_view_pos(global.camera, x-camera_width_half, y-camera_height_half);