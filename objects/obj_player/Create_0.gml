
#region THINGS WE DO WHEN INITIALIZING THE GAME (YES, WE DO IT IN THE PLAYER OBJECT)
// discord object
if (!instance_exists(objNekoPresenceDemo))
{
	instance_create_layer(0, 0, "controllers", objNekoPresenceDemo);	
}

if (!instance_exists(obj_game_controller))
{
	instance_create_layer(0, 0, "controllers", obj_game_controller);	
}

if (!instance_exists(obj_camera))
{
	instance_create_layer(0, 0, "camera", obj_camera);
}

if (!instance_exists(obj_console))
{
	instance_create_layer(0, 0, "controllers", obj_console);
}

if (!instance_exists(obj_dash_bonus_light))
{
	instance_create_layer(0, 0, layer + 1, obj_dash_bonus_light);
}
#endregion

update_player_inputs();

// speed
grav = 0.23;
h_speed = 0;
v_speed = 0;
walk_speed = 2.4;
haccel = 0.24;
vaccel = 0.19;
// vaccel = 0.21;

// jump
jump_speed = 4;
coyote_can_jump = 0;
jump_coyote_max = 8;
jump_buffer_counter = 0;
jump_buffer_max = 8;
jumper_object_can_jump_release = true;

// color
player_color = c_white;
player_color_red = 255;
player_color_green = 255;
player_color_blue = 255;

// dash
can_disable_dash = false;
can_dash = 1;
dash_dist = 35;
dash_time = 8;
dash_dir = 0;
dash_speed = 0;
dash_energy = 0;
time_to_dash = 10;
dash_timer = time_to_dash;

// dash trail
trail_timer = 0;
time_to_trail = 1.5;

// on wall
wall_grav = 0.1;
on_wall = 0;
// wall_hspeed = 2.5;
wall_hspeed = 2.8;
wall_vspeed = -4.2;
wall_max_vspeed = 1;
wall_jump_delay = 0;
wall_jump_delay_max = 3.5;

wall_jump_buffer = 10;
wall_timer = 0;
last_wall = 0;

// misc
xscale = 1;
yscale = 1;
side_to_look = 1;
can_create_death_par = true;
on_floor = false;
on_roof = false;
temp_on_floor = false;
can_reset_vspeed = false;
change_player_color_speed = 0.15;
player_anim_lerp = 0.1;

// dust particles
walking_dust_particles_time_to_spawn = 10;
walking_dust_particles_timer = walking_dust_particles_time_to_spawn;

#region dash particle system
can_spawn_dash_particles = false;

dash_particle_system = part_system_create_layer(layer_get_id(PLAYER_LAYER_NAME) + 1, false);
dash_particles_time_to_spawn = 2;
dash_particles_spawn_timer = dash_particles_time_to_spawn;

// particles
dash_particle = part_type_create();
dash_particle_color = make_color_rgb(255, 255, 50);

part_type_sprite(dash_particle, spr_pixel_particle, false, false, false);
part_type_life(dash_particle, 40, 50);
part_type_alpha3(dash_particle, 0.8, 1, 0);
part_type_color1(dash_particle, dash_particle_color);

// part_type_direction(dash_particle, 225, 315, 1, 30);
part_type_speed(dash_particle, 0.1, 0.006, 0, 0);
#endregion

// STATES

