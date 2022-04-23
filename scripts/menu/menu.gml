function create_menu_page()
{
	var arg;
	var ds_grid_id = ds_grid_create(5, argument_count);
	
	for (var i = 0; i < argument_count; i++)
	{
		arg[i] = argument[i];
		var array = arg[i];
		var array_length_value = array_length_1d(array);
		
		for (var xx = 0; xx < array_length_value; xx++)
			ds_grid_id[# xx, i] = array[xx];
	}
	
	return ds_grid_id;
}

function change_window_mode(value)
{
	switch(value)
	{
		case 0:
			window_set_fullscreen(true);
		break;
		
		case 1:
			window_set_fullscreen(false);
		break;
	}
}

function change_volume(value, sound_type = 0)
{
	switch(sound_type)
	{
		case 0:
			audio_master_gain(value);
		break;
	}
}

function reset_inputs()
{
	var transition = instance_create_depth(0, 0, -9999, obj_transition);
	transition.c = c_black;
}

function exit_game()
{
	game_end();
}

function resume_game()
{
	global.pause = false;
}

function update_menu_inputs()
{
	vk_select_p = keyboard_check_pressed(global.input_vk_select);
	
	gp_select_p = gamepad_button_check_pressed(global.device, global.input_gp_select);
	
	axis_lh = gamepad_axis_value(global.device, global.input_gp_lh_analog);
	
	axis_lv = gamepad_axis_value(global.device, global.input_gp_lv_analog);
	
	vk_rl_p = keyboard_check_pressed(global.input_vk_right)
				- keyboard_check_pressed(global.input_vk_left);
					
	gp_rl_p = gamepad_button_check_pressed(global.device, global.input_gp_right)
				- gamepad_button_check_pressed(global.device, global.input_gp_left);
					
	vk_du_p = keyboard_check_pressed(global.input_vk_down)
				- keyboard_check_pressed(global.input_vk_up);
					
	gp_du_p = gamepad_button_check_pressed(global.device, global.input_gp_down)
				- gamepad_button_check_pressed(global.device, global.input_gp_up);
				
	_vk_rl_p = global.input_vk_right != vk_right
				|| global.input_vk_left != vk_left ? keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left) : 0;
				
	_vk_du_p = global.input_vk_down != vk_down
				|| global.input_vk_up != vk_up ? keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up) : 0;
	
	pause_p = keyboard_check_pressed(global.input_vk_pause);
	
	back_with_select_p = gamepad_button_check_pressed(global.device, global.input_gp_back);
	
	back_with_east_p = gamepad_button_check_pressed(global.device, gp_face2);
}

function handle_menu_horizontal_selection()
{	
	if (vk_rl_p != 0)
		change_option_h = vk_rl_p;
	
	if (_vk_rl_p != 0)
		change_option_h = _vk_rl_p;
	
	if (gp_rl_p != 0)
		change_option_h = gp_rl_p;

	if (axis_lh > 0 && reset_lh)
	{
		change_option_h = 1;
		change_option_h_value = 1;
		reset_lh = false;
	}

	if (axis_lh < 0 && reset_lh)
	{
		change_option_h = -1;
		change_option_h_value = -1;
		reset_lh = false;
	}

	if (axis_lh == 0)
		reset_lh = true;
}

function handle_menu_vertical_selection()
{	
	if (vk_du_p != 0)
		change_option_v = vk_du_p;
		
	if (_vk_du_p != 0)
		change_option_v = _vk_du_p;
		
	if (gp_du_p != 0)
		change_option_v = gp_du_p;

	if (axis_lv > 0 && reset_lv)
	{
		change_option_v = 1;
		reset_lv = false;
	}

	if (axis_lv < 0 && reset_lv)
	{ 
		change_option_v = -1;
		reset_lv = false;
	}

	if (axis_lv == 0)
		reset_lv = true;
}

