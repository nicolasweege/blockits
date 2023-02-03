function ease_in_and_out(time, _begin, change, duration)
{
	time /= (duration / 2);
	
	if (time < 1)
	{
		return (((change / 2) * (time * time)) + _begin);
	}
	
	time--;
	return (((-change / 2) * ((time * (time - 2)) -1)) + _begin);
}

function ease_bounce(time, _begin, change, duration)
{
	var s = 1.7;
	var p = 0;
	var a = change;
	
	if (time == 0)
	{
		return _begin;	
	}
	
	time /= duration;
	
	if (time == 1)
	{
		return _begin + change;	
	}
	
	if (!p)
	{
		p = (duration * 0.1);
	}
	
	if (a < abs(change))
	{
		a = change;
		s = (p / 4);
	}
	else
	{
		s = (p / ((2 * pi) * arcsin(change/a)));
	}
	
	return a * power(2, -10*time) * sin((time*duration - s) * 
	       (2*pi) / p) + change + _begin;
}