
gpu_set_blendmode(bm_add);

if (instance_exists(obj_player))
{
	if (obj_player.can_dash > 1)
	{
		for (var i = 0; i < 10; i++)
		{
			draw_sprite_ext(spr_cone_gradiant, 
				            0, 
				            obj_player.x, 
							obj_player.y - 
							(sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2), 
				            obj_player.xscale * size, 
							obj_player.yscale * size, 
							0 + rotation + (i * 36), 
							color_overlay, 
							alpha);
			
			draw_sprite_ext(spr_cone_gradiant, 
				            0, 
				            obj_player.x, 
							obj_player.y - 
							(sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2), 
				            obj_player.xscale * size, 
							obj_player.yscale * size, 
							0 + rotation + (i * 36) + 18, 
							c_red, 
							alpha);
		}
	}
}

gpu_set_blendmode(bm_normal);