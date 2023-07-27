draw_self();

if (place_meeting(x, y, obj_player))
{
	draw_set_font(fnt_default);
	draw_set_halign(fa_center);
	draw_text_transformed(x, y - 50, "Enter", 1, 1, 0);
	
	draw_set_halign(fa_top);
	draw_set_font(-1);
}