cam = view_camera[0];

cam_half_width = camera_get_view_width(cam) * .5;
cam_half_height = camera_get_view_height(cam) * .5;

follow = obj_player;

xto = xstart;
yto = ystart;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
