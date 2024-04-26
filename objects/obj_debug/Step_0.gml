if (global.app_state == states.PAUSE_MENU
    || global.app_state == states.MAIN_MENU
    || room == MAIN_MENU_ROOM)
{
    exit;
}

if (keyboard_check_pressed(vk_f1))
{
    if (global.app_state == states.GAME)
    {
        global.app_state = states.EDITOR;
    }
    else if (global.app_state == states.EDITOR)
    {
        global.app_state = states.GAME;
    }
}