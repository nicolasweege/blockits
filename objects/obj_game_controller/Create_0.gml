display_set_gui_size(VIEW_W, VIEW_H);

layer_set_visible("Default_Colliders", false);
layer_set_visible("Checkpoints", false);
layer_set_visible("camera_masks", false);

layer_set_visible("Platform_Colliders", true);
layer_set_visible("Wall_Colliders", true);
layer_set_visible("Death_Colliders", true);

global.player = instance_create_layer(60, 100, "Player", obj_player);
global.colliders_controller = instance_create_layer(0, 0, "Controllers", obj_colliders_controller);