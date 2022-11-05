function set_player_idle_state()
{
	h_speed = 0;
	v_speed = 0;
				
	if (!on_floor)
		v_speed += grav;
				
	if (on_floor && jump && !place_meeting(x, y - 1, obj_default_collider))
		v_speed = -max_v_speed;
}

function set_player_moving_state()
{	
	h_speed = lerp(h_speed, _h_speed, default_accel);
	
	if (jump && (on_floor || jump_timer) && !place_meeting(x, y - 1, obj_default_collider))
		v_speed = -max_v_speed;
	
	if (jump_r && v_speed < 0)
		v_speed *= .1;
	
	if (!on_floor && (on_left_wall || on_right_wall || wall_timer))
	{
		var lerp_v_speed = lerp(v_speed, slide, default_accel);
	
		if (v_speed > 0)
			v_speed = lerp_v_speed;
		if (v_speed <= 0)
			v_speed += grav;
			
		if (!last_wall && jump) // On left wall
		{
			v_speed = -max_v_speed * .9;
			h_speed = max_h_speed * 2;
		}
	
		if (last_wall && jump) // On right wall
		{
			v_speed = -max_v_speed * .9;
			h_speed = -max_h_speed * 2;
		}
	}
	else if (!on_floor)
	{
		v_speed += grav;
	}
}

function set_player_death_state()
{
	instance_destroy();
	
	if (can_create_death_par)
		create_player_death_par(90, true);
	
	state = "back";
}

function set_player_back_state() {}

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
		
		case "back":
			set_player_back_state();
		break;
	}
}
