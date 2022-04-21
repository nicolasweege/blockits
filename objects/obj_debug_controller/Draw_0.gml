draw_set_font(fnt_default_text);

if (show_debug)
{
	show_debug_overlay(1);
	draw_set_color(c_yellow);
	draw_text_transformed(global.player.x + (global.player.sprite_width * .5), global.player.y - 12, global.player.state, .3, .3, 0);
	draw_set_color(-1);
}

draw_set_font(-1);
