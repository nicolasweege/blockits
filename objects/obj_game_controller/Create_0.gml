randomize();
display_set_gui_size(VIEW_W, VIEW_H);

global.menu = instance_create_layer(0, 0, layer, obj_pause_menu);
global.player = instance_create_layer(40, 165, layer, obj_player);
global.debug_controller = instance_create_depth(0, 0, -9999, obj_debug_controller);
