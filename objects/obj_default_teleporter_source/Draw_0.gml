if (!pair_instance)
{
	// no pair instance highlighting
	draw_set_color(c_red);
	draw_self();
	draw_set_color(c_white);
    exit;
}

draw_self();

// draw_line((bbox_left - 1), (bbox_top - 1), pair_instance.bbox_left - 1, pair_instance.bbox_top - 1);
draw_arrow((bbox_left - 1), (bbox_top - 1), pair_instance.bbox_left - 1, pair_instance.bbox_top - 1, 2);