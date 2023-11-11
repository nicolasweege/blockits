draw_set_font(fnt_default);

update_menu_inputs();

/*
if (mouse_check_button_pressed(mb_left))
{
	window_set_cursor(cr_default);
	use_mouse_button_selection = true;
	menu_index = 0;
}
*/

/*
if (menu_up || menu_down)
{
	use_mouse_button_selection = false;
}

if (!use_mouse_button_selection)
{
	window_set_cursor(cr_none);
	
	if (menu_up)
	{
		audio_play_sound(snd_button_selected, 1, 0);
		menu_index -= 1;	
	}

	if (menu_down)
	{
		audio_play_sound(snd_button_selected, 1, 0);
		menu_index += 1;
	}
}
*/

if (menu_index < 1)
{
	menu_index = current_button_options;
}
if (menu_index > current_button_options)
{
	menu_index = 1;	
}

current_menu();

draw_set_font(-1);