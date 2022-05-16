randomize();

layer_set_visible("Default_Colliders", false);
layer_set_visible("Checkpoints", false);

global.player = instance_create_layer(60, 164, "Player", obj_player);
global.colliders_controller = instance_create_layer(0, 0, "Controllers", obj_colliders_controller);
