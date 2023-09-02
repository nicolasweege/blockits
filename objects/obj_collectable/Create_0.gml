follow_player = false;
can_collect = false;
go_back_to_start_pos = false;
start_x = x;
start_y = y;
xscale = 1;
yscale = 1;

destroy_timer = time_source_create(time_source_game,
                                   2, 
								   time_source_units_seconds, 
								   function()
								   {
									   instance_destroy();
								   }, [], 1);