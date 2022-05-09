function move_player_camera()
{	
	playerx = (x div CAM_W) * CAM_W;
	playery = (y div CAM_H) * CAM_H;
	
	camerax = lerp(camera_get_view_x(view_camera[0]), playerx, 1);
	cameray = lerp(camera_get_view_y(view_camera[0]), playery, 1);
	
	camerax += random_range(-global.shake_remain, global.shake_remain);
	cameray += random_range(-global.shake_remain, global.shake_remain);
	global.shake_remain = max(0, global.shake_remain - ((1 / global.shake_length) * global.shake_magnitude));
	
	camera_set_view_pos(view_camera[0], camerax, cameray);
}

function screen_shake(magnitude, length)
{
	if (magnitude > global.shake_remain)
	{
		global.shake_magnitude = magnitude;
		global.shake_remain = global.shake_magnitude;
		global.shake_length = length;
	}
}

/*
function set_death_camera()
{
	var ww = lerp(camera_get_view_width(view_camera[0]), CAM_W / 2, .05);
	var hh = lerp(camera_get_view_height(view_camera[0]), CAM_H / 2, .05);
	
	var xx = lerp(camera_get_view_x(view_camera[0]), global.player.x, .08);
	var yy = lerp(camera_get_view_y(view_camera[0]), global.player.y, .08);
	
	camera_set_view_pos(view_camera[0], xx, yy);
	camera_set_view_size(view_camera[0], ww, hh);
	
	game_restart();
}
*/
