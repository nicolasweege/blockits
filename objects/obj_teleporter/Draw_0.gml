draw_self();

if (global.app_state == states.PAUSE_MENU)
{
	exit;	
}

if (current_state == default_state)
{
	if (place_meeting(x, y, obj_player))
	{
		if (alpha < 1)
		{
			alpha += 0.08;
		}
	
		draw_set_font(global.karmina_regular_font);
		draw_set_halign(fa_center);
		draw_set_alpha(alpha);
		// draw_text_transformed(x, y - 50, "Enter", 0.2, 0.2, 0);
	
		draw_set_alpha(1);
		draw_set_halign(fa_top);
		draw_set_font(-1);
	}
	else
	{
		if (alpha > 0)
		{
			alpha -= 0.08;
			draw_set_font(global.karmina_regular_font);
			draw_set_halign(fa_center);
			draw_set_alpha(alpha);
			// draw_text_transformed(x, y - 50, "Enter", 0.2, 0.2, 0);
	
			draw_set_alpha(1);
			draw_set_halign(fa_top);
			draw_set_font(-1);
		}
	}
}

if (current_state != default_state)
{
	if (alpha > 0)
	{
		alpha -= 0.08;
		draw_set_font(global.karmina_regular_font);
		draw_set_halign(fa_center);
		draw_set_alpha(alpha);
		// draw_text_transformed(x, y - 50, "Enter", 0.2, 0.2, 0);
	
		draw_set_alpha(1);
		draw_set_halign(fa_top);
		draw_set_font(-1);
	}
}