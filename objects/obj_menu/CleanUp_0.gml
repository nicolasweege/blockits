var _i = 0, _array_length_value = array_length_1d(menu_pages_list);
repeat(_array_length_value){
	ds_grid_destroy(menu_pages_list[_i]);
	_i++;
}