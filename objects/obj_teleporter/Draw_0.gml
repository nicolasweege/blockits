draw_self();

if (place_meeting(x, y, obj_player))
{
	draw_set_font(fnt_default);
	draw_set_halign(fa_center);
	draw_text_transformed(x, y - 50, "Enter / Y", 1, 1, 0);
	
	/*
	draw_sprite_ext(spr_interact_icon, 0,
	                x, y - 50,
					1, 1,
					0,
					c_white,
					1);
	*/
	
	draw_set_halign(fa_top);
	draw_set_font(-1);
}