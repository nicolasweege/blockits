switch (global.debug_controller.show_debug)
{
	case 1:
		draw_sprite_ext(spr_default_col_feedback, 0, 0 + sprite_get_width(spr_default_col_feedback), 0 + sprite_get_height(spr_default_col_feedback), .5, .5, 0, c_white, 1);
		draw_sprite_ext(spr_wall_col_feedback, 0, 0 + sprite_get_width(spr_wall_col_feedback), 0 + (sprite_get_height(spr_wall_col_feedback) * 2), .5, .5, 0, c_white, .3);
		draw_sprite_ext(spr_death_col_feedback, 0, 0 + sprite_get_width(spr_death_col_feedback), 0 + (sprite_get_height(spr_death_col_feedback) * 3), .5, .5, 0, c_white, .3);
	break;
	
	case 2:
		draw_sprite_ext(spr_default_col_feedback, 0, 0 + sprite_get_width(spr_default_col_feedback), 0 + sprite_get_height(spr_default_col_feedback), .5, .5, 0, c_white, .3);
		draw_sprite_ext(spr_wall_col_feedback, 0, 0 + sprite_get_width(spr_wall_col_feedback), 0 + (sprite_get_height(spr_wall_col_feedback) * 2), .5, .5, 0, c_white, 1);
		draw_sprite_ext(spr_death_col_feedback, 0, 0 + sprite_get_width(spr_death_col_feedback), 0 + (sprite_get_height(spr_death_col_feedback) * 3), .5, .5, 0, c_white, .3);
	break;
	
	case 3:
		draw_sprite_ext(spr_death_col_feedback, 0, 0 + sprite_get_width(spr_death_col_feedback), 0 + (sprite_get_height(spr_death_col_feedback) * 3), .5, .5, 0, c_white, 1);
		draw_sprite_ext(spr_default_col_feedback, 0, 0 + sprite_get_width(spr_default_col_feedback), 0 + sprite_get_height(spr_default_col_feedback), .5, .5, 0, c_white, .3);
		draw_sprite_ext(spr_wall_col_feedback, 0, 0 + sprite_get_width(spr_wall_col_feedback), 0 + (sprite_get_height(spr_wall_col_feedback) * 2), .5, .5, 0, c_white, .3);
	break;
}
