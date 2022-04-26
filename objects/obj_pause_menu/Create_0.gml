inputting = false;

key_is_known = false;
button_is_known = false;

reset_lh = true;
reset_lv = true;

draw_redefined_inputs = false;

change_option_v = 0;
change_option_h = 0;
change_option_h_value = 0;

last_input = -1;

step_ds_grid = -1;
step_ds_height = -1;

icons_size = .8;
can_back = false;

enum menu_page
{
	main,
	options,
	keyboard,
	gamepad,
	_exit_game,
	height
}

enum menu_element_type
{
	script_runner,
	page_transfer,
	slider,
	toggle,
	vk_input,
	gp_input
}

ds_main_menu = create_menu_page
(
	["Continue",	menu_element_type.script_runner,	resume_game],
	["Options",		menu_element_type.page_transfer,	menu_page.options],
	["Quit",		menu_element_type.page_transfer,	menu_page._exit_game]
);

ds_options_menu = create_menu_page
(
	["Volume:",			menu_element_type.slider,			change_volume,		1,	[0, 1]],
	["Full Screen:",	menu_element_type.toggle,			change_window_mode,	1,	["On", "Off"]],
	
	["Keyboard",		menu_element_type.page_transfer,	menu_page.keyboard],
	["Gamepad",			menu_element_type.page_transfer,	menu_page.gamepad],
	
	["Back",			menu_element_type.page_transfer,	menu_page.main]
);

ds_vk_inputs_menu = create_menu_page
(
	["Up:",					menu_element_type.vk_input,	"input_vk_up",					DEFAULT_INPUT_VK_UP],
	["Left:",				menu_element_type.vk_input,	"input_vk_left",				DEFAULT_INPUT_VK_LEFT],
	["Down:",				menu_element_type.vk_input,	"input_vk_down",				DEFAULT_INPUT_VK_DOWN],
	["Right:",				menu_element_type.vk_input,	"input_vk_right",				DEFAULT_INPUT_VK_RIGHT],
	["Switch Colliders:",	menu_element_type.vk_input,	"input_vk_switch_colliders",	DEFAULT_INPUT_VK_SWITCH_COLLIDERS],
	
	["Reset",				menu_element_type.script_runner,	reset_inputs],
	
	["Back",				menu_element_type.page_transfer,	menu_page.options]
);

ds_gp_inputs_menu = create_menu_page
(
	["Up:",					menu_element_type.gp_input,	"input_gp_up",					DEFAULT_INPUT_GP_UP],
	["Left:",				menu_element_type.gp_input,	"input_gp_left",				DEFAULT_INPUT_GP_LEFT],
	["Down:",				menu_element_type.gp_input,	"input_gp_down",				DEFAULT_INPUT_GP_DOWN],
	["Right:",				menu_element_type.gp_input,	"input_gp_right",				DEFAULT_INPUT_GP_RIGHT],
	["Switch Colliders:",	menu_element_type.gp_input,	"input_gp_switch_colliders",	DEFAULT_INPUT_GP_SWITCH_COLLIDERS],
	
	["Reset",				menu_element_type.script_runner,	reset_inputs],
	
	["Back",				menu_element_type.page_transfer,	menu_page.options]
);

ds_exit_menu = create_menu_page
(
	["Yes",	menu_element_type.script_runner,	exit_game],
	["No",	menu_element_type.page_transfer,	menu_page.main]
);

page = 0;
menu_pages_list = [ds_main_menu, ds_options_menu, ds_vk_inputs_menu, ds_gp_inputs_menu, ds_exit_menu];

for (var i = 0; i < array_length_1d(menu_pages_list); i++)
	menu_option[i] = 0;
