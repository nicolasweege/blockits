if (obj_player.player_state == obj_player.on_capsule_state)
{   
    if (obj_player.current_player_capsule)
    {
        if (obj_player.current_player_capsule.bbox_bottom > y)
        {
        	sprite_index = -1;
        }
        else 
        {
        	sprite_index = spr_slab_collider;
        }
    }
}
else
{
    if (obj_player.y > y) 
    {
    	sprite_index = -1;
    }
    else 
    {
    	sprite_index = spr_slab_collider;
    }
}