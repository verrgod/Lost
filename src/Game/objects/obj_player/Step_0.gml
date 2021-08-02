  /// @description player movement

//Check keys for movement
moveRight = keyboard_check(vk_right);
moveLeft = keyboard_check(vk_left);
jump = keyboard_check_pressed(vk_space);

//Check if player is on ground
isGrounded = place_meeting(x, y + 1, obj_wall);

vx = ((moveRight - moveLeft) * walkSpeed);

//gravity
vy = vy + grv;

//if player idle
if (vx == 0)
{
	//change idle sprite based on previous direction
	switch dir
	{
		case 0: sprite_index = spr_player_idle_right; break;
		case 1: sprite_index = spr_player_idle_left; break;
	}
}

//if moving 
if (vx != 0) 
{
	x += vx;
	
	//Change idle to run sprite
	if (vx > 0)
	{
		//change sprite to right
		sprite_index = spr_player_run_right;
		//keep direction value for idle animation
		dir = 0;
	}
	
	if (vx < 0)
	{
		//change sprite to left
		sprite_index = spr_player_run_left; 
		dir = 1;
	}
}

// player footsteps
if (sprite_index == spr_player_run_left) || (sprite_index == spr_player_run_right)
{
	if (!audio_is_playing(sn_playerWalk))
	{
		audio_play_sound(sn_playerWalk, 1, false);
	}
}

//if player is in the air
if (!isGrounded)
{
	//change falling sprite based on previous direction
	switch dir
	{
		case 0: sprite_index = spr_player_fall_right; break;
		case 1: sprite_index = spr_player_fall_left; break;
	}
	
	// check if walking footstep is playing when player is in the air
	if (sprite_index == spr_player_fall_left) || (sprite_index == spr_player_fall_right)
	{
		// if player is not in falling state,
		// stop walking sound
		audio_stop_sound(sn_playerWalk);
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
if (isGrounded and jump)
{
	vy -= jumpHeight;
}

y += vy;

// jump sound effect
if (jump)
{
	audio_play_sound(sn_playerJump, 0, false);	
}
	