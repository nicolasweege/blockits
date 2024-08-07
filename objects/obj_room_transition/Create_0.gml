transitioning_from_debug_menu = false;

has_paused   = false;
has_unpaused = false;

alpha = 0;
color = c_black;

transition_speed        = 0.05;
seconds_todo_transition = 0.1;

fade_in  = true;
fade_out = false;

room_to_go = rm_nexus;
xto        = 0;
yto        = 0;

transition_timer = time_source_create(time_source_game,
                                      seconds_todo_transition,
									  time_source_units_seconds,
									  function()
									  {
									      room_goto(room_to_go);
									      
										  if (instance_exists(obj_player))
										  {
											  obj_player.x = xto;
										      obj_player.y = yto;
										      
										      if (transitioning_from_debug_menu)
										      {
										          obj_player.player_state 
										          = obj_player.god_mode_state;
										          
										          global.app_state = states.EDITOR
										      }
										      else
										      {
										          obj_player.player_state 
										          = obj_player.free_state;
										      }
										  }
										  
										  fade_out = true;
									  }, [], 1);