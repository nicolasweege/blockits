side_to_look = 1;

dash_buffer_counter = 0;
dash_buffer_max = 15;

time_to_back_anim = 7;
can_back_anim_timer = 0;

set_player_momentum_timer = time_source_create(time_source_game,
                                               0.4,
											   time_source_units_seconds,
											   function()
											   {
												   with (obj_player)
												   {
													   keep_horizontal_jumper_momentum = true;
													   if (player_state != pre_direct_state)
													   {
															player_state = free_state;
													   }
												   }
											   }, [], 1);