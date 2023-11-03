draw_set_font(fnt_default);

// menu background
draw_set_alpha(0.8);
/*
draw_rectangle_color(0, 0, global.cam_width, global.cam_height, 
	                    c_black, c_black, c_black, c_black, 
						0);
						*/

current_menu();

draw_set_alpha(1.0);
draw_set_font(-1);