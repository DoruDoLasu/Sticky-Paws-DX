/* Platformer Player Part 1 */

#region /* Only update audio listener position and velocity when the player is moving */
if (speed > 0)
{
	audio_listener_position(x, y, 0);
	audio_listener_velocity(abs(hspeed), abs(vspeed), 0);
}
#endregion /* Only update audio listener position and velocity when the player is moving END */

if (current_file != global.file)
{
	current_file = global.file;
	room_persistent = false; /* Turn OFF Room Persistency */
	global.quit_level = true;
	global.quit_to_map = true;
}

scr_player_move_save_whole_level_as_screenshot();

scr_player_move_choose_voice_clips();

room_speed = global.max_fps; /* Room Speed */

scr_start_intro_animations();

#region /* Restart Level */
if (global.restart_level == true)
{
	global.restart_level = false;
	global.quit_level = false;
	audio_stop_all();
	room_persistent = false; /* Turn OFF Room Persistency */
	
	#region /* Reset timer back to zero */
	global.timeattack_realmillisecond = 0;
	global.timeattack_millisecond = 0;
	global.timeattack_second = 0;
	global.timeattack_minute = 0;	
	#endregion /* Reset timer back to zero END */
	
	score = 0;
	
	room_restart();
}
#endregion /* Restart Level END */

#region /* Quit Level */
if (global.quit_level == true)
{
	audio_stop_all();
	room_persistent = false; /* Turn OFF Room Persistency */
	
	#region /* Reset timer back to zero */
	global.timeattack_realmillisecond = 0;
	global.timeattack_millisecond = 0;
	global.timeattack_second = 0;
	global.timeattack_minute = 0;	
	#endregion /* Reset timer back to zero END */
	
	score = 0;
	
	scr_save_level();
	
	if (global.quit_to_map || global.quit_to_title)
	{
		if (!instance_exists(obj_camera.player1))
			global.player1_can_play = false;
		
		if (!instance_exists(obj_camera.player2))
			global.player2_can_play = false;
		
		if (!instance_exists(obj_camera.player3))
			global.player3_can_play = false;
		
		if (!instance_exists(obj_camera.player4))
			global.player4_can_play = false;
		
		global.quit_level = false;
		
		if (global.quit_to_map)
			room_goto(room_world_map);
		else
			room_goto(room_title);
		
		/* Only set these to false after going to room */
		global.quit_to_map = false;
		global.quit_to_title = false;
	}
}
#endregion /* Quit Level END */

#region /* Play Ambience */
if (!audio_is_playing(global.ambience))
{
	scr_audio_play(global.ambience, volume_source.ambient);
	audio_sound_gain(global.ambience, global.volume_ambient * global.volume_main, 0);
}
#endregion /* Play Ambience END */

#region /* Play Underwater Ambience */
if (!audio_is_playing(global.ambience_underwater))
{
	scr_audio_play(global.ambience_underwater, volume_source.ambient);
	audio_sound_gain(global.ambience_underwater, 0, 0);
}
#endregion /* Play Underwater Ambience END */

#region /* Music Pitch */
if (global.time_countdown < 100)
&& (global.enable_time_countdown == true)
&& (allow_timeup == true)
{
	audio_sound_pitch(global.music, music_pitch + 0.3);
	audio_sound_pitch(global.music_underwater, music_pitch + 0.3);
	if (crouch == true)
	|| (ground_pound == true)
	&& (place_meeting(x, y + sprite_height, obj_wall))
	{
		music_pitch = lerp(music_pitch, 0.95, 0.001);
	}
	else
	{
		music_pitch = lerp(music_pitch, 1, 0.01);
	}
}
else
{
	audio_sound_pitch(global.music, music_pitch);
	audio_sound_pitch(global.music_underwater, music_pitch);
	if (crouch == true)
	|| (ground_pound == true)
	&& (place_meeting(x, y + sprite_height, obj_wall))
	{
		music_pitch = lerp(music_pitch, 0.95, 0.001);
	}
	else
	{
		music_pitch = lerp(music_pitch, 1, 0.01);
	}
}
#endregion /* Music Pitch END */

#region /* Make sure the heart stays on the character if you spawn from a checkpoint */
if (instance_exists(obj_checkpoint))
&& (place_meeting(x, y, obj_checkpoint))
&& (instance_exists(obj_camera))
&& (place_meeting(x, y, obj_camera))
{
	if (obj_camera.iris_xscale < 0.3)
	|| (obj_camera.iris_yscale < 0.3)
	{
			
		xx_heart = x;
		yy_heart = y;
	}
}
#endregion /* Make sure the heart stays on the character if you spawn from a checkpoint END */

#region /* Winning the level and transitioning to the next area */
if (!place_meeting(x, y, obj_checkpoint))
&& (instance_exists(obj_camera))
&& (obj_camera.iris_xscale < 3)
{
	
	#region /* Don't go outside view boundary */
	if (goal == true)
	&& (global.time_countdown_bonus <= 0)
	{
		global.level_clear_rate = "clear"; /* Set the level_clear_rate to clear as soon as you get the goal */
		if (instance_exists(obj_camera))
		&& (obj_camera.iris_xscale <= 0.01)
		{
			if (obj_camera.iris_yscale <= 0.001)
			{
				audio_stop_all();
				global.checkpoint_x = 0;
				global.checkpoint_y = 0;
				global.checkpoint_millisecond = 0;
				global.checkpoint_second = 0;
				global.checkpoint_minute = 0;
				global.checkpoint_realmillisecond = 0;
				global.lives_until_assist = 0;
				scr_save_level(); /* Important that you save all level information here, before going back to map screen, but after setting level_clear_rate to clear */
				if (global.actually_play_edited_level == false)
				&& (global.play_edited_level == true)
				&& (global.character_select_in_this_menu == "level_editor")
				{
					global.actually_play_edited_level = false;
					global.play_edited_level = false;
					room_restart();
				}
				else
				if (global.actually_play_edited_level == true)
				&& (global.play_edited_level == true)
				&& (global.character_select_in_this_menu == "level_editor")
				{
					global.actually_play_edited_level = false;
					global.play_edited_level = false;
					if (!instance_exists(obj_camera.player1))
					{
						global.player1_can_play = false;
					}
					if (!instance_exists(obj_camera.player2))
					{
						global.player2_can_play = false;
					}
					if (!instance_exists(obj_camera.player3))
					{
						global.player3_can_play = false;
					}
					if (!instance_exists(obj_camera.player4))
					{
						global.player4_can_play = false;
					}
					room_goto(room_title);
				}
				else
				if (obj_camera.after_goal_go_to_this_level >= 0)
				{
					global.select_level_index = obj_camera.after_goal_go_to_this_level;
					scr_update_all_backgrounds();
					if (!instance_exists(obj_camera.player1))
					{
						global.player1_can_play = false;
					}
					if (!instance_exists(obj_camera.player2))
					{
						global.player2_can_play = false;
					}
					if (!instance_exists(obj_camera.player3))
					{
						global.player3_can_play = false;
					}
					if (!instance_exists(obj_camera.player4))
					{
						global.player4_can_play = false;
					}
					room_goto(room_leveleditor);
				}
				else
				{
					if (!instance_exists(obj_camera.player1))
					{
						global.player1_can_play = false;
					}
					if (!instance_exists(obj_camera.player2))
					{
						global.player2_can_play = false;
					}
					if (!instance_exists(obj_camera.player3))
					{
						global.player3_can_play = false;
					}
					if (!instance_exists(obj_camera.player4))
					{
						global.player4_can_play = false;
					}
					room_goto(room_world_map);
				}
			}
			else
			{
				if (x > room_width + 32)
				{
					x = room_width + 32;
					hspeed = 0;
					vspeed = 0;
					friction = 500;
					visible = false;
				}
			}
		}
	}
	#endregion /* Don't go outside view boundary END */
	
	else
	{
		
		#region /* Don't go outside view */
		if (x < camera_get_view_x(view_camera[view_current]))
		&& (instance_number(obj_player) >= 2)
		&& (intro_animation = "")
		{
			x = camera_get_view_x(view_camera[view_current]);
		}
		if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		&& (instance_number(obj_player) >= 2)
		&& (intro_animation = "")
		{
			x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]);
		}
		#endregion /* Don't go outside view END */
		
		#region /* Don't go outside room */
		if (intro_animation = "")
		{
			if (x < 0)
			{
				x = 0;
			}
			if (x > room_width)
			{
				x = room_width;
			}
			if (y < - 64)
			{
				y = -64;
			}
		}
		#endregion /* Don't go outside room END */
		
	}
}
else
{
	
	#region /* Don't go outside view */
	if (x < camera_get_view_x(view_camera[view_current]))
	&& (instance_number(obj_player) >= 2)
	&& (intro_animation = "")
	&& (global.player_can_go_outside_view == false)
	{
		x = camera_get_view_x(view_camera[view_current]);
	}
	if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
	&& (instance_number(obj_player) >= 2)
	&& (intro_animation = "")
	&& (global.player_can_go_outside_view == false)
	{
		x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]);
	}
	#endregion /* Don't go outside view END */
	
	#region /* Don't go outside room */
	if (intro_animation = "")
	{
		if (x < 0)
		{
			x = 0;
		}
		if (x > room_width)
		{
			x = room_width;
		}
		if (y < - 64)
		{
			y = -64;
		}
	}
	#endregion /* Don't go outside room END */
	
}
#endregion /* Winning the level and transitioning to the next area END */

#region /* Don't let the player outside the view too much when winning */
if (goal == true)
{
	if (x < camera_get_view_x(view_camera[view_current]) - 32)
	{
		x = camera_get_view_x(view_camera[view_current]) - 32;
		if (hspeed < 0)
		{
			hspeed = 0;
		}
	}
	if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 32)
	{
		x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 32;
		if (hspeed > 0)
		{
			hspeed = 0;
		}
	}
	if (y <- 64)
	{
		y = - 64;
	}
	if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 32)
	{
		y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 32;
		if (vspeed > 0)
		{
			vspeed = 0;
		}
		gravity = 0;
	}
}
#endregion /* Don't let the player outside the view too much when winning END */

if (hspeed != 0)
{
	hspeed_dir = sign(hspeed);
}

scr_toggle_fullscreen();

#region /* Assist Invincible */
if (assist_invincible == true)
{
	if (hp <= 0)
	{
		hp = 1;
	}
	invincible_timer = true;
	audio_stop_sound(music_invincible);
	if (key_jump_hold)
	{
		if (!place_meeting(x, y + 1, obj_wall))
		&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		&& (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
		&& (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
		&& (dive == false)
		&& (ground_pound == false)
		&& (crouch == false)
		&& (vspeed > 1)
		{
			vspeed = +1;
			crouch = false;
			can_ground_pound = false;
		}
	}
}
#endregion /* Assist Invincible END */

#region /* If Assist delault hp is invincible, stay invincible */
if (global.assist_enable == true)
&& (global.assist_invincible == true)
&& (hp < max_hp)
{
	hp = max_hp;
}
#endregion /* If Assist delault hp is invincible, stay invincible END */

scr_player_move_customizable_controls();

/* Sets up what the buttons do */

#region /* If controller gets disconnected during gameplay, pause the game */
if (player == 1)
&& (gamepad_is_connected(global.player1_slot))
|| (player == 2)
&& (gamepad_is_connected(global.player2_slot))
|| (player == 3)
&& (gamepad_is_connected(global.player3_slot))
|| (player == 4)
&& (gamepad_is_connected(global.player4_slot))
{
	controller_connected = true;
}
#endregion /* If controller gets disconnected during gameplay, pause the game END */

#region /* If player is allowed to move */
if (can_move == true)
{
	
	scr_player_move_pause();
	
	#region /* Save to variable when on ground */
	if (place_meeting(x, y + 1, obj_wall) /* If there is wall underneath */)
	|| (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform) /* If there is semisolid platform underneath */)
	|| (position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform) /* If there is semisolid platform underneath */)
	|| (position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform) /* If there is semisolid platform underneath */)
	{
		on_ground = true;
	}
	else
	{
		on_ground = false;
	}
	#endregion /* Save to variable when on ground */
	
	scr_player_move_go_left();
	
	scr_player_move_go_right();
	
}
#endregion /* If player is allowed to move END */

#region /* If player has finished the level, make the player run off to the right off screen, and disable player control */
if (goal == true)
&& (global.time_countdown_bonus <= 0)
{
	if (!place_meeting(x + 1, y, obj_wall))
	{
		hspeed += 0.3;
	}
	//can_move = false;
	if (hspeed > 0)
	{
		image_xscale = +1;
	}
}
#endregion /* If player has finished the level, make the player run off to the right off screen, and disable player control END */

scr_player_move_sprint();

