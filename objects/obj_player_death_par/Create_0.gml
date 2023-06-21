spd = 10;
back_to_checkpoint = false;
came_back = false;
is_last_par = false;
x_to = 0;
y_to = 0;

going_back_timer = time_source_create(time_source_game,
                                      0.5,
									  time_source_units_seconds,
									  function()
									  {
										  back_to_checkpoint = true;
									  }, [], 1);

time_source_start(going_back_timer);