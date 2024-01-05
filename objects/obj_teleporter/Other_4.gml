if (place_meeting(x, y, obj_player)
    && global.player_changing_rooms)
{
	layer_set_visible("player", false);
	sprite_index = spr_teleporter_3;
	current_state = open_door_state;
}