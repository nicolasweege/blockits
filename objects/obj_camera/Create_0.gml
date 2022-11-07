gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

// creating vertex format
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
m_vformat = vertex_format_end();

// creating vertex buffers
m_vbuffer = vertex_create_buffer();
vertex_begin(m_vbuffer, m_vformat);

blockits_add_vertex(m_vbuffer, 0, 0, 50, 0, 0, 1, 0, 0, c_red, 1);
blockits_add_vertex(m_vbuffer, room_width / 2, 0, 50, 0, 0, 1, 1, 0, c_green, 1);
blockits_add_vertex(m_vbuffer, room_width / 2, room_height / 2, 50, 0, 0, 1, 1, 1, c_blue, 1);

blockits_add_vertex(m_vbuffer, room_width / 2, room_height / 2, 50, 0, 0, 1, 1, 1, c_blue, 1);
blockits_add_vertex(m_vbuffer, 0, room_height / 2, 50, 0, 0, 1, 0, 1, c_green, 1);
blockits_add_vertex(m_vbuffer, 0, 0, 50, 0, 0, 1, 0, 0, c_red, 1);

vertex_end(m_vbuffer);

// vertex buffer 2
m_vbuffer_2 = vertex_create_buffer();
vertex_begin(m_vbuffer_2, m_vformat);

var x1 = 0, y1 = 0, x2 = 200, y2 = 200;
blockits_add_vertex(m_vbuffer_2, x1, y1, 100, 0, 0, 1, 0, 0, c_green, 1);
blockits_add_vertex(m_vbuffer_2, x2, y1, 100, 0, 0, 1, 1, 0, c_green, 1);
blockits_add_vertex(m_vbuffer_2, x2, y2, 100, 0, 0, 1, 1, 1, c_green, 1);

blockits_add_vertex(m_vbuffer_2, x2, y2, 100, 0, 0, 1, 1, 1, c_white, 1);
blockits_add_vertex(m_vbuffer_2, x1, y2, 100, 0, 0, 1, 0, 1, c_white, 1);
blockits_add_vertex(m_vbuffer_2, x1, y1, 100, 0, 0, 1, 0, 0, c_white, 1);

vertex_end(m_vbuffer_2);