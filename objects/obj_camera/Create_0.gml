global.camera = view_camera[0];

camera_width_half = camera_get_view_width(global.camera) * .5;
camera_height_half = camera_get_view_height(global.camera) * .5;

following_object = noone;
x_to = xstart;
y_to = ystart;