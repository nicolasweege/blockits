
if (obj_player.player_state == obj_player.god_mode_state
    || obj_player.player_state == obj_player.death_state
	|| global.app_state == states.PAUSE_MENU)
{
	image_speed = 0;
	exit;
}

image_speed = 1;

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
    && !obj_player.player_on_direct_state)
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
		
		is_in_timed_direct = false;
		player_state = pre_direct_state;
	}
}
