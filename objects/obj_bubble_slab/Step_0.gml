// pausing
if (global.app_state == states.PAUSE_MENU
    || global.app_state == states.EDITOR
    || !global.player_can_move
	|| obj_player.player_state == obj_player.death_state)
{
    if (!has_paused)
    {
        // put stuff that needs to be paused-handled here
        
        has_paused   = true;
        has_unpaused = false;
    }
    
    exit;
}
else
{
    if (!has_unpaused)
    {
        // put stuff that needs to be paused-handled here
        
        has_unpaused = true;
        has_paused   = false;
    }
}

// slab behavior stuff
if (obj_player.player_state == obj_player.god_mode_state)
{
    sprite_index = original_sprite_to_draw;
}
else if (obj_player.player_state == obj_player.on_capsule_state)
{   
    if (obj_player.current_player_capsule)
    {
        if (obj_player.current_player_capsule.bbox_bottom > y)
        {
        	sprite_index = -1;
        }
        else 
        {
        	sprite_index = original_sprite_to_draw;
        }
    }
}
else
{
    if (obj_player.y > y)
    {
    	sprite_index = -1;
    }
    else 
    {
    	sprite_index = original_sprite_to_draw;
    }
}

// movement stuff
h_speed = (hdir * current_speed);
v_speed = (vdir * current_speed);

// horizontal collision
repeat (abs(h_speed))
{
    var h_speed_sign = sign(h_speed);
    
    x += h_speed_sign;
	x = round(x);
	
	with (obj_player)
	{	
		if (place_meeting(x, y + 1, obj_bubble_slab))
		{
			x += h_speed_sign;
		}
	}
	
	// hitbox stuff
    if (hitbox)
    {
        hitbox.x = x;
    }
}

// vertical collision
repeat (abs(v_speed))
{
    var v_speed_sign = sign(v_speed);
    
    if (place_meeting(x, y - 1, obj_player))
    {
        obj_player.y += v_speed_sign;
    }
	
	y += v_speed_sign;
	y = round(y);
	
	// hitbox stuff
    if (hitbox)
    {
        hitbox.y = y;
    }
	
	/*
    	with (obj_player)
    	{
    		if (place_meeting(x, y + 1, obj_bubble_slab))
    		{
    			y += v_speed_sign;
    		}
    	}
	*/
}

// slab popping on player jump stuff
if (place_meeting(x, y - 1, obj_player))
{
    can_destroy_slab_on_player_jump = true;
}
else if (can_destroy_slab_on_player_jump)
{
    instance_destroy(hitbox);
    instance_destroy();
    exit;
}