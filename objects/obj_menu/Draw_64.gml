if (!global.pause) exit;

var g_width = global.view_width, g_height = global.view_height;
var ds_grid = menu_pages_list[page], ds_height = ds_grid_height(ds_grid);
var x_buffer = 16, y_buffer = 32;
var x_start_position = g_width/2, y_start_position = (g_height/2) - ((((ds_height-1)/2) * y_buffer));
var color = c_black;

draw_set_alpha(.9);
draw_rectangle_color(0, 0, g_width, g_height, color, color, color, color, false);
draw_set_alpha(1);

draw_set_valign(fa_center);
draw_set_font(fnt_01);

var left_text_x_position = x_start_position - x_buffer, left_text_y_position;

var yy = 0;
repeat(ds_height) {
	left_text_y_position = y_start_position + (yy*y_buffer);
	color = c_dkgray;
	
	switch(menu_pages_list[page]) {
		case 0:		
			if (yy == menu_option[page]) { color = c_white; }
			draw_set_halign(fa_center);
			draw_text_color(x_start_position, left_text_y_position, ds_grid[# 0, yy], color, color, color, color, 1);
			draw_set_halign(fa_left);
		break;
		
		case 1:
			if (yy == menu_option[page]) { color = c_white; }
			draw_set_halign(fa_center);
			draw_text_color(x_start_position, left_text_y_position, ds_grid[# 0, yy], color, color, color, color, 1);
			draw_set_halign(fa_left);
		break;
		
		case 4:
			if (yy == menu_option[page]) { color = c_white; }
			draw_set_halign(fa_center);
			draw_text_color(x_start_position, left_text_y_position, ds_grid[# 0, yy], color, color, color, color, 1);
			draw_set_halign(fa_left);
		break;
		
		default:	
			if (yy == menu_option[page]) { color = c_white; }
			if (ds_grid[# 0, yy] == "Back") {
				draw_set_halign(fa_center);
				draw_text_color(x_start_position, left_text_y_position, ds_grid[# 0, yy], color, color, color, color, 1);
				draw_set_halign(fa_left);
			} else {
				draw_set_halign(fa_right);
				draw_text_color(x_start_position, left_text_y_position, ds_grid[# 0, yy], color, color, color, color, 1);
				draw_set_halign(fa_left);
			}
		break;
	}
	yy++;
}

switch(menu_pages_list[page]) {
	case 0:
		color = c_white;
		draw_set_halign(fa_center);
		draw_line(x_start_position/1.5, left_text_y_position-y_buffer*3, (x_start_position/1.5)*2, left_text_y_position-y_buffer*3);
		draw_line(x_start_position/1.5, left_text_y_position-y_buffer*-1, (x_start_position/1.5)*2, left_text_y_position-y_buffer*-1);
		draw_line(x_start_position/1.5, left_text_y_position-y_buffer*3, x_start_position/1.5, left_text_y_position-y_buffer*-1);
		draw_line((x_start_position/1.5)*2, left_text_y_position-y_buffer*3, (x_start_position/1.5)*2, (left_text_y_position-y_buffer*-1));
		draw_set_halign(fa_left);
	break;
	
	case 1:
		color = c_white;
		draw_set_halign(fa_center);
		draw_text_color(x_start_position+1, left_text_y_position-y_buffer*4, "Options", color, color, color, color, 1);
		draw_line(x_start_position/1.5, left_text_y_position-y_buffer*3, (x_start_position/1.5)*2, left_text_y_position-y_buffer*3);
		draw_line(x_start_position/1.5, left_text_y_position-y_buffer*-1, (x_start_position/1.5)*2, left_text_y_position-y_buffer*-1);
		draw_line(x_start_position/1.5, left_text_y_position-y_buffer*3, x_start_position/1.5, left_text_y_position-y_buffer*-1);
		draw_line((x_start_position/1.5)*2, left_text_y_position-y_buffer*3, (x_start_position/1.5)*2, (left_text_y_position-y_buffer*-1));
		draw_set_halign(fa_left);
	break;
	
	case 2:
		color = c_white;
		draw_set_halign(fa_center);
		draw_text_color(x_start_position+1, left_text_y_position-y_buffer*5, "Audio", color, color, color, color, 1);
		draw_line(x_start_position/1.5, left_text_y_position-y_buffer*4, (x_start_position/1.5)*2, left_text_y_position-y_buffer*4);
		draw_line(x_start_position/1.5, left_text_y_position-y_buffer*-1, (x_start_position/1.5)*2, left_text_y_position-y_buffer*-1);
		draw_line(x_start_position/1.5, left_text_y_position-y_buffer*4, x_start_position/1.5, left_text_y_position-y_buffer*-1);
		draw_line((x_start_position/1.5)*2, left_text_y_position-y_buffer*4, (x_start_position/1.5)*2, (left_text_y_position-y_buffer*-1));
		draw_set_halign(fa_left);
	break;
	
	case 3:
		color = c_white;
		draw_set_halign(fa_center);
		draw_text_color(x_start_position+1, left_text_y_position-y_buffer*4, "Video", color, color, color, color, 1);
		draw_line(x_start_position/1.5, left_text_y_position-y_buffer*3, (x_start_position/1.5)*2, left_text_y_position-y_buffer*3);
		draw_line(x_start_position/1.5, left_text_y_position-y_buffer*-1, (x_start_position/1.5)*2, left_text_y_position-y_buffer*-1);
		draw_line(x_start_position/1.5, left_text_y_position-y_buffer*3, x_start_position/1.5, left_text_y_position-y_buffer*-1);
		draw_line((x_start_position/1.5)*2, left_text_y_position-y_buffer*3, (x_start_position/1.5)*2, (left_text_y_position-y_buffer*-1));
		draw_set_halign(fa_left);
	break;
	
	case 4:
		color = c_white;
		draw_set_halign(fa_center);
		draw_text_color(x_start_position+1, left_text_y_position-y_buffer*3, "Quit Game?", color, color, color, color, 1);
		draw_line(x_start_position/1.5, left_text_y_position-y_buffer*2, (x_start_position/1.5)*2, left_text_y_position-y_buffer*2);
		draw_line(x_start_position/1.5, left_text_y_position-y_buffer*-1, (x_start_position/1.5)*2, left_text_y_position-y_buffer*-1);
		draw_line(x_start_position/1.5, left_text_y_position-y_buffer*2, x_start_position/1.5, left_text_y_position-y_buffer*-1);
		draw_line((x_start_position/1.5)*2, left_text_y_position-y_buffer*2, (x_start_position/1.5)*2, (left_text_y_position-y_buffer*-1));
		draw_set_halign(fa_left);
	break;
}



var right_text_x_position = x_start_position + x_buffer, right_text_y_position;
yy = 0;

repeat(ds_height) {
	right_text_y_position = y_start_position + (yy*y_buffer);
	
	switch(ds_grid[# 1, yy]) {
		case menu_element_type.shift:
			var current_value = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			color = c_dkgray;
			if (yy == menu_option[page]) { color = c_white; }
			draw_text_color(right_text_x_position, right_text_y_position, current_array[current_value], color, color, color, color, 1);
		break;
		
		case menu_element_type.slider:
			var audio_line_length = 64;
			var current_value = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var circle_position = ((current_value - current_array[0]) / (current_array[1] - current_array[0]));
			color = c_dkgray;
			if (yy == menu_option[page]) { color = c_white; }
			draw_line_width_color(right_text_x_position, right_text_y_position, right_text_x_position+audio_line_length, right_text_y_position, 2, color, color);
			draw_circle_color(right_text_x_position+(circle_position*audio_line_length), right_text_y_position, 4, color, color, false);
			draw_text_color(right_text_x_position+(audio_line_length*1.2), right_text_y_position, string(floor(circle_position*10)), color, color, color, color, 1);
		break;
		
		case menu_element_type.toggle:
			var current_value = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			color = c_dkgray;
			if (yy == menu_option[page]) { color = c_white; }
			draw_text_color(right_text_x_position, right_text_y_position, current_array[current_value], color, color, color, color, 1);
		break;
	}
	yy++;
}

draw_set_font(-1);
draw_set_valign(fa_top);