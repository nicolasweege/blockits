if (obj_player.player_state == obj_player.god_mode_state
    || obj_player.player_state == obj_player.death_state)
{
	exit;	
}

if (obj_player.can_enter_timed_direct)
{
	image_alpha = 1;
}
else
{
	image_alpha = 0.2;
}

temp_colliding_with_player = place_meeting(x, y, obj_player);
if (temp_colliding_with_player
    && !colliding_with_player)
{
	with (obj_player)
	{
		player_on_direct_state = false;	
	}
}

colliding_with_player = place_meeting(x, y, obj_player);
if (colliding_with_player 
    && !obj_player.player_on_direct_state
	&& obj_player.can_enter_timed_direct)
{
	with (obj_player)
	{
		x = other.x;
		y = (other.y + (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2));
		player_on_direct_state = true;
		
		if (!instance_exists(obj_direct_feedback_arrow))
		{
			instance_create_depth(x, y, depth, obj_direct_feedback_arrow);	
		}
		
		time_source_start(timed_direct_timer);
		is_in_timed_direct = true;
		
		player_state = pre_direct_state;
	}
}