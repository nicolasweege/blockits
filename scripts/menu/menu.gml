function create_game_menu(xx, yy, options, desc = -1)
{
	with (instance_create_depth(xx, yy, -9999, obj_menu))
	{
		menu_options = options;
		menu_desc = desc;
		options_count = array_length(options);
		hover_marker = "* ";
		
		margin = 8;
		draw_set_font(fnt_default);
		
		width = 1;
		if (desc != -1)
		{
			width = max(width, string_width(desc));
		}
		
		for (var i = 0; i < options_count; i++)
		{
			width = max(width, string_width(options[i][0]));
		}
		width += string_width(hover_marker);
		
		height_line = 17;
		height = (height_line * (options_count + !(menu_desc == -1)));
		
		width_full = (width + (margin * 2));
		height_full = (height + (margin * 2));
	}
}