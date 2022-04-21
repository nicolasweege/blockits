if (!global.pause)
	exit;

step_ds_grid = menu_pages_list[page];
var ds_height = ds_grid_height(step_ds_grid);

update_menu_inputs();

change_option_v = 0;
change_option_h = 0;
change_option_h_value = 0;

handle_menu_horizontal_selection();
handle_menu_vertical_selection();

switch (menu_pages_list[page])
{
	case 2:
		if (vk_select_p || gp_select_p)
			handle_menu_selection_sounds();
		
		if (draw_redefined_inputs)
			reset_menu_vk_inputs();
	break;
	
	case 3:
		if (vk_select_p || gp_select_p)
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
				
			if (menu_option[page] > ds_height - 1)
				menu_option[page] = 0;
			
			if (menu_option[page] < 0)
				menu_option[page] = ds_height - 1;
				
			if (change_option_h != 0)
				audio_play_sound(MENU_CHANGE_OPTION_SOUND, 1, false);
			
			return;
		}
	
		menu_option[page] += change_option_v;
				
		if (menu_option[page] > ds_height - 1)
			menu_option[page] = 0;
				
		if (menu_option[page] < 0)
			menu_option[page] = ds_height - 1;
				
		if (change_option_v != 0)
			audio_play_sound(MENU_CHANGE_OPTION_SOUND, 1, false);
	}
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

if (pause_p)
{
	switch (menu_pages_list[page])
	{
		case 0: break;
		case 2:
		case 3:
			if (inputting)
				inputting = false;
			
			if (!inputting)
				page = step_ds_grid[# 2, ds_height - 1];
			
			audio_play_sound(MENU_CHANGE_OPTION_SOUND, 1, false);
		break;
		
		default:
			page = step_ds_grid[# 2, ds_height - 1];
			audio_play_sound(MENU_CHANGE_OPTION_SOUND, 1, false);
	}
}