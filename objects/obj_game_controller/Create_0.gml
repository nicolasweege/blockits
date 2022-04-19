randomize();

global.camera = instance_create_layer(0, 0, layer, obj_camera);
global.menu = instance_create_layer(0, 0, layer, obj_pause_menu);
global.debug_controller = instance_create_layer(0, 0, layer, obj_debug_controller);

display_set_gui_size(VIEW_W, VIEW_H);

room_goto(ROOM_START);
