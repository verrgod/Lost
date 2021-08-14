/// @description animation end

// footstep sound effect
if (sprite_index == spr_player_run) audio_play_sound(sn_playerWalk, 1, false);

// setting slide state back to move state
if (state == "Slide") 
{
	image_index = 0;	
	state = "Move";
}
// setting attack state back to move state
if (state == "Attack")
{
	image_index = 0;
	state = "Move";
}
