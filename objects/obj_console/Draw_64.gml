if (!global.console_enabled)
{
	exit;
}

// drawing backgrounds
draw_set_color(text_bg_color);
draw_set_alpha(text_bg_alpha);
draw_rectangle(0, 0, width, height, false);

draw_set_color(text_line_bg_color);
draw_set_alpha(text_line_alpha);
draw_rectangle(0, height-20, width, height, false);

// drawing text array
draw_set_font(font);
draw_set_color(text_primary_color);
draw_set_alpha(text_primary_alpha);
draw_set_valign(fa_bottom);

for (var i = 0; i < array_length(text_array); i++)
{
	var line_size;
	line_size = string_height(string_hash_to_newline(text_array[i]));
	draw_text_ext(text_def_length + 1, height-(i*line_size)-32, 
	              string_hash_to_newline(text_array[i]), -1, width);
}

// drawing line text
draw_set_color(text_line_color);
draw_set_alpha(text_line_alpha);
draw_set_valign(fa_top);
draw_text(4, height-20, string_hash_to_newline(current_line + cursor));

// reseting
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_valign(fa_top);