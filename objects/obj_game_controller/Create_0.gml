randomize();

display_set_gui_size(VIEW_W, VIEW_H);

layer_set_visible("default_colliders", false);
layer_set_visible("checkpoints", false);
layer_set_visible("camera_masks", false);
layer_set_visible("death_colliders", false);

layer_set_visible("platform_colliders", true);
layer_set_visible("wall_colliders", true);

show_debug_overlay(false);

show_debug_info = false;