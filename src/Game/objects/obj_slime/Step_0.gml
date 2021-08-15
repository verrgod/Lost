/// @description slime movement

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

		if (sprite_index != spr_slime_move)
		{
			sprite_index = spr_slime_move;
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
		if (sprite_index != spr_slime_attack)
		{
			sprite_index = spr_slime_attack;
			image_index = 0;
			ds_list_clear(hitByAttack);
		}
		mask_index = spr_slime_attack;
		var hitByAttackNow = ds_list_create();
		var hits = instance_place_list(x, y, obj_player, hitByAttackNow, false);
		if (hits > 0)
		{
			for (var i = 0; i < hits; i++)
			{
				// if this instance has not yet been hit by this attack
				var hitId = hitByAttackNow[| i];
				if (ds_list_find_index(hitByAttack, hitId) == -1)
				{
					ds_list_add(hitByAttack, hitId);
					with (hitId)
					{
						hp -= 1;
						flash = 3;
						hitFrom = obj_player.direction;
					}
				}
			}
		}
		ds_list_destroy(hitByAttackNow);
		mask_index = spr_slime_idle;
		#endregion
		break;
		
	case "Idle":
		#region Idle state
		if (sprite_index != spr_slime_idle)
		{
			sprite_index = spr_slime_idle;
			image_index = 0;
		}
		#endregion
		break;
}