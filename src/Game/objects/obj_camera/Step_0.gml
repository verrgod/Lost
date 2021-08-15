/// @description update camera

// update destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
	
	if ((follow).object_index == obj_playerDead)
	{
		x =	xTo;
		y = yTo;
	}
}

// update object position
x += (xTo - x) / 25;
y += (yTo - y) / 25;

// keep camera center inside room 
x = clamp(x, view_w_half + buffer, room_width - view_w_half - buffer);
y = clamp(y, view_h_half + buffer, room_height - view_h_half - buffer);

// shake remain 
x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);
shakeRemain = max(0, shakeRemain - ((1 / shakeLength) * shakeMagnitude));

// update camera view 
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

if (layer_exists("MiddleTrees"))
{
	layer_x("MiddleTrees", x / 2);
}