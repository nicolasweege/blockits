

default_sprite = spr_destroy_block;
destroy_sprite = spr_destroy_block_highlight;
current_sprite_to_draw = default_sprite;

time_togo_default_state = time_source_create(time_source_game,
				                             3,
											 time_source_units_seconds,
											 function()
											 {
												 current_state = default_state;
											 }, [], 1);

destroy_state = function()
{
	sprite_index = -1;
}

default_state = function()
{
	sprite_index = current_sprite_to_draw;
}

current_state = default_state;