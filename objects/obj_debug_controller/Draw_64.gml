//draw_set_font(fnt_01);

var _string = @"Player state: ";

if (show_debug){
	show_debug_overlay(1);
	scribble(_string)
	.transform(.5, .5)
	.draw(40, 40);
	
	//draw_text(40, 40, "Player state: " + obj_player.state);
	//draw_text(40, 60, "Fps: " + string(fps));
} else show_debug_overlay(0);

//draw_set_font(-1);