scr_player_move_double_tap_direction_to_run();

scr_player_move_double_tap_direction_to_dive();

#region /* Set the friction */
if (on_ground == true)
{
	if (speed > 0)
	{
		if (place_meeting(x, y + 1, obj_ice_block))
		{
			if (key_left_hold)
			|| (key_right_hold)
			|| (goal == true)
			{
				friction = 0.01;
			}
			else
			{
				friction = 0.02;
			}
		}
		else
		{
			if (key_left_hold)
			|| (key_right_hold)
			|| (goal == true)
			{
				friction = 0.1;
			}
			else
			{
				friction = 0.2;
			}
		}
	}
}
else
{
	friction = 0;
}
#endregion /* Set the friction END */

scr_player_move_jumping();

scr_player_move_triple_jump();

scr_player_move_mid_air_jump();

#region /* Do a small jump when releasing the jump button */
if (key_jump_released)
&& (!key_always_do_full_jump)
&& (spring == false)
{
	if (vspeed < 0) /* When still traveling up */
	{
		vspeed /= 2; /* Divide the vertical speed by half */
	}
}
#endregion /* Do a small jump when releasing the jump button END */

#region /* Fall faster */
if (vspeed > 0)
{
	vspeed += 0.4;
}
#endregion /* Fall faster END */

