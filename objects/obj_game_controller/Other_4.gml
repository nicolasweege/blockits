// layer stuff
layer_set_visible("default_colliders", can_show_debug_layers);
layer_set_visible("death_colliders", can_show_debug_layers);
layer_set_visible("checkpoints", can_show_debug_layers);
layer_set_visible("level_changers", can_show_debug_layers);

layer_set_visible("camera_masks", false);
layer_set_visible("camera_offset_masks", false);

if (global.use_scene_bloom_and_vignette)
{
	if (layer_exists("foreground_scene_bloom"))
	{
		layer_set_visible("foreground_scene_bloom", true);
	}
	if (layer_exists("foreground_scene_bloom_vignette"))
	{
		layer_set_visible("foreground_scene_bloom_vignette", true);
	}
}