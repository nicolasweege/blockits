
has_paused = false;
has_unpaused = false;

can_play_impact_audio = true;

h_speed = 0;
v_speed = 0;
can_change_hdir = true;
can_change_vdir = true;

change_hdir_timer = time_source_create(time_source_game,
				                      time_to_change_dir,
									  time_source_units_seconds,
										function()
										{
											hdir *= -1;
											h_speed = hdir;
											can_change_hdir = true;
										}, [], 1);


change_vdir_timer = time_source_create(time_source_game,
				                      time_to_change_dir,
									  time_source_units_seconds,
										function()
										{
											vdir *= -1;
		                                    v_speed = vdir;
											can_change_vdir = true;
										}, [], 1);