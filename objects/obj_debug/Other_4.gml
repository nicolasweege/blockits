layer_set_visible("default_colliders", false);
layer_set_visible("death_colliders", false);
layer_set_visible("checkpoints", false);
layer_set_visible("level_changers", false);

layer_set_visible("camera_masks", false);
layer_set_visible("camera_offset_masks", false);

if (global.app_state == states.EDITOR)
{
    global.app_state = states.GAME;
}