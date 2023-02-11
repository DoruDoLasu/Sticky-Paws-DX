///scr_config_save()
function scr_config_save()
{
	ini_open(working_directory + "config.ini");
	
	ini_write_real("config", "current_file", global.file);
	ini_write_real("config", "difficulty", global.difficulty);
	ini_write_real("config", "automatically_pause_when_window_is_unfocused", global.automatically_pause_when_window_is_unfocused);
	ini_write_real("config", "enable_attract_demo", global.enable_attract_demo);
	ini_write_real("config", "enable_links", global.enable_links);
	ini_write_real("config", "show_timer", global.show_timer);
	ini_write_real("config", "show_deaths_counter", global.show_deaths_counter);
	ini_write_real("config", "show_ranks", global.show_ranks);
	ini_write_real("config", "assist_enable", global.assist_enable);
	ini_write_real("config", "assist_enable_enemies", global.assist_enable_enemies);
	ini_write_real("config", "assist_enable_spikes", global.assist_enable_spikes);
	ini_write_real("config", "narrator", global.narrator);
	ini_write_real("config", "show_tutorial_signs", global.show_tutorial_signs);
	ini_write_real("config", "hud_hide_time", global.hud_hide_time);
	ini_write_real("config", "players_can_collide", global.players_can_collide);
	
	#region /* Assist Settings */
	ini_write_real("config", "assist_enable", global.assist_enable);
	ini_write_real("config", "assist_item_appear", global.assist_item_appear);
	ini_write_real("config", "assist_extra_hp", global.assist_extra_hp);
	ini_write_real("config", "assist_invincible", global.assist_invincible);
	ini_write_real("config", "assist_breathe_underwater", global.assist_breathe_underwater);
	ini_write_real("config", "assist_guiding_arrows", global.assist_guiding_arrows);
	ini_write_real("config", "assist_normal_arrows", global.assist_normal_arrows);
	ini_write_real("config", "assist_show_assist_mode_text", global.assist_show_assist_mode_text);
	#endregion /* Assist Settings END */
	
	ini_write_real("config", "fullscreen_mode", window_get_fullscreen());
	ini_write_real("config", "interpolate", global.interpolate);
	ini_write_real("config", "show_fps", global.show_fps);
	ini_write_real("config", "show_fps_real", global.show_fps_real);
	ini_write_real("config", "show_instance_count", global.show_instance_count);
	ini_write_real("config", "show_collision_mask", global.show_collision_mask);
	ini_write_real("config", "volume_main", global.volume_main * 10000);
	ini_write_real("config", "volume_music", global.volume_music * 10000);
	ini_write_real("config", "volume_sound", global.volume_sound * 10000);
	ini_write_real("config", "volume_ambient", global.volume_ambient * 10000);
	ini_write_real("config", "volume_footstep", global.volume_footstep * 10000);
	ini_write_real("config", "voices_volume", global.volume_voice * 10000);
	ini_write_real("config", "background_brightness_gameplay", global.background_brightness_gameplay * 10000);
	ini_write_real("config", "background_brightness_menu", global.background_brightness_menu * 10000);
	ini_write_real("config", "enable_background_layer1", global.enable_background_layer1);
	ini_write_real("config", "enable_background_layer2", global.enable_background_layer2);
	ini_write_real("config", "enable_background_layer3", global.enable_background_layer3);
	ini_write_real("config", "enable_background_layer4", global.enable_background_layer4);
	ini_write_real("config", "enable_foreground_layer1", global.enable_foreground_layer1);
	ini_write_real("config", "enable_foreground_layer_above_static_objects", global.enable_foreground_layer_above_static_objects);
	ini_write_real("config", "enable_foreground_layer2", global.enable_foreground_layer2);
	ini_write_real("config", "enable_foreground_layer_secret", global.enable_foreground_layer_secret);
	ini_write_real("config", "enable_transitions", global.enable_transitions);
	if (global.selected_resource_pack <= -1)
	{
		global.selected_resource_pack = 0;
	}
	ini_write_real("config", "selected_resource_pack", global.selected_resource_pack);
	if (global.selected_title_background <= -2)
	{
		global.selected_title_background = -1;
	}
	ini_write_real("config", "selected_title_background", global.selected_title_background);
	ini_write_real("config", "title_background_scale", global.title_background_scale);
	ini_write_real("config", "background_layer_x_scroll", global.background_layer_x_scroll);
	ini_write_real("config", "background_layer_y_scroll", global.background_layer_y_scroll);
	if (global.selected_title_logo <= -1)
	{
		global.selected_title_logo = 0;
	}
	ini_write_real("config", "selected_title_logo", global.selected_title_logo);
	ini_write_real("config", "zoom_level", global.zoom_level);
	ini_write_real("config", "zoom_world_map", global.zoom_world_map);
	ini_write_real("config", "reset_level_zoom_when_going_back_to_map", global.reset_level_zoom_when_going_back_to_map);
	ini_write_real("config", "reset_world_map_zoom_when_going_back_to_map", global.reset_world_map_zoom_when_going_back_to_map);
	ini_write_real("config", "gui_scale_modifier", global.gui_scale_modifier);
	ini_write_real("config", "language_localization", global.language_localization);
	ini_write_real("config", "convention_mode", global.convention_mode);
	ini_write_real("config", "arcade_mode", global.arcade_mode);
	ini_write_real("config", "chosen_controller_used", global.chosen_controller_used);
	ini_write_real("config", "show_prompt_when_changing_to_gamepad", global.show_prompt_when_changing_to_gamepad);
	ini_write_real("config", "show_prompt_when_changing_to_keyboard_and_mouse", global.show_prompt_when_changing_to_keyboard_and_mouse);
	ini_write_real("config", "always_show_gamepad_buttons", global.always_show_gamepad_buttons);
	
	#region /* Save Player 1 Keyboard Remapping */
	ini_write_real("config", "character_index_player_1", global.character_index[0]);
	ini_write_real("config", "skin_for_player_1", global.skin_for_player_1);
	ini_write_string("config", "player1_name", global.player1_name);
	ini_write_real("config", "player1_up_key_is_jump_key", global.player1_up_key_is_jump_key);
	ini_write_real("config", "player1_double_tap_to_run", global.player1_double_tap_to_run);
	ini_write_real("config", "player1_sprint_toggle", global.player1_sprint_toggle);
	ini_write_real("config", "player1_double_tap_to_dive", global.player1_double_tap_to_dive);
	ini_write_real("config", "player1_cancel_dive_by_pressing_jump_or_dive_button", global.player1_cancel_dive_by_pressing_jump_or_dive_button);
	ini_write_real("config", "player1_cancel_dive_by_pressing_opposite_direction", global.player1_cancel_dive_by_pressing_opposite_direction);
	ini_write_real("config", "player1_down_and_jump_to_groundpound", global.player1_down_and_jump_to_groundpound);
	ini_write_real("config", "player1_wall_jump_setting", global.player1_wall_jump_setting);
	ini_write_real("config", "player1_drop_from_rope", global.player1_drop_from_rope);
	ini_write_real("config", "player1_show_controls", global.player1_show_controls);
	#endregion /* Save Player 1 Keyboard Remapping END */
	
	#region /* Save Player 2 Keyboard Remapping */
	ini_write_real("config", "character_index_player_2", global.character_index[1]);
	ini_write_real("config", "skin_for_player_2", global.skin_for_player_2);
	ini_write_string("config", "player2_name", global.player2_name);
	ini_write_real("config", "player2_up_key_is_jump_key", global.player2_up_key_is_jump_key);
	ini_write_real("config", "player2_double_tap_to_run", global.player2_double_tap_to_run);
	ini_write_real("config", "player2_sprint_toggle", global.player2_sprint_toggle);
	ini_write_real("config", "player2_double_tap_to_dive", global.player2_double_tap_to_dive);
	ini_write_real("config", "player2_cancel_dive_by_pressing_jump_or_dive_button", global.player2_cancel_dive_by_pressing_jump_or_dive_button);
	ini_write_real("config", "player2_cancel_dive_by_pressing_opposite_direction", global.player2_cancel_dive_by_pressing_opposite_direction);
	ini_write_real("config", "player2_down_and_jump_to_groundpound", global.player2_down_and_jump_to_groundpound);
	ini_write_real("config", "player2_wall_jump_setting", global.player2_wall_jump_setting);
	ini_write_real("config", "player2_drop_from_rope", global.player2_drop_from_rope);
	ini_write_real("config", "player2_show_controls", global.player2_show_controls);
	#endregion /* Save Player 2 Keyboard Remapping END */
	
	#region /* Save Player 3 Keyboard Remapping */
	ini_write_real("config", "character_index_player_3", global.character_index[2]);
	ini_write_real("config", "skin_for_player_3", global.skin_for_player_3);
	ini_write_string("config", "player3_name", global.player3_name);
	ini_write_real("config", "player3_up_key_is_jump_key", global.player3_up_key_is_jump_key);
	ini_write_real("config", "player3_double_tap_to_run", global.player3_double_tap_to_run);
	ini_write_real("config", "player3_sprint_toggle", global.player3_sprint_toggle);
	ini_write_real("config", "player3_double_tap_to_dive", global.player3_double_tap_to_dive);
	ini_write_real("config", "player3_cancel_dive_by_pressing_jump_or_dive_button", global.player3_cancel_dive_by_pressing_jump_or_dive_button);
	ini_write_real("config", "player3_cancel_dive_by_pressing_opposite_direction", global.player3_cancel_dive_by_pressing_opposite_direction);
	ini_write_real("config", "player3_down_and_jump_to_groundpound", global.player3_down_and_jump_to_groundpound);
	ini_write_real("config", "player3_wall_jump_setting", global.player3_wall_jump_setting);
	ini_write_real("config", "player3_drop_from_rope", global.player3_drop_from_rope);
	ini_write_real("config", "player3_show_controls", global.player3_show_controls);
	#endregion /* Save Player 3 Keyboard Remapping END */
	
	#region /* Save Player 4 Keyboard Remapping */
	ini_write_real("config", "character_index_player_4", global.character_index[3]);
	ini_write_real("config", "skin_for_player_4", global.skin_for_player_4);
	ini_write_string("config", "player4_name", global.player4_name);
	ini_write_real("config", "player4_up_key_is_jump_key", global.player4_up_key_is_jump_key);
	ini_write_real("config", "player4_double_tap_to_run", global.player4_double_tap_to_run);
	ini_write_real("config", "player4_sprint_toggle", global.player4_sprint_toggle);
	ini_write_real("config", "player4_double_tap_to_dive", global.player4_double_tap_to_dive);
	ini_write_real("config", "player4_cancel_dive_by_pressing_jump_or_dive_button", global.player4_cancel_dive_by_pressing_jump_or_dive_button);
	ini_write_real("config", "player4_cancel_dive_by_pressing_opposite_direction", global.player4_cancel_dive_by_pressing_opposite_direction);
	ini_write_real("config", "player4_down_and_jump_to_groundpound", global.player4_down_and_jump_to_groundpound);
	ini_write_real("config", "player4_wall_jump_setting", global.player4_wall_jump_setting);
	ini_write_real("config", "player4_drop_from_rope", global.player4_drop_from_rope);
	ini_write_real("config", "player4_show_controls", global.player4_show_controls);
	#endregion /* Save Player 4 Keyboard Remapping END */
	
	ini_close();
	
}