randomize();
display_set_gui_size(VIEW_W, VIEW_H);

global.menu = instance_create_layer(0, 0, CONTROLLERS_LAYER, obj_pause_menu);
global.player = instance_create_layer(36, 168, PLAYER_LAYER, obj_player);
global.debug_controller = instance_create_depth(0, 0, -9999, obj_debug_controller);