#region DASH STATE
dash_state = function()
{
	if (can_disable_dash)
	{
		can_dash -= 1;
		can_disable_dash = false;
	}
	
	h_speed = lengthdir_x(dash_speed, dash_dir);
	v_speed = lengthdir_y(dash_speed, dash_dir);
	
	// trail_timer--;
	trail_timer -= global.delta;
	if (trail_timer <= 0)
	{
		with (instance_create_depth(x, y, depth + 1, obj_player_trail))
		{
			sprite_index = other.sprite_index;
			image_blend = make_color_rgb(180, 180, 0);
			image_alpha = 0.7;
		}
		trail_timer = time_to_trail;
	}
	
	// horizontal collision
	repeat (abs(h_speed)) 
	{
		var sign_hspeed = sign(h_speed);
	
		if (place_meeting(x + sign_hspeed, y, obj_default_collider)) 
		{
			h_speed = 0;
			break;
		} 
		else 
		{ 
			x += sign_hspeed;
			x = round(x);
		}
	}

	// vertical collision
	repeat (abs(v_speed)) 
	{
		var sign_vspeed = sign(v_speed);
	
		if (place_meeting(x, y + sign_vspeed, obj_default_collider)) 
		{
			v_speed = 0;
			break;
		} 
		else 
		{ 
			y += sign_vspeed;
			y = round(y);
		}
	}
	
	// going to the death state
	if (place_meeting(x, y, obj_death_collider) || place_meeting(x, y, obj_spine))
	{
		screen_shake(5, 10, true, true);
		player_state = death_state;
	}
	
	#region dash particles
	
	if (right && !up && !down && place_meeting(x + 1, y, obj_default_collider))
	{
		can_spawn_dash_particles = false;	
	}
	if (left && !up && !down && place_meeting(x - 1, y, obj_default_collider))
	{
		can_spawn_dash_particles = false;	
	}
	if (on_roof && up && !right && !left)
	{
		can_spawn_dash_particles = false;
	}
	if (on_floor && down && !right && !left)
	{
		can_spawn_dash_particles = false;
	}
	
	if (can_spawn_dash_particles && (h_speed != 0 || v_speed != 0))
	{
		dash_particles_spawn_timer -= 1;
		if (dash_particles_spawn_timer <= 0)
		{
			var length = 10;
			var angle_diff = random_range(-30, 30);
			var xdiff = x + lengthdir_x(length, ((dash_dir - 180) + angle_diff));
			var ydiff = (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)) 
			            + lengthdir_y(length, ((dash_dir - 180) + angle_diff));

			part_type_direction(dash_particle, dash_dir, dash_dir, 0, 10);

			part_particles_create(dash_particle_system, 
							      xdiff, 
								  ydiff, 
								  dash_particle, 
								  1);
							  
			dash_particles_spawn_timer = dash_particles_time_to_spawn;
		}
	}
	
	#endregion
	
	// stop dashing
	dash_energy -= dash_speed;
	if (dash_energy <= 0)
	{
		h_speed *= 0.8;
		v_speed *= 0.8;
		player_state = free_state;
	}
}
#endregion

#region LOCK STATE
lock_state = function()
{
	
}
#endregion

#region BACK STATE
back_state = function()
{
	player_state = free_state;
}
#endregion

#region DEATH STATE
death_state = function()
{
	global.cam_target = noone;
	// global.cam_target = obj_player_death_par;
	instance_destroy();
	
	if (can_create_death_par)
	{
		create_player_death_particle(90, true);
	}
	
	player_state = back_state;
}
#endregion

