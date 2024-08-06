if (global.use_gmlive)
{
	if (live_call()) return live_result;
}

original_grav_value = 0.01;
grav = original_grav_value;

base_max_fall_speed = 5;

h_speed = 0;
v_speed = 0;

on_floor = 0;

free_state = function()
{
    // falling
    if (use_falling)
    {
    	if (v_speed < (base_max_fall_speed * 1.10)) // 1.4
    	{
    		v_speed += grav;
    	}
	}
    
    // horizontal collision
    repeat (abs(h_speed)) 
    {
        var sign_hspeed = sign(h_speed);
        
        if (place_meeting(x + sign_hspeed, y, obj_default_collider)
            || place_meeting(x + sign_hspeed, y, obj_death_collider_counter))
        {
            h_speed = 0;
            break;
        } 
        else 
        { 
            x += sign_hspeed;
            x = round(x);
        }
    }
	
    // vertical collision
    repeat (abs(v_speed)) 
    {   
        var sign_vspeed = sign(v_speed);
        
        if (place_meeting(x, y + sign_vspeed, obj_default_collider)
            || place_meeting(x, y + sign_vspeed, obj_death_collider_counter))
        {
            v_speed = 0;
            break;
        }
        else 
        {
            y += sign_vspeed;
            y = round(y);
        }
    }
}

current_state = free_state;