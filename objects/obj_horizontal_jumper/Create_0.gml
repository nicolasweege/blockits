side_to_look = 1;

dash_buffer_counter = 0;
dash_buffer_max = 15;

time_to_back_anim = 7;
can_back_anim_timer = 0;
arrow_object_to_use = obj_jumper_arrow_particle_2;

change_color_speed = 0.03;
green = 255;
blue = 255;
red = 255;
main_color = make_color_rgb(red, green, blue);

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