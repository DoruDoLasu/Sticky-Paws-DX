/// @func scr_cos_oscillate(min,max,duration,[position in microseconds])
function scr_cos_oscillate(_min, _max, _duration, _pos = get_timer())
{
	if (_duration == 0) _duration = math_get_epsilon();
	return((_max - _min) / 2 * dcos(360 * 0.000001 * _pos / _duration) + (_max + _min) / 2);
}