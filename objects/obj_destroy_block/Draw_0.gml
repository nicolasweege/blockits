if (current_state == default_state)
{
	current_sprite_to_draw = default_sprite;
	draw_sprite_ext(current_sprite_to_draw, 
	                0, 
					x, y, 
					image_xscale, 
					image_yscale, 
					image_angle, 
					c_white,
					image_alpha);
}

if (current_state == destroy_state)
{
	current_sprite_to_draw = destroy_sprite;
	draw_sprite_ext(current_sprite_to_draw, 
	                0, 
					x, y, 
					image_xscale, 
					image_yscale, 
					image_angle, 
					c_white,
					image_alpha);
}

draw_set_font(fnt_default);

var txt = "default_state";
switch (current_state)
{
	case default_state:
		txt ="default_state";
	break;
	
	case destroy_state:
		txt ="destroy_state";
	break;
}

draw_text(x, y - 20, txt);
draw_set_font(-1);