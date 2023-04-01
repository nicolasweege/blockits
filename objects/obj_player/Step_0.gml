if (global.console_enabled)
{
	exit;
}

if (!global.player_can_move)
{
	exit;
}

update_player_inputs();

on_wall = (place_meeting(x + 1, y, obj_default_collider) 
          - place_meeting(x - 1, y, obj_default_collider));

// landing
var temp = place_meeting(x, y + 1, obj_default_collider);
if (temp && !on_floor && v_speed >= 0)
{
	xscale = 1.2;
	yscale = 0.5;
	
	var xx = random_range(x - (sprite_width / 3), x + (sprite_width / 3));
	create_player_dust_particle(1, xx, y, layer - 1, obj_player_dust_particle);
}

on_floor = place_meeting(x, y + 1, obj_default_collider);

// dash amount color feedback
switch (can_dash)
{
	case 0:
	{
		player_color_green = lerp(player_color_green, 0, 0.1);
		player_color_blue = lerp(player_color_blue, 0, 0.1);
		player_color_red = lerp(player_color_red, 255, 0.1);
	} break;
	
	case 1:
	{
		player_color_green = lerp(player_color_green, 255, 0.1);
		player_color_blue = lerp(player_color_blue, 255, 0.1);
		player_color_red = lerp(player_color_red, 255, 0.1);
	} break;
	
	default:
	{
		player_color_green = lerp(player_color_green, 255, 0.1);
		player_color_blue = lerp(player_color_blue, 255, 0.1);
		player_color_red = lerp(player_color_red, 255, 0.1);
	} break;
}
player_color = make_color_rgb(player_color_red, player_color_green, player_color_blue);

// updating player animation
xscale = lerp(xscale, 1, 0.15);
yscale = lerp(yscale, 1, 0.15);

// updating player state
player_state();