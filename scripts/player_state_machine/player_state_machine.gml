function set_player_idle_state()
{
	h_speed = 0;
	v_speed = 0;
				
	if (!on_floor)
		v_speed += grav;
				
	if (on_floor && jump && !place_meeting(x, y - 1, DEFAULT_COLLIDER))
	{
		v_speed = -max_v_speed;
		x_scale = .5;
		y_scale = 1.5;
		audio_play_sound(PLAYER_JUMP_SOUND, 1, false);
	}
}

function set_player_moving_state()
{	
	h_speed = lerp(h_speed, _h_speed, default_accel);
	
	if (jump && (on_floor || jump_timer) && !place_meeting(x, y - 1, DEFAULT_COLLIDER))
	{
		v_speed = -max_v_speed;
		x_scale = .5;
		y_scale = 1.5;
		audio_play_sound(PLAYER_JUMP_SOUND, 1, false);
	}
	
	if (jump_r && v_speed < 0)
		v_speed *= .1;
	
	if (!on_floor && (on_left_wall || on_right_wall || wall_timer))
	{
		var lerp_v_speed = lerp(v_speed, slide, default_accel);

		if ((on_left_wall || on_right_wall) && v_speed > 0 && !audio_is_playing(PLAYER_WALL_SLIDE_SOUND))
			audio_play_sound(PLAYER_WALL_SLIDE_SOUND, 1, false);
	
		if (v_speed > 0)
			v_speed = lerp_v_speed;
		
		if (v_speed <= 0)
			v_speed += grav;
			
		if (!last_wall && jump) // On left wall
		{
			v_speed = -max_v_speed * .9;
			h_speed = max_h_speed * 2;
			x_scale = .5;
			y_scale = 1.5;
			audio_play_sound(PLAYER_WALL_JUMP_SOUND, 1, false);
		}
	
		if (last_wall && jump) // On right wall
		{
			v_speed = -max_v_speed * .9;
			h_speed = -max_h_speed * 2;
			x_scale = .5;
			y_scale = 1.5;
			audio_play_sound(PLAYER_WALL_JUMP_SOUND, 1, false);
		}
	}
	else if (!on_floor) v_speed += grav;
	
	if (!(on_left_wall || on_right_wall) && audio_is_playing(PLAYER_WALL_SLIDE_SOUND))
		audio_stop_sound(PLAYER_WALL_SLIDE_SOUND);
		
	if ((on_left_wall || on_right_wall) && on_floor && audio_is_playing(PLAYER_WALL_SLIDE_SOUND))
		audio_stop_sound(PLAYER_WALL_SLIDE_SOUND);
}

function set_player_death_state()
{
	h_speed = 0;
	v_speed = 0;
	
	set_death_camera();
}

function set_player_state()
{
	switch (state)
	{
		case "idle":
			set_player_idle_state();
		break;
	
		case "moving":
			set_player_moving_state();
		break;
		
		case "death":
			set_player_death_state();
		break;
	}
}
