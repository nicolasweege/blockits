function ease_in_and_out(time, _begin, change, duration)
{
	time /= (duration / 2);
	
	if (time < 1)
	{
		return (((change / 2) * (time * time)) + _begin);
	}
	
	time--;
	return (((-change / 2) * ((time * (time - 2)) -1)) + _begin);
}

function ease_bounce(time, _begin, change, duration)
{
	var s = 1.7;
	var p = 0;
	var a = change;
	
	if (time == 0)
	{
		return _begin;	
	}
	
	time /= duration;
	
	if (time == 1)
	{
		return _begin + change;	
	}
	
	if (!p)
	{
		p = (duration * 0.1);
	}
	
	if (a < abs(change))
	{
		a = change;
		s = (p / 4);
	}
	else
	{
		s = (p / ((2 * pi) * arcsin(change/a)));
	}
	
	return a * power(2, -10*time) * sin((time*duration - s) * 
	       (2*pi) / p) + change + _begin;
}

function capture_entire_screen(name)
{
	var i = 0;
	var file_name = name;
	
	do
	{
		file_name = (game_save_id + string(name) + "_" + string(i) + ".png");
		i++;
	}
	until (!file_exists(file_name))
	{
		// taking the screenshot
		screen_save(file_name);
		
		return file_exists(file_name);
	}
}

function blockits_draw_button(_x, _y, text, width, height, color, hover_color, bg_color)
{
	var xx = _x;
	var yy = _y;
	var w = (width/2);
	var h = (height/2);
	
	var original_color = draw_get_color();
	var original_alpha = draw_get_alpha();
	
	var border_left = xx - w;
	var border_right = xx + w;
	var border_top = yy - h;
	var border_bottom = yy + h;
	
	var mouse_within = point_in_rectangle(device_mouse_x_to_gui(0), 
	                                      device_mouse_y_to_gui(0), 
	                                      border_left, border_top, 
	                                      border_right, border_bottom);

	if (mouse_within)
	{
		draw_set_color(bg_color);
		draw_set_alpha(0.2);
		
		draw_rectangle(border_left, border_top, border_right, 
		               border_bottom, false);
					   
		draw_set_color(hover_color);
		draw_set_alpha(1);
	}
	else
	{
		draw_set_color(color);
		draw_set_alpha(0.5);
	}
		
	draw_rectangle(border_left, border_top, border_right, 
		            border_bottom, true);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(xx, yy, text);
	
	// reseting
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(original_color);
	draw_set_alpha(original_alpha);
	
	return (mouse_within && mouse_check_button_pressed(mb_left));
}

function log(text_to_print)
{
	if (!instance_exists(obj_console))
	{
		exit;	
	}
	
	with (obj_console)
	{
		for (var i = (array_length(text_array) - 1); i >= 0; i--)
		{
			text_array[i+1] = text_array[i];
		}
		
		text_array[0] = string(text_to_print);
		current_line = text_def;
	}
}

function create_object(_x, _y, obj_name)
{
	// using strings as parameters
	// var _string;
	// _string += string(string_arg) + "";
	
	var xx = real(_x);
	var yy = real(_y);
	var obj = asset_get_index(obj_name);
	
	if (obj != -1)
	{
		instance_create_layer(xx, yy, "misc", obj);
	}
	else
	{
		log("instance does not exist");
	}
}

function tile_meeting(obj_x, obj_y, collision_layer)
{
    var tilemap = layer_tilemap_get_id(collision_layer);

	var _x1 = tilemap_get_cell_x_at_pixel(tilemap, bbox_left + (obj_x - x), y),
	    _y1 = tilemap_get_cell_y_at_pixel(tilemap, x, bbox_top + (obj_y - y)),
	    _x2 = tilemap_get_cell_x_at_pixel(tilemap, bbox_right + (obj_x - x), y),
	    _y2 = tilemap_get_cell_y_at_pixel(tilemap, x, bbox_bottom + (obj_y - y));

	for (var _x = _x1; _x <= _x2; _x++)
	{
		 for (var _y = _y1; _y <= _y2; _y++)
		 {
		    if (tile_get_index(tilemap_get(tilemap, _x, _y)))
			{
				return true;
		    }
		 }
	}

	return false;
}