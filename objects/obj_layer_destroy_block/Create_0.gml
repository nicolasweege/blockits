obj_name = "obj_layer_destroy_block";

original_image_speed = image_speed;
has_paused = false;
has_unpaused = false;

default_sprite = spr_layer_destroy_block;
destroy_sprite = spr_destroy_block_highlight;
current_sprite_to_draw = default_sprite;

time_togo_default_state = time_source_create(time_source_game,
				                             0.9, // 1
											 time_source_units_seconds,
											 function()
											 {
												 current_state = default_state;
											 }, [], 1);

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
}

current_state = default_state;