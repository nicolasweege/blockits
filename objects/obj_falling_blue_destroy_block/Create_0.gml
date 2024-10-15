obj_name = "obj_falling_blue_destroy_block";

original_image_speed = image_speed;
has_paused = false;
has_unpaused = false;

default_sprite = spr_falling_blue_destroy_block;
destroy_sprite = spr_destroy_block_highlight;
current_sprite_to_draw = default_sprite;

time_togo_default_state = time_source_create(time_source_game,
				                             0.9, // 1
											 time_source_units_seconds,
											 function()
											 {
												 current_state = default_state;
											 }, [], 1);

original_grav_value = 0.3;
grav = original_grav_value;

base_max_fall_speed = 5;

h_speed = 0;
v_speed = 0;

on_floor = 0;

// STATES
destroy_state = function()
{
	sprite_index = -1;
	current_sprite_to_draw = destroy_sprite;
}

default_state = function()
{
	sprite_index = spr_destroy_block;
	current_sprite_to_draw = default_sprite;
	
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
            || place_meeting(x + sign_hspeed, y, obj_death_collider_counter)
            || place_meeting(x + sign_hspeed, y, obj_platform_point))
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
            || place_meeting(x, y + sign_vspeed, obj_death_collider_counter)
            || place_meeting(x, y + sign_vspeed, obj_platform_point))
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

current_state = default_state;