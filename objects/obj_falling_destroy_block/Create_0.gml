original_image_speed = image_speed;
has_paused           = false;
has_unpaused         = false;

default_sprite         = spr_falling_destroy_block;
destroy_sprite         = spr_destroy_block_highlight;
current_sprite_to_draw = default_sprite;

fall_anim_yoffset = 0;
fall_anim_alpha   = 0.7;

can_destroy     = false;
can_draw        = true;
random_x        = 0;
random_y        = 0;
shake_to_showup = false;

time_togo_default_state = time_source_create(time_source_game,
				                             1,
											 time_source_units_seconds,
											 function()
											 {
												 current_state = default_state;
											 }, [], 1);

showup_timer = time_source_create(time_source_game,
                                  2,
								  time_source_units_seconds,
								  function()
								  {
									  can_destroy = false;
									  can_draw = true;
									  shake_to_showup = false;
									  fall_anim_yoffset = 0;
									  fall_anim_alpha = 0.7;
								  }, [], 1);

destroy_timer = time_source_create(time_source_game,
                                   0.5,
								   time_source_units_seconds, 
								   function()
								   {
									   sprite_index = -1;
									   can_draw = false;
									   time_source_start(shake_to_showup_timer);
									   time_source_start(showup_timer);
								   }, [], 1);

shake_to_showup_timer = time_source_create(time_source_game,
				                           1.8,
										   time_source_units_seconds,
										   function() 
										   { 
											   shake_to_showup = true; 
										   }, [], 1);

// STATES
destroy_state = function()
{
	sprite_index           = -1;
	current_sprite_to_draw = destroy_sprite;
}

default_state = function()
{
    sprite_index           = spr_destroy_block;
    current_sprite_to_draw = default_sprite;
}

current_state = default_state;