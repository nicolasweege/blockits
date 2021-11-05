if (instance_exists(obj_player)){
	if (obj_player.y > y) sprite_index = -1;
	else sprite_index = spr_platform_collider;
}