obj_name = "obj_default_death_destroy_block";

hitbox = 0;

original_image_speed = image_speed;
has_paused           = false;
has_unpaused         = false;

default_sprite         = spr_default_death_destroy_block;
destroy_sprite         = spr_destroy_block_highlight;
current_sprite_to_draw = default_sprite;

time_togo_default_state = time_source_create(time_source_game,
				                             1,
											 time_source_units_seconds,
											 function()
											 {
												 current_state = default_state;
											 }, [], 1);

// STATES
destroy_state = function()
{
    if (!hitbox)
    {
        hitbox = 
        instance_create_layer(x, y, 
                              layer,
                              obj_default_death_destroy_block_hitbox);
        
        hitbox.image_xscale = image_xscale;
        hitbox.image_yscale = image_yscale;
        hitbox.image_angle  = image_angle;
    }
    
    sprite_index           = -1;
    current_sprite_to_draw = destroy_sprite;
}

default_state = function()
{
    if (hitbox)
    {
        instance_destroy(hitbox);
        hitbox = 0;
    }
    
    sprite_index           = default_sprite;
    current_sprite_to_draw = default_sprite;
    
    if (instance_place(x, y, obj_player))
    {
        with (obj_player)
        {
            screen_shake(5, 10, true, true);
            PLAYER_goto_death_state();
        } 
    }
}

current_state = default_state;