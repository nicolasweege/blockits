// @TODO @Incomplete: see if it makes sense to give visual and/or audio feedback to the
// player when 'enter_capsule_timer' and 'go_back_to_start_pos_timer' are running.

// @OBS: maybe we could be using this type of behavior for the capsule, we'll see...
can_calculate_input     = true;
time_to_calculate_input = 10; // in frames per second
calculate_input_timer   = 0;

start_xpos      = xstart;
start_ypos      = ystart;
original_sprite = spr_capsule;
original_depth  = depth;

h_speed                  = 0;
v_speed                  = 0;
player_capsule_hdir      = 0;
player_capsule_vdir      = 0;
player_capsule_direction = 0;

capsule_speed = 4;

xaccel = 0.17;
yaccel = 0.17;

xaccel_multiplier = 0.1;
yaccel_multiplier = 0.1;

player_can_enter_capsule = true;
time_to_enter_capsule    = 30; // in frames per second
enter_capsule_timer      = 0;

// time_to_reappear = 60; // in frames per second
time_to_reappear = 60; // in frames per second
reappear_timer   = time_to_reappear;

// time_to_go_back_to_start_pos  = 400; // in frames per second
time_to_go_back_to_start_pos  = 1; // in frames per second
go_back_to_start_pos_timer    = 0;
distance_from_player_to_check = 200; // in pixels

colliding_with_player      = false;
temp_colliding_with_player = false;

current_state_string = "";

handle_capsule_destroy_state_transition = function()
{
    audio_play_sound(choose(snd_diamond_touch_01, snd_diamond_touch_02, snd_diamond_touch_03),
								0, 
								0);
								
    screen_shake(15, 10, true, true);
    
    obj_player.h_speed = 0;
    obj_player.v_speed = 0;
    
    // bouncing the player when destroying the capsule
    /*
        switch (player_capsule_direction)
    	{
    		case 0:
    			if (place_meeting(x + 1, y, obj_capsule_destroyer))
    			{
    				obj_player.h_speed = -12;
    				obj_player.v_speed = -4;
    			}
    			break;
    			
    		case 45:
    			if (place_meeting(x + 1, y, obj_capsule_destroyer))
    			{
    				obj_player.h_speed = -8;
    				obj_player.v_speed = -5;
    			}
    			else if (place_meeting(x, y - 1, obj_capsule_destroyer))
    			{
    				obj_player.h_speed = 8;
    				obj_player.v_speed = 2;
    			}
    			break;
    			
    		case 90:
    			if (place_meeting(x, y - 1, obj_capsule_destroyer))
    			{
    				obj_player.v_speed = 1.5;
    			}
    			break;
    			
    		case 135:
    			if (place_meeting(x - 1, y, obj_capsule_destroyer))
    			{
    				obj_player.h_speed = 8;
    				obj_player.v_speed = -5;
    			}
    			else if (place_meeting(x, y - 1, obj_capsule_destroyer))
    			{
    				obj_player.h_speed = -8;
    				obj_player.v_speed = 2;
    			}
    			break;
    			
    		case 180:
    			if (place_meeting(x - 1, y, obj_capsule_destroyer))
    			{
    				obj_player.h_speed = 12;
    				obj_player.v_speed = -4;
    			}
    			break;
    			
    		case 225:
    			if (place_meeting(x - 1, y, obj_capsule_destroyer))
    			{
    				obj_player.h_speed = 8;
    				obj_player.v_speed = 2;
    			}
    			else if (place_meeting(x, y + 1, obj_capsule_destroyer))
    			{
    				obj_player.h_speed = -8;
    				obj_player.v_speed = -5;
    			}
    			break;
    			
    		case 270:
    			if (place_meeting(x, y + 1, obj_capsule_destroyer))
    			{
    				obj_player.v_speed = -6;
    			}
    			break;
    			
    		case 315:
    			if (place_meeting(x + 1, y, obj_capsule_destroyer))
    			{
    				obj_player.h_speed = -8;
    				obj_player.v_speed = 2;
    			}
    			else if (place_meeting(x, y + 1, obj_capsule_destroyer))
    			{
    				obj_player.h_speed = 8;
    				obj_player.v_speed = -5;
    			}
    			break;
    	}
    */
}

