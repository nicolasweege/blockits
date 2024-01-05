if (image_index >= image_number - 1)
{
	image_speed = 0;
	teleporter_id.sprite_index = spr_teleporter_2;
	teleporter_id.current_state = teleporter_id.close_door_state;
	instance_destroy();
}