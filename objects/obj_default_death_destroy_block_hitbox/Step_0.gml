if (instance_place(x, y, obj_player))
{
    with (obj_player)
    {
        screen_shake(5, 10, true, true);
        PLAYER_goto_death_state();
    }
}