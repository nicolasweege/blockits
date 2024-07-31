if (!pair_instance)
{
	// no pair instance highlighting
	draw_set_color(c_red);
	draw_self();
	draw_set_color(c_white);
    exit;
}

draw_set_color(c_fuchsia);

draw_arrow(bbox_left + center_xpos, bbox_top + center_ypos, 
           pair_instance.bbox_right - 1, pair_instance.bbox_bottom - 1, 
           3);
          
draw_set_color(c_white);

draw_self();