#region FREE STATE
free_state = function()
{
	// wall_jump_delay = max(wall_jump_delay - 1, 0);
	wall_jump_delay = max(wall_jump_delay - global.delta, 0);
	
	if (wall_jump_delay == 0)
	{
		var hspeed_to = (((right - left) * walk_speed) * global.delta);
		if (on_floor)
		{
			default_accel = haccel;
		}
		else
		{
			default_accel = vaccel;
		}
		
		h_speed = lerp(h_speed, hspeed_to, default_accel);
		
		if (((left && !place_meeting(x - 1, y, obj_default_collider)) || (right && !place_meeting(x + 1, y, obj_default_collider))) 
		    && on_floor 
			&& !(left && right))
		{
			if (h_speed <= -1 || h_speed >= 1)
			{
				// player dust particles when walking
				// walking_dust_particles_timer -= 1;
				walking_dust_particles_timer -= global.delta;
				if (walking_dust_particles_timer <= 0)
				{
					create_player_dust_particle(1, x, y, global.player_dust_particles_layer, 
					                            choose(obj_player_dust_particle_1, 
												       obj_player_dust_particle_2));
				
					walking_dust_particles_timer = walking_dust_particles_time_to_spawn;
				}
			}
		}
	}
	
	if ((right ^^ left) && place_meeting(x, y + 1, obj_default_collider))
	{
		if (xscale < 1.5)
		{
			xscale = lerp(xscale, 1.5, player_anim_lerp); //0.17
		}
		if (yscale > 0.5)
		{
			yscale = lerp(yscale, 0.5, player_anim_lerp); // 0.17
		}
	}
	
	// wall jump
	if (!place_meeting(x, y + 1, obj_default_collider) 
	    && ((on_wall == 1 && right) || (on_wall == -1 && left)))
	{
		wall_timer = wall_jump_buffer;
		last_wall = on_wall;
		jumper_object_can_jump_release = true;
	}
	
	if (on_wall == 0 || !((on_wall == 1 && right) || (on_wall == -1 && left)))
	{
		if (wall_timer > 0)
		{
			// wall_timer--;
			wall_timer -= global.delta;
		}
	}
	
	// actual wall jump
	if (!place_meeting(x, y + 1, obj_default_collider) && jump_pressed
	    && ((on_wall == 1 && right) || (on_wall == -1 && left) || wall_timer))
	{
		wall_jump_delay = wall_jump_delay_max;
		h_speed = (-last_wall * wall_hspeed);
		v_speed = wall_vspeed;
		xscale = 0.6;
		yscale = 1.4;
		wall_timer = 0;
		
		var xx = x;
		if (last_wall == 1) // right wall
		{
			xx = (x + (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
		}
		if (last_wall == -1) // left wall
		{
			xx = (x - (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
		}
		
		create_player_dust_particle(1, xx, (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), 
									global.player_dust_particles_layer, choose(obj_player_dust_particle_1, obj_player_dust_particle_2),
									random_range(90, 180));
									
		audio_play_sound(snd_player_jump, 1, 0);
	}
	
	// wall sliding
	if (on_wall == 1 && right && v_speed >= 0) // right
	{
		if (can_reset_vspeed)
		{
			v_speed = 0.8;
			can_reset_vspeed = false;
		}
		
		if (v_speed < (wall_max_vspeed * 1.4))
		{
			v_speed += wall_grav;
		}
		
		if (v_speed >= 1.2)
		{
			walking_dust_particles_timer -= 1;
			if (walking_dust_particles_timer <= 0)
			{
				var xx = x;
				if (last_wall == 1) // right wall
				{
					xx = (x + (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
				}
				if (last_wall == -1) // left wall
				{
					xx = (x - (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
				}
		
				create_player_dust_particle(1, xx, (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), 
											global.player_dust_particles_layer, choose(obj_player_dust_particle_1, obj_player_dust_particle_2),
											random_range(90, 180));
				
				walking_dust_particles_timer = walking_dust_particles_time_to_spawn;
			}
		}
	}
	
	if (on_wall == 1 && right && v_speed < 0) // right
	{
		if (v_speed < (jump_speed * 1.2))
		{
			v_speed += grav;
		}
		
		if (v_speed >= 1.2)
		{
			walking_dust_particles_timer -= 1;
			if (walking_dust_particles_timer <= 0)
			{
				var xx = x;
				if (last_wall == 1) // right wall
				{
					xx = (x + (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
				}
				if (last_wall == -1) // left wall
				{
					xx = (x - (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
				}
		
				create_player_dust_particle(1, xx, (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), 
											global.player_dust_particles_layer, choose(obj_player_dust_particle_1, obj_player_dust_particle_2),
											random_range(90, 180));
				
				walking_dust_particles_timer = walking_dust_particles_time_to_spawn;
			}
		}
	}
	
	if (on_wall == -1 && left && v_speed >= 0) // left
	{
		if (can_reset_vspeed)
		{
			v_speed = 0.8;
			can_reset_vspeed = false;
		}
		
		if (v_speed < (wall_max_vspeed * 1.2))
		{
			v_speed += wall_grav;
		}
		
		if (v_speed >= 1.2)
		{
			walking_dust_particles_timer -= 1;
			if (walking_dust_particles_timer <= 0)
			{
				var xx = x;
				if (last_wall == 1) // right wall
				{
					xx = (x + (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
				}
				if (last_wall == -1) // left wall
				{
					xx = (x - (sprite_get_width(PLAYER_COLLISION_MASK_SPRITE) / 2));
				}
		
				create_player_dust_particle(1, xx, (y - (sprite_get_height(PLAYER_COLLISION_MASK_SPRITE) / 2)), 
											global.player_dust_particles_layer, choose(obj_player_dust_particle_1, obj_player_dust_particle_2),
											random_range(90, 180));
				
				walking_dust_particles_timer = walking_dust_particles_time_to_spawn;
			}
		}
	}
	
	// falling
	if (on_wall == -1 && left && v_speed < 0) // left
	{
		if (v_speed < (jump_speed * 1.10)) // 1.4
		{
			v_speed += grav;
		}
	}
	
	if (on_wall != 0 && !left && !right)
	{
		can_reset_vspeed = true;
		if (v_speed < (jump_speed * 1.10)) // 1.4
		{
			v_speed += grav;
		}
	}
	
	if (on_wall == 0)
	{
		can_reset_vspeed = true;
		if (v_speed < (jump_speed * 1.10)) // 1.4
		{
			v_speed += grav;
		}
	}
	
	// animating player falling
	if (!place_meeting(x, y + 1, obj_default_collider) && on_wall == 0 && v_speed > 2.5)
	{
		if (xscale > 0.7)
		{
			xscale = lerp(xscale, 0.7, player_anim_lerp); // 0.15
		}
		if (yscale < 1.4)
		{
			yscale = lerp(yscale, 1.4, player_anim_lerp); // 0.15
		}	
	}
	
	// dashing
	// && (left || right || down || up)
	if (dash_timer > 0)
	{
		// dash_timer -= 1;
		dash_timer -= global.delta;
	}
	
	if (can_dash > 0 && dash_pressed && dash_timer <= 0 && (left || right || down || up))
	{
		#region // picking dash direction
		
		dash_dir = point_direction(0, 0, right-left, down-up);
		
		if (down && (left || right) && !up) // floor diagonal dashing
		{
			if (!place_meeting(x - 1, y, obj_default_collider)
			    && !place_meeting(x + 1, y, obj_default_collider))
				{
					if (on_floor)
					{
						dash_dir = point_direction(0, 0, right-left, 0);
					}
					else
					{
						dash_dir = point_direction(0, 0, right-left, down-up);
					}
				}
		}
		
		if (up && (left || right) && !down) // roof diagonal dashing
		{
			if (!place_meeting(x - 1, y, obj_default_collider) 
			    && !place_meeting(x + 1, y, obj_default_collider))
				{
					if (place_meeting(x, y - 1, obj_default_collider))
					{
						dash_dir = point_direction(0, 0, right-left, 0);
					}
					else
					{
						dash_dir = point_direction(0, 0, right-left, down-up);
					}
				}
		}
		
		if (left && down && !right) // left-wall diagonal dashing
		{
			if (!on_floor)
			{
				if (place_meeting(x - 1, y, obj_default_collider))
				{
					dash_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					dash_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		if (left && up && !right) // left-wall diagonal dashing
		{
			if (!place_meeting(x, y - 1, obj_default_collider))
			{
				if (place_meeting(x - 1, y, obj_default_collider))
				{
					dash_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					dash_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		if (right && down && !left) // right-wall diagonal dashing
		{
			if (!on_floor)
			{
				if (place_meeting(x + 1, y, obj_default_collider))
				{
					dash_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					dash_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		if (right && up && !left) // right-wall diagonal dashing
		{
			if (!place_meeting(x, y - 1, obj_default_collider))
			{
				if (place_meeting(x + 1, y, obj_default_collider))
				{
					dash_dir = point_direction(0, 0, 0, down-up);
				}
				else
				{
					dash_dir = point_direction(0, 0, right-left, down-up);
				}
			}
		}
		
		// not dashing
		if (left && right && !up && !down)
		{
			exit;
		}
		if (up && down && !left && !right)
		{
			exit;
		}
		if (left && right && down && on_floor)
		{
			exit;	
		}
		if (left && right && up && down)
		{
			exit;
		}
		
		#endregion
		
		if (on_floor)
		{
			dash_timer = time_to_dash;
		}
		else
		{
			dash_timer = 0;	
		}
		
		coyote_can_jump = 0;
		dash_speed = (dash_dist / dash_time);
		dash_energy = dash_dist;
		
		if ((down || up) && !left && !right) // up or down (vertical)
		{
			xscale = 0.7;
			yscale = 1.3;
			screen_shake(2, 7, false, true);
		}
		else if ((left || right) && !down && !up) // left or right (horizontal)
		{
			xscale = 1.2;
			yscale = 0.7;
			screen_shake(2, 7, true, false);
		}
		else if ((down || up) && (left || right)) // diagonals
		{
			xscale = 1.2;
			yscale = 0.7;
			screen_shake(2, 7, true, true);
		}
		else
		{
			xscale = 1.2;
			yscale = 0.7;
			screen_shake(2, 7, true, true);
		}
		
		audio_play_sound(choose(snd_redbooster_dash, snd_greenbooster_dash), 1, 0);
		can_spawn_dash_particles = true;
		can_disable_dash = true;
		player_state = dash_state;
	}
	
	// jumping
	if (jump_pressed && v_speed > 0)
	{
		jump_buffer_counter = jump_buffer_max;
	}
	
	if (coyote_can_jump-- > 0 && jump_pressed && v_speed > 0)
	{
		v_speed = -jump_speed;
		coyote_can_jump = 0;
		xscale = 0.6;
		yscale = 1.3;	
		audio_play_sound(snd_player_jump, 1, 0);
		create_player_dust_particle(1, x, y, global.player_dust_particles_layer, choose(obj_player_dust_particle_1, obj_player_dust_particle_2));
	}
	
	if (jump_buffer_counter > 0)
	{
		// jump_buffer_counter -= 1;
		jump_buffer_counter -= global.delta;
		
		if ((place_meeting(x, y + 1, obj_default_collider) 
		     || place_meeting(x, y + 1, obj_slab_collider)) 
			 && v_speed > 0
			 && !place_meeting(x, y + 1, obj_jumper))
		{
			v_speed = -jump_speed;
			coyote_can_jump = 0;
			xscale = 0.6;
			yscale = 1.3;
			audio_play_sound(snd_player_jump, 1, 0);
			create_player_dust_particle(1, x, y, global.player_dust_particles_layer, choose(obj_player_dust_particle_1, obj_player_dust_particle_2));
		}
	}
	
	// jump releasing
	if (!place_meeting(x, y + 1, obj_default_collider) 
	    && v_speed <= 0 
		&& jump_released
		&& jumper_object_can_jump_release)
	{
		v_speed *= 0.05;
	}
	
	// going to the death state
	if (place_meeting(x, y, obj_death_collider) || place_meeting(x, y, obj_spine))
	{
		screen_shake(5, 10, true, true);
		player_state = death_state;
	}
	
	// horizontal collision
	repeat (abs(h_speed)) 
	{
		var sign_hspeed = sign(h_speed);
	
		if (place_meeting(x + sign_hspeed, y, obj_default_collider)) 
		{
			h_speed = 0;
			break;
		} 
		else 
		{ 
			x += sign_hspeed;
			x = round(x);
		}
	}
	
	// vertical collision
	repeat (abs(v_speed)) 
	{
		var sign_vspeed = sign(v_speed);
	
		if (place_meeting(x, y + sign_vspeed, obj_default_collider)) 
		{
			if (v_speed > 0)
			{
				coyote_can_jump = jump_coyote_max;
				can_dash = 1;
			}
			
			v_speed = 0;
			break;
		} 
		else 
		{
			y += sign_vspeed;
			y = round(y);
		}
	}
}
#endregion

player_state = free_state;



















