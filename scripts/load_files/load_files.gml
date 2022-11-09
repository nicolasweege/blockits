function blockits_load_model(obj_file_name, mtl_file_name, vformat) {
	// opening the obj and mtl files
	var obj_file   = file_text_open_read(obj_file_name);
	var mtl_file   = file_text_open_read(mtl_file_name);
	
	var mtl_name   = "none";
	var active_mtl = "none";
	var mtl_color  = ds_map_create();
	var mtl_alpha  = ds_map_create();
	ds_map_add(mtl_color, "none", c_white);
	ds_map_add(mtl_alpha, "none", 1);
	
	// reading the mtl file
	while (!file_text_eof(mtl_file)) {
		var line = file_text_read_string(mtl_file);
		file_text_readln(mtl_file);
		
		var values;
		values[0] = "";
		values[string_count(line, " ")] = "";
		var index = 0;
		
		for (var i = 1; i <= string_length(line); i++) {
			if (string_char_at(line, i) == " ") {
				index++;
				values[index] = "";
			} else { values[index] += string_char_at(line, i); }
		}
		
		switch (values[0]) {
			case "newmtl": mtl_name = values[1]; break;
			
			case "Kd":
				var r = real(values[1]) * 255;
				var g = real(values[2]) * 255;
				var b = real(values[3]) * 255;
				var color = make_color_rgb(r, g, b);
				ds_map_set(mtl_color, mtl_name, color);
			break;
			
			case "d": ds_map_set(mtl_alpha, mtl_name, real(values[1])); break;
			
			default: break;
		}
	}
	
	// creating the model vertex buffer
	var model_vbuffer = vertex_create_buffer();
	vertex_begin(model_vbuffer, vformat);
	
	var vx = ds_list_create();
	var vy = ds_list_create();
	var vz = ds_list_create();
	var nx = ds_list_create();
	var ny = ds_list_create();
	var nz = ds_list_create();
	var tx = ds_list_create();
	var ty = ds_list_create();
	
	// reading the obj file
	while (!file_text_eof(obj_file)) {
		var line = file_text_read_string(obj_file);
		file_text_readln(obj_file);
		
		var values;
		values[0] = "";
		values[string_count(line, " ")] = "";
		var index = 0;
		
		for (var i = 1; i <= string_length(line); i++) {
			if (string_char_at(line, i) == " ") {
				index++;
				values[index] = "";
			} else { values[index] += string_char_at(line, i); }
		}
		
		switch (values[0]) {
			case "v":
				ds_list_add(vx, real(values[1]));
				ds_list_add(vy, real(values[2]));
				ds_list_add(vz, real(values[3]));
			break;
			
			case "vn":
				ds_list_add(nx, real(values[1]));
				ds_list_add(ny, real(values[2]));
				ds_list_add(nz, real(values[3]));
			break;
			
			case "vt":
				ds_list_add(tx, real(values[1]));
				ds_list_add(ty, real(values[2]));
			break;
			
			case "f":
				for (var i = 1; i <= 3; i++) {
					var data;
					data[0] = "";
					data[string_count(values[i], "/")] = "";
					var index = 0;
					
					for (var j = 1; j <= string_length(values[i]); j++) {
						if (string_char_at(values[i], j) == "/") {
							index++;
							data[index] = "";
						} else { data[index] += string_char_at(values[i], j); }
					}
					
					var xx = ds_list_find_value(vx, real(data[0]) - 1);
					var yy = ds_list_find_value(vy, real(data[0]) - 1);
					var zz = ds_list_find_value(vz, real(data[0]) - 1);
					
					var txx = ds_list_find_value(tx, real(data[1]) - 1);
					var tyy = ds_list_find_value(ty, real(data[1]) - 1);
					
					var nxx = ds_list_find_value(nx, real(data[2]) - 1);
					var nyy = ds_list_find_value(ny, real(data[2]) - 1);
					var nzz = ds_list_find_value(nz, real(data[2]) - 1);
					
					var color = c_white;
					var alpha = 1;
					if (ds_map_exists(mtl_color, active_mtl)) { color = ds_map_find_value(mtl_color, active_mtl); }
					if (ds_map_exists(mtl_alpha, active_mtl)) { alpha = ds_map_find_value(mtl_alpha, active_mtl); }
					
					blockits_add_vertex(model_vbuffer, xx, yy, zz, nxx, nyy, nzz, txx, tyy, color, alpha);
				}
			break;
			
			case "usemtl": active_mtl = values[1]; break;
			
			default: break;
		}
	}
	
	vertex_end(model_vbuffer);
	
	// freeing memory
	ds_list_destroy(vx);
	ds_list_destroy(vy);
	ds_list_destroy(vz);
	ds_list_destroy(nx);
	ds_list_destroy(ny);
	ds_list_destroy(nz);
	ds_list_destroy(tx);
	ds_list_destroy(ty);
	ds_map_destroy(mtl_color);
	ds_map_destroy(mtl_alpha);

	// closing the files
	file_text_close(obj_file);
	file_text_close(mtl_file);
	
	return model_vbuffer;
}