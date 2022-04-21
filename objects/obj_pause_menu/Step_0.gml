if (!global.pause)
	exit;

var ds_grid = menu_pages_list[page];
var ds_height = ds_grid_height(ds_grid);

update_menu_inputs();

change_option_v = 0;
change_option_h = 0;
change_option_h_value = 0;

handle_menu_horizontal_selection();
handle_menu_vertical_selection();

switch(menu_pages_list[page])
{
	case 2:
		if (vk_select_p || gp_select_p)
		{
			if (menu_option[page] != 5)
			{
				if (menu_option[page] == 4)
					audio_play_sound(MENU_SELECT_SOUND, 1, false);
				
				if (menu_option[page] != 4)
				{
					inputting = !inputting;
					audio_play_sound(MENU_CLICK_SOUND, 1, false);
				}
			}
		}
		
		if (draw_redefined_inputs)
		{
			ds_grid[# 3, 0] = DEFAULT_INPUT_VK_UP;
			ds_grid[# 3, 1] = DEFAULT_INPUT_VK_LEFT;
			ds_grid[# 3, 2] = DEFAULT_INPUT_VK_DOWN;
			ds_grid[# 3, 3] = DEFAULT_INPUT_VK_RIGHT;
			variable_global_set(ds_grid[# 2, 0], DEFAULT_INPUT_VK_UP);
			variable_global_set(ds_grid[# 2, 1], DEFAULT_INPUT_VK_LEFT);
			variable_global_set(ds_grid[# 2, 2], DEFAULT_INPUT_VK_DOWN);
			variable_global_set(ds_grid[# 2, 3], DEFAULT_INPUT_VK_RIGHT);
			draw_redefined_inputs = false;
		}
	break;
	
	case 3:
		if (vk_select_p || gp_select_p)
		{
			if (menu_option[page] != 5)
			{
				if (menu_option[page] == 4)
					audio_play_sound(MENU_SELECT_SOUND, 1, false);
					
				if (menu_option[page] != 4)
				{
					 inputting = !inputting;
					 audio_play_sound(MENU_CLICK_SOUND, 1, false);
				}
			}
		}
		
		if (draw_redefined_inputs)
		{
			ds_grid[# 3, 0] = DEFAULT_INPUT_GP_UP;
			ds_grid[# 3, 1] = DEFAULT_INPUT_GP_LEFT;
			ds_grid[# 3, 2] = DEFAULT_INPUT_GP_DOWN;
			ds_grid[# 3, 3] = DEFAULT_INPUT_GP_RIGHT;
			variable_global_set(ds_grid[# 2, 0], DEFAULT_INPUT_GP_UP);
			variable_global_set(ds_grid[# 2, 1], DEFAULT_INPUT_GP_LEFT);
			variable_global_set(ds_grid[# 2, 2], DEFAULT_INPUT_GP_DOWN);
			variable_global_set(ds_grid[# 2, 3], DEFAULT_INPUT_GP_RIGHT);
			draw_redefined_inputs = false;
		}
	break;
	
	case 4:
		handle_menu_horizontal_selection();
	break;
	
	default:
		if (change_option_v != 0 && inputting)
			inputting = false;
		
		if ((vk_rl_p != 0 || gp_rl_p != 0 || axis_lh != 0) && !inputting)
			inputting = true;
}

if (inputting)
{
	switch(ds_grid[# 1, menu_option[page]])
	{
		case menu_element_type.slider:
			if (vk_rl_p != 0 || gp_rl_p != 0 || change_option_h_value != 0)
			{
				ds_grid[# 3, menu_option[page]] += vk_rl_p * .1;
				ds_grid[# 3, menu_option[page]] += gp_rl_p * .1;
				ds_grid[# 3, menu_option[page]] += change_option_h_value * .1;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
				script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]], menu_option[page]);
				audio_play_sound(MENU_CLICK_SOUND, 1, false);
			}
		break;
		
		case menu_element_type.toggle:
			if (vk_rl_p != 0 || gp_rl_p != 0 || change_option_h_value != 0)
			{
				ds_grid[# 3, menu_option[page]] += vk_rl_p;
				ds_grid[# 3, menu_option[page]] += gp_rl_p;
				ds_grid[# 3, menu_option[page]] += change_option_h_value;
				if (ds_grid[# 3, menu_option[page]] > array_length_1d(ds_grid[# 4, menu_option[page]]) - 1)
					ds_grid[# 3, menu_option[page]] = 0;
				
				if (ds_grid[# 3, menu_option[page]] < 0)
					ds_grid[# 3, menu_option[page]] = array_length_1d(ds_grid[# 4, menu_option[page]]) - 1;
				
				if (inputting)
					script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
				
				audio_play_sound(MENU_CLICK_SOUND, 1, false);
			}
		break;
		
		case menu_element_type.vk_input:
			var last_key_pressed = keyboard_lastkey;
			
			switch (last_key_pressed)
			{
				case ord("0"):
				case ord("1"):
				case ord("2"):
				case ord("3"):
				case ord("4"):
				case ord("5"):
				case ord("6"):
				case ord("7"):
				case ord("8"):
				case ord("9"):
				case ord("Q"):
				case ord("W"):
				case ord("E"):
				case ord("R"):
				case ord("T"):
				case ord("Y"):
				case ord("U"):
				case ord("I"):
				case ord("O"):
				case ord("P"):
				case ord("A"):
				case ord("S"):
				case ord("D"):
				case ord("F"):
				case ord("G"):
				case ord("H"):
				case ord("J"):
				case ord("K"):
				case ord("L"):
				case ord("Z"):
				case ord("X"):
				case ord("C"):
				case ord("V"):
				case ord("B"):
				case ord("N"):
				case ord("M"):
				case vk_left:
				case vk_right:
				case vk_up:
				case vk_down:
				case vk_escape:
				case vk_space:
				case vk_shift:
				case vk_lcontrol:
				case vk_rcontrol:
				case vk_lalt:
				case vk_ralt:
				case vk_backspace:
				case vk_tab:
				case vk_home:
				case vk_end:
				case vk_delete:
				case vk_insert:
				case vk_pageup:
				case vk_pagedown:
				case vk_pause:
				case vk_f1:
				case vk_f2:
				case vk_f3:
				case vk_f4:
				case vk_f5:
				case vk_f6:
				case vk_f7:
				case vk_f8:
				case vk_f9:
				case vk_f10:
				case vk_f11:
				case vk_f12:
				case vk_numpad0:
				case vk_numpad1:
				case vk_numpad2:
				case vk_numpad3:
				case vk_numpad4:
				case vk_numpad5:
				case vk_numpad6:
				case vk_numpad7:
				case vk_numpad8:
				case vk_numpad9:
					key_is_known = true;
				break;
				
				default:
					key_is_known = false;
			}
			if (key_is_known && last_key_pressed != global.input_vk_select && last_key_pressed != global.input_vk_right && last_key_pressed != global.input_vk_left && last_key_pressed != global.input_vk_down && last_key_pressed != global.input_vk_up && last_key_pressed != global.input_vk_pause)
			{
				ds_grid[# 3, menu_option[page]] = last_key_pressed;
				variable_global_set(ds_grid[# 2, menu_option[page]], last_key_pressed);
				inputting = false;
				audio_play_sound(MENU_CLICK_SOUND, 1, false);
			}
		break;
		
		case menu_element_type.gp_input:
			var last_button_pressed = -1;
			
			if (gamepad_button_check_pressed(global.device, gp_face1))
				last_button_pressed = gp_face1;
			
			if (gamepad_button_check_pressed(global.device, gp_face2))
				last_button_pressed = gp_face2;
			
			if (gamepad_button_check_pressed(global.device, gp_face3))
				last_button_pressed = gp_face3;
			
			if (gamepad_button_check_pressed(global.device, gp_face4))
				last_button_pressed = gp_face4;
			
			if (gamepad_button_check_pressed(global.device, gp_shoulderl))
				last_button_pressed = gp_shoulderl;
			
			if (gamepad_button_check_pressed(global.device, gp_shoulderlb))
				last_button_pressed = gp_shoulderlb;
			
			if (gamepad_button_check_pressed(global.device, gp_shoulderr))
				last_button_pressed = gp_shoulderr;
			
			if (gamepad_button_check_pressed(global.device, gp_shoulderrb))
				last_button_pressed = gp_shoulderrb;
			
			if (gamepad_button_check_pressed(global.device, gp_select))
				last_button_pressed = gp_select;
			
			if (gamepad_button_check_pressed(global.device, gp_start))
				last_button_pressed = gp_start;
			
			if (gamepad_button_check_pressed(global.device, gp_stickl))
				last_button_pressed = gp_stickl;
			
			if (gamepad_button_check_pressed(global.device, gp_stickr))
				last_button_pressed = gp_stickr;
			
			if (gamepad_button_check_pressed(global.device, gp_padu))
				last_button_pressed = gp_padu;
			
			if (gamepad_button_check_pressed(global.device, gp_padd))
				last_button_pressed = gp_padd;
			
			if (gamepad_button_check_pressed(global.device, gp_padl))
				last_button_pressed = gp_padl;
			
			if (gamepad_button_check_pressed(global.device, gp_padr))
				last_button_pressed = gp_padr;
			
			switch (last_button_pressed)
			{
				case gp_face1:
				case gp_face2:
				case gp_face3:
				case gp_face4:
				case gp_shoulderl:
				case gp_shoulderlb:
				case gp_shoulderr:
				case gp_shoulderrb:
				case gp_select:
				case gp_start:
				case gp_stickl:
				case gp_stickr:
				case gp_padu:
				case gp_padd:
				case gp_padl:
				case gp_padr:
					button_is_known = true;
				break;
				
				default:
					button_is_known = false;
			}
			
			if (button_is_known && last_button_pressed != global.input_gp_right && last_button_pressed != global.input_gp_left && last_button_pressed != global.input_gp_down && last_button_pressed != global.input_gp_up && last_button_pressed != global.input_gp_select && last_button_pressed != global.input_gp_pause && last_button_pressed != global.input_gp_back)
			{
				ds_grid[# 3, menu_option[page]] = last_button_pressed;
				variable_global_set(ds_grid[# 2, menu_option[page]], last_button_pressed);
				inputting = false;
				audio_play_sound(MENU_CLICK_SOUND, 1, false);
			}
		break;
	}
}
else
{
	if (change_option_v != 0 || change_option_h != 0)
	{
		switch (menu_pages_list[page])
		{
			case 4:
				menu_option[page] += change_option_h;
				
				if (menu_option[page] > ds_height - 1)
					menu_option[page] = 0;
				
				if (menu_option[page] < 0)
					menu_option[page] = ds_height - 1;
				
				if (change_option_h != 0)
					audio_play_sound(MENU_CHANGE_OPTION_SOUND, 1, false);
			break;
		
			default:
				menu_option[page] += change_option_v;
				
				if (menu_option[page] > ds_height - 1)
					menu_option[page] = 0;
				
				if (menu_option[page] < 0)
					menu_option[page] = ds_height - 1;
				
				if (change_option_v != 0)
					audio_play_sound(MENU_CHANGE_OPTION_SOUND, 1, false);
		}
	}
}

if (vk_select_p || gp_select_p)
{
	switch (ds_grid[# 1, menu_option[page]])
	{
		case menu_element_type.script_runner:
			script_execute(ds_grid[# 2, menu_option[page]]);
			
			if (menu_pages_list[page] != 2 && menu_pages_list[page] != 3)
				audio_play_sound(MENU_SELECT_SOUND, 1, false);
		break;
		
		case menu_element_type.page_transfer:
			page = ds_grid[# 2, menu_option[page]];
			menu_option[page] = 0;
			
			if (inputting)
				inputting = false;
			
			audio_play_sound(MENU_SELECT_SOUND, 1, false);
		break;
	}
}

var vk_gp_pause_menu_p = keyboard_check_pressed(global.input_vk_pause)
	|| gamepad_button_check_pressed(global.device, global.input_gp_back);

if (vk_gp_pause_menu_p)
{
	switch (menu_pages_list[page])
	{
		case 0: break;
		
		case 2:
		case 3:
			if (inputting)
				inputting = false;
			
			if (!inputting)
				page = ds_grid[# 2, ds_height - 1];
			
			audio_play_sound(MENU_CHANGE_OPTION_SOUND, 1, false);
		break;
		
		default:
			page = ds_grid[# 2, ds_height - 1];
			audio_play_sound(MENU_CHANGE_OPTION_SOUND, 1, false);
	}
}