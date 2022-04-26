if (global.pause)
	exit;

if (keyboard_check_pressed(global.input_vk_switch_colliders) || gamepad_button_check_pressed(global.device, global.input_gp_switch_colliders))
{
	show_collider++;
	audio_play_sound(MENU_CLICK_SOUND, 1, false);
}

if (show_collider > 2)
	show_collider = 1;

switch (show_collider)
{
	case 1: // Default Colliders
		instance_activate_layer(PLATFORM_COLLIDERS_LAYER);
		
		instance_deactivate_layer(WALL_COLLIDERS_LAYER);
	break;
	
	case 2: // Wall Colliders
		instance_activate_layer(WALL_COLLIDERS_LAYER);
		
		instance_deactivate_layer(PLATFORM_COLLIDERS_LAYER);
	break;
}
