if (!instance_exists(obj_player))
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