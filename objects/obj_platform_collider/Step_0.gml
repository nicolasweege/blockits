if (!instance_exists(global.player))
{
	exit;
}

if (global.player.y > y)
{
	sprite_index = -1;
}
	
if (global.player.y <= y)
{
	sprite_index = spr_platform_collider;
}
