mouse_over = false;

if (point_in_rectangle(mouse_x, mouse_y, x, y, (x + width), (y + height)))
{
	mouse_over = true;
	if (mousex_prev != mouse_x || mousey_prev != mouse_y)
	{
		var mouse_hover_line = ((mouse_y - y) div height_line);
		if !(menu_desc == -1)
		{
			mouse_hover_line -= 1
		}
		if (mouse_hover_line < 0)
		{
			mouse_hover_line = 0;	
		}
		if (mouse_hover_line > options_count - 1)
		{
			mouse_hover_line = options_count - 1;	
		}
		
		hover = mouse_hover_line;
	}
}

hover += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

if (hover > options_count - 1)
{
	hover = 0;	
}
if (hover < 0)
{
	hover = options_count - 1;	
}

if ((mouse_check_button_pressed(mb_left) && mouse_over) 
     || keyboard_check_pressed(vk_enter))
	 {
		 if (array_length(menu_options[hover]) == 2)
		 {
			 var func = menu_options[hover][1];
			 if (func != -1)
			 {
				 func();
			 }
			 instance_destroy();
		 }
	 }

mousex_prev = mouse_x;
mousey_prev = mouse_y;