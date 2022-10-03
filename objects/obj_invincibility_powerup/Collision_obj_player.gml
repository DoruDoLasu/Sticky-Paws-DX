#region /* Collect Invincibility Powerup */
if (bounceup == false)
{
	audio_sound_gain(global.music, 0, 0);
	audio_sound_gain(global.music_underwater, 0, 0);
	if (!audio_is_playing(snd_music_invincible))
	{
		scr_audio_play(snd_music_invincible, volume_source.music);
	}
	score += 1000;
	global.hud_show_score = true;
	if (asset_get_type("obj_camera") == asset_object)
	and (instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			hud_show_score_timer = global.hud_hide_time * 60;
		}
	}
	if (asset_get_type("obj_scoreup") == asset_object)
	{
		with(instance_create_depth(x, y, 0, obj_scoreup))
		{
			scoreup = 1000;
		}
	}
	with(other)
	{
		chain_reaction = 0;
		invincible = true;
		scr_audio_play(voice_get_star, volume_source.voice);
	}
	instance_destroy(); /* Delete after doing all other code */
}
#endregion /* Collect Invincibility Powerup END*/