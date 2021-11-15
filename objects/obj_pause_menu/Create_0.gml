inputting				= false;
key_is_known			= false;
button_is_known			= false;
controller				= false;
reset_lh				= true;
reset_lv				= true;
draw_redefined_inputs	= false;

icon_sprite				= spr_menu_feedback_icon;
icon_sprite_index		= 0;

_snd_change_option		= snd_menu_change_option;
_snd_click				= snd_menu_click;
_snd_select				= snd_menu_select;

enum menu_page{
	main,
	options,
	keyboard,
	gamepad,
	_exit_game,
	height
}

enum menu_element_type{
	script_runner,
	page_transfer,
	slider,
	toggle,
	vk_input,
	gp_input
}

ds_main_menu = create_menu_page(
	["Continue",		menu_element_type.script_runner,	resume_game],
	["Options",			menu_element_type.page_transfer,	menu_page.options],
	["Quit",			menu_element_type.page_transfer,	menu_page._exit_game]
);

ds_options_menu = create_menu_page(
	["Volume:",			menu_element_type.slider,			change_volume,			1,	[0, 1]],
	["Full Screen:",	menu_element_type.toggle,			change_window_mode,		1,	["On", "Off"]],
	["Keyboard",		menu_element_type.page_transfer,	menu_page.keyboard],
	["Gamepad",			menu_element_type.page_transfer,	menu_page.gamepad],
	["Back",			menu_element_type.page_transfer,	menu_page.main]
);

ds_vk_inputs_menu = create_menu_page(
	["Up:",				menu_element_type.vk_input,			"input_vk_up",			ord("W")],
	["Left:",			menu_element_type.vk_input,			"input_vk_left",		ord("A")],
	["Down:",			menu_element_type.vk_input,			"input_vk_down",		ord("S")],
	["Right:",			menu_element_type.vk_input,			"input_vk_right",		ord("D")],
	["Reset",			menu_element_type.script_runner,	reset_inputs],
	["Back",			menu_element_type.page_transfer,	menu_page.options]
);

ds_gp_inputs_menu = create_menu_page(
	["Up:",				menu_element_type.gp_input,			"input_gp_up",			gp_padu],
	["Left:",			menu_element_type.gp_input,			"input_gp_left",		gp_padl],
	["Down:",			menu_element_type.gp_input,			"input_gp_down",		gp_padd],
	["Right:",			menu_element_type.gp_input,			"input_gp_right",		gp_padr],
	["Reset",			menu_element_type.script_runner,	reset_inputs],
	["Back",			menu_element_type.page_transfer,	menu_page.options]
);

ds_exit_menu = create_menu_page(
	["Yes",				menu_element_type.script_runner,	exit_game],
	["No",				menu_element_type.page_transfer,	menu_page.main]
);

page = 0;
menu_pages_list = [ds_main_menu, ds_options_menu, ds_vk_inputs_menu, ds_gp_inputs_menu, ds_exit_menu];

var _i = 0, _array_length_value = array_length_1d(menu_pages_list);
repeat(_array_length_value){
	menu_option[_i] = 0;
	_i++;
}