randomize();
window_set_fullscreen(true);
display_set_gui_size(VIEW_W, VIEW_H);
layer_set_visible(DEFAULT_COLLIDERS_LAYER, false);

global.menu = instance_create_layer(0, 0, MENU_LAYER, obj_pause_menu);
global.player = instance_create_layer(28, 164, PLAYER_LAYER, obj_player);
global.colliders_controller = instance_create_layer(0, 0, CONTROLLERS_LAYER, obj_colliders_controller);
