if (!instance_exists(obj_player) 
    || !global.player_can_move
	|| global.is_paused)
{
	exit;
}

left = keyboard_check(ord("A"))
|| keyboard_check(vk_left)
|| gamepad_button_check(global.device, gp_padl);
			
right = keyboard_check(ord("D"))
|| keyboard_check(vk_right)
|| gamepad_button_check(global.device, gp_padr);
			
down = keyboard_check(ord("S"))
|| keyboard_check(vk_down)
|| gamepad_button_check(global.device, gp_padd);
	
up = keyboard_check(ord("W")) 
|| keyboard_check(vk_up)
|| gamepad_button_check(global.device, gp_padu);

if (obj_player.on_floor && down)
{
	exit;
}
if (obj_player.on_wall != 0 && (left || right))
{
	exit;	
}

var length = 15;
var angle_diff = random_range(-15, 15);
var xdiff = obj_player.x + lengthdir_x(length, ((obj_player.dash_dir - 180) + angle_diff));
var ydiff = (obj_player.y - (sprite_get_height(spr_player_collision_mask) / 2)) 
            + lengthdir_y(length, ((obj_player.dash_dir - 180) + angle_diff));

part_particles_create(particle_system, 
                      xdiff, 
					  ydiff, 
					  particle, 
					  1);

if (obj_player.player_state == obj_player.dash_state)
{
	alarm_set(1, 2);
}