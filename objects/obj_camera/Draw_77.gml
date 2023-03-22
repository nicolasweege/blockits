/*
gpu_set_blendenable(false);

var scale = (window_get_width() / VIEW_W);
draw_surface_ext(application_surface, 
                 0 - (frac(global.camx) * scale),
				 0 - (frac(global.camy) * scale),
				 scale,
				 scale,
				 0,
				 c_white,
				 1.0);

gpu_set_blendenable(true);
*/