function scr_player_move_mid_air_jump()
{
	
	#region /* Mid-Air / Double Jumping */
	if (can_mid_air_jump > 0)
	{
		can_mid_air_jump --;
	}

	if (key_double_jump)
	&& (can_move)
	&& (global.pause == false)
	&& (global.equipped_upgrade_double_jump)
	&& (ground_pound == false)
	&& (climb == false)
	&& (horizontal_rope_climb == false)
	&& (stick_to_wall == false)
	&& (asset_get_type("obj_wall") == asset_object)
	&& (!place_meeting(x, y + 1, obj_wall))
	&& (asset_get_type("obj_semisolid_platform") == asset_object)
	&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	&& (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	&& (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	&& (in_water == false)
	&& (can_mid_air_jump == 0)
	{
		if (spring)
		&& (vspeed > - 20)
		|| (spring == false)
		{
			if (number_of_jumps >= 2)
			&& (midair_jumps_left > 0)
			|| (number_of_jumps <= -1)
			{
				buffer_jump = 0;
				dive = false;
				if (!place_meeting(x, y -double_jump_height, obj_wall))
				{
					vspeed = -double_jump_height;
				}
				else
				if (!place_meeting(x, y - 4, obj_wall))
				{
					vspeed = -4;
				}
				else
				{
					vspeed = 0;
				}
				scr_audio_play(voice_jump, volume_source.voice);
				effect_create_above(ef_smoke, x - 16,bbox_bottom, 0, c_white);
				effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
				effect_create_above(ef_smoke, x + 16,bbox_bottom, 0, c_white);
				image_index = 0;
		
				if (number_of_jumps > - 1)
				&& (midair_jumps_left != number_of_jumps)
				{
					midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
					if (number_of_jumps >= 3)
					&& (midair_jumps_left < number_of_jumps)
					{
						with(instance_create_depth(x, bbox_bottom, 0, obj_score_up))
						{
							score_up = instance_nearest(x, y, obj_player).midair_jumps_left; /* If the player can do 3 jumps, show that */
							not_score = true;
							show_remaining_jumps = true;
						}
					}
				}
				else
				{
					midair_jumps_left = clamp(midair_jumps_left - 2, 0, number_of_jumps);
					if (number_of_jumps >= 3)
					&& (midair_jumps_left < number_of_jumps)
					{
						with(instance_create_depth(x, bbox_bottom, 0, obj_score_up))
						{
							score_up = instance_nearest(x, y, obj_player).midair_jumps_left; /* If the player can do 3 jumps, show that */
							not_score = true;
							show_remaining_jumps = true;
						}
					}
				}
		
				#region /* Mid-air flip animation */
				if (midair_jumps_left >= midair_jump_flip_animation)
				|| (number_of_jumps = 2)
				&& (midair_jump_flip_animation >= 2)
				{
					if (image_xscale > 0)
					{
						angle = +360;
					}
					else
					{
						angle = -360;
					}
				}
				#endregion /* Mid-air flip animation END */
		
			}
		}
	}
	#endregion /* Mid-Air / Double Jumping END */
	
	#region /* Recharge mid-air / double jump when landing on ground */
	if (on_ground)
	{
		if (vspeed >= 0)
		{
			midair_jumps_left = number_of_jumps;
		}
	}
	#endregion /* Recharge mid-air / double jump when landing on ground END */
	
}