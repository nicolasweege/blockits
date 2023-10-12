var left = bbox_left;
var top = bbox_top;
// var app_scale = surface_get_height(application_surface / 360);
var app_scale = surface_get_height(application_surface / 180);
var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);

water_surface = surface_create(sprite_width, sprite_height + transparency_buffer_height);
surface_set_target(water_surface);

	draw_clear_alpha(c_blue, 0);
	draw_surface_part_ext(application_surface, (left - camx) * app_scale, (top - camy) * app_scale, sprite_width * app_scale, sprite_height * app_scale, 0, transparency_buffer_height, 1 / app_scale, 1 / app_scale, c_white, 1);
	// gpu_set_colorwriteenable(true, true, true, false);
	draw_set_alpha(0.1);
	// draw_set_color($f4bb41);
	draw_set_color(c_aqua);
	draw_rectangle(0, transparency_buffer_height, sprite_width, sprite_height + transparency_buffer_height, false);
	draw_set_color($f4eb42);
	draw_line(0, transparency_buffer_height + 1, sprite_width, transparency_buffer_height + 1);
	// gpu_set_colorwriteenable(true, true, true, true);
	
	draw_set_color(c_white);
	draw_set_alpha(0.5);
	draw_line(0, transparency_buffer_height, sprite_width, transparency_buffer_height);
	draw_set_alpha(1);

surface_reset_target();

pw = texture_get_texel_width(surface_get_texture(water_surface));
ph = texture_get_texel_height(surface_get_texture(water_surface));

resize_surface = surface_create(sprite_width, sprite_height + transparency_buffer_height);
surface_set_target(resize_surface);
	draw_clear_alpha(c_white, 0);
	shader_set(sh_water);
		shader_set_uniform_f(global.u_pixelh_wave, ph);
		shader_set_uniform_f(global.u_pixelw_wave, pw);
		shader_set_uniform_f(global.u_spring_count, spring_count);
		shader_set_uniform_f_array(global.u_springs, springs);
		shader_set_uniform_f(global.u_time, (get_timer() * 0.0000025));
		draw_surface(water_surface, 0, 0);
	shader_reset();
surface_reset_target();

draw_surface(resize_surface, left, top - transparency_buffer_height);

surface_free(water_surface);
surface_free(resize_surface);