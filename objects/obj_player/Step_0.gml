if (global.pause) exit;

var temp = place_meeting(x, y+1, obj_default_collider);
if (temp && !on_floor) audio_play_sound(landing_sound, 1, false);

on_floor = place_meeting(x, y+1, obj_default_collider);
on_left_wall = place_meeting(x-1, y, obj_wall_collider);
on_right_wall = place_meeting(x+1, y, obj_wall_collider);

if (on_floor){
	player_jump_timer = player_jump_limit;
	player_dash_cooldown = 1;
} else if (player_jump_timer > 0) player_jump_timer--;

if (on_left_wall || on_right_wall){
	last_wall = on_left_wall ? 0 : 1;
	wall_timer = wall_limit;
} else if (wall_timer > 0) wall_timer--;

player_default_accel = on_floor ? player_floor_accel : player_air_accel;

var left, right, up, down, jump, jump_r, dash;
left	= keyboard_check(global.input_vk_left) || gamepad_button_check(global.gp_slot, global.input_gp_left);
right	= keyboard_check(global.input_vk_right) || gamepad_button_check(global.gp_slot, global.input_gp_right);
up		= keyboard_check(global.input_vk_up) || gamepad_button_check(global.gp_slot, global.input_gp_up);
down	= keyboard_check(global.input_vk_down) || gamepad_button_check(global.gp_slot, global.input_gp_down);
jump	= keyboard_check_pressed(global.input_vk_jump) || gamepad_button_check_pressed(global.gp_slot, global.input_gp_jump);
jump_r	= keyboard_check_released(global.input_vk_jump) || gamepad_button_check_released(global.gp_slot, global.input_gp_jump);
dash	= keyboard_check_pressed(global.input_vk_dash) || gamepad_button_check_pressed(global.gp_slot, global.input_gp_dash);

if (right || left || down || up) controller = false;

if (abs(gamepad_axis_value(global.gp_slot, global.input_gp_lh_analog)) > .2){
	right = ceil(max(gamepad_axis_value(global.gp_slot, global.input_gp_lh_analog), 0));
	left = ceil(abs(min(gamepad_axis_value(global.gp_slot, global.input_gp_lh_analog), 0)));
	controller = true;
}

if (abs(gamepad_axis_value(global.gp_slot, global.input_gp_lv_analog)) > .2){
	down = ceil(max(gamepad_axis_value(global.gp_slot, global.input_gp_lv_analog), 0));
	up = ceil(abs(min(gamepad_axis_value(global.gp_slot, global.input_gp_lv_analog), 0)));
	controller = true;
}

var h_spd = (right - left) * max_player_horizontal_speed;

