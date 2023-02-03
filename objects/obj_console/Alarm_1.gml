// cursor blink
if (!is_typing)
{
	if (cursor == original_cursor)
	{
		cursor = " ";
	}
	else
	{
		cursor = original_cursor;
	}
}

alarm_set(1, cursor_delay);