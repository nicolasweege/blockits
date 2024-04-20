// debug stuff
show_debug_overlay(false);

debug_info_text_size = 0.1;
show_debug_info = false;

// layer stuff
layer_set_visible("default_colliders", false);
layer_set_visible("death_colliders", false);
layer_set_visible("checkpoints", false);
layer_set_visible("level_changers", false);
layer_set_visible("camera_masks", false);
layer_set_visible("camera_offset_masks", false);
can_show_debug_layers = false;

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