if (image_index >= image_number - 1)
{
	image_speed = 0;
	instance_destroy();
	layer_set_visible("player", true);
	global.player_input_enable = true;
	teleporter_id.current_state = teleporter_id.default_state;
}