#macro VIEW_W 320
#macro VIEW_H 180

#macro CAM_W 320
#macro CAM_H 180

#region Colors
#macro PLATFORM_COLLIDER_COLOR make_color_rgb(4, 255, 0)
#macro WALL_COLLIDER_COLOR make_color_rgb(255, 0, 238)
#endregion

#region Layers
#macro MENU_LAYER "Menu"
#macro CONTROLLERS_LAYER "Controllers"
#macro PLAYER_LAYER "Player"
#macro PLATFORM_COLLIDERS_LAYER "Platform_Colliders"
#macro WALL_COLLIDERS_LAYER "Wall_Colliders"
#macro DEFAULT_COLLIDERS_LAYER "Default_Colliders"
#endregion

#region Colliders
#macro DEFAULT_COLLIDER obj_default_collider
#macro WALL_COLLIDER obj_wall_collider
#endregion

#region Player Sounds
#macro PLAYER_LANDING_SOUND -1
#macro PLAYER_JUMP_SOUND -1
#macro PLAYER_WALL_JUMP_SOUND -1
#macro PLAYER_WALL_SLIDE_SOUND -1
#endregion

#region UI Sounds
// #macro MENU_CLICK_SOUND snd_menu_click
#macro MENU_CLICK_SOUND -1
#endregion

#region UI Sprites
#macro MENU_ICON_SPRITE spr_menu_feedback_icon
#endregion
 
#region Keyboard Default Inputs
#macro DEFAULT_INPUT_VK_MENU_RIGHT vk_right
#macro DEFAULT_INPUT_VK_MENU_LEFT vk_left
#macro DEFAULT_INPUT_VK_MENU_DOWN vk_down
#macro DEFAULT_INPUT_VK_MENU_UP vk_up
#macro DEFAULT_INPUT_VK_MENU_SELECT vk_enter

#macro DEFAULT_INPUT_VK_RIGHT ord("D")
#macro DEFAULT_INPUT_VK_LEFT ord("A")
#macro DEFAULT_INPUT_VK_JUMP ord("K")
#macro DEFAULT_INPUT_VK_SWITCH_COLLIDERS ord("J")
#macro DEFAULT_INPUT_VK_PAUSE vk_escape
#endregion

#region Gamepad Default Inputs
#macro DEFAULT_INPUT_GP_MENU_RIGHT gp_padr
#macro DEFAULT_INPUT_GP_MENU_LEFT gp_padl
#macro DEFAULT_INPUT_GP_MENU_DOWN gp_padd
#macro DEFAULT_INPUT_GP_MENU_UP gp_padu
#macro DEFAULT_INPUT_GP_MENU_SELECT gp_face1

#macro DEFAULT_INPUT_GP_RIGHT gp_padr
#macro DEFAULT_INPUT_GP_LEFT gp_padl
#macro DEFAULT_INPUT_GP_JUMP gp_face1
#macro DEFAULT_INPUT_GP_SWITCH_COLLIDERS gp_shoulderr
#macro DEFAULT_INPUT_GP_PAUSE gp_start
#macro DEFAULT_INPUT_GP_AXISLH gp_axislh
#macro DEFAULT_INPUT_GP_AXISLV gp_axislv
#endregion
