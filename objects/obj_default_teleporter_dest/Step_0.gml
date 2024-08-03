if (global.app_state == states.PAUSE_MENU
    || global.app_state == states.EDITOR
    || obj_player.player_state == obj_player.death_state
    || !pair_instance)
{
    exit;
}