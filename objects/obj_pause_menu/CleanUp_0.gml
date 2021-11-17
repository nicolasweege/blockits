var i = 0, array_length_val = array_length_1d(menu_pages_list);
repeat(array_length_val){
	ds_grid_destroy(menu_pages_list[i]);
	i++;
}