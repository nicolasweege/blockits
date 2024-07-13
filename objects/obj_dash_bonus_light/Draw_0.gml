if (obj_player.player_state == obj_player.god_mode_state
    || obj_player.player_state == obj_player.death_state)
{
	exit;
}

// gpu_set_blendmode(bm_add);

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

        /*			
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
						*/
	}
}

// gpu_set_blendmode(bm_normal);