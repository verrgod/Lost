/// @description move to next room

with (obj_player)
{
	if (hasControl)
	{
		hasControl = false;
		SlideTransition(TRANS_MODE.GOTO, other.target);
	}
}

audio_sound_gain(sn_levelAmbience, 0, true);
