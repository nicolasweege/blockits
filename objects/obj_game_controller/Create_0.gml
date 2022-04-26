randomize();
display_set_gui_size(VIEW_W, VIEW_H);
layer_set_visible(DEFAULT_COLLIDERS_LAYER, false);

global.menu = instance_create_depth(0, 0, -1, obj_pause_menu);
global.player = instance_create_layer(52, 120, PLAYER_LAYER, obj_player);
global.colliders_controller = instance_create_layer(0, 0, CONTROLLERS_LAYER, obj_colliders_controller);
