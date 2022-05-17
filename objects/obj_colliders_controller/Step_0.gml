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
		instance_activate_layer("Platform_Colliders");
		instance_deactivate_layer("Wall_Colliders");
	break;
	
	case 2: // Wall Colliders
		instance_activate_layer("Wall_Colliders");
		instance_deactivate_layer("Platform_Colliders");
	break;
}
