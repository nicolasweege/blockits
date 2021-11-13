global.view_width	= 640;
global.view_height	= 480;

aspect_ratio = display_get_width()/display_get_height();
global.view_width = round(global.view_width*aspect_ratio);

if (display_get_width() mod global.view_width != 0){
	var _d = round(display_get_width()/global.view_width);
	global.view_width = display_get_width()/_d;
}
if (display_get_height() mod global.view_height != 0){
	var _d = round(display_get_height()/global.view_height);
	global.view_height = display_get_height()/_d;
}

if (global.view_width & 1){ global.view_width++; }
if (global.view_height & 1){ global.view_height++; }

camera_width_half	= global.view_width * .5;
camera_height_half	= global.view_height * .5;
following_obj		= noone;
x_to				= xstart;
y_to				= ystart;

window_set_size(global.view_width, global.view_height);
alarm[0] = 1;

surface_resize(application_surface, global.view_width, global.view_height);
display_set_gui_size(global.view_width, global.view_height);