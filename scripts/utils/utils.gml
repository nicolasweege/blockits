function BLOCKITS_draw_grid(x_cell_value,
                            y_cell_value,
                            horizontal_lines_color,
                            vertical_lines_color,
                            line_thickness,
                            lines_alpha)
{
    draw_set_color(horizontal_lines_color);
    draw_set_alpha(lines_alpha);
    
    // horizontal lines
    for (var line = -1; line < room_height; line += x_cell_value)
    {
        draw_line_width(0, line, room_width, line, line_thickness);
    }
    
    draw_set_color(vertical_lines_color);
    
    // vertical lines
    for (var line = -1; line < room_width; line += y_cell_value)
    {
        draw_line_width(line, 0, line, room_height, line_thickness);
    }
    
    draw_set_alpha(1);
    draw_set_color(c_white);
}

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
	var i         = 0;
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