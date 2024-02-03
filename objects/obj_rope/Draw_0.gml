if (!instance_place(x, y, obj_player)
    && obj_player.player_state != obj_player.rope_swing_state)
{
	if (rope_collision_area_alpha < 1)
	{
		rope_collision_area_alpha += 0.1;
	}
	draw_sprite_ext(spr_rope_collision_area, 0, x, y, 1, 1, 0, c_white, rope_collision_area_alpha);
}

if (instance_place(x, y, obj_player)
	&& obj_player.player_state != obj_player.rope_swing_state)
{
	if (rope_collision_area_alpha < 1)
	{
		rope_collision_area_alpha += 0.1;
	}
	draw_sprite_ext(spr_rope_collision_area, 0, x, y, 1, 1, 0, c_white, rope_collision_area_alpha);
}

if (obj_player.player_state == obj_player.rope_swing_state)
{
	if (rope_collision_area_alpha > 0)
	{
		rope_collision_area_alpha -= 0.1;
	}
	draw_sprite_ext(spr_rope_collision_area, 0, x, y, 1, 1, 0, c_white, rope_collision_area_alpha);
	
	draw_line_width_color(obj_player.grapple_x, obj_player.grapple_y, 
						    obj_player.x, 
							(obj_player.y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), 
							1,
							c_white,
							c_white);
}
	
draw_self();