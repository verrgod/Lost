/// @description player movement

switch (state)
{
	case "Move":
 		#region Move state
		// check if player in control during transition from level to level 
		if (hasControl)
		{	
			// Check keys for movement
			moveRight = keyboard_check(vk_right)
			moveLeft = keyboard_check(vk_left)
			keyJump = keyboard_check_pressed(vk_space);
			keySlide = keyboard_check_pressed(vk_shift);
			keyAttack = keyboard_check_pressed(ord("A"));
		}
		else
		{
			moveRight = 0;
			moveLeft = 0;
			keyJump = 0;
			keySlide = 0;
			keyAttack = 0;
		}
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
			sprite_index = spr_player_fall;
			image_speed = 0;
			if (sign(vSpeed) > 0) image_index = 0; else sprite_index = spr_player_idle;
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
		// jump sound effect
		if (keyJump) && (onFloor) audio_play_sound(sn_playerJump, 5, false);
		// change to slide state when player on ground
		if (keySlide) && (onFloor)
		{
			image_index = 0;
			state = "Slide";
		}
		// change to attack state when player on ground
		if (keyAttack) && (onFloor)
		{
			image_index = 0;
			state = "Attack";	
		}
		#endregion
		break;
		
	case "Slide":
		#region Slide state
		sprite_index = spr_player_slide;
		mask_index = spr_player_slide;
		
		if (sprite_index == spr_player_slide) 
		{
			if (!audio_is_playing(sn_playerSlide))
			{
				audio_play_sound(sn_playerSlide, 1, false);
			}
		}
		if image_xscale == 1 and not place_meeting(x + 6, y, obj_wall)
		{
			x += 6;
		}
	
		if image_xscale == -1 and not place_meeting(x - 6, y, obj_wall)
		{
			x -= 6;
		}	
		mask_index = spr_player_idle;
		#endregion
		break;
		
	case "Attack":
		#region Attack state
		if (sprite_index != spr_player_attack)
		{    
			sprite_index = spr_player_attack;
			image_index = 0;
			ds_list_clear(hitByAttack);
		}
		mask_index = spr_player_attackHitbox;
		var hitByAttackNow = ds_list_create();
		var hits = instance_place_list(x, y, obj_slime, hitByAttackNow, false);
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
						hp -= 2;
						flash = 3;
						hitFrom = obj_slime.direction;
					}
				}
			}
		}
		ds_list_destroy(hitByAttackNow);
		mask_index = spr_player_idle;
		#endregion
		break;
}