lock_state = function()
{
    // do nothing   
}

destroy_state = function()
{
    current_state_string = "destroy_state";

    if (reappear_timer > 0)
    {
        reappear_timer -= 1;
    }
    
    if (reappear_timer <= 0)
    {
        sprite_index             = original_sprite;
        x                        = start_xpos;
        y                        = start_ypos;
        player_can_enter_capsule = true;
        current_state            = free_state;
    }
}

player_in_capsule_state = function()
{
    current_state_string = "player_in_capsule_state";
    
    if (obj_player.player_state == obj_player.on_capsule_state
        && obj_player.current_player_capsule == id)
    {
        // handling capsule destroyers
        if (place_meeting(x, y, obj_capsule_destroyer))
        {
            // capsule stuff
            handle_capsule_destroy_state_transition();
            
            reappear_timer           = time_to_reappear;
            sprite_index             = -1;
            player_can_enter_capsule = false;
            obj_player.player_state  = obj_player.free_state;
            current_state            = destroy_state;
        }
        
        if (place_meeting(x, y, obj_timed_death_capsule_destroyer))
        {
            // destroyer stuff
            var destroyer_instance = instance_place(x, y, obj_timed_death_capsule_destroyer);
            if (destroyer_instance)
            {
                with (destroyer_instance)
                {
                    handle_transition_to_destroy_state();
                }
            }
            
            // capsule stuff
            handle_capsule_destroy_state_transition();
            
            reappear_timer           = time_to_reappear;
            sprite_index             = -1;
            player_can_enter_capsule = false;
            obj_player.player_state  = obj_player.free_state;
            current_state            = destroy_state;
        }
    
        depth = obj_player.depth - 1;
        
        // going to the destroy state
        if (place_meeting(x, y, obj_death_collider)
            && !place_meeting(x, y, obj_moving_death_collider)
            && !place_meeting(x, y, obj_right_death_collider)
            && !place_meeting(x, y, obj_left_death_collider)
            && !place_meeting(x, y, obj_timed_death_capsule_destroyer))
        {
            // capsule stuff
            handle_capsule_destroy_state_transition();
            
            reappear_timer           = time_to_reappear;
            sprite_index             = -1;
            player_can_enter_capsule = false;
            obj_player.player_state  = obj_player.free_state;
            current_state            = destroy_state;
        }
        
        // timer stuff
        if (calculate_input_timer > 0)
        {
            calculate_input_timer -= 1;
        }
        if (calculate_input_timer <= 0)
        {
            can_calculate_input = true;
        }
        
        // movement stuff
        if (can_calculate_input)
        {
            update_player_inputs();
            
            if (right || left || up || down)
            {
                player_capsule_direction = point_direction(0, 0, right - left, down - up);
            }
            
            /*
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
            */
        }
    	
    	var hspeed_to = ((right - left) * capsule_speed);
    	var vspeed_to = ((down - up) * capsule_speed);
    	/*
        	h_speed = lerp(h_speed, (right - left) * capsule_speed, xaccel);
        	v_speed = lerp(v_speed, (down - up) * capsule_speed, yaccel);
    	*/
    	
    	if (right && !left && h_speed < 0)
        {
            h_speed += (xaccel_multiplier * (capsule_speed * 0.5));
        }
        if (left && !right && h_speed > 0)
        {
            h_speed -= (xaccel_multiplier * (capsule_speed * 0.5));
        }
        if (down && !up && v_speed < 0)
        {
            v_speed += (yaccel_multiplier * (capsule_speed * 0.5));
        }
        if (up && !down && v_speed > 0)
        {
            v_speed -= (yaccel_multiplier * (capsule_speed * 0.5));
        }
    	
    	// acceleration stuff
		if (right || left)
		{
		    if (abs(h_speed) > capsule_speed)
            {
                h_speed = lerp(h_speed, hspeed_to, xaccel);
            }
            else
            {
                h_speed += (hspeed_to * xaccel_multiplier);
            }
		}
		
		if (down || up)
		{
		    if (abs(v_speed) > capsule_speed)
            {
                v_speed = lerp(v_speed, vspeed_to, yaccel);
            }
            else
            {
                v_speed += (vspeed_to * yaccel_multiplier);
            }
		}
		
		if (!right && !left)
		{
			if (h_speed < 0)
			{
				h_speed += (xaccel_multiplier * (capsule_speed * 0.5));
				if (h_speed > 0)
				{
					h_speed = 0;
				}
			}
			else if (h_speed > 0)
			{
				h_speed -= (xaccel_multiplier * (capsule_speed * 0.5));
				if (h_speed < 0)
				{
					h_speed = 0;	
				}
			}
		}
		
		if (!down && !up)
		{
			if (v_speed < 0)
			{
				v_speed += (yaccel_multiplier * (capsule_speed * 0.5));
				if (v_speed > 0)
				{
					v_speed = 0;
				}
			}
			else if (v_speed > 0)
			{
			    v_speed -= (yaccel_multiplier * (capsule_speed * 0.5));
				if (v_speed < 0)
				{
					v_speed = 0;
				}
			}
		}
        
        // not gonna use this for now
        // old acceleration stuff
        /*
            var hspeed_to = (player_capsule_hdir * capsule_speed);
            var vspeed_to = (player_capsule_vdir * capsule_speed);
            
            if ((player_capsule_hdir == 1 && h_speed >= 0)
                || (player_capsule_hdir == -1 && h_speed <= 0))
            {
                if (abs(h_speed) > capsule_speed)
                {
                    h_speed = lerp(h_speed, hspeed_to, xaccel);
                }
                else
                {
                    h_speed += (hspeed_to * xaccel_multiplier);
                }
            }
            
            if ((player_capsule_vdir == 1 && v_speed >= 0)
                || (player_capsule_vdir == -1 && v_speed <= 0))
            {
                if (abs(v_speed) > capsule_speed)
                {
                    v_speed = lerp(v_speed, vspeed_to, yaccel);
                }
                else
                {
                    v_speed += (vspeed_to * yaccel_multiplier);
                }
            }
		
		    // horizontal
            if (player_capsule_hdir == 1
                && h_speed < 0)
            {
                h_speed += (xaccel_multiplier * (capsule_speed * 0.7));
            }
            
            if (player_capsule_hdir == -1
                && h_speed > 0)
            {
                h_speed -= (xaccel_multiplier * (capsule_speed * 0.7));
            }
            
            // vertical
            if (player_capsule_vdir == 1
                && v_speed < 0)
            {
                v_speed += (yaccel_multiplier * (capsule_speed * 0.7));
            }
            
            if (player_capsule_vdir == -1
                && v_speed > 0)
            {
                v_speed -= (yaccel_multiplier * (capsule_speed * 0.7));
            }
        */
        
    	// horizontal collision
    	repeat (abs(h_speed)) 
    	{
    	    with (obj_player)
    		{
    		    PLAYER_handle_checkpoint_setting(); 
    		}
    		
    		var sign_hspeed = sign(h_speed);
    		
    		if (place_meeting(x + sign_hspeed, y, obj_default_collider))
    		{
    			h_speed = 0;
    			obj_player.h_speed = 0;
    			// player_capsule_hdir = -player_capsule_hdir;
    			/*
        			h_speed = (-player_capsule_hdir * capsule_speed);
        			obj_player.h_speed = h_speed;
        			can_calculate_input = false;
        			calculate_input_timer = time_to_calculate_input;
    			*/
    			break;
    		} 
    		else 
    		{
                x += sign_hspeed;
                x = round(x);
                obj_player.x = x;
                // obj_player.x += sign_hspeed;
    		    // obj_player.x = round(obj_player.x);
    		}
    		
    		PLAYER_CAPSULE_handle_horizontal_death_colliders_collision();
    	}
    	
    	// vertical collision
    	repeat (abs(v_speed))
    	{
    	    with (obj_player)
    		{
    		    PLAYER_handle_checkpoint_setting(); 
    		}
    		
            var sign_vspeed = sign(v_speed);
            
            if (place_meeting(x, y + sign_vspeed, obj_default_collider))
            {   
            	v_speed = 0;
            	obj_player.v_speed = 0;
            	// player_capsule_vdir = -player_capsule_vdir;
            	/*
                	v_speed = (-player_capsule_vdir * capsule_speed);
                	obj_player.v_speed = v_speed;
                	can_calculate_input = false;
                	calculate_input_timer = time_to_calculate_input;
            	*/
            	break;
            }
            else 
            {
            	y += sign_vspeed;
            	y = round(y);
            	obj_player.y = (y + (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2));
            	// obj_player.y += sign_vspeed;
            	// obj_player.y = round(obj_player.y);
            }
            
            PLAYER_CAPSULE_handle_vertical_death_colliders_collision();
    	}
    }
    else
    {
        current_state = free_state;
    }
}

