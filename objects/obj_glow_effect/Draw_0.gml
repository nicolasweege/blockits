// draw_self();

// set blend modes to the glow effect
gpu_set_blendmode(bm_add);

// drawing sprites that are affected by the glow effect
draw_sprite_ext(sprite_to_glow, 0, x, y, 1, 1, 0, c_white, alpha);

gpu_set_blendmode(bm_normal);