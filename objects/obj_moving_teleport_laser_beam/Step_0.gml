if (global.app_state == states.PAUSE_MENU
    || global.app_state == states.EDITOR
    || !global.player_can_move
	|| obj_player.player_state == obj_player.death_state)
{
	if (!has_paused)
	{	
		if (time_source_get_state(change_hdir_timer) == time_source_state_active)
		{
			time_source_pause(change_hdir_timer);
		}
		if (time_source_get_state(change_vdir_timer) == time_source_state_active)
		{
			time_source_pause(change_vdir_timer);
		}
		
		has_paused   = true;
		has_unpaused = false;
	}
	
	exit;
}
else
{
	if (!has_unpaused)
	{	
		if (time_source_get_state(change_hdir_timer) == time_source_state_paused)
		{
			time_source_resume(change_hdir_timer);
		}
		if (time_source_get_state(change_vdir_timer) == time_source_state_paused)
		{
			time_source_resume(change_vdir_timer);
		}
		
		has_unpaused = true;
		has_paused   = false;
	}
}

if (place_meeting(x, y, obj_player)
    && obj_player.player_state == obj_player.dash_state)
{
    if (laser_direction == 1)
    {
        with (obj_player)
        {
            h_speed               = 0;
            v_speed               = 0;
            jump_pressed          = 0;
            coyote_can_jump       = 0;
            jump_buffer_counter   = 0;
            can_jumper_dash_timer = 0;
            can_dash              = 1;
            
            x = (other.bbox_right - (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
            y = other.bbox_bottom;
            
            player_state = free_state;
        }
    }
    else if (laser_direction == -1)
    {
        with (obj_player)
        {
            h_speed               = 0;
            v_speed               = 0;
            jump_pressed          = 0;
            coyote_can_jump       = 0;
            jump_buffer_counter   = 0;
            can_jumper_dash_timer = 0;
            can_dash              = 1;
            
            x = (other.bbox_left + (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
            y = other.bbox_bottom;
            
            player_state = free_state;
        }
    }
    else if (laser_direction == 0)
    {
        show_debug_message("laser_direction is 0!");
    }
}


// movement stuff
h_speed = (hdir * current_speed);
v_speed = (vdir * current_speed);

// horizontal collision
repeat (abs(h_speed))
{
	var h_speed_sign = sign(h_speed);
	
	if (place_meeting(x + h_speed_sign, y, obj_platform_point))
	{
		if (can_change_hdir)
		{
			time_source_start(change_hdir_timer);
			can_change_hdir = false;
		}
		
		h_speed = 0;
		break;
	}
	else
	{
		x += h_speed_sign;
	}
}

// vertical collision
repeat (abs(v_speed))
{
	var v_speed_sign = sign(v_speed);
	
	if (place_meeting(x, y + v_speed_sign, obj_platform_point))
	{
		if (can_change_vdir)
		{
			time_source_start(change_vdir_timer);
			can_change_vdir = false;
		}
		
		v_speed = 0;
		break;
	}
	else
	{
		y += v_speed_sign;
	}
}