go_back_to_start_pos_state = function()
{
    current_state_string = "go_back_to_start_pos_state";
    
    // use this if we want to have a fixed capsule, that stays in the place
    // we left it when dying or whatever...
    /*
        if (point_distance(x, y, obj_player.x, 
            (obj_player.y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)))
            < distance_from_player_to_check)
        {
            go_back_to_start_pos_timer = 0;
            current_state              = free_state;
            
        }
        else
        {
              
        }
    */
    
    // counting to go back to start position
    if (go_back_to_start_pos_timer > 0)
    {
        go_back_to_start_pos_timer -= 1;
    }
    // actually going back
    if (go_back_to_start_pos_timer <= 0)
    {
        reappear_timer           = time_to_reappear;
        sprite_index             = -1;
        player_can_enter_capsule = false;
        current_state            = destroy_state;
        
        // @TODO @Incomplete: play sound and stuff, do different effects for this
        // type of destroy_state transition.
        
        // handle_capsule_destroy_state_transition();
    }
    
    // doing the same stuff that we do in the free_state
    // capsule timer stuff
    if (enter_capsule_timer > 0)
    {
        enter_capsule_timer -= 1;
    }
    if (enter_capsule_timer <= 0
        && !player_can_enter_capsule
        && !place_meeting(x, y, obj_player))
    {
        player_can_enter_capsule = true;
    }

    colliding_with_player = place_meeting(x, y, obj_player);
    if (colliding_with_player
        && obj_player.player_state != obj_player.on_capsule_state
        && player_can_enter_capsule)
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
    		
    		// player_on_capsule_state = true;
    		
    		go_back_to_start_pos_timer = 0;
    		current_player_capsule = other.id;
    		player_state = on_capsule_state;
    	}
    	
    	current_state = player_in_capsule_state;
    }
}

