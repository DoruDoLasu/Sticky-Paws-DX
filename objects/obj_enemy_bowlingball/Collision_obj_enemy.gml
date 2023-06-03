#region /* Turn around */
if (die == false)
&& (sliding_along_ground == 0)
&& (other.die == false)
{
	if (!place_meeting(x, y, obj_bullet))
	&& (!place_meeting(x, y, obj_arrow))
	{
		while(place_meeting(x, y, other))
		{
			x += lengthdir_x(0.5, point_direction(other.x, other.y, x, y));
			y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
		}
	}
	if (position_meeting(bbox_left - 1, y, other))
	&& (!position_meeting(bbox_left - 1, y, obj_bullet))
	&& (!position_meeting(bbox_left - 1, y, obj_arrow))
	{
		image_xscale = +1;
	}
	if (position_meeting(bbox_right + 1, y, other))
	&& (!position_meeting(bbox_right + 1, y, obj_bullet))
	&& (!position_meeting(bbox_right + 1, y, obj_arrow))
	{
		image_xscale = -1;
	}
}
#endregion /* Turn around END */

if (sliding_along_ground == +1)
&& (other.die == false)
&& (die == false)
&& (die_volting == false)
&& (other.die_volting == false)
|| (sliding_along_ground == -1)
&& (other.die == false)
&& (die == false)
&& (die_volting == false)
&& (other.die_volting == false)
{
	if (other.x < x)
	{
		other.die = true;
		other.die_volting = +1;
		other.hspeed = +4;
		other.vspeed = -4;
		if (other.sliding_along_ground <> 0)
		{
			die = true;
			die_volting = -1;
			hspeed = -4;
			vspeed = -4;
		}
	}
	else
	{
		other.die = true;
		other.die_volting = -1;
		other.hspeed = -4;
		other.vspeed = -4;
		if (other.sliding_along_ground <> 0)
		{
			die = true;
			die_volting = +1;
			hspeed = +4;
			vspeed = -4;
		}
	}
}

if (die == false)
&& (die_volting == false)
&& (other.die_volting == false)
&& (other.speed > speed)
&& (other.flat)
&& (other.sliding_along_ground == 0)
{
	if (die_volting == false)
	{
		global.enemy_counter ++;
		if (other.x < x)
		{
			vspeed = - 8;
			die_volting = -1;
			die = true;
		}
		else
		{
			vspeed = - 8;
			die_volting = +1;
			die = true;
		}
		effect_create_above(ef_smoke, x, y, 2, c_white);
		if (asset_get_type("obj_player") == asset_object)
		&& (instance_exists(obj_player))
		{
			scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.5, 10);
		}
		
		scr_audio_play(choose(enemyvoice_defeated1, enemyvoice_defeated2, enemyvoice_defeated3), volume_source.voice);
		
		#region /* Rewards */
		
		#region /* 1 Coin */
		if (asset_get_type("obj_basic_collectible") == asset_object)
		{
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
			}
		}
		#endregion /* 1 Coin END */
		
		#region /* 200 Score */
		score += 200;
		if (asset_get_type("obj_score_up") == asset_object)
		{
			with(instance_create_depth(x, y, 0, obj_score_up))
			{
				score_up = 200;
			}
		}
		#endregion /* 200 Score END */
		
		#endregion /* Rewards END */
		
		audio_sound_pitch(snd_stomp, 1);
		scr_audio_play(snd_stomp, volume_source.sound);
	}
}