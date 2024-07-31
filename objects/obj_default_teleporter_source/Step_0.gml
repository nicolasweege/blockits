if (!pair_instance)
{
    exit;
}

if (!pair_instance.pair_instance)
{
    pair_instance.pair_instance = id;
}

if (place_meeting(x, y, obj_player) && !obj_player.current_player_capsule)
{
    with (obj_player)
    {
        player_state = free_state;
        h_speed = 0;
        v_speed = 0;
        x = ((other.pair_instance.bbox_left + 1) + other.pair_instance.center_xpos);
        y = (other.pair_instance.bbox_bottom - 1);
    }
}