// deactivating layers
layer_set_visible(DEFAULT_COLLIDERS_LAYER, false);
layer_set_visible(DEATH_COLLIDERS_LAYER, false);
layer_set_visible(CHECKPOINTS_LAYER, false);
layer_set_visible(LEVEL_CHANGERS_LAYER, false);

layer_set_visible(CAMERA_MASKS_LAYER, false);
layer_set_visible(CAMERA_OFFSET_MASKS_LAYER, false);

layer_set_visible(FOREGROUND_SCENE_BLOOM_LAYER, true);
layer_set_visible(FOREGROUND_SCENE_VIGNETTE_LAYER, true);

if (instance_exists(obj_room_transition))
{
    if (!obj_room_transition.transitioning_from_debug_menu
        && global.app_state == states.EDITOR)
    {
        global.app_state = states.GAME;
    }
}