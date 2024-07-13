obj_name = "obj_falling_destroy_block";

original_image_speed = image_speed;
has_paused           = false;
has_unpaused         = false;

default_sprite         = spr_falling_destroy_block;
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
    
    // && obj_player.player_state != obj_player.dash_state
    if ((place_meeting(x + 1, y, obj_player)
            || place_meeting(x - 1, y, obj_player)
            || place_meeting(x, y + 1, obj_player)
            || place_meeting(x, y - 1, obj_player))
        && obj_player.dash_destroy_block_buffer_counter <= 0)
    {
        with (obj_player)
        {
            screen_shake(5, 10, 1, 1);
            PLAYER_goto_death_state();
        }
    }
}

current_state = default_state;