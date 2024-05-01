if (obj_player.player_state == obj_player.god_mode_state)
{
    sprite_index = spr_left_death_collider;
}
else if (obj_player.player_state == obj_player.on_capsule_state)
{   
    if (obj_player.current_player_capsule)
    {
        if (obj_player.current_player_capsule.bbox_right > x)
        {
            sprite_index = -1;
        }
        else
        {
            sprite_index = spr_left_death_collider;
        }
    }
}
else
{
    if (obj_player.bbox_right > x)
    {
        sprite_index = -1;
    }
    else
    {
        sprite_index = spr_left_death_collider;
    }
}