can_draw = false;
// sprite_index = -1;
sprite_index = spr_dash_bonus_item_highlight;

screen_shake(3, 7, true, false);

audio_play_sound_on(audio_emitter, 
                    choose(snd_diamond_touch_01, snd_diamond_touch_02, snd_diamond_touch_03),
				    0, 
					1);

alarm_set(1, time_to_showup);