fall_anim_yoffset = 0;
fall_anim_alpha = 0.7;

has_paused = false;
has_unpaused = false;

can_destroy = false;
can_draw = true;
random_x = 0;
random_y = 0;
shake_to_showup = false;

sprite_to_draw = spr_mountain_falling_platform_animation;
sprite_highlight = spr_mountain_falling_platform_highlight;

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