if (global.pause) exit;

var temp = place_meeting(x, y+1, obj_default_collider);
if (temp && !on_floor) audio_play_sound(landing_sound, 1, false);

on_floor		= place_meeting(x, y+1, obj_default_collider);
on_left_wall	= place_meeting(x-1, y, obj_wall_collider);
on_right_wall	= place_meeting(x+1, y, obj_wall_collider);

if (on_floor){
	jump_timer = jump_limit;
	dash_cooldown = 1;
} else if (jump_timer > 0) jump_timer--;

if (on_left_wall || on_right_wall){
	last_wall = on_left_wall ? 0 : 1;
	wall_timer = wall_limit;
} else if (wall_timer > 0) wall_timer--;

default_accel = on_floor ? floor_accel : air_accel;

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

var _hspeed = (right - left) * max_hspeed;

#region State machine

	switch(state){
		#region Idle
		
			case "idle":
				h_speed = 0;
				v_speed = 0;
				
				if (!on_floor) v_speed += grav;
				
				if (on_floor && jump){
					v_speed = -max_vspeed;
					audio_play_sound(jump_sound, 1, false);
				}
				
				if (abs(h_speed) > 0 || abs(v_speed) > 0 || left || right || jump) state = "moving";
				
				var steps_snd_playing = audio_is_playing(foot_steps_sound);
				if (steps_snd_playing) audio_stop_sound(foot_steps_sound);
				
				#region Going to dash state
				
					var on_walls = place_meeting(x+side, y, obj_default_collider);
					
					if !(on_walls){
						if (dash && dash_cooldown > 0){
							dash_direction = point_direction(0, 0, (right-left), 0);
							dash_cooldown--;
							state = "dash";
							audio_play_sound(dash_sound, 1, false);
						}
					}
				
				#endregion
			break;
			
		#endregion
		
 		#region Moving
		
			case "moving":
				h_speed = lerp(h_speed, _hspeed, default_accel);
				
				if (h_speed == 0 && v_speed == 0) state = "idle";
				
				var steps_snd_playing = audio_is_playing(foot_steps_sound);
				if (on_floor && !steps_snd_playing) audio_play_sound(foot_steps_sound, 1, false);
				else if (!on_floor && steps_snd_playing) audio_stop_sound(foot_steps_sound);
				
				if (h_speed <= .8 && h_speed >= -.8 && steps_snd_playing) audio_stop_sound(foot_steps_sound);
				
				if (jump && (on_floor || jump_timer)){
					v_speed = -max_vspeed;
					audio_play_sound(jump_sound, 1, false);
				}
				if (jump_r && v_speed < 0) v_speed *= .2;
				
				#region On the walls's sides
				
					var wall_slide_snd_playing = audio_is_playing(wall_slide_sound);
				
					if (!on_floor && (on_left_wall || on_right_wall || wall_timer)){
						var _lerp = lerp(v_speed, slide, default_accel);
						if ((on_left_wall || on_right_wall) && v_speed > 0 && !wall_slide_snd_playing) audio_play_sound(wall_slide_sound, 1, false);
					
						if (v_speed > 0) v_speed = _lerp;
						else v_speed += grav;
				
						if (!last_wall && jump){ // On left wall
							v_speed = -max_vspeed;
							h_speed = max_hspeed * 3;
							audio_play_sound(wall_jump_sound, 1, false);
						}
						else if (last_wall && jump){ // On right wall
							v_speed = -max_vspeed;
							h_speed = -max_hspeed * 3;
							audio_play_sound(wall_jump_sound, 1, false);
						}
					} else if (!on_floor) v_speed += grav;
					
					if (!(on_left_wall || on_right_wall) && wall_slide_snd_playing) audio_stop_sound(wall_slide_sound);
					if ((on_left_wall || on_right_wall) && on_floor && wall_slide_snd_playing) audio_stop_sound(wall_slide_sound);
				
				#endregion
				
				#region Going to dash state
				
					var on_walls = place_meeting(x+side, y, obj_default_collider);
					
					if !(on_walls){
						if (dash && dash_cooldown > 0){
							dash_direction = left || right ? point_direction(0, 0, (right-left), 0) : point_direction(0, 0, side, 0);
							dash_cooldown--;
							state = "dash";
							audio_play_sound(dash_sound, 1, false);
						}
					}
				
				#endregion
			break;
			
		#endregion
		
		#region Dash
		
			case "dash":
				dash_timer--;
				h_speed = lengthdir_x(dash_speed, dash_direction);
				v_speed = lengthdir_y(dash_speed, dash_direction);
				
				if (trail_create_timer <= 0){
					var trail = instance_create_layer(x, y, "PlayerTrail", obj_player_trail);
					trail.sprite_index = sprite_index;
					trail_create_timer = trail_time_count;
				} else trail_create_timer--;
				
				#region Going to moving state
				
					if (dash_timer <= 0){
						h_speed = (max_hspeed*sign(h_speed)) * .5;
						v_speed = (max_vspeed*sign(v_speed)) * .5;
						dash_timer = room_speed / 4;
						state = "moving";
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
		var sign_hspeed = sign(h_speed);
		while (!place_meeting(x+sign_hspeed, y, obj_default_collider)){
			x += sign_hspeed;
		}
		h_speed = 0;
	}
	
	if (place_meeting(x, y+v_speed, obj_default_collider)){
		var sign_vspeed = sign(v_speed);
		while (!place_meeting(x, y+sign_vspeed, obj_default_collider)){
			y += sign_vspeed;
		}
		v_speed = 0;
	}

#endregion

var on_changing_room = place_meeting(x, y, obj_change_room_collider);
x += !on_changing_room ? h_speed : obj_change_room_collider.x;
y += !on_changing_room ? v_speed : obj_change_room_collider.y;