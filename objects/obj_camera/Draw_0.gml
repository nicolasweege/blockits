var cam = camera_get_active();
camera_set_view_mat(cam, matrix_build_lookat(-200, -50, 200, room_width, room_height, 0, 0, 0, -1));
camera_set_proj_mat(cam, matrix_build_projection_perspective_fov(80, window_get_width() / window_get_height(), 1, 32000));
camera_apply(cam);

vertex_submit(m_vbuffer, pr_trianglelist, sprite_get_texture(spr_fallen, 0));
// vertex_submit(m_vbuffer_2, pr_trianglelist, -1);