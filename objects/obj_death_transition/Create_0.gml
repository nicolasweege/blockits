alpha = 0;
color = c_black;

transition_speed = 0.05;

fade_in = true;
fade_out = false;

transition_timer = time_source_create(time_source_game,
                                      0.3,
									  time_source_units_seconds,
									  function()
									  {
										  with(obj_player)
										  {
											  player_state = free_state;
											  going_back_to_checkpoint = true;
											  can_create_death_transition = true;
											  x = global.checkpoint_x;
											  y = global.checkpoint_y;
										  }
										  global.camx = (obj_player.x - (global.cam_width/2));
										  global.camy = ((obj_player.y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) - (global.cam_height/2));
										  
										  fade_out = true;
									  }, [], 1);