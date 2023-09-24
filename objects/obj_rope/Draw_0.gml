if (!instance_place(x, y, obj_player)
    && obj_player.player_state != obj_player.rope_swing_state)
{
	draw_sprite_ext(spr_rope_collision_area, 0, x, y, 1, 1, 0, c_white, 1);
}

if (obj_player.player_state == obj_player.rope_swing_state)
{
	draw_line_width_color(obj_player.grapple_x, obj_player.grapple_y, 
				          obj_player.x, 
					 	  (obj_player.y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), 
						   1,
						   c_green,
						   c_green);
}

draw_self();