#region State machine

	switch(player_state){
		#region Idle
		
			case "idle":
				h_speed = 0;
				player_vertical_speed = 0;
				
				if (!on_floor) player_vertical_speed += grav;
				
				if (on_floor && jump){
					player_vertical_speed = -max_player_vertical_speed;
					audio_play_sound(jump_sound, 1, false);
				}
				
				if (abs(h_speed) > 0 || abs(player_vertical_speed) > 0 || left || right || jump) player_state = "moving";
				
				#region Going to dash state
				
					var on_collision_with_walls = place_meeting(x+side, y, obj_default_collider);
					
					if !(on_collision_with_walls){
						if (dash && player_dash_cooldown > 0){
							player_dash_direction = point_direction(0, 0, (right-left), 0);
							audio_play_sound(dash_sound, 1, false);
							player_state = "dash";
							player_dash_cooldown--;
						}
					}
				
				#endregion
			break;
			
		#endregion
		
 		#region Moving
		
			case "moving":
				h_speed = lerp(h_speed, h_spd, player_default_accel);
				
				var foot_steps_sound_is_playing = audio_is_playing(foot_steps_sound);
				if (on_floor && !foot_steps_sound_is_playing) audio_play_sound(foot_steps_sound, 1, false);
				else if (!on_floor && foot_steps_sound_is_playing) audio_stop_sound(foot_steps_sound);
				if (h_speed <= .8 && h_speed >= -.8 && foot_steps_sound_is_playing) audio_stop_sound(foot_steps_sound);
				
				if (jump && (on_floor || player_jump_timer)){
						player_vertical_speed = -max_player_vertical_speed;
						audio_play_sound(jump_sound, 1, false);
					}
				if (jump_r && player_vertical_speed < 0) player_vertical_speed *= .2;
				
				#region On the walls's sides
				
					var wall_slide_sound_is_playing = audio_is_playing(wall_slide_sound);
				
					if (!on_floor && (on_left_wall || on_right_wall || wall_timer)){
						var _lerp = lerp(player_vertical_speed, slide, player_default_accel);
						if ((on_left_wall || on_right_wall) && player_vertical_speed > 0 && !wall_slide_sound_is_playing) audio_play_sound(wall_slide_sound, 1, false);
					
						if (player_vertical_speed > 0) player_vertical_speed = _lerp;
						else player_vertical_speed += grav;
				
						if (!last_wall && jump){	// On left wall
							player_vertical_speed = -max_player_vertical_speed;
							h_speed = max_player_horizontal_speed * 3;
							audio_play_sound(wall_jump_sound, 1, false);
						}
						else if (last_wall && jump){	// On right wall
							player_vertical_speed = -max_player_vertical_speed;
							h_speed = -max_player_horizontal_speed * 3;
							audio_play_sound(wall_jump_sound, 1, false);
						}
					} else if (!on_floor) player_vertical_speed += grav;
					
					if (!(on_left_wall || on_right_wall) && wall_slide_sound_is_playing) audio_stop_sound(wall_slide_sound);
					if ((on_left_wall || on_right_wall) && on_floor && wall_slide_sound_is_playing) audio_stop_sound(wall_slide_sound);
				
				#endregion
				
				#region Going to dash state
				
					var on_collision_with_walls = place_meeting(x+side, y, obj_default_collider);
					
					if !(on_collision_with_walls){
						if (dash && player_dash_cooldown > 0){
							if (left || right) player_dash_direction = point_direction(0, 0, (right-left), 0);
							else player_dash_direction = point_direction(0, 0, side, 0);
							audio_play_sound(dash_sound, 1, false);
							player_state = "dash";
							player_dash_cooldown--;
						}
					}
				
				#endregion
			break;
			
		#endregion
		
		#region Dash
		
			case "dash":
				player_dash_timer--;
				h_speed = lengthdir_x(player_dash_speed, player_dash_direction);
				player_vertical_speed = lengthdir_y(player_dash_speed, player_dash_direction);
				
				if (player_trail_timer_to_create <= 0){
					var trail = instance_create_layer(x, y, "PlayerTrail", obj_player_trail);
					trail.sprite_index = sprite_index;
					player_trail_timer_to_create = player_trail_time_to_count;
				} else player_trail_timer_to_create--;
				
				#region Going to moving state
				
					if (player_dash_timer <= 0){
						player_state = "moving";
						player_dash_timer = room_speed / 4;
						h_speed = (max_player_horizontal_speed*sign(h_speed)) * .5;
						player_vertical_speed = (max_player_vertical_speed*sign(player_vertical_speed)) * .5;
					}
					
				#endregion
			break;
			
		#endregion
		
		#region Death
		
			case "death":
				room_restart();
			break;
			
		#endregion
	}
	
	x_scale = lerp(x_scale, 1, .15);
	y_scale = lerp(y_scale, 1, .15);
	
#endregion

#region Collision

	if (place_meeting(x+h_speed, y, obj_default_collider)){
		var sign_player_hspeed = sign(h_speed);
		while (!place_meeting(x+sign_player_hspeed, y, obj_default_collider)){
			x += sign_player_hspeed;
		}
		h_speed = 0;
	}
	
	if (place_meeting(x, y+player_vertical_speed, obj_default_collider)){
		var sign_player_vspeed = sign(player_vertical_speed);
		while (!place_meeting(x, y+sign_player_vspeed, obj_default_collider)){
			y += sign_player_vspeed;
		}
		player_vertical_speed = 0;
	}

#endregion

var on_change_room_mode = place_meeting(x, y, obj_change_room_collider);

x += !on_change_room_mode ? h_speed : obj_change_room_collider.x;
y += !on_change_room_mode ? player_vertical_speed : obj_change_room_collider.y;