camera_lerp = lerp(camera_lerp, current_camera_lerp, cam_stick_speed);
x = lerp(x, global.cam_target.x, camera_lerp);
y = lerp(y, (global.cam_target.y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), camera_lerp);

if (distance_to_object(obj_player) > camera_stick_range)
{	
	current_camera_lerp = 0.1;
	// current_camera_lerp = 0.4;
	cam_stick_speed = 0.0005;
	// cam_stick_speed = 0.01;
}
else
{
	current_camera_lerp = original_camera_lerp;
	cam_stick_speed = original_cam_stick_speed;
}

if (obj_player.player_state == obj_player.god_mode_state)
{
    if (global.use_instance_deactivation)
	{
		global.use_instance_deactivation = false;
		instance_activate_all();
	}
}
else
{
    if (keyboard_check_pressed(vk_f5))
    {
    	if (global.use_instance_deactivation)
    	{
    		global.use_instance_deactivation = false;
    		instance_activate_all();
    	}
    	else
    	{
    		global.use_instance_deactivation = true;
    	}
    }    
}

if (global.app_state == states.PAUSE_MENU)
{
	exit;
}


// assumindo que global.cam_target eh o obj_player.
var xx = global.cam_target.x;
var yy = (global.cam_target.y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2));

var _room_offset_mask_collision = instance_position(xx, yy, obj_camera_offset_mask);


