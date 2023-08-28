set_initial_game_stuff();

show_save_slots_page = false;

if (!global.use_main_menu)
{
	if (room == rm_main_menu)
	{
		room_goto(rm_nexus);	
	}
}