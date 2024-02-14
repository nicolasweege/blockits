if (obj_player.player_state == obj_player.god_mode_state)
{
	exit;
}

gpu_set_blendmode(bm_add);

for (var i = 0; i < 10; i++)
{
	if (obj_player.on_floor && (obj_player.dash_dir == 0 || obj_player.dash_dir == 180))
	{
		xto_draw = obj_player.x;
		// yto_draw = obj_player.y + (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2);
		yto_draw = obj_player.y;
	}
	else
	{
		xto_draw = obj_player.x;
		yto_draw = obj_player.y;	
	}
	
	draw_sprite_ext(spr_cone_gradiant, 
				    0, 
				    xto_draw, 
					yto_draw - 
					(sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2), 
				    obj_player.xscale * size, 
					obj_player.yscale * size, 
					0 + rotation + (i * 36), 
					color_overlay, 
					alpha);
		
	draw_sprite_ext(spr_cone_gradiant, 
				    0, 
				    xto_draw, 
					yto_draw - 
					(sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2), 
				    obj_player.xscale * size, 
					obj_player.yscale * size, 
					0 + rotation + (i * 36) + 18, 
					c_red, 
					alpha);
}

gpu_set_blendmode(bm_normal);