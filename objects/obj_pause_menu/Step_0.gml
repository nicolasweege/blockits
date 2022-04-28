if (!global.pause)
	exit;

step_ds_grid = menu_pages_list[page];
step_ds_height = ds_grid_height(step_ds_grid);

update_menu_inputs();

change_option_v = 0;
change_option_h = 0;
change_option_h_value = 0;

handle_menu_horizontal_selection();
handle_menu_vertical_selection();
handle_menu_selecting();
handle_menu_inputting();
