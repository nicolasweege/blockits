draw_self();

if (place_meeting(x, y, obj_player))
{	
	draw_sprite_ext(spr_interact_icon, 0,
	                x, y - 50,
					1, 1,
					0,
					c_white,
					1);
}