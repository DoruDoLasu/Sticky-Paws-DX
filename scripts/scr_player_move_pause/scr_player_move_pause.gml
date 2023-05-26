function scr_player_move_pause()
{
	
	#region /* Set correct controller ports */
	if (player == 1)
	{
		var player_gamepad_slot = global.player1_slot;
	}
	else
	if (player == 2)
	{
		var player_gamepad_slot = global.player2_slot;
	}
	else
	if (player == 3)
	{
		var player_gamepad_slot = global.player3_slot;
	}
	else
	if (player == 4)
	{
		var player_gamepad_slot = global.player4_slot;
	}
	#endregion /* Set correct controller ports END */
	
	#region /* Pause */	
	if (keyboard_check_pressed(vk_escape))
	or (keyboard_check(vk_tab))
	and (keyboard_check(vk_lshift))
	or (gamepad_button_check_pressed(player_gamepad_slot, gp_start))
	or (gamepad_button_check_pressed(player_gamepad_slot, gp_select))
	or (!gamepad_is_connected(player_gamepad_slot))
	and (controller_connected)
	or (global.actually_play_edited_level)
	and (!window_has_focus())
	and (global.automatically_pause_when_window_is_unfocused)
	{
		
		#region /* Show all HUD elements */
		if (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_lives_timer = global.hud_hide_time * 60;
				hud_show_deaths_timer = global.hud_hide_time * 60;
				hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
				hud_show_big_collectibles_timer = global.hud_hide_time * 60;
				hud_show_score_timer = global.hud_hide_time * 60;
			}
		}
		#endregion /* Show all HUD elements END */
		
		controller_connected = false;
		if (global.play_edited_level)
		and (global.actually_play_edited_level == false)
		and (global.character_select_in_this_menu == "level_editor")
		{
			global.play_edited_level = false;
			global.actually_play_edited_level = false;
			score = 0;
			
			#region /* Save Level Information when in level editor */
			if (global.character_select_in_this_menu == "level_editor")
			and (global.level_name != "")
			{
				ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
				ini_write_real("info", "view_xview", camera_get_view_x(view_camera[view_current]));
				ini_write_real("info", "view_yview", camera_get_view_y(view_camera[view_current]));
				ini_close();
			}
			#endregion /* Save Level Information when in level editor END */
			
			room_restart();
		}
		else
		{
			
			#region /* What player should control the pause menu */
			if (gamepad_button_check_pressed(player_gamepad_slot, gp_start))
			or (gamepad_button_check_pressed(player_gamepad_slot, gp_select))
			{
				global.pause_player = player - 1;
			}
			else
			if (global.player1_can_play)
			{
				global.pause_player = 0;
			}
			else
			if (global.player2_can_play)
			{
				global.pause_player = 1;
			}
			else
			if (global.player3_can_play)
			{
				global.pause_player = 2;
			}
			else
			if (global.player4_can_play)
			{
				global.pause_player = 3;
			}
			#endregion /* What player should control the pause menu END */
			
			global.pause_screenshot = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), 0, 1, 0, 0);
			room_persistent = true; /* Turn ON Room Persistency */
			global.pause_room = room;
			audio_pause_all();
			global.pause = true;
			room_goto(room_pause);
		}
	}
	else
	{
		room_persistent = false; /* Turn OFF Room Persistency */
	}
	#endregion /* Pause END */
	
}