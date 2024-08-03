if (global.app_state == states.PAUSE_MENU
    || global.app_state == states.EDITOR)
{
    exit;
}

// @TODO @Incomplete: mover isso pra uma função que é chamada de dentro do player.
if (place_meeting(x, y, obj_player))
{
    with (obj_player)
    {
        PLAYER_goto_death_state();
    }
}

update_player_inputs();


if (dash_pressed && obj_player.player_state == obj_player.dash_state && !can_disappear)
{
    can_disappear = true;
    can_reappear = false;
    reappear_timer = time_to_reappear;
}

if (reappear_timer > 0 && can_disappear)
{
    reappear_timer -= 1;
}
else
{
    can_disappear = false;
    can_reappear = true;
}

if (can_disappear)
{
    sprite_index = -1;
}

if (can_reappear)
{
    sprite_index = default_sprite;
}