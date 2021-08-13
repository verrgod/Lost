// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScreenShake(_magnitude, _frames){
	with (obj_camera)
	{
		if (_magnitude > shakeRemain)
		{
			shakeMagnitude = _magnitude;
			shakeRemain = _magnitude;
			shakeLength = _frames;
		}
	}
}