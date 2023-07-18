if (!instance_exists(obj_player))
{
	exit;	
}

part_emitter_region(particle_system, snow_emitter, 
                    obj_player.x - (global.cam_width / 2), obj_player.x + (global.cam_width / 2), 
					obj_player.y - (global.cam_width / 2), obj_player.y + (global.cam_width / 2),
					ps_shape_rectangle, ps_distr_linear);