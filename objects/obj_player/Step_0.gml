if (global.console_enabled || global.is_paused || !global.player_can_move)
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
	can_dash = 1;
	
	audio_play_sound(choose(snd_debris_stone_soft_01,
	                        snd_debris_stone_soft_02,
							snd_debris_stone_soft_03,
							snd_debris_stone_soft_04,
							snd_debris_stone_soft_05,
							snd_debris_stone_soft_06), 
					 1, 
					 0);
	
	var xx = random_range(x - (sprite_width / 3), x + (sprite_width / 3));
	create_player_dust_particle(1, xx, y, layer - 1, obj_player_dust_particle);
}

on_floor = place_meeting(x, y + 1, obj_default_collider);
on_roof = place_meeting(x, y - 1, obj_default_collider);

// dash amount color feedback
switch (can_dash)
{
	case 0:
	{
		// red color
		player_color_green = lerp(player_color_green, 0, change_player_color_speed);
		player_color_blue = lerp(player_color_blue, 0, change_player_color_speed);
		player_color_red = lerp(player_color_red, 255, change_player_color_speed);
	} break;
	
	case 1:
	{
		// white color
		player_color_green = lerp(player_color_green, 255, change_player_color_speed);
		player_color_blue = lerp(player_color_blue, 255, change_player_color_speed);
		player_color_red = lerp(player_color_red, 255, change_player_color_speed);
	} break;
	
	default:
	{
		// white color
		player_color_green = lerp(player_color_green, 255, change_player_color_speed);
		player_color_blue = lerp(player_color_blue, 0, change_player_color_speed);
		player_color_red = lerp(player_color_red, 255, change_player_color_speed);
	} break;
}
player_color = make_color_rgb(player_color_red, player_color_green, player_color_blue);

// updating player animation
xscale = lerp(xscale, 1, 0.15);
yscale = lerp(yscale, 1, 0.15);

// updating player state
player_state();