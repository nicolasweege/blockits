if (obj_player.player_state == obj_player.pre_direct_state)
{
	with (obj_player)
	{
		// diagonals
		if (left && up && !down && !right)
		{
			draw_sprite_ext(spr_direct_feedback_arrow_diagonal, 0, 
			                obj_player.x - 4, (obj_player.y 
							- (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) - 4,
			                -1, 1, 0, c_white, 1);	
		}
		
		if (left && down && !up && !right)
		{
			draw_sprite_ext(spr_direct_feedback_arrow_diagonal, 0, 
			                obj_player.x - 4, (obj_player.y 
							- (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) + 4,
			                -1, -1, 0, c_white, 1);		
		}
		
		if (right && up && !down && !left)
		{
			draw_sprite_ext(spr_direct_feedback_arrow_diagonal, 0, 
			                obj_player.x + 4, (obj_player.y 
							- (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) - 4,
			                1, 1, 0, c_white, 1);	
		}
		
		if (right && down && !up && !left)
		{
			draw_sprite_ext(spr_direct_feedback_arrow_diagonal, 0, 
			                obj_player.x + 4, (obj_player.y 
							- (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) + 4,
			                1, -1, 0, c_white, 1);	
		}
		
		// normals
		if (left && !right && !down && !up)
		{
			draw_sprite_ext(spr_direct_feedback_arrow, 0, 
			                obj_player.x - 5, (obj_player.y 
							- (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)),
			                1, 1, 90, c_white, 1);	
		}
		
		if (!left && right && !down && !up)
		{
			draw_sprite_ext(spr_direct_feedback_arrow, 0,
			                obj_player.x + 5, (obj_player.y 
							- (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)),
			                1, 1, 270, c_white, 1);	
		}
		
		if (!left && !right && !down && up)
		{
			draw_sprite_ext(spr_direct_feedback_arrow, 0,
			                obj_player.x, (obj_player.y 
							- (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) - 5,
			                1, 1, 0, c_white, 1);		
		}
		
		if (!left && !right && down && !up)
		{
			draw_sprite_ext(spr_direct_feedback_arrow, 0,
			                obj_player.x, (obj_player.y 
							- (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) + 5,
			                1, 1, 180, c_white, 1);	
		}
	}
}