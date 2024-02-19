gpu_set_blendmode(bm_src_alpha_sat);

draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, sprite_color, sprite_alpha);

gpu_set_blendmode(bm_normal);