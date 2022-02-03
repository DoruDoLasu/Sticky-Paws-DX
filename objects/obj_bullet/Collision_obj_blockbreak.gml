/*Collision Event with player object*/
if (die = false)
{
	if (die_volting = false)
	{
		die = true;
		if (image_xscale < 0)
		{
			with(instance_create_depth(x, y, 0, obj_blaster_reward_decrease_mask))
			{
				image_xscale = +1;
			}
		}
		else
		if (image_xscale > 0)
		{
			with(instance_create_depth(x, y, 0, obj_blaster_reward_decrease_mask))
			{
				image_xscale = -1;
			}
		}
		global.enemy_counter += 1;
		if (other.x < x)
		{
			die_volting = - 1;
			vspeed = - 8;
		}
		else
		{
			die_volting = +1;
			vspeed = - 8;
		}
		effect_create_above(ef_smoke, x, y, 2, c_white);

		#region /*Enemy Voice Defeated*/
		audio_play_sound(choose(enemyvoice_defeated1,enemyvoice_defeated2,enemyvoice_defeated3), 0, 0);
		audio_sound_gain(enemyvoice_defeated1, global.voices_volume, 0);
		audio_sound_gain(enemyvoice_defeated2, global.voices_volume, 0);
		audio_sound_gain(enemyvoice_defeated3, global.voices_volume, 0);
		#endregion /*Enemy Voice Defeated END*/
		
		#region /*Rewards*/
		
		#region /* 1 Coin*/
		if (asset_get_type("obj_basic_collectible") == asset_object)
		{
			var obj;
			obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
			with(obj)
			{
				image_speed = 1;
				motion_set(90, 10);
				bounceup = true;
			}
		}
		#endregion /* 1 Coin END*/
		
		#region /* 200 Score*/
		score += 200;
		if (asset_get_type("obj_scoreup") == asset_object)
		{
			obj = instance_create_depth(x, y, 0, obj_scoreup);
			with(obj)
			{
				scoreup = 200;
			}
		}
		#endregion /* 200 Score END*/
		
		#endregion /*Rewards END*/
		
		if (asset_get_type("snd_stomp") == asset_sound)
		{
			audio_play_sound(snd_stomp, 0, 0);
			audio_sound_gain(snd_stomp, global.sfx_volume, 0);
			audio_sound_pitch(snd_stomp, 1);
		}
	}
}