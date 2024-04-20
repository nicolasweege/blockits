/*
	if (global.is_paused)
	{
		exit;	
	}

	if (place_meeting(x,y,obj_player) && meeting = false)
	{
		//Make water fall down when colide
		// springs[(round(-((x - obj_player.x)) / WATERDIVISION))] -= 10 + obj_player.v_speed;
		springs[(round(-((x - obj_player.x)) / WATERDIVISION))] -= 20;
	
		//Changes waves speed 
		// spring_velocity[(round(-((x - obj_player.x)) / WATERDIVISION))] -= 10 + obj_player.v_speed;
		spring_velocity[(round(-((x - obj_player.x)) / WATERDIVISION))] -= 10;
	
		//Waves Spread
		spread = 0.25;
	
		meeting = true;
	} 
	else 
	{
		meeting = false;
	}


	for (var i = 0; i <= spring_count; i++)
	{
		var a = -k * springs[i] - d * spring_velocity[i];
		spring_velocity[i] += a;
		springs[i] += spring_velocity[i];
	}

	for (var i = 0; i <= spring_count; i++)
	{
		if (i > 0)
		{
			spring_delta_L[i] = spread * (springs[i] - springs[i - 1]);
			spring_velocity[i - 1] += spring_delta_L[i];
		}
	
		if (i < spring_count)
		{
			spring_delta_R[i] = spread * (springs[i] - springs[i + 1]);
			spring_velocity[i + 1] += spring_delta_R[i];
		}
	}

	for (var i = 0; i <= spring_count; i++)
	{
		if (i > 0)
		{
			springs[i - 1] += spring_delta_L[i];
		}
		if (i < spring_count)
		{
			springs[i + 1] += spring_delta_R[i];
		}
	}
*/