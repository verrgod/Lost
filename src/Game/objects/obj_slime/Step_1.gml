/// @description Insert description here
// You can write your code in this editor

if (hp <= 0)
{
	with(instance_create_layer(x, y, layer, obj_slimeDead))
	{
		direction = other.hitFrom;
		hSpeed = lengthdir_x(3, direction);
		vSpeed = lengthdir_y(3, direction) - 2;
		if (sign(hSpeed) != 0) image_xscale = sign(hSpeed);
	}
	
	instance_destroy();	
}