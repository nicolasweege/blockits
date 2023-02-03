draw_set_font(fnt_default);

if (show_debug_info)
{
	draw_text_transformed(0, 5, + string(fps), 1, 1, 0);
	// draw_text_transformed(0, 10, "FPS real: " + string(fps_real), 0.5, 0.5, 0);
}

// taking screenshots
if (keyboard_check_pressed(vk_f6))
{
	capture_entire_screen("screen");
}

/*
var _button = blockits_draw_button(100, 50, "screen shot", 
                     100, 32, c_white, c_green, c_white);

if (_button)
{
	capture_entire_screen("screen");
}
*/