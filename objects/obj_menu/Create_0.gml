global.pause = false;
global.view_width = camera_get_view_width(global.camera);
global.view_height = camera_get_view_height(global.camera);

global.key_enter =	vk_enter;
global.key_right =	vk_right;
global.key_left =	vk_left;
global.key_down =	vk_down;
global.key_up =		vk_up;

display_set_gui_size(global.view_width, global.view_height);

enum menu_page{
	main,
	settings,
	audio,
	graphics,
	_exit_game,
	height
}

enum menu_element_type{
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle
}

ds_main_menu = create_menu_page(
		["Continue",		menu_element_type.script_runner,	resume_game],
		["Options",			menu_element_type.page_transfer,	menu_page.settings],
		["Quit Game",		menu_element_type.page_transfer,	menu_page._exit_game]
);

ds_options_menu = create_menu_page(
		["Audio",			menu_element_type.page_transfer,	menu_page.audio],
		["Video",			menu_element_type.page_transfer,	menu_page.graphics],
		["Back",			menu_element_type.page_transfer,	menu_page.main]
);

ds_audio_menu = create_menu_page(
		["Master Volume",	menu_element_type.slider,			change_volume,			1,		[0, 1]],
		["Sound Volume",	menu_element_type.slider,			change_volume,			1,		[0, 1]],
		["Music Volume",	menu_element_type.slider,			change_volume,			1,		[0, 1]],
		["Back",			menu_element_type.page_transfer,	menu_page.settings]
);

ds_video_menu = create_menu_page(
		["Resolution",		menu_element_type.shift,			change_resolution,		3,		["720 x 400", "1280 x 720", "1600 x 900", "1920 x 1080"]],
		["Full Screen",		menu_element_type.toggle,			change_window_mode,		1,		["On", "Windowed"]],
		["Back",			menu_element_type.page_transfer,	menu_page.settings]
);

ds_exit_menu = create_menu_page(
		["Yes",				menu_element_type.script_runner,	exit_game],
		["No",				menu_element_type.page_transfer,	menu_page.main]
);

page = 0;
menu_pages_list = [ds_main_menu, ds_options_menu, ds_audio_menu, ds_video_menu, ds_exit_menu];

var _i = 0, _array_length_value = array_length_1d(menu_pages_list);
repeat(_array_length_value){
	menu_option[_i] = 0;
	_i++;
}

inputting = false;