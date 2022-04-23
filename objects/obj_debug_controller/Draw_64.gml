switch (show_debug)
{
	case 1: // Default Colliders
		instance_activate_layer(DEFAULT_COLLIDERS_LAYER);
		
		instance_deactivate_layer(WALL_COLLIDERS_LAYER);
		instance_deactivate_layer(DEATH_COLLIDERS_LAYER);
	break;
	
	case 2: // Wall Colliders
		instance_activate_layer(WALL_COLLIDERS_LAYER);
		
		instance_deactivate_layer(DEFAULT_COLLIDERS_LAYER);
		instance_deactivate_layer(DEATH_COLLIDERS_LAYER);
	break;
	
	case 3: // Death Colliders
		instance_activate_layer(DEATH_COLLIDERS_LAYER);
		
		instance_deactivate_layer(DEFAULT_COLLIDERS_LAYER);
		instance_deactivate_layer(WALL_COLLIDERS_LAYER);
	break;
	
	default:
		instance_deactivate_layer(DEFAULT_COLLIDERS_LAYER);
		instance_deactivate_layer(WALL_COLLIDERS_LAYER);
		instance_deactivate_layer(DEATH_COLLIDERS_LAYER);
}
