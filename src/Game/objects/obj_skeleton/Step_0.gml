/// @description Insert description here
// You can write your code in this editor

switch (state)
{
	case "Chase":
		#region Chase state
		vSpeed += gravSpeed;
		
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

		if (sprite_index != spr_skeleton_walk)
		{
			sprite_index = spr_skeleton_walk;
			image_index = 0;
		}
		
		if not (instance_exists(obj_player)) break;
		
		image_xscale = sign(obj_player.x - x);
		if (image_xscale == 0) image_xscale = 1;
		
		var directionFacing = image_xscale
		var distanceToPlayer = point_distance(x, y, obj_player.x, obj_player.y);
		if (distanceToPlayer <= attackRange)
		{
			image_index = 0;
			state = "Attack";
		}
		else
		{
			if not place_meeting(x + 1, y, obj_wall)
			{
				x += directionFacing * chaseSpeed;
			}
			else
			{
				image_index = 0;
				x -= 1;
			}
		}
		#endregion
		break;
	case "Attack":
		#region Attack state
		if (sprite_index != spr_skeleton_attack)
		{
			sprite_index = spr_skeleton_attack;
			image_index = 0;
		}
		#endregion
		break;
}