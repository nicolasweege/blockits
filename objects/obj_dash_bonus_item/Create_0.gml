
original_image_speed = image_speed;
has_paused = false;
has_unpaused = false;

// audio stuff
audio_emitter = audio_emitter_create();
audio_emitter_position(audio_emitter, x, y, 0);
audio_emitter_falloff(audio_emitter, 1, 300, 1);
								
showup_timer = time_source_create(time_source_game,
					                2,
									time_source_units_seconds,
									function()
									{
										audio_play_sound_on(audio_emitter, 
										                    choose(snd_diamond_return_01, snd_diamond_return_02, snd_diamond_return_03),
														    0, 
															1);
															
										current_state = default_state;
									}, [], 1);
									

// STATES
destroy_state = function()
{
	sprite_index = spr_dash_bonus_item_highlight;
}

default_state = function()
{
	sprite_index = spr_dash_bonus_item;
}

current_state = default_state;