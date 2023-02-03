draw_set_font(fnt_default);

if (show_debug_info)
{
	draw_text_transformed(0, 5, "FPS: " + string(fps), 0.5, 0.5, 0);
	draw_text_transformed(0, 10, "FPS real: " + string(fps_real), 0.5, 0.5, 0);
}