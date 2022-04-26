if (!global.pause)
	exit;

var ds_grid = menu_pages_list[page];
var ds_height = ds_grid_height(ds_grid);
var y_buffer = 32;
var xsp = VIEW_W;
var ysp = (VIEW_H / 2) - (((ds_height - 1) / 2) * y_buffer);
var left_txt_y_pos;
var right_txt_y_pos;
var c = c_black;

draw_rectangle_color(0, 0, VIEW_W, VIEW_H, c, c, c, c, false);
draw_set_font(fnt_menu);

for (var i = 0; i < ds_height; i++)
{
	left_txt_y_pos = ysp + (i * (y_buffer * .7));
	c = c_dkgray;
	
	switch (menu_pages_list[page])
	{
		case 0:
			xsp = VIEW_W * .1;
			
			if (i == menu_option[page])
			{
				c = c_white;
				draw_sprite_ext(MENU_ICON_SPRITE, 0, xsp, left_txt_y_pos, 1, 1, 0, c, 1);
			}
			
			draw_text_color(xsp, left_txt_y_pos, ds_grid[# 0, i], c, c, c, c, 1);
		break;
		
		case 1:
			xsp = VIEW_W * .1;
			
			if (i == menu_option[page])
			{
				c = c_white;
				draw_sprite_ext(MENU_ICON_SPRITE, 0, xsp, left_txt_y_pos, 1, 1, 0, c, 1);
			}
			
			draw_text_color(xsp, left_txt_y_pos, ds_grid[# 0, i], c, c, c, c, 1);
		break;
		
		case 4:
			if (i == menu_option[page])
			{
				c = c_white;
				
				switch (i)
				{
					case 0:
						xsp = VIEW_W * .1;
						draw_sprite_ext(MENU_ICON_SPRITE, 0, xsp, left_txt_y_pos, 1, 1, 0, c, 1);
					break;
					
					case 1:
						xsp = VIEW_W * .25;
						draw_sprite_ext(MENU_ICON_SPRITE, 0, xsp, ysp, 1, 1, 0, c, 1);
					break;
				}
			}
			
			switch (i)
			{
				case 0:
					xsp = VIEW_W * .1;
					draw_text_color(xsp, ysp, ds_grid[# 0, i], c, c, c, c, 1);
				break;
				
				case 1:
					xsp = VIEW_W * .25;
					draw_text_color(xsp, ysp, ds_grid[# 0, i], c, c, c, c, 1);
				break;
			}
		break;
		
		default:
			xsp = VIEW_W * .1;
			left_txt_y_pos = (ysp + 17) + (i * (y_buffer * .7));
			
			if (i == menu_option[page])
			{
				c = c_white;
				draw_sprite_ext(MENU_ICON_SPRITE, 0, xsp, left_txt_y_pos, 1, 1, 0, c, 1);
			}
			
			draw_text_color(xsp, left_txt_y_pos, ds_grid[# 0, i], c, c, c, c, 1);
	}
}

for (var i = 0; i < ds_height; i++)
{
	right_txt_y_pos = ysp + (i * (y_buffer * .7));
	
	switch (ds_grid[# 1, i])
	{
		case menu_element_type.slider:
			var current_value = ds_grid[# 3, i];
			var current_array = ds_grid[# 4, i];
			var volume_pos = ((current_value - current_array[0]) / (current_array[1] - current_array[0]));
			c = c_dkgray;
			xsp = VIEW_W * .35;
			
			if (i == menu_option[page])
				c = c_white;
			
			draw_text_color(xsp, right_txt_y_pos, string(floor(volume_pos * 100)), c, c, c, c, 1);
		break;
		
		case menu_element_type.toggle:
			var current_value = ds_grid[# 3, i];
			var current_array = ds_grid[# 4, i];
			c = c_dkgray;
			xsp = VIEW_W * .35;
			
			if (i == menu_option[page])
				c = c_white;
			
			draw_text_color(xsp, right_txt_y_pos, current_array[current_value], c, c, c, c, 1);
		break;
		
		case menu_element_type.vk_input:
			var current_value = ds_grid[# 3, i];
			var input_string = "";
			var input_sprite;
			
			switch (current_value)
			{
				case ord("0"): input_string = "0"; break;
				case ord("1"): input_string = "1"; break;
				case ord("2"): input_string = "2"; break;
				case ord("3"): input_string = "3"; break;
				case ord("4"): input_string = "4"; break;
				case ord("5"): input_string = "5"; break;
				case ord("6"): input_string = "6"; break;
				case ord("7"): input_string = "7"; break;
				case ord("8"): input_string = "8"; break;
				case ord("9"): input_string = "9"; break;
				case ord("Q"): input_string = "Q"; break;
				case ord("W"): input_string = "W"; break;
				case ord("E"): input_string = "E"; break;
				case ord("R"): input_string = "R"; break;
				case ord("T"): input_string = "T"; break;
				case ord("Y"): input_string = "Y"; break;
				case ord("U"): input_string = "U"; break;
				case ord("I"): input_string = "I"; break;
				case ord("O"): input_string = "O"; break;
				case ord("P"): input_string = "P"; break;
				case ord("A"): input_string = "A"; break;
				case ord("S"): input_string = "S"; break;
				case ord("D"): input_string = "D"; break;
				case ord("F"): input_string = "F"; break;
				case ord("G"): input_string = "G"; break;
				case ord("H"): input_string = "H"; break;
				case ord("J"): input_string = "J"; break;
				case ord("K"): input_string = "K"; break;
				case ord("L"): input_string = "L"; break;
				case ord("Z"): input_string = "Z"; break;
				case ord("X"): input_string = "X"; break;
				case ord("C"): input_string = "C"; break;
				case ord("V"): input_string = "V"; break;
				case ord("B"): input_string = "B"; break;
				case ord("N"): input_string = "N"; break;
				case ord("M"): input_string = "M"; break;
				case vk_left: input_sprite = spr_left_arrow_icon; break;
				case vk_right: input_sprite = spr_right_arrow_icon; break;
				case vk_up: input_sprite = spr_up_arrow_icon; break;
				case vk_down: input_sprite = spr_down_arrow_icon; break;
				case vk_escape: input_string = "Esc"; break;
				case vk_space: input_string = "Space"; break;
				case vk_shift: input_string = "Shift"; break;
				case vk_lcontrol: input_string = "L Ctrl"; break;
				case vk_rcontrol: input_string = "R Ctrl"; break;
				case vk_lalt: input_string = "L Alt"; break;
				case vk_ralt: input_string = "R Alt"; break;
				case vk_backspace: input_string = "Backspace"; break;
				case vk_tab: input_string = "Tab"; break;
				case vk_home: input_string = "Home"; break;
				case vk_end: input_string = "End"; break;
				case vk_delete: input_string = "Del"; break;
				case vk_insert: input_string = "Ins"; break;
				case vk_pageup: input_string = "PgUp"; break;
				case vk_pagedown: input_string = "PgDn"; break;
				case vk_pause: input_string = "Puase"; break;
				case vk_f1: input_string = "F1"; break;
				case vk_f2: input_string = "F2"; break;
				case vk_f3: input_string = "F3"; break;
				case vk_f4: input_string = "F4"; break;
				case vk_f5: input_string = "F5"; break;
				case vk_f6: input_string = "F6"; break;
				case vk_f7: input_string = "F7"; break;
				case vk_f8: input_string = "F8"; break;
				case vk_f9: input_string = "F9"; break;
				case vk_f10: input_string = "F10"; break;
				case vk_f11: input_string = "F11"; break;
				case vk_f12: input_string = "F12"; break;
				case vk_numpad0: input_string = "Numpad 0"; break;
				case vk_numpad1: input_string = "Numpad 1"; break;
				case vk_numpad2: input_string = "Numpad 2";	break;
				case vk_numpad3: input_string = "Numpad 3";	break;
				case vk_numpad4: input_string = "Numpad 4";	break;
				case vk_numpad5: input_string = "Numpad 5";	break;
				case vk_numpad6: input_string = "Numpad 6";	break;
				case vk_numpad7: input_string = "Numpad 7";	break;
				case vk_numpad8: input_string = "Numpad 8";	break;
				case vk_numpad9: input_string = "Numpad 9"; break;
				default: input_string = "Unknown";
			}
			
			c = c_dkgray;
			xsp = VIEW_W * .35;
			right_txt_y_pos = (ysp + 17) + (i * (y_buffer * .7));
			
			if (i == menu_option[page] && inputting)
				c = c_white;
			
			draw_set_halign(fa_center);
			
			switch (current_value)
			{
				case vk_left:
					var spr_height = sprite_get_height(input_sprite);
					draw_sprite_ext(input_sprite, 0, xsp + (xsp / 2), right_txt_y_pos + (spr_height / 2), icons_size, icons_size, 0, c, 1);
				break;

				case vk_right:
					var spr_height = sprite_get_height(input_sprite);
					draw_sprite_ext(input_sprite, 0, xsp + (xsp / 2), right_txt_y_pos + (spr_height / 2), icons_size, icons_size, 0, c, 1);
				break;

				case vk_up:
					var spr_height = sprite_get_height(input_sprite);
					draw_sprite_ext(input_sprite, 0, xsp + (xsp / 2), right_txt_y_pos + (spr_height / 2), icons_size, icons_size, 0, c, 1);
				break;

				case vk_down:
					var spr_height = sprite_get_height(input_sprite);
					draw_sprite_ext(input_sprite, 0, xsp + (xsp / 2), right_txt_y_pos + (spr_height / 2), icons_size, icons_size, 0, c, 1);
				break;

				default: draw_text_color(xsp + (xsp / 2), right_txt_y_pos, input_string, c, c, c, c, 1);	
			}
			
			draw_set_halign(fa_left);
		break;
		
		case menu_element_type.gp_input:
			var current_value = ds_grid[# 3, i];
			var input_string = "";
			var input_sprite;
			
			switch (current_value)
			{
				case gp_face1: input_sprite = spr_south_button_icon; break;
				case gp_face2: input_sprite = spr_east_button_icon; break;
				case gp_face3: input_sprite = spr_west_button_icon; break;
				case gp_face4: input_sprite = spr_north_button_icon; break;
				case gp_shoulderl: input_string = "LB"; break;
				case gp_shoulderlb: input_string = "LT"; break;
				case gp_shoulderr: input_string = "RB"; break;
				case gp_shoulderrb: input_string = "RT"; break;
				case gp_select: input_string = "Back"; break;
				case gp_start: input_string = "Start"; break;
				case gp_stickl: input_string = "L Stick"; break;
				case gp_stickr: input_string = "R Strick"; break;
				case gp_padu: input_sprite = spr_up_button_icon; break;
				case gp_padd: input_sprite = spr_down_button_icon; break;
				case gp_padl: input_sprite = spr_left_button_icon; break;
				case gp_padr: input_sprite = spr_right_button_icon; break;
				default: input_string = "Unknown";
			}
			
			c = c_dkgray;
			xsp = VIEW_W * .35;
			
			if (i == menu_option[page] && inputting)
				c = c_white;
			
			right_txt_y_pos = (ysp + 17) + (i * (y_buffer * .7));
			
			draw_set_halign(fa_center);
			
			switch (current_value)
			{
				case gp_face1:
					var spr_height = sprite_get_height(input_sprite);
					draw_sprite_ext(input_sprite, 0, xsp + (xsp / 2), right_txt_y_pos + (spr_height / 2), icons_size, icons_size, 0, c, 1);
				break;
				
				case gp_face2:
					var spr_height = sprite_get_height(input_sprite);
					draw_sprite_ext(input_sprite, 0, xsp + (xsp / 2), right_txt_y_pos + (spr_height / 2), icons_size, icons_size, 0, c, 1);
				break;
				
				case gp_face3:
					var spr_height = sprite_get_height(input_sprite);
					draw_sprite_ext(input_sprite, 0, xsp + (xsp / 2), right_txt_y_pos + (spr_height / 2), icons_size, icons_size, 0, c, 1);
				break;
				
				case gp_face4:
					var spr_height = sprite_get_height(input_sprite);
					draw_sprite_ext(input_sprite, 0, xsp + (xsp / 2), right_txt_y_pos + (spr_height / 2), icons_size, icons_size, 0, c, 1);
				break;
				
				case gp_start:
					var spr_height = sprite_get_height(input_sprite);
					draw_sprite_ext(input_sprite, 0, xsp + (xsp / 2), right_txt_y_pos + (spr_height / 2), icons_size, icons_size, 0, c, 1);
				break;
					
				case gp_padu:
					var spr_height = sprite_get_height(input_sprite);
					draw_sprite_ext(input_sprite, 0, xsp + (xsp / 2), right_txt_y_pos + (spr_height / 2), icons_size, icons_size, 0, c, 1);
				break;
					
				case gp_padd:
					var spr_height = sprite_get_height(input_sprite);
					draw_sprite_ext(input_sprite, 0, xsp + (xsp / 2), right_txt_y_pos + (spr_height / 2), icons_size, icons_size, 0, c, 1);
				break;
					
				case gp_padl:
					var spr_height = sprite_get_height(input_sprite);
					draw_sprite_ext(input_sprite, 0, xsp + (xsp / 2), right_txt_y_pos + (spr_height / 2), icons_size, icons_size, 0, c, 1);
				break;
					
				case gp_padr:
					var spr_height = sprite_get_height(input_sprite);
					draw_sprite_ext(input_sprite, 0, xsp + (xsp / 2), right_txt_y_pos + (spr_height / 2), icons_size, icons_size, 0, c, 1);
				break;
					
				default: draw_text_color(xsp + (xsp / 2), right_txt_y_pos, input_string, c, c, c, c, 1);
			}
			
			draw_set_halign(fa_left);
		break;
	}
}

var page_name_x_pos = (VIEW_W * .95);
var page_name_y_pos = (VIEW_H * .95);

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

switch (menu_pages_list[page])
{
	case 1:
		c = c_white;
		draw_text_color(page_name_x_pos, page_name_y_pos, "Options", c, c, c, c, 1);
	break;
			
	case 2:
		c = c_white;
		draw_text_color(page_name_x_pos, page_name_y_pos, "Keyboard", c, c, c, c, 1);
	break;
	
	case 3:
		c = c_white;
		draw_text_color(page_name_x_pos, page_name_y_pos, "Gamepad", c, c, c, c, 1);
	break;
	
	case 4:
		c = c_white;
		xsp = VIEW_W * .1;
		draw_set_halign(fa_left);
		draw_text_color(xsp, left_txt_y_pos - (y_buffer * .8), "Quit game?", c, c, c, c, 1);
	break;	
}

draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
