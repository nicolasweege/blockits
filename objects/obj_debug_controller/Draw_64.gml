draw_set_font(fnt_debug_01);

if (show_debug)
{
	show_debug_overlay(true);
	
	draw_set_color(c_green);
	draw_text_transformed(display_get_gui_width() * .5, 5, "FPS: " + string(fps), .1, .1, 0);
	
	draw_set_color(c_yellow);
	draw_text_transformed(display_get_gui_width() * .5, 10, "Player State: " + global.player.state, .1, .1, 0);
	draw_text_transformed(display_get_gui_width() * .5, 15, "Player X: " + string(global.player.x), .1, .1, 0);
	draw_text_transformed(display_get_gui_width() * .5, 20, "Player Y: " + string(global.player.y), .1, .1, 0);
}

if (!show_debug)
	show_debug_overlay(false);

draw_set_color(c_white);
draw_set_font(-1);