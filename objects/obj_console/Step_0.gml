if (!global.console_enabled)
{
	exit;
}

// erasing the command line with backspace
if (keyboard_check_pressed(vk_backspace) && string_length(current_line) > text_def_length)
{
	if (erase >= 0)
	{
		current_line = string_copy(current_line, 1, string_length(current_line) - 1);
		erase = 0;
	}
	else
	{
		erase++;
	}
}

// commnad parsing
var command = "";
var arg;
arg[0] = "";
var arg_count = 0;

// executing command
if (keyboard_check_released(vk_enter) && string_length(current_line) > text_def_length)
{
	current_line = current_line + " ";
	var word = "";
	
	for (var i = text_def_length; i < string_length(current_line); i++)
	{
		var next_char = string_char_at(current_line, i+1);
		
		if (next_char != " ")
		{
			word += next_char;
		}
		else
		{
			if (command == "")
			{
				command = asset_get_index(word);
				if (script_exists(command))
				{
					command = word;
					word = "";
					continue;
				}
				else
				{
					// command was not recognized
					log(current_line);
					log("unknown command");
					command = "";
					word = "";
					break;
				}
			}
			else
			{
				// putting arguments in the array
				arg[arg_count] = word;
				arg_count++;
				word = "";
			}
		}
	}
	
	// execute
	if (script_exists(asset_get_index(command)))
	{
		log(current_line);
		script_execute_ext(asset_get_index(command), arg);
	}
}

// conflict keys
if (keyboard_lastkey != -1)
{
	switch (keyboard_lastkey)
	{
		case vk_control:
		case vk_lcontrol:
		case vk_rcontrol:
		case vk_shift:
		case vk_enter:
		case vk_lshift:
		case vk_rshift:
		case vk_backspace:
		case vk_escape:
		case vk_alt:
		case vk_lalt:
		case vk_ralt:
		case vk_tab:
		case vk_delete:
		case vk_home:
		case vk_pageup:
		case vk_pagedown:
		case vk_end:
		case vk_insert:
		case vk_up:
		case vk_down:
		case vk_left:
		case vk_right:
		case vk_pause:
		case vk_printscreen:
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
		{
			keyboard_lastkey = -1;
			keyboard_lastchar = -1;
			exit;
		}
		break;
	}
	
	current_line += keyboard_lastchar;
	keyboard_lastkey = -1;
}