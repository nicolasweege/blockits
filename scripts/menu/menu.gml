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

function change_volume(value, sound_type)
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
	global.menu.draw_redefined_inputs = true;
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
	
	vk_rl_p = keyboard_check_pressed(global.input_vk_right)
				- keyboard_check_pressed(global.input_vk_left);
					
	gp_rl_p = gamepad_button_check_pressed(global.device, global.input_gp_right)
				- gamepad_button_check_pressed(global.device, global.input_gp_left);
					
	vk_du_p = keyboard_check_pressed(global.input_vk_down)
				- keyboard_check_pressed(global.input_vk_up);
					
	gp_du_p = gamepad_button_check_pressed(global.device, global.input_gp_down)
				- gamepad_button_check_pressed(global.device, global.input_gp_up);
					
	axis_lh = gamepad_axis_value(global.device, global.input_gp_lh_analog);
	
	axis_lv = gamepad_axis_value(global.device, global.input_gp_lv_analog);
}

function handle_menu_horizontal_selection()
{	
	if (vk_rl_p != 0)
		change_option_h = vk_rl_p;
	
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
