if (obj_player.player_state == obj_player.god_mode_state
    || obj_player.player_state == obj_player.death_state
	|| global.app_state == states.PAUSE_MENU
	|| !global.player_can_move)
{
	exit;
}

// @TODO @Incomplete: maybe change this to the current states,
// to have more control over when this visual feedback happens.
if (!player_can_enter_capsule)
{
    image_blend = c_gray;
}
else
{
    image_blend = c_white;
}

if (!colliding_with_player)
{
    with (obj_player)
    {
        if (place_meeting(x, y, obj_capsule))
        {
            other.enter_capsule_timer = 0;
        }
    }
}

current_state();