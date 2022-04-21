var sign_h_speed = sign(h_speed);
side = h_speed != 0 ? sign_h_speed : side;

draw_sprite_ext(sprite_index, image_index, x, y, x_scale * side, y_scale, image_angle, image_blend, image_alpha);