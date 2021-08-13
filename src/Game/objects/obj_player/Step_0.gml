/// @description player movement

// Check keys for movement
moveRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
moveLeft = keyboard_check(vk_left) ||keyboard_check(ord("A"));
keyJump = keyboard_check_pressed(vk_space);

// calculate movement
var move = moveRight - moveLeft;

hSpeed = move * walkSpeed;

vSpeed += gravSpeed;

// check if player on ground
onFloor = place_meeting(x, y + 1, obj_wall);

if (place_meeting(x, y + 1, obj_wall)) && (keyJump)
{
	vSpeed -= 10;
}

// horizontal collision
if (place_meeting(x + hSpeed, y, obj_wall))
{
	while (!place_meeting(x + sign(hSpeed), y, obj_wall))
	{
		x += sign(hSpeed);
	}
	hSpeed = 0;
}
x += hSpeed;

// vertical collision
if (place_meeting(x, y + vSpeed, obj_wall))
{
	while (!place_meeting(x, y + sign(vSpeed), obj_wall))
	{
		y += sign(vSpeed);
	}
	vSpeed = 0;
}
y += vSpeed;

// sprite animation
if (!onFloor)
{
	sprite_index = spr_player_idle;
	image_speed = 0;
	if (sign(vSpeed) > 0) image_index = 0; else sprite_index = spr_player_fall;
}
else
{
	image_speed = 1;
	if (hSpeed == 0)
	{
		sprite_index = spr_player_idle;
	}
	else
	{
		sprite_index = spr_player_run;
	}
}

if (hSpeed != 0) image_xscale = sign(hSpeed);

	