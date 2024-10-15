obj_name = "obj_layer_destroy_block";

original_image_speed = image_speed;
has_paused = false;
has_unpaused = false;

layer_1_sprite = spr_layer_destroy_block_layer_1;
layer_2_sprite = spr_layer_destroy_block_layer_2;
layer_3_sprite = spr_layer_destroy_block_layer_3;

destroy_sprite = spr_destroy_block_highlight;
current_sprite_to_draw = layer_3_sprite;

time_togo_default_state = time_source_create(time_source_game,
				                             0.9, // 1
											 time_source_units_seconds,
											 function()
											 {
											     current_layer_index = max_layer_index;
												 current_state = default_state;
											 }, [], 1);

current_layer_index = 3;
max_layer_index = 3;

// STATES
destroy_state = function()
{
	sprite_index = -1;
	current_sprite_to_draw = destroy_sprite;
}

default_state = function()
{
	sprite_index = spr_destroy_block;
	
	switch (current_layer_index)
    {
        case 1: current_sprite_to_draw = layer_1_sprite; break;
        case 2: current_sprite_to_draw = layer_2_sprite; break;
        case 3: current_sprite_to_draw = layer_3_sprite; break;
    }
}

current_state = default_state;