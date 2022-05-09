randomize();

display_set_gui_size(VIEW_W, VIEW_H);

layer_set_visible(DEFAULT_COLLIDERS_LAYER, false);
layer_set_visible(CHECKPOINTS_LAYER, false);

global.menu = instance_create_layer(0, 0, MENU_LAYER, obj_pause_menu);
global.player = instance_create_layer(PLAYER_X_START_POS, PLAYER_Y_START_POS, PLAYER_LAYER, obj_player);
global.colliders_controller = instance_create_layer(0, 0, CONTROLLERS_LAYER, obj_colliders_controller);
