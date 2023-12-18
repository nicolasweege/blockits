// timers
// time_source_destroy(player_moving_platform_mode_timer);

time_source_destroy(going_back_to_checkpoint_timer);
time_source_destroy(set_player_rope_momentum_timer);

time_source_destroy(timed_direct_timer);
time_source_destroy(can_enter_timed_direct_timer);

time_source_destroy(bounce_player_destroy_block_timer);

// particles
part_type_destroy(dash_particle);
part_system_destroy(dash_particle_system);