#region /* Set the gravity */
gravity_direction = 270; /* Direction of the gravity */
if (!place_meeting(x, y + 1, obj_wall))
&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
&& (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
&& (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
&& (climb == false)
&& (horizontal_rope_climb == false)
{
	gravity = 0.5; /* The gravity */
}
else
{
	gravity = 0;
}
#endregion /* Set the gravity END */

#region /* Limits the horizontal speed */
if (abs(hspeed) > speed_max)
{
	hspeed -= 0.4 * sign(hspeed);
}
#endregion /* Limits the horizontal speed END */

#region /* Limits the vertical speed */
if (place_meeting(x, y + 32, obj_semisolid_platform))
|| (place_meeting(x, y + 16, obj_semisolid_platform))
|| (place_meeting(x, y + 8, obj_semisolid_platform))
|| (place_meeting(x, y + 1, obj_semisolid_platform))
{
	if (vspeed > 8)
	{
		vspeed = + 8;
	}
}
else
{
	if (ground_pound == true)
	{
		if (vspeed > 30)
		{
			vspeed = +30;
		}
	}
	else
	if (key_jump_hold)
	{
		if (vspeed > 17)
		{
			vspeed = +17;
		}
	}
	else
	{
		if (vspeed > 20)
		{
			vspeed = +20;
		}
	}
}
#endregion /* Limits the vertical speed END */

#region /* Bottomless Pit */
/* Don't stop horizontal speed, as it feels awkward when falling down */
if (bbox_top > room_height + 200)
&& (goal == false)
&& (global.goal_active == false)
{
	die = true;
}
#endregion /* Bottomless Pit END */

#region /* Stuck inside a wall */
if (position_meeting(x, y, obj_wall))
&& (can_collide_with_wall == true)
{
	stuck_in_wall_counter ++;
	if (stuck_in_wall_counter > 6)
	&& (global.goal_active == false)
	{
		die = true;
	}
}
else
{
	if (stuck_in_wall_counter > 0)
	{
		stuck_in_wall_counter --;
	}
}

if (position_meeting(x, bbox_top + 8, obj_wall))
&& (position_meeting(x, bbox_bottom - 8, obj_wall))
{
	die = true; /* If there is solid ground above and underneath you, you are probably getting flattened */
}
#endregion /* Stuck inside a wall END */

#region /* ________________________________MORE MOVES________________________________ */

scr_player_move_tongue();

scr_player_move_roll_when_landing();

#region /* Chain Reaction Reset */
if (on_ground == true)
{
	if (invincible_timer <= false)
	{
		chain_reaction = 0;
	}
}
if (assist_invincible == true) /* You can never get chain reactions when you have assist invincibility */
{
	chain_reaction = 0;
}
#endregion /* Chain Reaction Reset END */

scr_player_move_wall_jump_and_wall_climb();

scr_player_move_ground_pound();

scr_player_move_dive();

scr_player_move_throw_items_in_hands();

#region /* Can Attack After Dive On Ground */
if (on_ground == true)
{
	if (can_attack_after_dive_on_ground > 0)
	{
		can_attack_after_dive_on_ground --;
		if (key_jump)
		{
			can_attack_after_dive_on_ground = false;
		}
	}
}
#endregion /* Can Attack After Dive On Ground END */

scr_player_move_dive_ground_boost();

scr_player_move_ledge_grab();

#region /* Put sprite angle at right angle */
if (angle <- 360)
{
	angle += 16;
}
else
if (angle >+ 360)
{
	angle -= 16;
}
else
if (ground_pound == true)
{
	angle = lerp(angle, 0, 0.2);
}
else
{
	if (!place_meeting(x, y + 1, obj_wall))
	&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	&& (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	&& (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	&& (vspeed > 0)
	{
		if (key_left_hold)
		&& (!key_right_hold)
		{
			angle = lerp(angle, 0 + 10, 0.1);
		}
		else
		if (key_right_hold)
		&& (!key_left_hold)
		{
			angle = lerp(angle, 0 - 10, 0.1);
		}
		else
		{
			angle = lerp(angle, 0, 0.1);
		}
	}
	else
	{
		angle = lerp(angle, 0, 0.1);
	}
}
#endregion /* Put sprite angle at right angle */

if (in_water == true)
{
	if (global.music_underwater > 0)
	{
		audio_sound_gain(global.music, 0, 0);
		audio_sound_gain(global.music_underwater, global.volume_music * global.volume_main, 0);
	}
	else
	if (global.music > 0)
	{
		audio_sound_gain(global.music, global.volume_music * global.volume_main, 0);
		audio_sound_gain(global.music_underwater, 0, 0);
	}
	if (global.ambience_underwater > 0)
	{
		audio_sound_gain(global.ambience, 0, 0);
		audio_sound_gain(global.ambience_underwater, global.volume_ambient * global.volume_main, 0);
	}
	else
	if (global.ambience > 0)
	{
		audio_sound_gain(global.ambience, global.volume_ambient * global.volume_main, 0);
		audio_sound_gain(global.ambience_underwater, 0, 0);
	}
}
else
{
	if (global.music > 0)
	{
		audio_sound_gain(global.music, global.volume_music * global.volume_main, 0);
		audio_sound_gain(global.music_underwater, 0, 0);
	}
	if (global.ambience > 0)
	{
		audio_sound_gain(global.ambience, global.volume_ambient * global.volume_main, 0);
		audio_sound_gain(global.ambience_underwater, 0, 0);
	}
}

scr_player_move_swimming_in_water();

scr_player_move_drowning();

#region /* Water Splash Effect */
if (in_water != old_in_water)
{
	
	#region /* Jump out of water */
	if (key_jump_hold)
	&& (in_water == false)
	&& (vspeed > -normal_jump_height)
	{
		vspeed = -normal_jump_height;
		
		#region /* Jump sound effect */
		scr_audio_play(snd_jump, volume_source.sound);
		scr_audio_play(snd_swim, volume_source.sound);
		#endregion /* Jump sound effect END */
		
	}
	#endregion /* Jump out of water END */
	
	old_in_water = in_water;
	
	instance_create_depth(x, y, 0, obj_water_splash);
	repeat(10)
	{
		with(instance_create_depth(x, bbox_top, 0, obj_water_splash_particle))
		{
			direction = random_range(0, 180);
			speed = random_range(2, 10);
		}
	}
}
#endregion /* Water Splash Effect END */

#region /* Speedup to Dashspeed */
if (abs(hspeed) > 7)
&& (invincible_timer >= true)
&& (power_meter_running_sound == true)
{
	speedunit += 2;
	if (speedunit > 100)
	{
		speedunit = 100;
		if (on_ground == true)
		{
			speed_dash = true;
		}
	}
}
else
{
	speedunit --;
	if (speedunit < 0)
	{
		speedunit = 0;
	}
	speed_dash = false;
}
#endregion /* Speedup to Dashspeed END */

#region /* Health Handeling */
if (taken_damage > 0)
{
	taken_damage -= 0.5;
}

#region /* Make the player die if you have 0 HP */
if (hp <= 0)
&& (global.goal_active == false)
{
	die = true;
}
#endregion /* Make the player die if you have 0 HP END */

#region /* Don't gain more HP than your max HP */
if (hp > max_hp)
{
	if (allow_overflow_hp == true)
	{
		overflow_hp ++;
		if (overflow_hp >= max_overflow_hp)
		{
			max_hp ++;
			overflow_hp = 0;
		}
	}
	hp = max_hp;
}
#endregion /* Don't gain more HP than your max HP END */

#endregion /* Health Handeling END */

#region /* Burnt */
if (asset_get_type("obj_lava") == asset_object)
&& (place_meeting(x, y, obj_lava))
{
	if (allow_survive_lava == true)
	&& (hp > 0)
	{
		burnt = true;
		dive = false;
		ground_pound = false;
		stick_to_wall = false;
		crouch = false;
		speed_max = 8;
		taken_damage = 100;
		if (invincible_timer <= false)
		{
			scr_audio_play(voice_burned, volume_source.voice);
			hp --;
		}
		if (invincible_timer >= true)
		{
			scr_audio_play(voice_burned, volume_source.voice);
		}
		if (vspeed > 0)
		{
			vspeed = -15;
		}
	}
	else
	if (global.goal_active == false)
	{
		die = true;
	}
}
if (burnt == true)
{
	effect_create_above(ef_smoke, x, bbox_bottom, 0, c_black);
	if (on_ground == true)
	{
		scr_audio_play(voice_burned_running, volume_source.voice);
		burnt = 2;
		dive = false;
		ground_pound = false;
		crouch = false;
		speed_max = 8;
		vspeed = -7.5;
	}
}
else
if (burnt == 2)
{
	effect_create_above(ef_smoke, x, bbox_bottom, 0, c_black);
	if (on_ground == true)
	{
		burnt = false;
	}
}
#endregion /* Burnt END */

#region /* If you touch spikes, take damage */
if (instance_exists(obj_spikes))
{
	if (place_meeting(x - 1, y, obj_spikes))
	|| (place_meeting(x + 1, y, obj_spikes))
	|| (place_meeting(x, y - 1, obj_spikes))
	|| (place_meeting(x, y + 1, obj_spikes))
	{
		if (taken_damage < 1)
		&& (assist_invincible == false)
		&& (invincible_timer <= false)
		{
			if (have_heart_balloon == true)
			{
				have_heart_balloon = false;
				
				#region /* Save heart balloon to be false */
				if (player == 1)
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player1_have_heart_balloon", false);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				if (player == 2)
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player2_have_heart_balloon", false);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				if (player == 3)
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player3_have_heart_balloon", false);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				if (player == 4)
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player4_have_heart_balloon", false);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				#endregion /* Save heart balloon to be false END */
				
			}
			else
			{
				hp --;
			}
			taken_damage = 100;
		}
	}
}
#endregion /* If you touch spikes, take damage END */

#region /* Invincible Music */
if (invincible_timer >= true)
&& (assist_invincible == false)
{
	invincible_timer --;
	if (!audio_is_playing(music_invincible))
	{
		scr_audio_play(music_invincible, volume_source.music);
		audio_sound_gain(global.music, 0, 0);
		audio_sound_gain(global.music_underwater, 0, 0);
	}
	else
	if (audio_is_playing(music_invincible))
	{
		audio_sound_gain(global.music, 0, 0);
		audio_sound_gain(global.music_underwater, 0, 0);
	}
}
else
{
	if (invincible_timer <= false)
	{
		audio_stop_sound(music_invincible);
	}
	
	if (!audio_is_playing(global.music))
	{
		if (!audio_is_playing(snd_hurry_up))
		{
			scr_audio_play(global.music, volume_source.music);
			if (audio_is_playing(global.loading_music))
			{
				audio_stop_sound(global.loading_music);
			}
		}
	}
	if (!audio_is_playing(global.music_underwater))
	{
		if (!audio_is_playing(snd_hurry_up))
		{
			scr_audio_play(global.music_underwater, volume_source.music);
			if (audio_is_playing(global.loading_music))
			{
				audio_stop_sound(global.loading_music);
			}
		}
	}
}
#endregion /* Invincible Music END */

#region /* Time */
if (goal == false)
{
	if (global.time_countdown == 0)
	&& (global.enable_time_countdown == true)
	&& (allow_timeup == true)
	&& (global.player_has_entered_goal == false)
	&& (global.goal_active == false)
	{
		die = true;
	}
	if (instance_exists(obj_camera))
	&& (obj_camera.hurry_up_message_timer == 1)
	&& (global.enable_time_countdown == true)
	{
		if (!audio_is_playing(snd_hurry_up))
		{
			scr_audio_play(snd_hurry_up, volume_source.sound);
		}
		if (audio_is_playing(snd_hurry_up))
		{
			audio_stop_sound(global.music);
			audio_stop_sound(global.music_underwater);
		}
	}
}
else
{
	if (global.time_countdown_bonus > 0)
	{
		if (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_score_timer = global.hud_hide_time * 60;
			}
		}
		if (global.time_countdown_bonus > 3)
		{
			global.time_countdown_bonus -= 3;
			score += 150;
		}
		else
		{
			global.time_countdown_bonus --;
			score += 50;
		}
		if (!audio_is_playing(snd_beep))
		{
			scr_audio_play(snd_beep, volume_source.sound);
		}
	}
	if (global.time_countdown_bonus == 0)
	{
		if (audio_is_playing(snd_beep))
		{
			audio_stop_sound(snd_beep);
		}
	}
	with(obj_enemy)
	{
		instance_destroy();
	}
}
#endregion /* Time END */

scr_player_move_goal();

scr_player_move_homing_attack();

if (vspeed > 0)
{
	stomp_spin = false;
}

scr_player_move_spring();

#endregion /* ________________________________MORE MOVES________________________________ */

/* Platformer Player Part 2 */
#region /* ________________________________Handling the sprites and sounds in the step event________________________________ */
draw_xscale = lerp(draw_xscale, 1, 0.2); /* Make horizontal stretching slowly reset back to 1 */
draw_yscale = lerp(draw_yscale, 1, 0.2); /* Make vertical stretching slowly reset back to 1 */

if (sprite_index == sprite_jump)
|| (sprite_index == sprite_stand)
|| (sprite_index == sprite_run)
|| (sprite_index == sprite_run2)
|| (sprite_index == sprite_run3)
|| (sprite_index == sprite_run4)
{
	jump_transition_to_fall_animation = 0;
}

#region /* A bump sound effect if a player walks into a wall to let them know that they they hit a wall */

#region /* Left */
if (key_left_hold)
&& (!key_right_hold)
&& (place_meeting(x - 1, y, obj_wall))
&& (climb == false)
&& (stick_to_wall == false)
{
	if (on_ground == true)
	{
		if (!audio_is_playing(snd_bump))
		{
			scr_audio_play(snd_bump, volume_source.sound);
		}
	}
}
#endregion /* Left END */

#region /* Right */
if (!audio_is_playing(snd_bump))
&& (!key_left_hold)
&& (climb == false)
&& (key_right_hold)
&& (on_ground == true)
&& (place_meeting(x + 1, y, obj_wall))
&& (stick_to_wall == false)
{
	scr_audio_play(snd_bump, volume_source.sound);
}
#endregion /* Right END */

#endregion /* A bump sound effect if a player walks into a wall to let them know that they they hit a wall END */

if (!place_meeting(x, y, obj_vine))
{
	climb = false;
}
if (!place_meeting(x, y, obj_horizontal_rope))
{
	horizontal_rope_climb = false;
}

#region /* Climb Horizontal Rope */
if (can_climb_horizontal_rope_cooldown > 0)
{
	can_climb_horizontal_rope_cooldown --;
}

if (place_meeting(x, y, obj_horizontal_rope))
{
	var nearest_horizontal_rope = instance_nearest(x, y, obj_horizontal_rope);
	if (!instance_position(nearest_horizontal_rope.x, nearest_horizontal_rope.y + 64, obj_wall)) /*If there is no wall underneath the horizontal rope, then it's safe to grab onto the horizontal rope*/
	&& (!instance_position(nearest_horizontal_rope.x, nearest_horizontal_rope.y + 32, obj_wall))
	&& (!instance_position(nearest_horizontal_rope.x, nearest_horizontal_rope.y + 16, obj_wall))
	&& (!place_meeting(x, y + 1, obj_wall))
	&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	&& (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	&& (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	&& (in_water == false)
	&& (hold_item_in_hands == "")
	{
		if (horizontal_rope_climb == false)
		&& (can_climb_horizontal_rope_cooldown <= 0)
		{
			midair_jumps_left = number_of_jumps;
			horizontal_rope_climb = true;
			jump_transition_to_fall_animation = 0;
			climb = false;
			jump = 0;
			spring = false;
			scr_audio_play(snd_catch_ivy, volume_source.sound); /* Make a sound effect that you have started cimbing */
			scr_audio_play(voice_rope_catch, volume_source.voice);
		}
		if (horizontal_rope_climb == true)
		{
			if (!place_meeting(x - 32, y, obj_horizontal_rope))
			&& (hspeed < 0)
			|| (!place_meeting(x + 32, y, obj_horizontal_rope))
			&& (hspeed > 0)
			{
				hspeed = 0;
			}
			angle = 0;
			midair_jumps_left = number_of_jumps;
			can_ground_pound = false;
			can_dive = true;
			chain_reaction = 0;
			dive = false;
			gravity = 0;
			ground_pound = false;
			last_standing_x = x;
			last_standing_y = y;
			ledge_grab_jump = false;
			speed_max = 4;
			spring = false;
			stick_to_wall = false;
			crouch = false;
			vspeed = 0;
			if (key_left_hold)
			|| (key_right_hold)
			{
				friction = 0.2;
			}
			else
			{
				friction = 0.5;
			}
			y = nearest_horizontal_rope.y + climb_under_y_offset;
		
			#region /* Spinning on horizontal rope */
			if (key_up)
			&& (!key_down)
			&& (!place_meeting(x, y - 16, obj_wall))
			&& (!place_meeting(x, y - 32, obj_wall))
			&& (!place_meeting(x, y - 48, obj_wall))
			&& (!place_meeting(x, y - 64, obj_wall))
			&& (simple_controls == false)
			{
				friction = 0.5; /* Make the character stop horizontal movement sooner when spinning on horizontal rope */
				
				#region /* Start spinning on rope */
				if (place_meeting(x - 1, y, obj_wall))
				|| (place_meeting(x - 4, y - 16, obj_wall))
				|| (place_meeting(x - 4, y - 32, obj_wall))
				|| (place_meeting(x - 4, y - 48, obj_wall))
				|| (place_meeting(x - 4, y - 64, obj_wall))
				{
					x ++;
					hspeed = 0;
				}
				else
				if (place_meeting(x + 1, y, obj_wall))
				|| (place_meeting(x + 4, y - 16, obj_wall))
				|| (place_meeting(x + 4, y - 32, obj_wall))
				|| (place_meeting(x + 4, y - 48, obj_wall))
				|| (place_meeting(x + 4, y - 64, obj_wall))
				{
					x --;
					hspeed = 0;
				}
				if (image_index <= 5)
				&& (image_speed > 0.3)
				{
					instance_create_depth(x, y, 0, obj_block_break);
					instance_create_depth(x, y + 32, 0, obj_block_break);
					instance_create_depth(x, y + 64, 0, obj_block_break);
				}
				else
				if (image_index >= 5)
				&& (image_speed > 0.3)
				{
					instance_create_depth(x, y, 0, obj_block_break);
					instance_create_depth(x, y - 32, 0, obj_block_break);
					instance_create_depth(x, y - 64, 0, obj_block_break);
				}
				if (image_speed < 1)
				{
					if (sprite_climb_under_spin > noone){sprite_index = sprite_climb_under_spin;}else
					if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
					if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
					if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
				}
				else
				{
					if (sprite_climb_under_spin_fast> noone){sprite_index = sprite_climb_under_spin_fast;}else
					if (sprite_climb_under_spin > noone){sprite_index = sprite_climb_under_spin;}else
					if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
					if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
					if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
				}
				if (image_index >= image_number - 1)
				&& (image_number > 1)
				{
					scr_gamepad_vibration(player, 0.2, 10);
					scr_audio_play(snd_swing, volume_source.sound);
					image_index = 0;
				}
				image_speed += 0.02;
				if (image_speed > 1)
				{
					image_speed = 1;
				}
				#endregion /* Start spinning on rope END */
				
				#region /* Jump from rope spin */
				if (key_jump)
				|| (up_is_also_jump == true)
				&& (!key_up)
				{
					scr_audio_play(snd_jump, volume_source.sound);
					scr_gamepad_vibration(player, 0.4, 10);
					can_climb_horizontal_rope_cooldown = sprite_get_height(mask_index) / 35;
					midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
					y -= 64;
					climb = false;
					horizontal_rope_climb = false;
					spring_animation = 0;
					spring = true;
				
					#region /* Do a charged upward jump depending on how fast you spin */
					if (image_speed >= 1)
					{
						vspeed = -triple_jump_height * 1.25;
						scr_audio_play(voice_jump_rope, volume_source.voice);
					}
					else
					if (image_speed >= 0.9)
					{
						vspeed = -triple_jump_height * 1.125;
					}
					else
					if (image_speed >= 0.7)
					{
						vspeed = -triple_jump_height;
					}
					else
					{
						vspeed = -normal_jump_height; /* Do the normal upward jump, when you haven't spinned fast enough */
					}
					#endregion /* Do a charged upward jump depending on how fast you spin END */
				
				}
				#endregion /* Jump from rope spin END */
				
			}
			#endregion /* Spinning on horizontal rope END */
		
			else
		
			#region /* Jump upward normally from rope spin if drop down from rope doesn't use jump */
			if (drop_from_rope == 0) /* Drop down from rope: Release Jump */
			&& (key_jump)
			|| (drop_from_rope == 2) /* Drop down from rope: Only Down */
			&& (key_jump)
			|| (drop_from_rope == 4) /* Drop down from rope: Down + Jump */
			&& (key_jump)
			&& (!key_down)
			{
				if (!place_meeting(x, y - 16, obj_wall))
				&& (!place_meeting(x, y - 32, obj_wall))
				&& (!place_meeting(x, y - 48, obj_wall))
				&& (!place_meeting(x, y - 64, obj_wall))
				{
					scr_audio_play(snd_jump, volume_source.sound);
					can_climb_horizontal_rope_cooldown = sprite_get_height(mask_index) / 35;
					midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
					y -= 64;
					climb = false;
					horizontal_rope_climb = false;
					spring_animation = 0;
					spring = true;
					vspeed = -normal_jump_height; /* Do the normal upward jump, no chargeup */
				}
			}
			#endregion /* Jump upward normally from rope spin if drop down from rope doesn't use jump END */
		
			else
		
			#region /* Drop down from rope */
			if (drop_from_rope == 0) /* Drop down from rope: Release Jump */
			&& (!key_jump_hold)
			|| (drop_from_rope == 1) /* Drop down from rope: Down or Jump */
			&& (key_down)
			|| (drop_from_rope == 1) /* Drop down from rope: Down or Jump */
			&& (key_jump)
			|| (drop_from_rope == 2) /* Drop down from rope: Only Down */
			&& (key_down)
			|| (drop_from_rope == 3) /* Drop down from rope: Only Jump */
			&& (key_jump)
			|| (drop_from_rope == 4) /* Drop down from rope: Down + Jump */
			&& (key_down)
			&& (key_jump)
			{
				if (!key_up)
				{
					if (place_meeting(x - 1, y, obj_wall))
					{
						x ++;
					}
					else
					if (place_meeting(x + 1, y, obj_wall))
					{
						x --;
					}
					can_climb_horizontal_rope_cooldown = sprite_get_height(mask_index) / 9; /* Cooldown timer before you can start climbing again. The deviding number should be high enough so you grab a rope below you but not grabbing the same rope you were just on */
					can_ground_pound = false;
					climb = false;
					horizontal_rope_climb = false;
					stomp_spin = false;
					midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
				}
			}
			#endregion /* Drop down from rope END */
		
			else
		
			#region /* Climb left on horizontal rope */
			if (key_left_hold)
			&& (!key_right_hold)
			&& (!place_meeting(x - 1, y, obj_wall))
			&& (!place_meeting(x - 10, y, obj_spikes))
			&& (taken_damage <= taken_damage_freezetime)
			{
				image_xscale = -1;
				if (place_meeting(x - 32, y, obj_horizontal_rope))
				{
					if (sprite_climb_under > noone){sprite_index = sprite_climb_under;}else
					if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
					if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
					if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
					if (key_sprint)
					|| (double_tap_left == 3)
					{
						hspeed -= 0.5;
						speed_max = speed_max_run;
						image_speed = speed / 10 + 0.1;
					}
					else
					{
						hspeed -= 0.5;
						speed_max = speed_max_walk;
						image_speed = speed / 10 + 0.1;
					}
					if (!audio_is_playing(snd_move_ivy))
					{
						scr_audio_play(snd_move_ivy, volume_source.sound);
					}
				}
				else
				{
					hspeed = 0;
				}
			}
			#endregion /* Climb left on horizontal rope END */
		
			else
		
			#region /* Climb right on horizontal rope */
			if (key_right_hold)
			&& (!key_left_hold)
			&& (!place_meeting(x + 1, y, obj_wall))
			&& (!place_meeting(x + 10, y, obj_spikes))
			&& (taken_damage <= taken_damage_freezetime)
			{
				image_xscale = +1;
				if (place_meeting(x + 32, y, obj_horizontal_rope))
				{
					if (sprite_climb_under > noone){sprite_index = sprite_climb_under;}else
					if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
					if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
					if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
					if (key_sprint)
					|| (double_tap_right == 3)
					{
						hspeed += 0.5;
						speed_max = speed_max_run;
						image_speed = speed / 10 + 0.1;
					}
					else
					{
						hspeed += 0.5;
						speed_max = speed_max_walk;
						image_speed = speed / 10 + 0.1;
					}
					if (!audio_is_playing(snd_move_ivy))
					{
						scr_audio_play(snd_move_ivy, volume_source.sound);
					}
				}
				else
				{
					hspeed = 0;
				}
			}
			#endregion /* Climb right on horizontal rope END */
		
			else
		
			#region /* Look up when on horizontal rope */
			if (key_up)
			{
				if (speed > 0)
				{
					if (sprite_climb_under > noone){sprite_index = sprite_climb_under;}else
					if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
					if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
					if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
				}
				else
				{
					if (sprite_climb_under_look_up > noone){sprite_index = sprite_climb_under_look_up;}else
					if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
					if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
					if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
				}
				image_speed = 0.5;
			}
			#endregion /* Look up when on horizontal rope END */

			else
			{
				if (speed > 0)
				{
					if (sprite_climb_under > noone){sprite_index = sprite_climb_under;}else
					if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
					if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
					if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
				}
				else
				if (sprite_climb_under_still > noone)
				{
					sprite_index = sprite_climb_under_still;
				}
				else
				{
					if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
					if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
				}
			}
			if (instance_position(nearest_horizontal_rope.x, nearest_horizontal_rope.y + 64, obj_wall)) /*If there is a wall underneath the horizontal rope, then release grab from horizontal rope*/
			|| (instance_position(nearest_horizontal_rope.x, nearest_horizontal_rope.y + 32, obj_wall))
			|| (instance_position(nearest_horizontal_rope.x, nearest_horizontal_rope.y + 16, obj_wall))
			{
				can_climb_horizontal_rope_cooldown = sprite_get_height(mask_index) / 10;
				can_ground_pound = false;
				climb = false;
				horizontal_rope_climb = false;
				stomp_spin = false;
			}
		
			#region /* Bump into wall on left side when climbing horizontal rope */
			if (place_meeting(x - 1, y, obj_wall))
			|| (place_meeting(x - 10, y, obj_spikes))
			|| (!place_meeting(x - 1, y, obj_horizontal_rope))
			{
				if (hspeed < 0)
				{
					hspeed = 0;
				}
				if (key_left_hold)
				&& (!key_right_hold)
				&& (taken_damage <= taken_damage_freezetime)
				{
					image_xscale = -1;
					if (!audio_is_playing(snd_bump))
					{
						scr_audio_play(snd_bump, volume_source.sound);
					}
				}
			}
			#endregion /* Bump into wall on left side when climbing horizontal rope END */
		
			else
		
			#region /* Bump into wall on right side when climbing horizontal rope */
			if (place_meeting(x + 1, y, obj_wall))
			|| (place_meeting(x + 10, y, obj_spikes))
			|| (!place_meeting(x + 1, y, obj_horizontal_rope))
			{
				if (hspeed > 0)
				{
					hspeed = 0;
				}
				if (key_right_hold)
				&& (!key_left_hold)
				&& (taken_damage <= taken_damage_freezetime)
				{
					image_xscale = +1;
					if (!audio_is_playing(snd_bump))
					{
						scr_audio_play(snd_bump, volume_source.sound);
					}
				}
			}
			#endregion /* Bump into wall on right side when climbing horizontal rope END */
		
		}
	}
}
#endregion /* Climb Horizontal Rope END */

else

#region /* Climb Vine / Ladder */
if (place_meeting(x, y, obj_vine))
{
	if (key_up)
	&& (vspeed >= 0)
	&& (hold_item_in_hands == "")
	|| (key_up_pressed)
	&& (hold_item_in_hands == "")
	{
		if (climb == false)
		{
			climb = true;
			horizontal_rope_climb = false;
			jump = 0;
			stick_to_wall = false;
			scr_audio_play(snd_catch_ivy, volume_source.sound); /* Make a sound effect that you have started cimbing */
			scr_audio_play(voice_rope_catch, volume_source.voice);
		}
	}
	if (climb == true)
	{
		gravity = 0;
		hspeed = 0;
		vspeed = 0;
		last_standing_x = x;
		last_standing_y = y;
		speed_max = 4;
		ledge_grab_jump = false;
		ground_pound = false;
		dive = false;
		can_ground_pound = false;
		can_dive = true;
		stomp_spin = false;
		midair_jumps_left = number_of_jumps;
		spring = false;
		chain_reaction = 0;
		
		if (key_up)
		&& (!key_down)
		&& (place_meeting(x, bbox_top - 1, obj_vine))
		&& (taken_damage <= taken_damage_freezetime)
		|| (key_down)
		&& (!key_up)
		&& (taken_damage <= taken_damage_freezetime)
		{
			var nearest_vine = instance_nearest(x, y, obj_vine);
			if (x < nearest_vine.x)
			{
				x += 4;
			}
			if (x > nearest_vine.x)
			{
				x -= 4;
			}
		}
		
		if (key_up)
		&& (!key_down)
		&& (place_meeting(x, bbox_top - 1, obj_vine))
		&& (taken_damage <= taken_damage_freezetime)
		{
			if (!position_meeting(x, bbox_top - 1, obj_wall))
			{
				if (sprite_vine_climb> noone){sprite_index = sprite_vine_climb;}else
				if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
				if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
				if (key_sprint)
				{
					y -= 4;
					image_speed = 0.4;
				}
				else
				{
					y -= 2;
					image_speed = 0.2;
				}
				if (!audio_is_playing(snd_move_ivy))
				{
					scr_audio_play(snd_move_ivy, volume_source.sound);
				}
			}
			else
			{
				if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
				if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
			}
		}
		else
		if (key_down)
		&& (!key_up)
		&& (taken_damage <= taken_damage_freezetime)
		{
			if (sprite_vine_climb> noone){sprite_index = sprite_vine_climb;}else
			if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
			if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
			
			if (!on_ground)
			{
				if (key_sprint)
				{
					y += 5;
					image_speed = -0.4;
				}
				else
				{
					y += 3;
					image_speed = -0.2;
				}
				if (!audio_is_playing(snd_move_ivy))
				{
					scr_audio_play(snd_move_ivy, volume_source.sound);
				}
			}
			
			if (on_ground == true)
			{
				climb = false;
			}
		}
		else
		if (key_left_hold)
		&& (!key_right_hold)
		&& (!key_up)
		&& (!key_down)
		&& (!position_meeting(bbox_left - 1, y, obj_wall))
		&& (taken_damage <= taken_damage_freezetime)
		{
			image_xscale = -1;
			if (sprite_vine_climb> noone){sprite_index = sprite_vine_climb;}else
			if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
			if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
			if (key_sprint)
			{
				x -= 4;
				image_speed = 0.4;
			}
			else
			{
				x -= 2;
				image_speed = 0.2;
			}
			if (!audio_is_playing(snd_move_ivy))
			{
				scr_audio_play(snd_move_ivy, volume_source.sound);
			}
		}
		else
		if (key_left_hold)
		&& (!key_right_hold)
		&& (!key_up)
		&& (!key_down)
		&& (position_meeting(bbox_left - 1, y, obj_wall))
		&& (taken_damage <= taken_damage_freezetime)
		{
			if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
			if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
			image_speed = 0;
			image_xscale = -1;
			if (!audio_is_playing(snd_bump))
			{
				scr_audio_play(snd_bump, volume_source.sound);
			}
		}
		else
		if (key_right_hold)
		&& (!key_left_hold)
		&& (!key_up)
		&& (!key_down)
		&& (!position_meeting(bbox_right + 1, y, obj_wall))
		&& (taken_damage <= taken_damage_freezetime)
		{
			image_xscale = +1;
			if (sprite_vine_climb> noone){sprite_index = sprite_vine_climb;}else
			if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
			if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
			if (key_sprint)
			{
				x += 4;
				image_speed = 0.4;
			}
			else
			{
				x += 2;
				image_speed = 0.2;
			}
			if (!audio_is_playing(snd_move_ivy))
			{
				scr_audio_play(snd_move_ivy, volume_source.sound);
			}
		}
		else
		if (key_right_hold)
		&& (!key_left_hold)
		&& (!key_up)
		&& (!key_down)
		&& (position_meeting(bbox_right + 1, y, obj_wall))
		&& (taken_damage <= taken_damage_freezetime)
		{
			if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
			if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
			image_speed = 0;
			image_xscale = +1;
			if (!audio_is_playing(snd_bump))
			{
				scr_audio_play(snd_bump, volume_source.sound);
			}
		}
		else
		{
			if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
			if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
			image_speed = 0.2;
		}
		if (key_jump)
		{
			if (!key_down)
			{
				midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
				vspeed = -11.5;
			}
			climb = false;
			stomp_spin = false;
			scr_audio_play(snd_jump, volume_source.sound);
		}
	}
}
#endregion /* Climb Vine / Ladder END */

#region /* In Water Animations */
if (in_water == true)
&& (climb == false)
{
	can_ground_pound = false;
	chain_reaction = 0;

#region /* Crouch Underwater */
if (key_crouch_hold) /* Holding the crouch button */
&& (allow_crouch == true) /* Can crouch */
&& (crouch == false) /* Not currently crouching */
&& (can_move == true)
&& (ground_pound == false)
&& (dive == false)
&& (on_ground == true)
{
	crouch = true;
	stick_to_wall = false;
	y += 16;
	if (sprite_crouch > noone){sprite_index = sprite_crouch;}else
	if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
	if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
	if (sprite_mask_crouch >= 0)
	{
		mask_index = sprite_mask_crouch;
	}
	else
	{
		mask_index = spr_player_stand;
	}
	scr_audio_play(snd_squat, volume_source.sound);
}
#endregion /* Crouch Underwater END */

else

#region /* Don't Crouch Underwater */
if (!key_crouch_hold)
&& (!place_meeting(x, y - 8, obj_wall))
&& (crouch == true)
{
	if (vspeed >= 0)
	{
		crouch = false;
		y -= 16;
		draw_xscale = 0.75;
		draw_yscale = 1.25;
		if (sprite_mask >= 0)
		{
			mask_index = sprite_mask;
		}
		else
		{
			mask_index = spr_player_stand;
		}
		scr_audio_play(snd_rise, volume_source.sound);
	}
}
#endregion /* Don't Crouch Underwater END */

if (crouch == true)
{
	stick_to_wall = false;
	if (on_ground == true)
	{
		if (abs(hspeed) > 3)
		{
			if (!audio_is_playing(snd_skidding))
			{
				scr_audio_play(snd_skidding, volume_source.sound);
			}
			effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
		}
		else
		{
			if (audio_is_playing(snd_skidding))
			{
				audio_stop_sound(snd_skidding);
			}
		}
	}
	if (abs(hspeed) >= 2.5)
	&& (on_ground == true)
	{
		if (asset_get_type("spr_player_slide") == asset_sprite)
		{
			if (sprite_mask_crouch >= 0)
			{
				mask_index = sprite_mask_crouch;
			}
			else
			{
				mask_index = spr_player_stand;
			}
			sprite_index = spr_player_slide;
		}
		else
		{
			if (sprite_mask_crouch >= 0)
			{
				mask_index = sprite_mask_crouch;
			}
			else
			{
				mask_index = spr_player_stand;
			}
			if (sprite_crouch_crawl > noone){sprite_index = sprite_crouch_crawl;}else
			if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
			if (image_index > image_number - 1)
			{
				image_speed = 0;
			}
			else
			{
				image_speed = 0.5;
			}
		}
	}
	else
	if (on_ground == true)
	{
		
		#region /* Crouch Stand */
		if (speed == 0)
		&& (!key_left_hold)
		&& (!key_right_hold)
		{
			if (sprite_crouch > noone){sprite_index = sprite_crouch;}else
			if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
			if (image_index > image_number - 1)
			{
				image_speed = 0;
			}
			else
			{
				image_speed = 0.5;
			}
		}
		#endregion /* Crouch Stand END */
		
		else
		
		#region /* Crouch Crawl */
		if (key_left_hold)
		|| (key_right_hold)
		{
			if (sprite_crouch_crawl > noone){sprite_index = sprite_crouch_crawl;}else
			if (sprite_crouch > noone){sprite_index = sprite_crouch;}else
			if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
			image_speed = 0.5;
		}
		#endregion /* Crouch Crawl END */
		
	}
	else
	if (!place_meeting(x, y + 1, obj_wall))
	|| (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	|| (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	|| (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	{
		if (key_jump)
		{
			image_index = 0;
		}
		if (image_index > image_number - 1)
		{
			image_speed = 0;
		}
		else
		{
			image_speed = 0.3;
		}
		if (vspeed > 0)
		{
			if (sprite_swim_fall > noone){sprite_index = sprite_swim_fall;}else
			if (sprite_swim > noone){sprite_index = sprite_swim;}else
			if (sprite_swim_stand > noone){sprite_index = sprite_swim_stand;}else
			if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
		}
		else
		{
			if (sprite_swim > noone){sprite_index = sprite_swim;}else
			if (sprite_swim_stand > noone){sprite_index = sprite_swim_stand;}else
			if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
		}
	}
}
else
if (on_ground == true)
{
	
	#region /* Skidding */
	if (hspeed < 0)
	&& (key_right_hold)
	|| (hspeed > 0)
	&& (key_left_hold)
	{
		if (!audio_is_playing(snd_skidding))
		{
			scr_audio_play(snd_skidding, volume_source.sound);
		}
		if (sprite_swim > noone){sprite_index = sprite_swim;}else
		if (sprite_swim_stand > noone){sprite_index = sprite_swim_stand;}else
		if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
		if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
		effect_create_above(ef_smoke, x, bbox_bottom, 1, c_white);
		if (image_index > image_number - 1)
		{
			image_speed = 0;
		}
		else
		{
			image_speed = 0.5;
		}
	}
	#endregion /* Skidding END */
	
	else
	
	#region /* Run in Water */
	if (hspeed <+ 0.1)
	|| (hspeed >- 0.1)
	{
		if (hold_item_in_hands != "")
		{
			if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front;}else
			if (sprite_standing_with_item_in_front > noone){sprite_index = sprite_standing_with_item_in_front;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}else
			if (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}
		}
		else
		if (speed_dash == true)
		{
			if (sprite_swim > noone){sprite_index = sprite_swim;}else
			if (sprite_run > noone){sprite_index = sprite_run;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}else
			if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}
		}
		else
		if (abs(speed) >= 6)
		{
			if (sprite_swim > noone){sprite_index = sprite_swim;}else
			if (sprite_run > noone){sprite_index = sprite_run;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}else
			if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}
		}
		/* Against Wall */
		else
		{
			if (place_meeting(x - 1, y, obj_wall))
			|| (place_meeting(x + 1, y, obj_wall))
			{
				if (sprite_swim > noone){sprite_index = sprite_swim;}else
				if (sprite_against_wall > noone){sprite_index = sprite_against_wall; image_speed = 0.5;}else
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
				if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
			}
			/* Walk */
			else
			{
				if (sprite_swim > noone){sprite_index = sprite_swim;}else
				if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}else
				if (sprite_run > noone){sprite_index = sprite_run;}else
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}
			}
		}
		image_speed = speed / 13.5 +0.1;
	}
	#endregion /* Run in Water END */
	
	else
	
	#region /* Stand Underwater */
	if (hspeed == 0)
	&& (!key_left_hold)
	&& (!key_right_hold)
	{
		if (sprite_swim_stand > noone){sprite_index = sprite_swim_stand;}else
		if (sprite_swim > noone){sprite_index = sprite_swim;}else
		if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
		if (sprite_walk > noone){sprite_index = sprite_walk; image_speed = 0;}
		image_speed = 0.1;
	}
	#endregion /* Stand Underwater END */
	
	#region /* Mask */
	if (sprite_mask >= 0)
	{
		mask_index = sprite_mask;
	}
	else
	{
		mask_index = spr_player_stand;
	}
	#endregion /* Mask END */
	
}
else

#region /* Swimming Sprites */
if (!place_meeting(x, y + 1, obj_wall))
and(!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
and(!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
and(!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
{
	
	#region /* Skidding */
	if (hspeed <-0.2)
	&& (image_xscale > 0)
	|| (hspeed >+0.2)
	&& (image_xscale < 0)
	{
		if (!audio_is_playing(snd_skidding))
		{
			scr_audio_play(snd_skidding, volume_source.sound);
		}
		if (asset_get_type("spr_player_swim_skidding") == asset_sprite)
		{
			sprite_index = spr_player_swim_skidding;
		}
		else
		{
			if (sprite_swim_stand > noone){sprite_index = sprite_swim_stand;}else
			if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
		}
		if (image_index > image_number - 1)
		{
			image_speed = 0;
		}
		else
		{
			image_speed = 0.5;
		}
	}
	#endregion /* Skidding END */
	
	/* Single Swim */
	else
	if (key_jump)
	{
		image_index = 0;
	}
	if (image_index > image_number - 1)
	{
		image_speed = 0;
	}
	else
	{
		image_speed = 0.3;
	}
	if (vspeed > 0)
	{
		if (sprite_swim_fall > noone){sprite_index = sprite_swim_fall;}else
		if (sprite_swim > noone){sprite_index = sprite_swim;}else
		if (sprite_swim_stand > noone){sprite_index = sprite_swim_stand;}else
		if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
		if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
	}
	else
	{
		if (sprite_swim > noone){sprite_index = sprite_swim;}else
		if (sprite_swim_stand > noone){sprite_index = sprite_swim_stand;}else
		if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
		if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
	}
	if (sprite_mask >= 0)
	{
		mask_index = sprite_mask;
	}
	else
	{
		mask_index = spr_player_stand;
	}
}
#endregion /* Swimming Sprites END */

}
#endregion /* In Water Animations END */

else
{

#region /* Crouch */
if (key_crouch_hold) /* Holding the crouch button */
&& (allow_crouch == true) /* Can crouch */
&& (crouch == false) /* Not currently crouching */
&& (can_move == true)
&& (ground_pound == false)
&& (dive == false)
&& (on_ground == true)
{
	crouch = true;
	draw_xscale = 1.5;
	draw_yscale = 0.5;
	if (sprite_crouch > noone){sprite_index = sprite_crouch;}else
	if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
	if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
	
	if (sprite_mask_crouch >= 0)
	{
		mask_index = sprite_mask_crouch;
	}
	else
	{
		mask_index = spr_player_stand;
	}
	if (!place_meeting(x, y + 16, obj_wall))
	|| (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	|| (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	|| (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	{
		y += 32;
	}
	scr_audio_play(snd_squat, volume_source.sound);
}
#endregion /* Crouch END */

else

#region /* Don't crouch */
if (!key_crouch_hold)
&& (!place_meeting(x, y - 8, obj_wall))
&& (crouch == true)
&& (vspeed >= 0)
{
	crouch = false;
	y -= 16;
	draw_xscale = 0.75;
	draw_yscale = 1.25;
	if (sprite_mask >= 0)
	{
		mask_index = sprite_mask;
	}
	else
	{
		mask_index = spr_player_stand;
	}
	scr_audio_play(snd_rise, volume_source.sound);
}
#endregion /* Don't crouch END */

#region /* Roll */
if (allow_roll == true)
&& (roll == true)
{
	if (asset_get_type("spr_player_roll") == asset_sprite)
	{
		sprite_index = spr_player_roll;
	}
	if (sprite_mask_crouch >= 0)
	{
		mask_index = sprite_mask_crouch;
	}
	else
	{
		mask_index = spr_player_stand;
	}
	if (!place_meeting(x, y + 1, obj_wall))
	&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	&& (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	&& (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	{
		roll = false;
	}
	if (image_index > image_number - 1)
	{
		image_speed = 0;
		roll = false;
	}
	else
	{
		image_speed = 0.5;
	}
}
#endregion /* Roll END */

else
if (crouch == true)
{
	
	#region /* Destroy blocks above you when you jump while crouching */
	if (key_jump)
	{
		with (instance_create_depth(x, bbox_top, 0, obj_block_break))
		{
			can_break_other_blocks = true;
			image_xscale = 0.75;
			image_yscale = 0.75;
		}
	}
	#endregion /* Destroy blocks above you when you jump while crouching END */
	
	if (on_ground == true)
	{
		if (abs(hspeed) > 3)
		{
			if (!audio_is_playing(snd_skidding))
			{
				scr_audio_play(snd_skidding, volume_source.sound);
			}
			effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
			scr_gamepad_vibration(player, 0.1, 10);
		}
		else
		if (audio_is_playing(snd_skidding))
		{
			audio_stop_sound(snd_skidding);
		}
	}
	if (abs(hspeed) >= 2.5)
	&& (on_ground == true)
	{
		if (sprite_mask_crouch >= 0)
		{
			mask_index = sprite_mask_crouch;
		}
		else
		{
			mask_index = spr_player_stand;
		}
		if (sprite_crouch_crawl > noone){sprite_index = sprite_crouch_crawl;}else
		if (sprite_crouch > noone){sprite_index = sprite_crouch;}else
		if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
		if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
		if (image_index > image_number - 1)
		{
			image_speed = 0;
		}
		else
		{
			image_speed = 0.5;
		}
	}
	else
	if (on_ground == true)
	{
		
		#region /* Crouch Still */
		if (speed == 0)
		&& (!key_left_hold)
		&& (!key_right_hold)
		{
			if (sprite_crouch > noone){sprite_index = sprite_crouch;}else
			if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
			if (image_index > image_number - 1)
			{
				image_speed = 0;
			}
			else
			{
				image_speed = 0.5;
			}
		}
		#endregion /* Crouch Still END */
		
		else
		
		#region /* Crouch Crawl */
		if (key_left_hold)
		|| (key_right_hold)
		{
			if (sprite_crouch_crawl > noone){sprite_index = sprite_crouch_crawl;}else
			if (sprite_crouch > noone){sprite_index = sprite_crouch;}else
			if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
			image_speed = 0.5;
		}
		#endregion /* Crouch Crawl END */
		
	}

	else
	if (!place_meeting(x, y + 1, obj_wall))
	&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	&& (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	&& (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	{
		
		#region /* Crouch Jump */
		if (vspeed < 0)
		{
			jump_transition_to_fall_animation = 0;
			if (sprite_crouch_jump > noone){sprite_index = sprite_crouch_jump;}else
			if (sprite_crouch_fall > noone){sprite_index = sprite_crouch_fall;}else
			if (sprite_jump > noone) && (vspeed <= 0){sprite_index = sprite_jump;}else
			if (sprite_fall_slower > noone) && (vspeed > 0) && (key_jump_hold){sprite_index = sprite_fall_slower;}else
			if (sprite_fall > noone) && (vspeed > 0){sprite_index = sprite_fall; image_speed = 0.5;}else
			if (sprite_jump > noone){sprite_index = sprite_jump;}else
			if (sprite_crouch > noone){sprite_index = sprite_crouch;}else
			if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
			if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
			if (image_index > image_number - 1)
			{
				image_speed = 0;
			}
			else
			{
				image_speed = 0.5;
			}
		}
		#endregion /* Crouch Jump END */
		
		else
		if (vspeed > 0)
		&& (stick_to_wall == false)
		{
			
			#region /* Crouch Fall sprites */
			if (jump_transition_to_fall_animation == 0)
			{
				image_index = 0;
				jump_transition_to_fall_animation = 1
			}
			if (jump_transition_to_fall_animation == 1)
			{
				image_speed = 0.5;
				if (sprite_crouch_jump_transition_to_fall > noone)
				{
					sprite_index = sprite_crouch_jump_transition_to_fall;
				}
				else
				{
					jump_transition_to_fall_animation = 2;
				}
				if (image_index > image_number - 1)
				{
					image_index = 0;
					jump_transition_to_fall_animation = 2;
				}
			}
			if (jump_transition_to_fall_animation == 2)
			{
				if (sprite_crouch_fall > noone){sprite_index = sprite_crouch_fall;}else
				if (sprite_crouch_jump_transition_to_fall > noone){sprite_index = sprite_crouch_jump_transition_to_fall; image_index = image_number - 1;}else
				if (sprite_crouch_jump > noone){sprite_index = sprite_crouch_jump;}else
				if (sprite_jump > noone) && (vspeed <= 0){sprite_index = sprite_jump;}else
				if (sprite_fall_slower > noone) && (vspeed > 0) && (key_jump_hold){sprite_index = sprite_fall_slower;}else
				if (sprite_fall > noone) && (vspeed > 0){sprite_index = sprite_fall; image_speed = 0.5;}else
				if (sprite_jump > noone){sprite_index = sprite_jump;}else
				if (sprite_crouch > noone){sprite_index = sprite_crouch;}else
				if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
				if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
				if (image_index > image_number - 1)
				{
					image_speed = 0;
				}
				else
				{
					image_speed = 0.5;
				}
			}
			#endregion /* Crouch Fall sprites END */
			
		}
	}
	jump = 0;
	if (sprite_mask_crouch >= 0)
	{
		mask_index = sprite_mask_crouch;
	}
	else
	{
		mask_index = spr_player_stand;
	}
}
else
if (ground_pound == true)
{
	if (sprite_ground_pound > noone){sprite_index = sprite_ground_pound;}else
	if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
	if (sprite_jump > noone){sprite_index = sprite_jump;}else
	if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
	if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
}
else
if (ground_pound == 2)
{
	if (sprite_ground_pound_get_up > noone){sprite_index = sprite_ground_pound_get_up;}else
	{
		if (image_index > 0)
		{
			image_speed = 0;
			ground_pound = false;
		}
	}
	if (image_index > image_number - 1)
	{
		image_speed = 0;
		ground_pound = false;
	}
	else
	{
		image_speed = 0.5;
	}
}
else
if (ground_pound == 3)
{
	if (sprite_stomp_spin > noone){sprite_index = sprite_stomp_spin;}else
	if (sprite_jump > noone){sprite_index = sprite_jump;}else
	if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
	if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
	if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
}
else
if (on_ground == true)
&& (vspeed == 0)
{
	
	#region /* Skidding */
	if (hspeed < 0)
	&& (key_right_hold)
	|| (hspeed > 0)
	&& (key_left_hold)
	{
		if (place_meeting(x, y + 1, obj_ice_block))
		{
			if (!audio_is_playing(snd_skidding_ice))
			{
				scr_audio_play(snd_skidding_ice, volume_source.sound);
			}
		}
		else
		{
			if (!audio_is_playing(snd_skidding))
			{
				scr_audio_play(snd_skidding, volume_source.sound);
			}
		}
		if (place_meeting(x, y + 1, obj_ice_block))
		{
			if (hold_item_in_hands != "")
			{
				if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front; image_speed = speed / 10 + 0.1;}else
				if (sprite_standing_with_item_in_front > noone){sprite_index = sprite_standing_with_item_in_front; image_speed = speed / 10 + 0.1;}else
				if (sprite_walk > noone){sprite_index = sprite_walk; image_speed = speed / 10 + 0.1;}else
				if (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand; image_speed = 0.5;}
			}
			else
			if (sprite_skidding_ice > noone){sprite_index = sprite_skidding_ice; image_speed = 0.5;}else
			if (sprite_skidding> noone){sprite_index = sprite_skidding; image_speed = 0.5;}else
			if (sprite_run > noone){sprite_index = sprite_run;}else
			if (sprite_walk > noone) && (hspeed <> 0){sprite_index = sprite_walk;}else
			if (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}
		}
		else
		{
			if (hold_item_in_hands != "")
			{
				if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front; image_speed = speed / 10 + 0.1;}else
				if (sprite_standing_with_item_in_front > noone){sprite_index = sprite_standing_with_item_in_front; image_speed = speed / 10 + 0.1;}else
				if (sprite_walk > noone){sprite_index = sprite_walk; image_speed = speed / 10 + 0.1;}else
				if (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand; image_speed = 0.5;}
			}
			else
			if (sprite_skidding> noone){sprite_index = sprite_skidding; image_speed = 0.5;}else
			if (abs(hspeed) > 20) && (sprite_run4 > noone){sprite_index = sprite_run4;}else
			if (abs(hspeed) > 15) && (sprite_run3 > noone){sprite_index = sprite_run3;}else
			if (abs(hspeed) > 10) && (sprite_run2 > noone){sprite_index = sprite_run2;}else
			if (abs(hspeed) > 5) && (sprite_run > noone){sprite_index = sprite_run;}else
			if (sprite_walk >  noone) && (hspeed <> 0){sprite_index = sprite_walk;}else
			if (sprite_run > noone) && (hspeed <> 0){sprite_index = sprite_run;}else
			if (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}
		}
		effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
	}
	#endregion /* Skidding END */
	
	else
	
	#region /* Skidding Stop */
	if (hspeed < 0)
	&& (!key_left_hold)
	|| (hspeed > 0)
	&& (!key_right_hold)
	{
		if (hold_item_in_hands != "")
		{
			if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front; image_speed = speed / 10 + 0.1;}else
			if (sprite_standing_with_item_in_front > noone){sprite_index = sprite_standing_with_item_in_front; image_speed = speed / 10 + 0.1;}else
			if (sprite_walk > noone){sprite_index = sprite_walk; image_speed = speed / 10 + 0.1;}else
			if (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand; image_speed = 0.5;}
		}
		else
		if (sprite_skidding_stop > noone){sprite_index = sprite_skidding_stop; image_speed = 0.5;}else
		if (abs(hspeed) > 20) && (sprite_run4 > noone){sprite_index = sprite_run4; image_speed = speed / 10 + 0.1;}else
		if (abs(hspeed) > 15) && (sprite_run3 > noone){sprite_index = sprite_run3; image_speed = speed / 10 + 0.1;}else
		if (abs(hspeed) > 10) && (sprite_run2 > noone){sprite_index = sprite_run2; image_speed = speed / 10 + 0.1;}else
		if (abs(hspeed) > 5) && (sprite_run > noone){sprite_index = sprite_run; image_speed = speed / 10 + 0.1;}else
		if (sprite_walk > noone) && (hspeed <> 0){sprite_index = sprite_walk; image_speed = speed / 10 + 0.1;}else
		if (sprite_run > noone) && (hspeed <> 0){sprite_index = sprite_run; image_speed = speed / 10 + 0.1;}else
		if (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand; image_speed = 0.5;}
	}
	#endregion /* Skidding Stop END */
	
	else
	
	#region /* Look Up */
	if (hspeed == 0)
	&& (key_up)
	&& (!key_down)
	{
		if (look_up_start_animation == true)
		{
			if (sprite_look_up_start> noone){sprite_index = sprite_look_up_start;}else
			if (sprite_look_up > noone){sprite_index = sprite_look_up;}else
			if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
		}
		else
		{
			if (sprite_look_up > noone){sprite_index = sprite_look_up;}else
			if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
		}
		if (image_index > image_number - 1)
		&& (look_up_start_animation == true)
		{
			image_index = 1;
			look_up_start_animation = false;
		}
		image_speed = 0.3;
		if (sprite_mask >= 0)
		{
			mask_index = sprite_mask;
		}
		else
		{
			mask_index = spr_player_stand;
		}
	}
	#endregion /* Look Up END */
	
	else
	
	#region /* Run */
	if (abs(hspeed) > 0)
	{
		look_up_start_animation = true;
		against_wall_animation = 0;
		if (hold_item_in_hands != "")
		{
			if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front;}else
			if (sprite_standing_with_item_in_front > noone){sprite_index = sprite_standing_with_item_in_front;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}else
			if (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}
		}
		else
		if (abs(hspeed) >= 20)
		{
			if (sprite_run4 > noone){sprite_index = sprite_run4;}else
			if (sprite_run3 > noone){sprite_index = sprite_run3;}else
			if (sprite_run2 > noone){sprite_index = sprite_run2;}else
			if (sprite_run > noone){sprite_index = sprite_run;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}else
			if (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}
		}
		else
		if (abs(hspeed) >= 15)
		{
			if (sprite_run3 > noone){sprite_index = sprite_run3;}else
			if (sprite_run2 > noone){sprite_index = sprite_run2;}else
			if (sprite_run > noone){sprite_index = sprite_run;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}else
			if (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}
		}
		else
		if (abs(hspeed) >= 10)
		{
			if (sprite_run2 > noone){sprite_index = sprite_run2;}else
			if (sprite_run > noone){sprite_index = sprite_run;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}else
			if (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}
		}
		else
		if (abs(hspeed) >= 5)
		{
			if (sprite_run > noone){sprite_index = sprite_run;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}else
			if (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}
		}
		else
		{
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;} /* Walk */ else
			if (sprite_run > noone){sprite_index = sprite_run;} /* If no walk sprite, use run sprite */ else
			if (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}
		}
		if (place_meeting(x, y + 1, obj_ice_block))
		{
			image_speed = 0.5;
		}
		else
		{
			image_speed = speed / 10 + 0.1;
		}
	}
	#endregion /* Run END */
	
	else
	
	#region /* Against Wall */
	if (place_meeting(x - 1, y, obj_wall))
	&& (on_ground == true)
	&& (key_left_hold)
	|| (place_meeting(x + 1, y, obj_wall))
	&& (on_ground == true)
	&& (key_right_hold)
	{
		if (crouch == false)
		{
			if (against_wall_animation == 0)
			{
				image_index = 0;
				if (sprite_against_wall_start > noone){sprite_index = sprite_against_wall_start; image_speed = 0.5;}else
				if (sprite_against_wall > noone){sprite_index = sprite_against_wall; image_speed = 0.5;}else
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
				if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
				against_wall_animation = 1;
			}
			else
			if (against_wall_animation == 1)
			{
				if (sprite_against_wall_start > noone){sprite_index = sprite_against_wall_start; image_speed = 0.5;}else
				if (sprite_against_wall > noone){sprite_index = sprite_against_wall; image_speed = 0.5;}else
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
				if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
				if (image_index >= image_number - 1)
				{
					against_wall_animation = 2;
				}
			}
			else
			if (against_wall_animation = 2)
			{
				if (sprite_against_wall > noone){sprite_index = sprite_against_wall; image_speed = 0.5;}else
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
				if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
			}
		}
		if (!audio_is_playing(snd_bump))
		{
			scr_audio_play(snd_bump, volume_source.sound);
		}
	}
	#endregion /* Against Wall END */
	
	else
	
	#region /* Stand */
	if (hspeed == 0)
	&& (!key_left_hold)
	&& (!key_right_hold)
	&& (climb == false)
	{
		look_up_start_animation = true;
		against_wall_animation = 0;
		if (place_meeting(x, y + 1, obj_bump_in_ground))
		&& (sprite_standing_on_something > noone)
		{
			sprite_index = sprite_standing_on_something;
		}
		else
		if (have_heart_balloon == false)
		&& (hp <= 1)
		&& (max_hp >= 2)
		&& (invincible_timer <= false)
		&& (sprite_panting > noone)
		{
			sprite_index = sprite_panting;
			image_speed = 0.3;
		}
		else
		if (instance_exists(obj_camera))
		&& (global.rain == true)
		&& (sprite_stand_cold > noone)
		{
			sprite_index = sprite_stand_cold;
			image_speed = 1;
		}
		else
		{
			if (image_index >= image_number - 1)
			{
				image_index = 0;
				idle_animtaion = choose(0, 0, 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
			}
			if (idle_animtaion == 1)
			&& (sprite_stand_blink > noone)
			{
				sprite_index = sprite_stand_blink;
			}
			else
			if (idle_animtaion = 2)
			&& (sprite_idle_animation1 > noone)
			{
				sprite_index = sprite_idle_animation1;
			}
			else
			if (idle_animtaion = 3)
			&& (sprite_idle_animation2 > noone)
			{
				sprite_index = sprite_idle_animation2;
			}
			else
			if (idle_animtaion = 4)
			&& (sprite_idle_animation3 > noone)
			{
				sprite_index = sprite_idle_animation3;
			}
			else
			if (idle_animtaion == 5)
			&& (sprite_idle_animation4 > noone)
			{
				sprite_index = sprite_idle_animation4;
			}
			else
			if (idle_animtaion == 6)
			&& (sprite_idle_animation5 > noone)
			{
				sprite_index = sprite_idle_animation5;
			}
			else
			if (idle_animtaion == 7)
			&& (sprite_idle_animation6 > noone)
			{
				sprite_index = sprite_idle_animation6;
			}
			else
			if (idle_animtaion == 8)
			&& (sprite_idle_animation7 > noone)
			{
				sprite_index = sprite_idle_animation7;
			}
			else
			if (idle_animtaion = 9)
			&& (sprite_idle_animation8 > noone)
			{
				sprite_index = sprite_idle_animation8;
			}
			else
			if (idle_animtaion = 10)
			&& (sprite_idle_animation9 > noone)
			{
				sprite_index = sprite_idle_animation9;
			}
			else
			if (sprite_stand > noone)
			{
				sprite_index = sprite_stand;
			}
			
			#region /* If there isn't any stand or idle animation existing, then just use walk sprite */
			else
			if (sprite_walk > noone)
			{
				sprite_index = sprite_walk;
				image_speed = 0;
			}
			#endregion /* If there isn't any stand or idle animation existing, then just use walk sprite END */
			
			image_speed = 0.3;
		}
	}
	else
	{
		idle_animtaion = 0;
	}
	#endregion /* Stand END */
	
	#region /* Mask */
	if (sprite_mask >= 0)
	{
		mask_index = sprite_mask;
	}
	else
	{
		mask_index = spr_player_stand;
	}
	#endregion /* Maske END */
	
}
else

#region /* Jumping Sprites */
if (!place_meeting(x, y + 1, obj_wall))
&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
&& (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
&& (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
{
	if (burnt> 0)
	{
		if (sprite_burnt > noone){sprite_index = sprite_burnt;}else
		if (sprite_die > noone){sprite_index = sprite_die;}else
		if (sprite_jump > noone) && (vspeed <= 0){sprite_index = sprite_jump;}else
		if (sprite_fall_slower > noone) && (vspeed > 0) && (key_jump_hold){sprite_index = sprite_fall_slower;}else
		if (sprite_fall > noone) && (vspeed > 0){sprite_index = sprite_fall; image_speed = 0.5;}else
		if (sprite_jump > noone){sprite_index = sprite_jump;}else
		if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
		if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
		if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
	}
	else
	if (dive == true)
	{
		if (sprite_dive > noone){sprite_index = sprite_dive;if (image_index > image_number - 1){image_speed = 0;}else{image_speed = 0.5;}}else
		if (sprite_jump > noone) && (vspeed <= 0){sprite_index = sprite_jump;}else
		if (sprite_fall_slower > noone) && (vspeed > 0) && (key_jump_hold){sprite_index = sprite_fall_slower;}else
		if (sprite_fall > noone) && (vspeed > 0){sprite_index = sprite_fall; image_speed = 0.5;}else
		if (sprite_jump > noone){sprite_index = sprite_jump;}else
		if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
		if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
		if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
	}
	else
	
	#region /* Wall slide down */
	if (stick_to_wall == true)
	&& (vspeed >= 0)
	{
		if (crouch == false)
		&& (ground_pound == false)
		&& (ledge_grab == false)
		{
			if (vspeed > 0)
			{
				if (sprite_wall_slide_down > noone){sprite_index = sprite_wall_slide_down;}else
				if (sprite_wall_slide > noone){sprite_index = sprite_wall_slide;}else
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
				if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
			}
			else
			{
				if (sprite_wall_slide > noone){sprite_index = sprite_wall_slide;}else
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
				if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
			}
			image_speed = 0.5;
		}
	}
	#endregion /* Wall slide down END */
	
	else
	if (vspeed < 0)
	{
		if (stomp_spin == true)
		{
			if (sprite_stomp_spin > noone){sprite_index = sprite_stomp_spin;if (image_index > image_number - 1){image_speed = 0;}else{image_speed = 0.5;}}else
			if (sprite_jump > noone){sprite_index = sprite_jump;}else
			if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
			if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
		}
		else
		if (spring>= 2)
		{
			if (asset_get_type("spr_player_spring_double") == asset_sprite)
			{
				sprite_index = spr_player_spring_double;
			}
			else
			{
				sprite_index = sprite_stomp_spin;
			}
			if (image_index > image_number - 1)
			{
				image_speed = 0;
			}
			else
			{
				image_speed = 0.5;
			}
		}
		else
		/* Make it look natural when climbing wall */
		/* Run up wall / wall_slide up */
		if (stick_to_wall == true)
		{
			if (crouch == false)
			&& (ground_pound == false)
			&& (ledge_grab == false)
			{
				if (sprite_wall_slide_up > noone){sprite_index = sprite_wall_slide_up;}else
				if (sprite_wall_slide > noone){sprite_index = sprite_wall_slide;}else
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
				if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
				image_speed = 0.5;
			}
		}
		else
		if (invincible_timer >= true)
		&& (asset_get_type("spr_player_invincible_jump") == asset_sprite)
		{
			sprite_index = spr_player_invincible_jump;
			image_speed = 1;
		}
		/* Walljump */
		else
		{
			if (wall_jump >= 0)
			&& (asset_get_type("spr_player_wall_jump") == asset_sprite)
			{
				sprite_index = spr_player_wall_jump;
				if (image_index > image_number - 1)
				{
					image_speed = 0;
				}
				else
				{
					image_speed = 0.5;
				}
			}
			else
		
			#region /* Single Jump */
			if (jump <= 1)
			{
				if (speed_dash == true)
				{
					if (asset_get_type("spr_player_speed_dashjump") == asset_sprite)
					{
						sprite_index = spr_player_speed_dashjump;
					}
					else
					if (asset_get_type("spr_player_jump2") == asset_sprite)
					&& (asset_get_type("spr_player_jump3") == asset_sprite)
					{
						if (sprite_index != sprite_jump)
						&& (sprite_index != spr_player_jump2)
						&& (sprite_index != spr_player_jump3)
						{
							sprite_index = choose(sprite_jump, spr_player_jump2, spr_player_jump3);
						}
					}
					else
					if (spring == false)
					{
						if (sprite_jump > noone){sprite_index = sprite_jump;}else
						if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
						if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
						if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
					}
				}
				else
				if (asset_get_type("spr_player_jump2") == asset_sprite)
				&& (asset_get_type("spr_player_jump3") == asset_sprite)
				{
					if (sprite_index != sprite_jump)
					&& (sprite_index != spr_player_jump2)
					&& (sprite_index != spr_player_jump3)
					{
						sprite_index = choose(sprite_jump, spr_player_jump2, spr_player_jump3);
					}
				}
				else
				if (spring == false)
				{
					if (sprite_jump > noone){sprite_index = sprite_jump;}else
					if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
					if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
					if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
				}
			}
			#endregion /* Single Jump END */
		
			else
		
			#region /* Double Jump */
			if (jump = 2)
			{
				if (sprite_double_jump > noone){sprite_index = sprite_double_jump;}else
				if (sprite_jump > noone){sprite_index = sprite_jump;}else
				if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
				if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
				image_speed = 0.5;
			}
			#endregion /* Double Jump END */

			else

			#region /* Triple Jump */
			if (jump >= 3)
			{
				if (sprite_triple_jump > noone){sprite_index = sprite_triple_jump;}else
				if (sprite_jump > noone){sprite_index = sprite_jump;}else
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
				if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
			}
			#endregion /* Triple Jump */

			if (image_index > image_number - 1)
			{
				image_speed = 0;
			}
			else
			{
				image_speed = 0.5;
			}
		}
	}
	else
	if (vspeed > 0)
	&& (stick_to_wall == false)
	&& (spring == false)
	{
		if (invincible_timer >= true)
		&& (asset_get_type("spr_player_invincible_jump") == asset_sprite)
		{
			sprite_index = spr_player_invincible_jump;
			image_speed = 1;
		}
		else
		{
			
			#region /* Fall sprites */
			if (jump_transition_to_fall_animation == 0)
			{
				image_index = 0;
				jump_transition_to_fall_animation = 1
			}
			if (jump_transition_to_fall_animation == 1)
			{
				image_speed = 0.5;
				if (sprite_jump_transition_to_fall > noone){sprite_index = sprite_jump_transition_to_fall;}else
				{jump_transition_to_fall_animation = 2;}
				if (image_index > image_number - 1)
				{
					image_index = 0;
					jump_transition_to_fall_animation = 2;
				}
			}
			if (jump_transition_to_fall_animation == 2)
			{
				if (key_jump_hold)
				{
					if (sprite_fall_slower > noone){sprite_index = sprite_fall_slower;}else
					if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
					if (sprite_jump_transition_to_fall > noone){sprite_index = sprite_jump_transition_to_fall; image_index = image_number - 1;}else
					if (sprite_jump > noone){sprite_index = sprite_jump; image_index = image_number - 1;}else
					if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
					if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
				}
				else
				{
					if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
					if (sprite_fall_slower > noone){sprite_index = sprite_fall_slower;}else
					if (sprite_jump_transition_to_fall > noone){sprite_index = sprite_jump_transition_to_fall; image_index = image_number - 1;}else
					if (sprite_jump > noone){sprite_index = sprite_jump; image_index = image_number - 1;}else
					if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
					if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
				}
			}
			#endregion /* Fall sprites END */
			
		}
	}
	if (sprite_mask >= 0)
	{
		mask_index = sprite_mask;
	}
	else
	{
		mask_index = spr_player_stand;
	}
}
#endregion /* Jumping Sprites END */

}

#region/* Stop skidding ice sound */
if (crouch == false)
{
	if (speed < 2)
	|| (hspeed > 0)
	&& (key_right_hold)
	|| (hspeed < 0)
	&& (key_left_hold)
	|| (!key_left_hold)
	&& (!key_right_hold)
	|| (!place_meeting(x, y + 1, obj_ice_block))
	{
		if (audio_is_playing(snd_skidding_ice))
		{
			audio_stop_sound(snd_skidding_ice);
		}
	}
}
else
if (!place_meeting(x, y + 1, obj_ice_block))
|| (speed < 1)
{
	if (audio_is_playing(snd_skidding_ice))
	{
		audio_stop_sound(snd_skidding_ice);
	}
}
#endregion /* Stop skidding ice sound END */

#region /* Stop skidding sound */
if (crouch == false)
{
	if (speed < 2)
	|| (hspeed > 0)
	&& (key_right_hold)
	|| (hspeed < 0)
	&& (key_left_hold)
	|| (!key_left_hold)
	&& (!key_right_hold)
	|| (!place_meeting(x, y + 1, obj_wall))
	{
		if (audio_is_playing(snd_skidding))
		{
			audio_stop_sound(snd_skidding);
		}
	}
}
else
if (!place_meeting(x, y + 1, obj_wall))
|| (speed < 1)
{
	if (audio_is_playing(snd_skidding))
	{
		audio_stop_sound(snd_skidding);
	}
}
#endregion /* Stop skidding sound END */

#region /* Footstep sounds */
if (on_ground && speed > 0 && !crouch)
{
	if ((hspeed < 0 && !key_right_hold) || (hspeed > 0 && !key_left_hold))
	{
		if (instance_exists(obj_ground))
		{
			var ground = instance_nearest(x, bbox_bottom, obj_ground);
			var ground_surface = ground.ground_surface;
			var ground_meeting = place_meeting(x, y + 1, obj_ground);
		}
		else
		{
			var ground = false;
			var ground_surface = false;
			var ground_meeting = false;
		}
		
		if (image_index < 1)
		{
			switch (ground_surface)
			{
				case 1: /* Dirt Footstep Left */
					if (ground_meeting && ground_surface == 1 && !audio_is_playing(snd_footstep_dirt_left))
						scr_audio_play(snd_footstep_dirt_left, volume_source.footstep);
					break;
				case 2: /* Glass Footstep Left */
					if (ground_meeting && ground_surface == 2 && !audio_is_playing(snd_footstep_glass_left))
						scr_audio_play(snd_footstep_glass_left, volume_source.footstep);
					break;
				case 3: /* Grass Footstep Left */
					if (ground_meeting && ground_surface == 3 && !audio_is_playing(snd_footstep_grass_left))
						scr_audio_play(snd_footstep_grass_left, volume_source.footstep);
					break;
				case 4: /* Gravel Footstep Left */
					if (ground_meeting && ground_surface == 4 && !audio_is_playing(snd_footstep_gravel_left))
						scr_audio_play(snd_footstep_gravel_left, volume_source.footstep);
					break;
				case 5: /* Metal Footstep Left */
					if (ground_meeting && ground_surface == 5 && !audio_is_playing(snd_footstep_metal_left))
						scr_audio_play(snd_footstep_metal_left, volume_source.footstep);
					break;
				case 6: /* Stone Footstep Left */
					if (ground_meeting && ground_surface == 6 && !audio_is_playing(snd_footstep_stone_left))
						scr_audio_play(snd_footstep_stone_left, volume_source.footstep);
					break;
				case 7: /* Wood Footstep Left */
					if (ground_meeting && ground_surface == 7 && !audio_is_playing(snd_footstep_wood_left))
						scr_audio_play(snd_footstep_wood_left, volume_source.footstep);
					break;
				default: /* Default Footstep Left */
					if (!audio_is_playing(snd_footstep_default_left))
						scr_audio_play(snd_footstep_default_left, volume_source.footstep);
					break;
			}
		}
		else if (image_index > image_number * 0.5 - 1 && image_index < image_number * 0.5 + 1)
		{
			switch (ground_surface)
			{
				case 1: /* Dirt Footstep Right */
					if (ground_meeting && ground_surface == 1 && !audio_is_playing(snd_footstep_dirt_right))
						scr_audio_play(snd_footstep_dirt_right, volume_source.footstep);
					break;
				case 2: /* Glass Footstep Right */
					if (ground_meeting && ground_surface == 2 && !audio_is_playing(snd_footstep_glass_right))
						scr_audio_play(snd_footstep_glass_right, volume_source.footstep);
					break;
				case 3: /* Grass Footstep Right */
					if (ground_meeting && ground_surface == 3 && !audio_is_playing(snd_footstep_grass_right))
						scr_audio_play(snd_footstep_grass_right, volume_source.footstep);
					break;
				case 4: /* Gravel Footstep Right */
					if (ground_meeting && ground_surface == 4 && !audio_is_playing(snd_footstep_gravel_right))
						scr_audio_play(snd_footstep_gravel_right, volume_source.footstep);
					break;
				case 5: /* Metal Footstep Right */
					if (ground_meeting && ground_surface == 5 && !audio_is_playing(snd_footstep_metal_right))
						scr_audio_play(snd_footstep_metal_right, volume_source.footstep);
					break;
				case 6: /* Stone Footstep Right */
					if (ground_meeting && ground_surface == 6 && !audio_is_playing(snd_footstep_stone_right))
						scr_audio_play(snd_footstep_stone_right, volume_source.footstep);
					break;
				case 7: /* Wood Footstep Right */
					if (ground_meeting && ground_surface == 7 && !audio_is_playing(snd_footstep_wood_right))
						scr_audio_play(snd_footstep_wood_right, volume_source.footstep);
					break;
				default: /* Default Footstep Right */
					if (!audio_is_playing(snd_footstep_default_right))
						scr_audio_play(snd_footstep_default_right, volume_source.footstep);
					break;
			}
		}
	}
}
#endregion /* Footstep sounds END */

#region /* Running Sparks Effect */
if (on_ground == true)
&& (abs(hspeed) >= speed_max_walk)
{
	if (abs(hspeed) > speed_max_walk + 1)
	{
		if (spark1_effect == false)
		{
			if (abs(hspeed) < 7)
			&& (key_sprint)
			&& (stick_to_wall == false)
			&& (wall_jump == 0)
			{
				scr_audio_play(voice_startdash, volume_source.voice);
			}
			effect_speedspark_subimg = 0; /* Start speedspark animation */
			spark1_effect = true;
		}
	}
	else
	{
		spark1_effect = false;
	}
	if (abs(hspeed) > 7)
	{
		if (spark2_effect == false)
		{
			if (abs(hspeed) < 7.5)
			&& (key_sprint)
			&& (stick_to_wall == false)
			&& (wall_jump == 0)
			{
				scr_audio_play(snd_speed_dash, volume_source.sound);
			}
			effect_speedspark_subimg = 0; /* Start speedspark animation */
			spark2_effect = true;
		}
	}
	else
	{
		spark2_effect = false;
	}
}
else
{
	if (abs(hspeed) < speed_max_walk)
	{
		spark1_effect = false;
	}
	spark2_effect = false;
}
#endregion /* Running Sparks Effect END */

#region /* Speedlines Effect */
if (can_create_speed_lines == true)
{
	if (invincible_timer >= true)
	&& (assist_invincible == false)
	&& (instance_exists(obj_player))
	|| (vspeed < 0)
	|| (vspeed > 0)
	{
		instance_create_depth(xx, yy, 0, obj_speedline);
	}
}
#endregion /* Speedlines Effect END */

if (on_ground == true)
{
	can_dive = true;
}

#region /* Sprite standing with item in front */
if (hold_item_in_hands != "")
&& (speed > 0)
&& (crouch == false)
&& (sprite_index != sprite_vine_climb)
&& (sprite_index != sprite_vine_stay)
{
	if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front;}else
	if (sprite_standing_with_item_in_front > noone){sprite_index = sprite_standing_with_item_in_front;}else
	if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}else
	if (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}
}
else
if (hold_item_in_hands != "")
&& (crouch == false)
&& (sprite_index != sprite_vine_climb)
&& (sprite_index != sprite_vine_stay)
{
	if (sprite_standing_with_item_in_front > noone){sprite_index = sprite_standing_with_item_in_front;}else
	if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front; image_index = 0; image_speed = 0;}else
	if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
	if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
}
#endregion /* Sprite standing with item in front END */

if (rope_swing == true)
{
	if (speed > 10)
	{
		if (sprite_tongue_swing > noone){sprite_index = sprite_tongue_swing;}else
		if (sprite_tongue_swing_still > noone){sprite_index = sprite_tongue_swing_still;}
	}
	else
	{
		if (sprite_tongue_swing_still > noone){sprite_index = sprite_tongue_swing_still;}else
		if (sprite_tongue_swing > noone){sprite_index = sprite_tongue_swing;}
	}
	angle = point_direction(grapple_x, grapple_y, x, y) + 90;
}

#region /* Glide */
if (allow_glide == true)
{
	if (can_glide > 0)
	{
		can_glide --;
	}
	if (on_ground == false)
	&& (!place_meeting(x, y + 32, obj_wall))
	&& (key_jump)
	&& (rope_swing == false)
	&& (stick_to_wall == false)
	&& (climb == false)
	&& (horizontal_rope_climb == false)
	&& (ledge_grab == false)
	&& (can_glide == 0)
	{
		glide = true;
		ground_pound = false;
		can_glide = 3;
	}
	if (on_ground == true)
	|| (rope_swing == true)
	|| (stick_to_wall == true)
	|| (climb == true)
	|| (horizontal_rope_climb == true)
	{
		can_glide = 3;
	}
	if (key_crouch_pressed)
	{
		can_glide = 20;
	}
}
if (glide == true)
{
	speed_max = speed_max_run;
	dive = false;
	gravity = 0.1;
	if (vspeed > 1)
	{
		vspeed = 1;
	}
	if (sprite_glide_down > noone){sprite_index = sprite_glide_down;}else
	if (sprite_spring_up > noone){sprite_index = sprite_spring_up;}else
	if (sprite_spring_down > noone){sprite_index = sprite_spring_down;}else
	if (sprite_double_jump > noone){sprite_index = sprite_double_jump;}else
	if (sprite_jump > noone){sprite_index = sprite_jump;}else
	if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
	if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
	if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
	if (key_sprint_pressed)
	|| (key_crouch_pressed)
	|| (on_ground == true)
	&& (vspeed >= 0)
	|| (rope_swing == true)
	|| (stick_to_wall == true)
	|| (climb == true)
	|| (horizontal_rope_climb == true)
	|| (ground_pound == true)
	{
		glide = false;
		can_glide = 3;
	}
}
#endregion /* Glide END */

#endregion /* ________________________________Handling the sprites and sounds in the step event________________________________END */

#region /* Partner Character Code */
if (partner_character == true)
{
	
	#region /* What player to follow */
	if (player == 1)
	{
		if (instance_exists(obj_camera))
		&& (instance_exists(obj_camera.player4))
		{
			partner_follow_player = obj_camera.player4;
		}
		else
		if (instance_exists(obj_camera))
		&& (instance_exists(obj_camera.player3))
		{
			partner_follow_player = obj_camera.player3;
		}
		else
		if (instance_exists(obj_camera))
		&& (instance_exists(obj_camera.player2))
		{
			partner_follow_player = obj_camera.player2;
		}
	}
	else
	if (player == 2)
	{
		if (instance_exists(obj_camera))
		&& (instance_exists(obj_camera.player1))
		{
			partner_follow_player = obj_camera.player1;
		}
		else
		if (instance_exists(obj_camera))
		&& (instance_exists(obj_camera.player4))
		{
			partner_follow_player = obj_camera.player4;
		}
		else
		if (instance_exists(obj_camera))
		&& (instance_exists(obj_camera.player3))
		{
			partner_follow_player = obj_camera.player3;
		}
	}
	else
	if (player == 3)
	{
		if (instance_exists(obj_camera))
		&& (instance_exists(obj_camera.player2))
		{
			partner_follow_player = obj_camera.player2;
		}
		else
		if (instance_exists(obj_camera))
		&& (instance_exists(obj_camera.player1))
		{
			partner_follow_player = obj_camera.player1;
		}
		else
		if (instance_exists(obj_camera))
		&& (instance_exists(obj_camera.player4))
		{
			partner_follow_player = obj_camera.player4;
		}
	}
	else
	if (player == 4)
	{
		if (instance_exists(obj_camera))
		&& (instance_exists(obj_camera.player3))
		{
			partner_follow_player = obj_camera.player3;
		}
		else
		if (instance_exists(obj_camera))
		&& (instance_exists(obj_camera.player2))
		{
			partner_follow_player = obj_camera.player2;
		}
		else
		if (instance_exists(obj_camera))
		&& (instance_exists(obj_camera.player1))
		{
			partner_follow_player = obj_camera.player1;
		}
	}
	#endregion /* What player to follow END */
	
	if (instance_exists(obj_camera))
	&& (instance_exists(partner_follow_player))
	&& (distance_to_object(partner_follow_player) > 100)
	&& (x < partner_follow_player.x - 100)
	{
		active_right = true;
		if (invincible_timer >= true)
		&& (assist_invincible == false)
		{
			speed_max = lerp(speed_max, 10, 0.1);
		}
		else
		{
			if (speed_max < speed_max_run)
			{
				speed_max = lerp(speed_max, speed_max_run, 0.1);
			}
		}
	}
	else
	{
		active_right = false;
	}
	if (instance_exists(obj_camera))
	&& (instance_exists(partner_follow_player))
	&& (distance_to_object(partner_follow_player) > 100)
	&& (x > partner_follow_player.x + 100)
	{
		active_left = true;
		if (invincible_timer >= true)
		&& (assist_invincible == false)
		{
			speed_max = lerp(speed_max, 10, 0.1);
		}
		else
		{
			if (speed_max < speed_max_run)
			{
				speed_max = lerp(speed_max, speed_max_run, 0.1);
			}
		}
	}
	else
	{
		active_left = false;
	}
	if (instance_exists(obj_camera))
	&& (instance_exists(partner_follow_player))
	&& (distance_to_object(partner_follow_player) > 100)
	&& (y > partner_follow_player.y + 100)
	&& (on_ground == true)
	|| (instance_exists(obj_camera))
	&& (instance_exists(partner_follow_player))
	&& (distance_to_object(partner_follow_player) > 100)
	&& (place_meeting(x - 1, y, obj_wall))
	&& (x > partner_follow_player.x + 100)
	&& (on_ground == true)
	|| (instance_exists(obj_camera))
	&& (instance_exists(partner_follow_player))
	&& (distance_to_object(partner_follow_player) > 100)
	&& (place_meeting(x + 1, y, obj_wall))
	&& (x < partner_follow_player.x - 100)
	&& (on_ground == true)
	{
		active_jump = true;
		active_up = true;
	}
	else
	{
		active_jump = false;
		active_up = false;
	}
	if (instance_exists(obj_camera))
	&& (instance_exists(partner_follow_player))
	&& (distance_to_object(partner_follow_player) > 100)
	&& (y < partner_follow_player.y - 100)
	{
		active_down = true;
	}
	else
	{
		active_down = false;
	}
}
#endregion /* Partner Character Code */

#region /* Predicting where player will end up at high speeds and stopping the player from going inside a wall */
line_hit = scr_line_trace( x, y, x + hspeed, y + vspeed, 1);
if (line_hit.instance != noone)
{
	if (abs(hspeed) > abs(vspeed)) /* If hspeed is more than vspeed, that's when x position is updated, so y position isn't unecessarely being changed and character jitters */
	&& (hspeed <> 0)
	{
		x = line_hit.x_hit;
	}
	if (abs(vspeed) > abs(hspeed)) /* If vspeed is more than hspeed, that's when y position is updated, so z position isn't unecessarely being changed and character jitters */
	&& (vspeed <> 0)
	{
		y = line_hit.y_hit;
	}
}
#endregion /* Predicting where player will end up at high speeds and stopping the player from going inside a wall END */

#region /* Debug teleport character with mouse */
if (keyboard_check(vk_f3))
&& (mouse_check_button(mb_left))
{
	with(obj_camera)
	{
		hspeed = 0;
		vspeed = 0;
		x = xprevious;
		y = yprevious;
		if (!mouse_check_button(mb_right))
		{
			xx = xprevious;
			yy = yprevious;
		}
	}
	hspeed = 0;
	vspeed = 0;
	x = mouse_x;
	y = mouse_y;
	die = false;
	stuck_in_wall_counter = 0;
}
#endregion /* Debug teleport character with mouse END */

scr_player_move_lose(); /* Have the losing script at the end of Step Event */