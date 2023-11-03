draw_sprite_stretched(spr_menu, 0, (x - margin), (y - margin), width_full, height_full);

draw_set_color(c_white);
draw_set_font(fnt_default);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var desc = !(menu_desc == -1);
for (i = 0; i < (options_count + desc); i++)
{
	draw_set_color(c_gray);
	if (i == 0 && desc)
	{
		draw_text(x, y, menu_desc);
	}
	else
	{
		var menu_string = menu_options[(i - desc)][0];
		if (hover == (i - desc))
		{
			draw_set_color(c_white);
			menu_string = (hover_marker + menu_string);
		}
		
		draw_text(x, (y + (i * height_line)), menu_string);
	}
}

draw_set_color(c_white);
draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);