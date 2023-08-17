if (!instance_exists(obj_player))
{
	exit;	
}

if (obj_player.player_state == obj_player.god_mode_state
    || obj_player.player_state == obj_player.death_state)
{
	exit;
}

if ((place_meeting(x, y - 1, obj_player) 
     || place_meeting(x + 1, y, obj_player)
	 || place_meeting(x - 1, y, obj_player)) 
    && !can_destroy)
{
	can_destroy = true;
	image_speed = 1.5;
	time_source_start(destroy_timer);
}
else if (!can_destroy)
{
	sprite_index = spr_mountain_falling_platform_animation;
	image_speed = 0;
	image_index = 0;
}