function set_player_idle_state()
{
	h_speed = 0;
	v_speed = 0;
				
	if (!on_floor)
		v_speed += grav;
				
	if (on_floor && jump)
	{
		v_speed = -max_v_speed;
		x_scale = .3;
		y_scale = 1.7;;
		audio_play_sound(PLAYER_JUMP_SOUND, 1, false);
	}
}

function set_player_moving_state()
{	
	h_speed = lerp(h_speed, _h_speed, default_accel);
				
	if (jump && (on_floor || jump_timer))
	{
		v_speed = -max_v_speed;
		x_scale = .3;
		y_scale = 1.7;
		audio_play_sound(PLAYER_JUMP_SOUND, 1, false);
	}
	
	if (jump_r && v_speed < 0)
		v_speed *= .2;
	
	var is_wall_slide_sound_playing = audio_is_playing(PLAYER_WALL_SLIDE_SOUND);
	
	if (!on_floor && (on_left_wall || on_right_wall || wall_timer))
	{
		var _lerp = lerp(v_speed, slide, default_accel);

		if ((on_left_wall || on_right_wall) && v_speed > 0 && !is_wall_slide_sound_playing)
			audio_play_sound(PLAYER_WALL_SLIDE_SOUND, 1, false);
	
		if (v_speed > 0)
			v_speed = _lerp;
		
		if (v_speed <= 0)
			v_speed += grav;
			
		if (!last_wall && jump) // On left wall
		{
			v_speed = -max_v_speed;
			h_speed = max_h_speed * 3;
			x_scale = .3;
			y_scale = 1.7;
			audio_play_sound(PLAYER_WALL_JUMP_SOUND, 1, false);
		}
	
		if (last_wall && jump) // On right wall
		{
			v_speed = -max_v_speed;
			h_speed = -max_h_speed * 3;
			x_scale = .3;
			y_scale = 1.7;
			audio_play_sound(PLAYER_WALL_JUMP_SOUND, 1, false)
		}
	}
	else if (!on_floor)
		v_speed += grav;
	
	if (!(on_left_wall || on_right_wall) && is_wall_slide_sound_playing)
		audio_stop_sound(PLAYER_WALL_SLIDE_SOUND);
		
	if ((on_left_wall || on_right_wall) && on_floor && is_wall_slide_sound_playing)
		audio_stop_sound(PLAYER_WALL_SLIDE_SOUND);
}

function set_player_dash_state()
{
	dash_timer--;
	
	h_speed = lengthdir_x(dash_speed, dash_direction);
	v_speed = lengthdir_y(dash_speed, dash_direction);
	
	instance_create_layer(x, y, "PlayerTrail", obj_player_trail);
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
	
		case "dash":
			set_player_dash_state();
		break;
	}
}
