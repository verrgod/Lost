/// @description Insert description here
// You can write your code in this editor

// done is used to make sure that the slime (once dead) does not keep moving
if (done == 0)
{
	vSpeed += gravSpeed;

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
		// set done = 1 so that the sprite stops moving 
		if (vSpeed > 0)
		{
			done = 1;
		}
		while (!place_meeting(x, y + sign(vSpeed), obj_wall))
		{
			y += sign(vSpeed);
		}
		vSpeed = 0;
	}
	y += vSpeed;
}
