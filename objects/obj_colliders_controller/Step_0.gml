var switch_colliders_p = keyboard_check_pressed(ord("J"))
	|| gamepad_button_check_pressed(global.device, gp_shoulderr)
	|| gamepad_button_check_pressed(global.device, gp_shoulderl)
	|| gamepad_button_check_pressed(global.device, gp_shoulderrb)
	|| gamepad_button_check_pressed(global.device, gp_shoulderlb)

if (switch_colliders_p)
	show_collider++;

if (show_collider > 2)
	show_collider = 1;

switch (show_collider)
{
	case 1: // Default Colliders
		instance_activate_layer("platform_colliders");
		instance_deactivate_layer("wall_colliders");
	break;
	
	case 2: // Wall Colliders
		instance_activate_layer("wall_colliders");
		instance_deactivate_layer("platform_colliders");
	break;
}