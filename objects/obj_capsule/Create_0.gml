h_speed = 0;
v_speed = 0;
player_capsule_hdir = 0;
player_capsule_vdir = 0;
capsule_speed = 5;

colliding_with_player = false;
temp_colliding_with_player = false;

player_in_capsule_state = function()
{
    update_player_inputs();

    if (right && up && !down && !left)
    {
        player_capsule_hdir = 1;
        player_capsule_vdir = -1;
    }
    if (right && down && !up && !left)
    {
        player_capsule_hdir = 1;
        player_capsule_vdir = 1;
    }
    if (left && up && !down && !right)
    {
        player_capsule_hdir = -1;
        player_capsule_vdir = -1;
    }
    if (left && down && !up && !right)
    {
        player_capsule_hdir = -1;
        player_capsule_vdir = 1;
    }
    if (right && !left && !up && !down)
    {
        player_capsule_hdir = 1;
        player_capsule_vdir = 0;
    }
    if (left && !right && !up && !down)
    {
        player_capsule_hdir = -1;
        player_capsule_vdir = 0;
    }
    if (up && !down && !right && !left)
    {
        player_capsule_hdir = 0;
        player_capsule_vdir = -1;
    }
    if (down && !up && !right && !left)
    {
        player_capsule_hdir = 0;
        player_capsule_vdir = 1;
    }
	
	obj_player.default_accel = obj_player.haccel;
	h_speed = lerp(h_speed, player_capsule_hdir * capsule_speed, obj_player.default_accel);
	v_speed = lerp(v_speed, player_capsule_vdir * capsule_speed, obj_player.default_accel);
	
	// horizontal collision
	repeat (abs(h_speed)) 
	{	
		var sign_hspeed = sign(h_speed);
		
		if (place_meeting(x + sign_hspeed, y, obj_default_collider)
		    || place_meeting(x + sign_hspeed, y, obj_death_collider))
		{   
			h_speed = 0;
			obj_player.h_speed = 0;
			break;
		} 
		else 
		{   
            x += sign_hspeed;
            x = round(x);
            obj_player.x += sign_hspeed;
		    obj_player.x = round(obj_player.x);
		}
	}
	
	// vertical collision
	repeat (abs(v_speed))
	{
	   var sign_vspeed = sign(v_speed);
	
		if (place_meeting(x, y + sign_vspeed, obj_default_collider)
		    || place_meeting(x, y + sign_vspeed, obj_death_collider))
		{   
			v_speed = 0;
			obj_player.v_speed = 0;
			break;
		} 
		else 
		{   
			y += sign_vspeed;
			y = round(y);
			obj_player.y += sign_vspeed;
			obj_player.y = round(obj_player.y);
		}
	}
}

free_state = function()
{
    colliding_with_player = place_meeting(x, y, obj_player);
    if (colliding_with_player
        && obj_player.player_state != obj_player.on_capsule_state
        && obj_player.player_can_enter_capsule)
    {
        with (obj_player)
    	{
    		x = other.x;
    		y = (other.y + (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2));
    		jump_pressed = 0;
        	coyote_can_jump = 0;
        	jump_buffer_counter = 0;
        	can_jumper_dash_timer = 0;
        	can_dash = 1;
    		
    		player_on_capsule_state = true;
    		
    		player_state = on_capsule_state;
    	}
    	
    	current_state = player_in_capsule_state;
    }
}

current_state = free_state;