if (obj_player.player_state == obj_player.pre_direct_state)
{
	with (obj_player)
	{
		// diagonals
		if (left && up && !down && !right)
		{
			if (other.arrow_alpha < 1)
			{
				other.arrow_alpha += other.arrow_appear_speed;	
			}
		}
		else
		{
			if (other.arrow_alpha > 0)
			{
				other.arrow_alpha -= other.arrow_appear_speed;	
			}
		}
		draw_sprite_ext(spr_direct_feedback_arrow_diagonal, 0, 
			                obj_player.x - 4, (obj_player.y 
							- (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) - 4,
			                -1, 1, 0, c_white, other.arrow_alpha);	
		
		if (left && down && !up && !right)
		{
			if (other.arrow_alpha1 < 1)
			{
				other.arrow_alpha1 += other.arrow_appear_speed;	
			}		
		}
		else
		{
			if (other.arrow_alpha1 > 0)
			{
				other.arrow_alpha1 -= other.arrow_appear_speed;	
			}
		}
		draw_sprite_ext(spr_direct_feedback_arrow_diagonal, 0, 
			                obj_player.x - 4, (obj_player.y 
							- (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) + 4,
			                -1, -1, 0, c_white, other.arrow_alpha1);
		
		if (right && up && !down && !left)
		{
			if (other.arrow_alpha2 < 1)
			{
				other.arrow_alpha2 += other.arrow_appear_speed;	
			}
		}
		else
		{
			if (other.arrow_alpha2 > 0)
			{
				other.arrow_alpha2 -= other.arrow_appear_speed;	
			}
		}
		draw_sprite_ext(spr_direct_feedback_arrow_diagonal, 0, 
			                obj_player.x + 4, (obj_player.y 
							- (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) - 4,
			                1, 1, 0, c_white, other.arrow_alpha2);	
		
		if (right && down && !up && !left)
		{
			if (other.arrow_alpha3 < 1)
			{
				other.arrow_alpha3 += other.arrow_appear_speed;	
			}	
		}
		else
		{
			if (other.arrow_alpha3 > 0)
			{
				other.arrow_alpha3 -= other.arrow_appear_speed;	
			}
		}
		draw_sprite_ext(spr_direct_feedback_arrow_diagonal, 0, 
			                obj_player.x + 4, (obj_player.y 
							- (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) + 4,
			                1, -1, 0, c_white, other.arrow_alpha3);
		
		// normals
		if (left && !right && !down && !up)
		{
			if (other.arrow_alpha4 < 1)
			{
				other.arrow_alpha4 += other.arrow_appear_speed;	
			}
		}
		else
		{
			if (other.arrow_alpha4 > 0)
			{
				other.arrow_alpha4 -= other.arrow_appear_speed;	
			}
		}
		draw_sprite_ext(spr_direct_feedback_arrow, 0, 
			                obj_player.x - 5, (obj_player.y 
							- (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)),
			                1, 1, 90, c_white, other.arrow_alpha4);	
		
		if (!left && right && !down && !up)
		{
			if (other.arrow_alpha5 < 1)
			{
				other.arrow_alpha5 += other.arrow_appear_speed;	
			}	
		}
		else
		{
			if (other.arrow_alpha5 > 0)
			{
				other.arrow_alpha5 -= other.arrow_appear_speed;	
			}
		}
		draw_sprite_ext(spr_direct_feedback_arrow, 0,
			                obj_player.x + 5, (obj_player.y 
							- (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)),
			                1, 1, 270, c_white, other.arrow_alpha5);
		
		if (!left && !right && !down && up)
		{
			if (other.arrow_alpha6 < 1)
			{
				other.arrow_alpha6 += other.arrow_appear_speed;	
			}	
		}
		else
		{
			if (other.arrow_alpha6 > 0)
			{
				other.arrow_alpha6 -= other.arrow_appear_speed;	
			}
		}
		draw_sprite_ext(spr_direct_feedback_arrow, 0,
			                obj_player.x, (obj_player.y 
							- (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) - 5,
			                1, 1, 0, c_white, other.arrow_alpha6);	
		
		if (!left && !right && down && !up)
		{
			if (other.arrow_alpha7 < 1)
			{
				other.arrow_alpha7 += other.arrow_appear_speed;	
			}	
		}
		else
		{
			if (other.arrow_alpha7 > 0)
			{
				other.arrow_alpha7 -= other.arrow_appear_speed;	
			}
		}
		draw_sprite_ext(spr_direct_feedback_arrow, 0,
			                obj_player.x, (obj_player.y 
							- (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) + 5,
			                1, 1, 180, c_white, other.arrow_alpha7);
		
		/*
		if (!left && !right && !up && !down)
		{
			if (other.arrow_alpha > 0)
			{
				other.arrow_alpha -= other.arrow_appear_speed;	
			}
			
			if (other.arrow_alpha1 > 0)
			{
				other.arrow_alpha1 -= other.arrow_appear_speed;	
			}
			
			if (other.arrow_alpha2 > 0)
			{
				other.arrow_alpha2 -= other.arrow_appear_speed;	
			}
			
			if (other.arrow_alpha3 > 0)
			{
				other.arrow_alpha3 -= other.arrow_appear_speed;	
			}
			
			if (other.arrow_alpha4 > 0)
			{
				other.arrow_alpha4 -= other.arrow_appear_speed;	
			}
			
			if (other.arrow_alpha5 > 0)
			{
				other.arrow_alpha5 -= other.arrow_appear_speed;	
			}
			
			if (other.arrow_alpha6 > 0)
			{
				other.arrow_alpha6 -= other.arrow_appear_speed;	
			}
			
			if (other.arrow_alpha7 > 0)
			{
				other.arrow_alpha7 -= other.arrow_appear_speed;	
			}
		}
		*/
	}
}