// obtendo a nova posicao da camera
var temp_room_mask_collision = instance_position(xx, yy, obj_camera_mask);
if (temp_room_mask_collision != room_mask_collision)
{
    global.camx = (global.cam_target.x - (global.cam_width/2));
    global.camy = ((global.cam_target.y - 
    (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) - (global.cam_height/2));
    
    with (obj_player)
    {
        PLAYER_handle_level_change();
    }
}

room_mask_collision = instance_position(xx, yy, obj_camera_mask);

if (room_mask_collision)
{
	global.cam_x_min = room_mask_collision.x;
	
	global.cam_x_max = 
	((room_mask_collision.x + (global.cam_width * room_mask_collision.image_xscale)) 
	- global.cam_width);
	
	global.cam_y_min = room_mask_collision.y;
	
	global.cam_y_max = 
	((room_mask_collision.y + (global.cam_height * room_mask_collision.image_yscale)) 
	- global.cam_height);
} 
else if (obj_player.player_state == obj_player.death_state)
{
    // quando o player fora de uma camera_mask. Soh calculamos isso quando o player esta no death_state,
    // pra que a camera siga ele quando etiver voltando pra posicao do ultimo checkpoint.
    if (obj_player.player_state == obj_player.death_state)
    {
        global.cam_x_min = 0;
    	global.cam_x_max = room_width - global.cam_width;
    	
    	global.cam_y_min = 0;
    	global.cam_y_max = room_height - global.cam_height;
    }
}

if (obj_player.player_state != obj_player.god_mode_state)
{
	// calculando o offset pro qual a cemera vai olhar
	if (_room_offset_mask_collision)
	{
		camera_xoffset_to_set = _room_offset_mask_collision.camera_xoffset;
		camera_yoffset_to_set = _room_offset_mask_collision.camera_yoffset;	
	}

	// transicionando a camera pra posicao do novo level
	cam_x_min_lerp = global.cam_x_min;
	cam_x_max_lerp = global.cam_x_max;
	cam_y_min_lerp = global.cam_y_min;
	cam_y_max_lerp = global.cam_y_max;
    
    // acho que coloquei isso aqui quando implementei a funcionalidade de poder dar zoom out e zoom in no 
    // EDITOR, e provavelmente acontece algum comportamento indesejado se não fizermos essa verificacao.
    if ((camera_get_view_width(global.current_camera) != VIEW_W)
        || (camera_get_view_height(global.current_camera) != VIEW_H))
    {
        // fazendo a camera seguir o global.cam_target, seja la qual objeto for. Nesse caso soh tem 
        // como ser o "cursor" do editor.
        global.camx = lerp(global.camx, 
                           (global.cam_target.x - (camera_get_view_width(global.current_camera)/2)), 
                           camera_lerp);
        
        global.camy = lerp(global.camy, 
                           (global.cam_target.y - (camera_get_view_height(global.current_camera)/2)), 
                           camera_lerp);
    }
    else
    {
        var _player_xpos = (global.cam_target.x - (global.cam_width/2));
        var _player_ypos = ((global.cam_target.y - 
        (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) - (global.cam_height/2));
        
        if (obj_player.player_state == obj_player.death_state)
        {
            global.camx = lerp(global.camx, _player_xpos, (original_camera_lerp * 1.7));
            global.camy = lerp(global.camy,
                               _player_ypos,
                               (original_camera_lerp * 1.7));
        }
        else
        {
            // camera_swap_lerp = original_camera_swap_lerp;
            global.camx = lerp(global.camx, _player_xpos, camera_lerp);
            global.camy = lerp(global.camy, _player_ypos, camera_lerp);
        }
    }
	
	// direct camera stuff
	if (obj_player.player_state == obj_player.pre_direct_state)
	{
		update_player_inputs();
		
		global.camx = lerp(global.camx, global.camx + ((right - left) * pre_direct_xto_dist), pre_direct_cam_lerp);
		global.camy = lerp(global.camy, global.camy + ((down - up) * pre_direct_yto_dist), pre_direct_cam_lerp);
	}
	
	// limitando o movimento da camera dentro da atual camera_mask.
	global.camx = clamp(global.camx, cam_x_min_lerp, cam_x_max_lerp);
	global.camy = clamp(global.camy, cam_y_min_lerp, cam_y_max_lerp);
	
	CAMERA_handle_screen_shake();

	// movendo a cemera
	global.camx -= global.camx mod 0.01;
	global.camy -= global.camy mod 0.01;
	camera_set_view_pos(global.current_camera, global.camx, global.camy);
}
// estamos no GOD_MODE:
else
{
    global.player_can_move = true
    
    // || mouse_check_button(mb_middle)
    if (keyboard_check(vk_space))
    {
        can_drag_camera = true;
    }
    else
    {
        can_drag_camera = false;
    }

    // Camera zoom in and out
    if (mouse_wheel_down()
        && keyboard_check(vk_control)
        && (camera_get_view_width(global.current_camera) < (room_width + (VIEW_W * 4)))
        && (camera_get_view_height(global.current_camera) < (room_height + (VIEW_H * 4))))
    {
        new_cam_width  = (camera_get_view_width(global.current_camera) + (VIEW_W / 2));
        new_cam_height = (camera_get_view_height(global.current_camera) + (VIEW_H / 2));
        
        camera_set_view_size(global.current_camera, new_cam_width, new_cam_height);
        
        global.camx = (global.cam_target.x - (camera_get_view_width(global.current_camera) / 2));
    	global.camy = (global.cam_target.y - (camera_get_view_height(global.current_camera) / 2));
    	global.camx -= global.camx mod 0.01;
    	global.camy -= global.camy mod 0.01;
    	
    	var center_window_x_pos = (camera_get_view_x(global.current_camera) - (VIEW_W / 4));
        var center_window_y_pos = (camera_get_view_y(global.current_camera) - (VIEW_H / 4));
    	camera_set_view_pos(global.current_camera, center_window_x_pos, center_window_y_pos);
    }
    else if (mouse_wheel_up()
             && keyboard_check(vk_control)
             && (camera_get_view_width(global.current_camera) > (VIEW_W / 2))
             && (camera_get_view_height(global.current_camera) > (VIEW_H / 2)))
    {   
        new_cam_width  = (camera_get_view_width(global.current_camera) - (VIEW_W / 2));
        new_cam_height = (camera_get_view_height(global.current_camera) - (VIEW_H / 2));
        
        camera_set_view_size(global.current_camera, new_cam_width, new_cam_height);
        
        global.camx = (global.cam_target.x - (camera_get_view_width(global.current_camera)/2));
    	global.camy = (global.cam_target.y - (camera_get_view_height(global.current_camera)/2));
    	global.camx -= global.camx mod 0.01;
    	global.camy -= global.camy mod 0.01;
    	
    	var center_window_x_pos = (camera_get_view_x(global.current_camera) + (VIEW_W / 4));
        var center_window_y_pos = (camera_get_view_y(global.current_camera) + (VIEW_H / 4));
        camera_set_view_pos(global.current_camera, center_window_x_pos, center_window_y_pos);
    }
    
    cam_x_min_lerp = lerp(cam_x_min_lerp, global.cam_x_min, camera_swap_lerp);
	cam_x_max_lerp = lerp(cam_x_max_lerp, global.cam_x_max, camera_swap_lerp);
	cam_y_min_lerp = lerp(cam_y_min_lerp, global.cam_y_min, camera_swap_lerp);
	cam_y_max_lerp = lerp(cam_y_max_lerp, global.cam_y_max, camera_swap_lerp);
	
	global.camx = (global.cam_target.x - (camera_get_view_width(global.current_camera)/2));
	global.camy = (global.cam_target.y - (camera_get_view_height(global.current_camera)/2));
	
	with (obj_player)
	{
		x = clamp(x, 0, room_width);
		y = clamp(y, 0, room_height);
	}
	
	update_player_inputs();
	
	if ((right || left || up || down))
	{
	   global.camx -= global.camx mod 0.01;
	   global.camy -= global.camy mod 0.01;
	   camera_set_view_pos(global.current_camera, global.camx, global.camy);
	}
}


// backround parallax effects:
/*
if (layer_exists(bg_1_layer_id))
{
	// layer_x(bg_1_layer_id, (global.camx - (global.cam_width / 2)) / 8);
	layer_x(bg_1_layer_id, lerp(0, camera_get_view_x(global.current_camera), 0.1));
	// layer_y(bg_1_layer_id, lerp(0, camera_get_view_y(global.current_camera), 0.1));
}

if (layer_exists(bg_2_layer_id))
{
	// layer_x(bg_2_layer_id, (global.camx - (global.cam_width / 2)) / 6);
	layer_x(bg_2_layer_id, lerp(0, camera_get_view_x(global.current_camera), 0.2));
	// layer_y(bg_2_layer_id, lerp(0, camera_get_view_y(global.current_camera), 0.2));
}
*/

// -------------

// image background
if (layer_exists(image_bg_layer_id))
{
	layer_x(image_bg_layer_id, (global.camx * 0.7));
	layer_y(image_bg_layer_id, (global.camy * 0.7));
}


if (layer_exists(bg_1_layer_id))
{
	layer_x(bg_1_layer_id, global.camx / 6);
	layer_y(bg_1_layer_id, global.camy);
}

if (layer_exists(bg_2_layer_id))
{
	layer_x(bg_2_layer_id, global.camx / 4);
	layer_y(bg_2_layer_id, global.camy);
}

if (layer_exists(bg_3_layer_id))
{
	layer_x(bg_3_layer_id, global.camx / 2);
	layer_y(bg_3_layer_id, global.camy);
}