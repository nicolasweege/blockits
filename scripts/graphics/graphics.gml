function blockits_add_vertex(vbuffer, xpos, ypos, zpos, xnormal, ynormal, znormal, xtex, ytex, color, alpha) {
	vertex_position_3d(vbuffer, xpos, ypos, zpos);
	vertex_normal(vbuffer, xnormal, ynormal, znormal);
	vertex_texcoord(vbuffer, xtex, ytex);
	vertex_color(vbuffer, color, alpha);
}