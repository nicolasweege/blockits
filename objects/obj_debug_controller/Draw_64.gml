draw_set_font(fnt_menu);

if (show_debug){
	show_debug_overlay(1);
	draw_text_transformed(30, 30, "Player state: " + obj_player.state, .5, .5, 0);
	draw_text_transformed(30, 60, "Fps: " + string(fps), .5, .5, 0);
} else show_debug_overlay(0);

draw_set_font(-1);