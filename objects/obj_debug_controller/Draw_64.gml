if (show_fps){
	show_debug_overlay(1);
	draw_text(40, 40, "Player state: " + obj_player.state);
	draw_text(40, 60, "Fps: " + string(fps));
}
else show_debug_overlay(0);