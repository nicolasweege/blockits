if (global.is_paused
    || global.console_enabled
	|| global.player_can_move)
{
	exit;	
}

// TODO: fix the death collision bug when the platform is moving in diagonal

h_speed = (hdir * current_speed);
v_speed = (vdir * current_speed);

// changing direction
if (place_meeting(x + sign(h_speed), y + sign(v_speed), obj_platform_point)
    || place_meeting(x + sign(h_speed), y + sign(v_speed), obj_default_collider))
{
	hdir *= -1;
	vdir *= -1;
}

// stand up the platform (player em cima da platadorma)
if (place_meeting(x, y - 1, obj_player))
{
	with (obj_player)
	{
		// dying
		if (other.vdir < 0 && place_meeting(x, y - 1, obj_default_collider))
		{
			player_state = death_state;
		}
		
		if (place_meeting(x, y + 1, obj_default_collider))
		{
			y += other.v_speed;
		}
		
		if (!place_meeting(x + sign(other.h_speed), y, obj_default_collider))
		{
			x += other.h_speed;
		}
	}
}

// bouncing the player when colliding in the bottom of the platform
if (vdir < 0 && place_meeting(x, y + 1, obj_player))
{
	with (obj_player)
	{
		player_state = free_state;
		v_speed = 1;
	}
}

// lateral x axis collision in the oposite side of the platform's direction
if (hdir > 0 && place_meeting(x - 1, y, obj_player))
{
	with (obj_player)
	{
		// player_state = free_state;
		// h_speed = -3;
		x += other.h_speed;
	}
}
if (hdir < 0 && place_meeting(x + 1, y, obj_player))
{
	with (obj_player)
	{
		// player_state = free_state;
		// h_speed = 3;
		x += other.h_speed;
	}
}

// vertical death collision (player ta em baixo da plataforma)
if (place_meeting(x, y + 1, obj_player))
{
	with (obj_player)
	{
		// dying
		if (other.vdir > 0 && place_meeting(x, y + 1, obj_default_collider))
		{
			player_state = death_state;
		}
		
		// y += other.v_speed;
	}
}

// lateral death collision
if (place_meeting(x + sign(h_speed), y, obj_player))
{
	with (obj_player)
	{	
		// dying
		if (other.hdir < 0 && place_meeting(x - 1, y, obj_default_collider))
		{
			player_state = death_state;
		}
		if (other.hdir > 0 && place_meeting(x + 1, y, obj_default_collider))
		{
			player_state = death_state;
		}
		
		x += other.h_speed;
	}
}

x += h_speed;
y += v_speed;