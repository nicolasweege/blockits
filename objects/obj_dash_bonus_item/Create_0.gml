start = 0;
time = 0;
hover = 0;
dest = 4;
duration = 150;
// base_sprite = sprite_index;

can_destroy = false;
can_draw = true;
time_to_showup = 120;

// audio stuff
audio_emitter = audio_emitter_create();
audio_emitter_position(audio_emitter, x, y, 0);
audio_emitter_falloff(audio_emitter, 1, 300, 1);