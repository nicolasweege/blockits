if (image_alpha < 1)
	image_alpha += .02;
	
if (place_meeting(x, y, global.player))
{
	if (global.player.dash_cooldown <= 0)
		global.player.dash_cooldown++;

	is_hidden = true;
	alarm[0] = room_speed * 5;
}
