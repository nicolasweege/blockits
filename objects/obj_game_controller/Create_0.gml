randomize();

display_set_gui_size(VIEW_W, VIEW_H);

layer_set_visible("default_colliders", false);
layer_set_visible("checkpoints", false);
layer_set_visible("camera_masks", false);
layer_set_visible("death_colliders", false);

layer_set_visible("platform_colliders", true);
layer_set_visible("wall_colliders", true);

show_debug_overlay(false);

if (!instance_exists(obj_player))
{
	global.player = instance_create_layer(60, 100, "player", obj_player);	
}
else
{
	global.player = instance_find(obj_player, 1);
}

global.colliders_controller = instance_create_layer(0, 0, "controllers", obj_colliders_controller);

show_debug_info = false;