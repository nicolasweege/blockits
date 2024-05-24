original_image_speed = image_speed;
has_paused           = false;
has_unpaused         = false;

default_sprite         = spr_inside_death_destroy_block;
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
	sprite_index           = -1;
	current_sprite_to_draw = destroy_sprite;
}

default_state = function()
{
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