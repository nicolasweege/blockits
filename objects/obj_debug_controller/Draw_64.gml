draw_set_font(fnt_default_text);

if (show_debug)
{
	show_debug_overlay(1);
	draw_set_color(c_green);
	draw_text_transformed(display_get_gui_width() * .96, 5, "FPS: " + string(fps), .2, .2, 0);
	draw_set_color(-1);
}

if (!show_debug)
	show_debug_overlay(0);

draw_set_font(-1);