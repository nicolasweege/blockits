if (!pair_instance)
{
	// no pair instance highlighting
	draw_set_color(c_red);
	draw_self();
	draw_set_color(c_white);
    exit;
}

draw_self();

draw_set_color(c_fuchsia);

draw_line(bbox_right - 1, bbox_bottom - 1, 
          pair_instance.bbox_right - 1, 
          pair_instance.bbox_bottom - 1);
          
draw_set_color(c_white);