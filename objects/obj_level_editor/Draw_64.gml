
// @TODO @Incomplete: change this to be a 'engine state' by itself?
// Instead of just using the 'show_debug_info' variable from the obj_game_controller.

if (global.debug_mode)
{
    draw_set_font(global.karmina_regular_font);
    
    default_collider_button = blockits_draw_button(global.cam_width - 100, 
                		                           0 + 50, 
                								   "default_collider", 
                	                               80, 15, 
                								   c_white, c_white, c_white);
                								   
    death_collider_button = blockits_draw_button(global.cam_width - 100, 
                		                           0 + 100, 
                								   "death_collider", 
                	                               80, 15, 
                								   c_white, c_white, c_white);
            									
    draw_set_font(-1);
}