 /// @description player movement

//Check keys for movement
moveRight = keyboard_check(vk_right);
moveLeft = keyboard_check(vk_left);

vx = ((moveRight - moveLeft) * walkSpeed);

//If player idle
if (vx == 0)
{
	//change idle sprite based on previous direction
	switch dir
	{
		case 0: sprite_index = spr_player_idle_right; break;
		case 1: sprite_index = spr_player_idle_left; break;
	}
}

//If moving 
if (vx != 0) 
{
	x += vx;
	
	//Change idle to run sprite
	if (vx > 0)
	{
		//change to right
		sprite_index = spr_player_run_right;
		//keep direction value for idle animation
		dir = 0;
	}
	
	if (vx < 0)
	{
		//change to left
		sprite_index = spr_player_run_left; 
		dir = 1;
	}
}

	
