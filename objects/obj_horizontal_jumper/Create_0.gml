side_to_look = 1;

dash_buffer_counter = 0;
dash_buffer_max = 15;

set_player_momentum_timer = time_source_create(time_source_game,
                                               0.4,
											   time_source_units_seconds,
											   function()
											   {
												   with (obj_player)
												   {
													   keep_horizontal_jumper_momentum = true;
													   player_state = free_state;
												   }
											   }, [], 1);