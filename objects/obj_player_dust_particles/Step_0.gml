if (!instance_exists(obj_player))
{
	exit;
}

part_emitter_region(particle_system, 
	                emitter, 
					obj_player.x - 10, obj_player.x + 10, 
					obj_player.y, obj_player.y, 
					ps_shape_diamond, 
					ps_distr_gaussian);
	
// part_emitter_burst(particle_system, emitter, particle, 1);