free_state = function()
{
    current_state_string = "free_state";
    
    h_speed             = 0;
    v_speed             = 0;
    player_capsule_hdir = 0;
    player_capsule_vdir = 0;
    depth               = original_depth;
    
    if (x != start_xpos || y != start_ypos)
    {
        if (point_distance(x, y, obj_player.x, obj_player.y) 
            >= distance_from_player_to_check)
        {
            go_back_to_start_pos_timer = time_to_go_back_to_start_pos;
            current_state              = go_back_to_start_pos_state;
        }
        // Going to the start position if the player dies.
        else
        {
            if (obj_player.player_state == obj_player.death_state)
            {
                go_back_to_start_pos_timer = time_to_go_back_to_start_pos;
                current_state              = go_back_to_start_pos_state;
            }
        }
    }

    // capsule timer stuff
    if (enter_capsule_timer > 0)
    {
        enter_capsule_timer -= 1;
    }
    if (enter_capsule_timer <= 0
        && !player_can_enter_capsule
        && !place_meeting(x, y, obj_player))
    {
        player_can_enter_capsule = true;
    }

    colliding_with_player = place_meeting(x, y, obj_player);
    if (colliding_with_player
        && obj_player.player_state != obj_player.on_capsule_state
        && player_can_enter_capsule)
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
    		
    		// player_on_capsule_state = true;
    		
    		go_back_to_start_pos_timer = 0;
    		current_player_capsule = other.id;
    		player_state = on_capsule_state;
    	}
    	
    	current_state = player_in_capsule_state;
    }
}

current_state = free_state;