if (global.app_state == states.PAUSE_MENU
    || global.app_state == states.EDITOR)
{
    exit;
}

// landing
temp_on_floor = place_meeting(x, y + 1, obj_default_collider);
if (temp_on_floor && !on_floor && v_speed >= 0)
{
    if (use_falling)
    {
        // screen_shake(5, 10, true, true);
        screen_shake(15, 10, true, true);
        audio_play_sound(snd_debris_stone_soft_01, 1, false);
    }
}

on_floor = place_meeting(x, y + 1, obj_default_collider);

current_state();