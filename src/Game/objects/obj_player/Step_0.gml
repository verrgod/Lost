  /// @description player movement

//Check keys for movement
moveRight = keyboard_check(vk_right);
moveLeft = keyboard_check(vk_left);
jump = keyboard_check_pressed(vk_space);

//Check if player is on ground
isGrounded = place_meeting(x, y + 1, obj_wall);

//
vx = ((moveRight - moveLeft) * walkSpeed);

//gravity
vy = vy + grv;

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

//prevent clipping through walls
if place_meeting(x, y + vy, obj_wall)
{
	//if there is no wall
	while !place_meeting(x, y + sign(vy), obj_wall)
	{
		y += sign(vy);
	}
	
	vy = 0;
}

//jump action
if isGrounded and jump
{
	vy -= jumpHeight;
}

y += vy;