gpu_set_blendmode(bm_add);

image_alpha = sprite_alpha;
image_blend = sprite_color;
draw_self();

gpu_set_blendmode(bm_normal);