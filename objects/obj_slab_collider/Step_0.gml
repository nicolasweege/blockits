if (obj_player.player_state == obj_player.on_capsule_state)
{
    sprite_index = -1;
    exit;
}

if (obj_player.y > y) 
{
	sprite_index = -1;
}
else 
{
	sprite_index = spr_slab_collider;
}