var matrix = matrix_build(x, y, m_z, 0, 0, 0, 100, 100, 0);
matrix_set(matrix_world, matrix);
vertex_submit(m_model, pr_trianglelist, -1);
matrix_set(matrix_world, matrix_build_identity());