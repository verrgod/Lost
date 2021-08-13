/// @description slime movement

vSpeed += gravSpeed;

// check if slime on ground
onFloor = place_meeting(x, y + 1, obj_wall);

// horizontal collision
if (place_meeting(x + hSpeed, y, obj_wall))
{
	while (!place_meeting(x + sign(hSpeed), y, obj_wall))
	{
		x += sign(hSpeed);
	}
	hSpeed = -hSpeed;
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
	sprite_index = spr_slime_idle;
	image_speed = 0;
	if (sign(vSpeed) > 0) image_index = 0; else sprite_index = spr_player_fall;
}
else
{
	image_speed = 1;
	if (hSpeed == 0)
	{
		sprite_index = spr_slime_idle;
	}
	else
	{
		sprite_index = spr_slime_move;
	}
}

if (hSpeed != 0) image_xscale = sign(hSpeed);

	