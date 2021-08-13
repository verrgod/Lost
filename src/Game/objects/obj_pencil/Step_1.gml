/// @description follow player

x = obj_player.x - 5;
y = obj_player.y + 10;

// mouse aim
image_angle = point_direction(x, y, mouse_x, mouse_y);

firingDelay -= 1;
recoil = max(0, recoil - 1);

// when fired
if (mouse_check_button(mb_left)) && (firingDelay < 0)
{
	recoil = 3;
	firingDelay = 10;
	with (instance_create_layer(x, y, "Lead", obj_lead))
	{
		speed = 25;
		direction = other.image_angle;
		image_angle = direction;
	}
	
}

// recoil kickback 
x -= lengthdir_x(recoil, image_angle);
y -= lengthdir_y(recoil, image_angle);