function reset_menu_vk_inputs()
{
	step_ds_grid[# 3, 0] = DEFAULT_INPUT_VK_UP;
	step_ds_grid[# 3, 1] = DEFAULT_INPUT_VK_LEFT;
	step_ds_grid[# 3, 2] = DEFAULT_INPUT_VK_DOWN;
	step_ds_grid[# 3, 3] = DEFAULT_INPUT_VK_RIGHT;
	variable_global_set(step_ds_grid[# 2, 0], DEFAULT_INPUT_VK_UP);
	variable_global_set(step_ds_grid[# 2, 1], DEFAULT_INPUT_VK_LEFT);
	variable_global_set(step_ds_grid[# 2, 2], DEFAULT_INPUT_VK_DOWN);
	variable_global_set(step_ds_grid[# 2, 3], DEFAULT_INPUT_VK_RIGHT);
	draw_redefined_inputs = false;
}

function reset_menu_gp_inputs()
{
	step_ds_grid[# 3, 0] = DEFAULT_INPUT_GP_UP;
	step_ds_grid[# 3, 1] = DEFAULT_INPUT_GP_LEFT;
	step_ds_grid[# 3, 2] = DEFAULT_INPUT_GP_DOWN;
	step_ds_grid[# 3, 3] = DEFAULT_INPUT_GP_RIGHT;
	variable_global_set(step_ds_grid[# 2, 0], DEFAULT_INPUT_GP_UP);
	variable_global_set(step_ds_grid[# 2, 1], DEFAULT_INPUT_GP_LEFT);
	variable_global_set(step_ds_grid[# 2, 2], DEFAULT_INPUT_GP_DOWN);
	variable_global_set(step_ds_grid[# 2, 3], DEFAULT_INPUT_GP_RIGHT);
	draw_redefined_inputs = false;
}

function handle_menu_selection_sounds()
{
	if (menu_option[page] == 5)
		return;
			
	if (menu_option[page] == 4)
		audio_play_sound(MENU_SELECT_SOUND, 1, false);
				
	if (menu_option[page] != 4)
	{
		inputting = !inputting;
		audio_play_sound(MENU_CLICK_SOUND, 1, false);
	}	
}

function handle_menu_step_slider()
{
	if (vk_rl_p != 0 || _vk_rl_p || gp_rl_p != 0 || change_option_h_value != 0)
	{
		step_ds_grid[# 3, menu_option[page]] += vk_rl_p * .1;
		step_ds_grid[# 3, menu_option[page]] += _vk_rl_p * .1;
		step_ds_grid[# 3, menu_option[page]] += gp_rl_p * .1;
		step_ds_grid[# 3, menu_option[page]] += change_option_h_value * .1;
		step_ds_grid[# 3, menu_option[page]] = clamp(step_ds_grid[# 3, menu_option[page]], 0, 1);
		
		script_execute(step_ds_grid[# 2, menu_option[page]], step_ds_grid[# 3, menu_option[page]], menu_option[page]);
		
		audio_play_sound(MENU_CLICK_SOUND, 1, false);
	}	
}

function handle_menu_step_toggle()
{
	if (vk_rl_p != 0 || _vk_rl_p || gp_rl_p != 0 || change_option_h_value != 0)
	{
		step_ds_grid[# 3, menu_option[page]] += vk_rl_p;
		step_ds_grid[# 3, menu_option[page]] += _vk_rl_p;
		step_ds_grid[# 3, menu_option[page]] += gp_rl_p;
		step_ds_grid[# 3, menu_option[page]] += change_option_h_value;
		
		if (step_ds_grid[# 3, menu_option[page]] > array_length_1d(step_ds_grid[# 4, menu_option[page]]) - 1)
			step_ds_grid[# 3, menu_option[page]] = 0;
		
		if (step_ds_grid[# 3, menu_option[page]] < 0)
			step_ds_grid[# 3, menu_option[page]] = array_length_1d(step_ds_grid[# 4, menu_option[page]]) - 1;
		
		if (inputting)
			script_execute(step_ds_grid[# 2, menu_option[page]], step_ds_grid[# 3, menu_option[page]]);
		
		audio_play_sound(MENU_CLICK_SOUND, 1, false);
	}	
}

function handle_menu_step_vk_input()
{
	last_input = -1;
			
	if (keyboard_check_pressed(vk_anykey))
		last_input = keyboard_lastkey;
			
	switch (last_input)
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
	
	if (key_is_known
		&& last_input != global.input_vk_select
		&& last_input != global.input_vk_pause)
		handle_menu_inputs_swap();
}

function handle_menu_step_gp_input()
{
	last_input = -1;
			
	if (gamepad_button_check_pressed(global.device, gp_face1))
		last_input = gp_face1;
	
	if (gamepad_button_check_pressed(global.device, gp_face2))
		last_input = gp_face2;
			
	if (gamepad_button_check_pressed(global.device, gp_face3))
		last_input = gp_face3;
		
	if (gamepad_button_check_pressed(global.device, gp_face4))
		last_input = gp_face4;
			
	if (gamepad_button_check_pressed(global.device, gp_shoulderl))
		last_input = gp_shoulderl;
			
	if (gamepad_button_check_pressed(global.device, gp_shoulderlb))
		last_input = gp_shoulderlb;
	
	if (gamepad_button_check_pressed(global.device, gp_shoulderr))
		last_input = gp_shoulderr;
	
	if (gamepad_button_check_pressed(global.device, gp_shoulderrb))
		last_input = gp_shoulderrb;
	
	if (gamepad_button_check_pressed(global.device, gp_select))
		last_input = gp_select;
	
	if (gamepad_button_check_pressed(global.device, gp_start))
		last_input = gp_start;
			
	if (gamepad_button_check_pressed(global.device, gp_stickl))
		last_input = gp_stickl;
	
	if (gamepad_button_check_pressed(global.device, gp_stickr))
		last_input = gp_stickr;
			
	if (gamepad_button_check_pressed(global.device, gp_padu))
		last_input = gp_padu;
			
	if (gamepad_button_check_pressed(global.device, gp_padd))
		last_input = gp_padd;
			
	if (gamepad_button_check_pressed(global.device, gp_padl))
		last_input = gp_padl;
			
	if (gamepad_button_check_pressed(global.device, gp_padr))
		last_input = gp_padr;
			
	switch (last_input)
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
	
	if (button_is_known
		&& last_input != global.input_gp_select
		&& last_input != global.input_gp_pause
		&& last_input != global.input_gp_back)
		handle_menu_inputs_swap();
}

function handle_menu_inputs_swap()
{
	for (var i = 0; i < ds_grid_height(step_ds_grid); i++)
	{
		if (step_ds_grid[# 3, i] == last_input)
		{
			variable_global_set(step_ds_grid[# 2, i], step_ds_grid[# 3, menu_option[page]]);
			step_ds_grid[# 3, i] = step_ds_grid[# 3, menu_option[page]];
		}
	}
	
	variable_global_set(step_ds_grid[# 2, menu_option[page]], last_input);
	audio_play_sound(MENU_CLICK_SOUND, 1, false);
	step_ds_grid[# 3, menu_option[page]] = last_input;
	inputting = false;	
}

function handle_menu_selecting()
{
	switch (menu_pages_list[page])
	{
		case 2:
			if (vk_select_p || gp_select_p)
				handle_menu_selection_sounds();
		
			if (draw_redefined_inputs)
				reset_menu_vk_inputs();
		break;
	
		case 3:
			if (vk_select_p || gp_select_p || gamepad_button_check_pressed(global.device, global.input_gp_pause))
				handle_menu_selection_sounds();
		
			if (draw_redefined_inputs)
				reset_menu_gp_inputs();
		break;
	
		case 4:
			handle_menu_horizontal_selection();
		break;
	
		default:
			if (change_option_v != 0 && inputting)
				inputting = false;
		
			if ((vk_rl_p != 0 || _vk_rl_p || gp_rl_p != 0 || axis_lh != 0) && !inputting)
				inputting = true;
	}
	
	if (vk_select_p || gp_select_p)
	{	
		if (step_ds_grid[# 1, menu_option[page]] == menu_element_type.script_runner)
		{
			script_execute(step_ds_grid[# 2, menu_option[page]]);
		
			if (menu_pages_list[page] != 2 && menu_pages_list[page] != 3)
				audio_play_sound(MENU_SELECT_SOUND, 1, false);
		}
	
		if (step_ds_grid[# 1, menu_option[page]] == menu_element_type.page_transfer)
		{
			page = step_ds_grid[# 2, menu_option[page]];
			menu_option[page] = 0;
			
			if (inputting)
				inputting = false;
			
			audio_play_sound(MENU_SELECT_SOUND, 1, false);
		}
	}
}

function handle_menu_inputting()
{
	if (inputting)
	{
		switch (step_ds_grid[# 1, menu_option[page]])
		{
			case menu_element_type.slider:
				handle_menu_step_slider();
			break;
		
			case menu_element_type.toggle:
				handle_menu_step_toggle();
			break;
		
			case menu_element_type.vk_input:
				handle_menu_step_vk_input();
			break;
		
			case menu_element_type.gp_input:
				handle_menu_step_gp_input();
			break;
		}
	}

	if (!inputting)
	{
		if (change_option_v != 0 || change_option_h != 0)
		{
			if (menu_pages_list[page] == 4)
			{
				menu_option[page] += change_option_h;
				
				if (menu_option[page] > step_ds_height - 1)
					menu_option[page] = 0;
			
				if (menu_option[page] < 0)
					menu_option[page] = step_ds_height - 1;
				
				if (change_option_h != 0)
					audio_play_sound(MENU_CHANGE_OPTION_SOUND, 1, false);
			
				return;
			}
	
			menu_option[page] += change_option_v;
				
			if (menu_option[page] > step_ds_height - 1)
				menu_option[page] = 0;
				
			if (menu_option[page] < 0)
				menu_option[page] = step_ds_height - 1;
				
			if (change_option_v != 0)
				audio_play_sound(MENU_CHANGE_OPTION_SOUND, 1, false);
		}
	}	
}

function handle_menu_backing()
{
	if (pause_p)
	{
		switch (menu_pages_list[page])
		{
			case 0: break;
		
			case 2:
			case 3:
				if (inputting)
				{
					inputting = false;
				}
				else
				{
					page = step_ds_grid[# 2, step_ds_height - 1];
				}
			
				audio_play_sound(MENU_CHANGE_OPTION_SOUND, 1, false);
			break;
		
			default:
				page = step_ds_grid[# 2, step_ds_height - 1];
				audio_play_sound(MENU_CHANGE_OPTION_SOUND, 1, false);
		}
	}

	if (back_with_select_p)
	{
		switch (menu_pages_list[page])
		{
			case 0:
				global.pause = false;
			break;
		
			case 2:
			case 3:
				if (inputting)
				{
					inputting = false;
				}
				else
				{
					page = step_ds_grid[# 2, step_ds_height - 1];
				}
			
				audio_play_sound(MENU_CHANGE_OPTION_SOUND, 1, false);
			break;
		
			default:
				page = step_ds_grid[# 2, step_ds_height - 1];
				audio_play_sound(MENU_CHANGE_OPTION_SOUND, 1, false);
		}
	}

	if (back_with_east_p)
	{
		switch (menu_pages_list[page])
		{
			case 0:
				global.pause = false;
			break;
		
			case 2:
				if (inputting)
				{
					inputting = false;
				}
				else
				{
					page = step_ds_grid[# 2, step_ds_height - 1];
				}
			
				audio_play_sound(MENU_CHANGE_OPTION_SOUND, 1, false);
			break;
		
			case 3:		
				if (inputting)
					alarm[0] = 1;
			
				if (!inputting && can_back)
				{
					page = step_ds_grid[# 2, step_ds_height - 1];
					audio_play_sound(MENU_CHANGE_OPTION_SOUND, 1, false);
					can_back = false;
				}
			break;
		
			default:
				page = step_ds_grid[# 2, step_ds_height - 1];
				audio_play_sound(MENU_CHANGE_OPTION_SOUND, 1, false);
		}
	}	
}
