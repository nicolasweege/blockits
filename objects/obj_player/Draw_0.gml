var sign_hspeed = sign(h_speed);
side = h_speed != 0 ? sign_hspeed : side;

draw_sprite_ext(sprite_index, image_index, x, y, (x_scale*side), y_scale, image_angle, image_blend, image_alpha);