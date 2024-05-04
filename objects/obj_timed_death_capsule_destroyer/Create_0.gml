time_to_reappear_in_frames = 200;
reappear_timer             = 0;

original_sprite_to_draw = spr_timed_death_capsule_destroyer;
sprite_to_draw          = original_sprite_to_draw;

handle_transition_to_destroy_state = function()
{
    /*
        audio_play_sound(choose(snd_diamond_touch_01, snd_diamond_touch_02, snd_diamond_touch_03),
    								0, 
    								0);
    */
    
    reappear_timer = time_to_reappear_in_frames;
    sprite_index   = -1;
    current_state  = destroy_state;
}

destroy_state = function()
{
    reappear_timer -= 1;
    if (reappear_timer <= 0)
    {
        sprite_index  = sprite_to_draw;
        current_state = default_state;
    }
}

default_state = function()
{
    draw_sprite_ext(sprite_to_draw, image_index,
                    x, y,
                    image_xscale, image_yscale,
                    image_angle, image_blend, image_alpha);   
}

current_state = default_state;