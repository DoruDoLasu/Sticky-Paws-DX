function scr_options_control_menu()
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var can_change_profile = true;
	
	#region /* Buttons positions */
	if (remapping_player == 0)
	&& (allow_player1_dive)
	|| (remapping_player == 1)
	&& (allow_player2_dive)
	|| (remapping_player == 2)
	&& (allow_player3_dive)
	|| (remapping_player == 3)
	&& (allow_player4_dive)
	{
		var menu_y_remap_key_dive = 8 + 64 * 3;
		var menu_y_remap_key_jump = 8 + 64 * 4;
	}
	else
	{
		var menu_y_remap_key_dive = -999;
		var menu_y_remap_key_jump = 8 + 64 * 3;
	}
	if (remapping_player == 0)
	&& (allow_player1_double_jump >= 2)
	|| (remapping_player == 1)
	&& (allow_player2_double_jump >= 2)
	|| (remapping_player == 2)
	&& (allow_player3_double_jump >= 2)
	|| (remapping_player == 3)
	&& (allow_player4_double_jump >= 2)
	|| (remapping_player == 0)
	&& (allow_player1_double_jump == -1)
	|| (remapping_player == 1)
	&& (allow_player2_double_jump == -1)
	|| (remapping_player == 2)
	&& (allow_player3_double_jump == -1)
	|| (remapping_player == 3)
	&& (allow_player4_double_jump == -1)
	{
		var menu_y_remap_key_double_jump = menu_y_remap_key_jump + 64 * 1;
		var menu_y_remap_key_crouch = menu_y_remap_key_jump + 64 * 2;
	}
	else
	{
		var menu_y_remap_key_double_jump = -999;
		var menu_y_remap_key_crouch = menu_y_remap_key_jump + 64 * 1;
	}
	var menu_y_remap_key_crouch_toggle = menu_y_remap_key_crouch + 64 * 1;
	var menu_y_remap_key_sprint = menu_y_remap_key_crouch + 64 * 2;
	var menu_y_remap_key_sprint_toggle = menu_y_remap_key_crouch + 64 * 3;
	var menu_y_remap_key_left = menu_y_remap_key_crouch + 64 * 4;
	var menu_y_remap_key_right = menu_y_remap_key_crouch + 64 * 5;
	var menu_y_remap_key_down = menu_y_remap_key_crouch + 64 * 6;
	var menu_y_remap_key_up = menu_y_remap_key_crouch + 64 * 7;
	
	if (remapping_player == 0)
	&& (allow_player1_tongue)
	|| (remapping_player == 1)
	&& (allow_player2_tongue)
	|| (remapping_player == 2)
	&& (allow_player3_tongue)
	|| (remapping_player == 3)
	&& (allow_player4_tongue)
	{
		var menu_y_remap_key_tongue = menu_y_remap_key_crouch + 64 * 8;
		var menu_y_remap_key_zoom_in = menu_y_remap_key_crouch + 64 * 9;
		var menu_y_remap_key_zoom_out = menu_y_remap_key_crouch + 64 * 10;
		var menu_y_remap_key_accept = menu_y_remap_key_crouch + 64 * 11;
		var menu_y_remap_key_back = menu_y_remap_key_crouch + 64 * 12;
	}
	else
	{
		var menu_y_remap_key_tongue = -999;
		var menu_y_remap_key_zoom_in = menu_y_remap_key_crouch + 64 * 8;
		var menu_y_remap_key_zoom_out = menu_y_remap_key_crouch + 64 * 9;
		var menu_y_remap_key_accept = menu_y_remap_key_crouch + 64 * 10;
		var menu_y_remap_key_back = menu_y_remap_key_crouch + 64 * 11;
	}
	var menu_y_remap_reset = menu_y_remap_key_back + 64 * 1 - 16;
	var menu_y_up_is_also_jump = menu_y_remap_key_back + 64 * 2;
	var menu_y_double_tap_direction_to_run = menu_y_remap_key_back + 64 * 3;
	var menu_y_always_run = menu_y_remap_key_back + 64 * 4;
	if (remapping_player == 0)
	&& (allow_player1_dive)
	|| (remapping_player == 1)
	&& (allow_player2_dive)
	|| (remapping_player == 2)
	&& (allow_player3_dive)
	|| (remapping_player == 3)
	&& (allow_player4_dive)
	{
		var menu_y_double_tap_direction_to_dive = menu_y_remap_key_back + 64 * 5;
		var menu_y_cancel_dive_by_pressing_jump_or_dive_button = menu_y_remap_key_back + 64 * 6;
		var menu_y_cancel_dive_by_pressing_opposite_direction = menu_y_remap_key_back + 64 * 7;
		var menu_y_down_and_jump_to_groundpound = menu_y_remap_key_back + 64 * 8;
	}
	else
	{
		var menu_y_double_tap_direction_to_dive = -999;
		var menu_y_cancel_dive_by_pressing_jump_or_dive_button = -999;
		var menu_y_cancel_dive_by_pressing_opposite_direction = -999;
		var menu_y_down_and_jump_to_groundpound = menu_y_remap_key_back + 64 * 5;
	}
	var menu_y_wall_jump_setting = menu_y_down_and_jump_to_groundpound + 64 * 1;
	var menu_y_drop_down_from_rope = menu_y_down_and_jump_to_groundpound + 64 * 2 + 16;
	var menu_y_show_controls = menu_y_down_and_jump_to_groundpound + 64 * 3 + 32;
	
	if (global.enable_options_for_pc)
	{
		var menu_y_show_prompt_when_changing_controller = menu_y_down_and_jump_to_groundpound + 64 * 4				+ 48;
	}
	else
	{
		var menu_y_show_prompt_when_changing_controller = -999;
	}
	
	if (global.enable_options_for_pc)
	&& (global.settings_sidebar_menu == "controller_settings")
	{
		var menu_y_always_show_gamepad_buttons = menu_y_down_and_jump_to_groundpound + 64 * 5				+ 48;
		var menu_y_chosen_controller_used = menu_y_down_and_jump_to_groundpound + 64 * 6				+ 48;
	}
	else
	{
		var menu_y_always_show_gamepad_buttons = -999;
		var menu_y_chosen_controller_used = -999;
	}
	#endregion /* Buttons positions END */
	
	#region /* Controls Options */
	if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
	|| (global.settings_sidebar_menu == "controller_settings")
	{
		
		#region /* Show sprite of the character you have currently selected for current player you are remapping */
		if (remapping_player == 0)
		&& (sprite_exists(global.sprite_select_player[1]))
		{
			draw_sprite_ext(global.sprite_select_player[1], 0, window_get_width() - 100, 100, 100 / sprite_get_width(global.sprite_select_player[1]), 100 / sprite_get_width(global.sprite_select_player[1]), 0, global.hex_color_for_player1, 1);
		}
		if (remapping_player == 1)
		&& (sprite_exists(global.sprite_select_player[2]))
		{
			draw_sprite_ext(global.sprite_select_player[2], 0, window_get_width() - 100, 100, 100 / sprite_get_width(global.sprite_select_player[2]), 100 / sprite_get_width(global.sprite_select_player[2]), 0, global.hex_color_for_player2, 1);
		}
		if (remapping_player == 2)
		&& (sprite_exists(global.sprite_select_player[3]))
		{
			draw_sprite_ext(global.sprite_select_player[3], 0, window_get_width() - 100, 100, 100 / sprite_get_width(global.sprite_select_player[3]), 100 / sprite_get_width(global.sprite_select_player[3]), 0, global.hex_color_for_player3, 1);
		}
		if (remapping_player == 3)
		&& (sprite_exists(global.sprite_select_player[4]))
		{
			draw_sprite_ext(global.sprite_select_player[4], 0, window_get_width() - 100, 100, 100 / sprite_get_width(global.sprite_select_player[4]), 100 / sprite_get_width(global.sprite_select_player[4]), 0, global.hex_color_for_player4, 1);
		}
		#endregion /* Show sprite of the character you have currently selected for current player you are remapping END */
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		
		#region /* Remap Keyboard and Mouse or Gamepad */
		
		#region /* Show what key is used */
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		{
			image_speed = 0;
			key1_x = 800;
			key2_x = 1000;
			
			#region /* Show the keys for every player */
			
			#region /* Remapping Player 1 Key Variables */
			if (remapping_player == 0)
			{
				var selected_remapping_player = 1;
				var other1_remapping_player = 2;
				var other2_remapping_player = 3;
				var other3_remapping_player = 4;
			}
			if (remapping_player == 1)
			{
				var selected_remapping_player = 2;
				var other1_remapping_player = 1;
				var other2_remapping_player = 3;
				var other3_remapping_player = 4;
			}
			if (remapping_player == 2)
			{
				var selected_remapping_player = 3;
				var other1_remapping_player = 1;
				var other2_remapping_player = 2;
				var other3_remapping_player = 4;
			}
			if (remapping_player == 3)
			{
				var selected_remapping_player = 4;
				var other1_remapping_player = 1;
				var other2_remapping_player = 2;
				var other3_remapping_player = 3;
			}
			if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
			{
				var keyboard_or_gamepad = inp.key;
			}
			else
			{
				var keyboard_or_gamepad = inp.gp;
			}
			
			/* global.player_[keyboard/gamepad][player][key1/key2][action] */
			var remapping_player_key_dive = global.player_[keyboard_or_gamepad][selected_remapping_player][1][action.dive];
			var remapping_player_key_jump = global.player_[keyboard_or_gamepad][selected_remapping_player][1][action.jump];
			var remapping_player_key_double_jump = global.player_[keyboard_or_gamepad][selected_remapping_player][1][action.double_jump];
			var remapping_player_key_crouch = global.player_[keyboard_or_gamepad][selected_remapping_player][1][action.crouch];
			var remapping_player_key_crouch_toggle = global.player_[keyboard_or_gamepad][selected_remapping_player][1][action.crouch_toggle];
			var remapping_player_key_sprint = global.player_[keyboard_or_gamepad][selected_remapping_player][1][action.sprint];
			var remapping_player_key_sprint_toggle = global.player_[keyboard_or_gamepad][selected_remapping_player][1][action.sprint_toggle];
			var remapping_player_key_left = global.player_[keyboard_or_gamepad][selected_remapping_player][1][action.left];
			var remapping_player_key_right = global.player_[keyboard_or_gamepad][selected_remapping_player][1][action.right];
			var remapping_player_key_down = global.player_[keyboard_or_gamepad][selected_remapping_player][1][action.down];
			var remapping_player_key_up = global.player_[keyboard_or_gamepad][selected_remapping_player][1][action.up];
			var remapping_player_key_tongue = global.player_[keyboard_or_gamepad][selected_remapping_player][1][action.tongue];
			var remapping_player_key_zoom_in = global.player_[keyboard_or_gamepad][selected_remapping_player][1][action.zoom_in];
			var remapping_player_key_zoom_out = global.player_[keyboard_or_gamepad][selected_remapping_player][1][action.zoom_out];
			var remapping_player_key_accept = global.player_[keyboard_or_gamepad][selected_remapping_player][1][action.accept];
			var remapping_player_key_back = global.player_[keyboard_or_gamepad][selected_remapping_player][1][action.back];
			
			var remapping_player_key2_dive = global.player_[keyboard_or_gamepad][selected_remapping_player][2][action.dive];
			var remapping_player_key2_jump = global.player_[keyboard_or_gamepad][selected_remapping_player][2][action.jump];
			var remapping_player_key2_double_jump = global.player_[keyboard_or_gamepad][selected_remapping_player][2][action.double_jump];
			var remapping_player_key2_crouch = global.player_[keyboard_or_gamepad][selected_remapping_player][2][action.crouch];
			var remapping_player_key2_crouch_toggle = global.player_[keyboard_or_gamepad][selected_remapping_player][2][action.crouch_toggle];
			var remapping_player_key2_sprint = global.player_[keyboard_or_gamepad][selected_remapping_player][2][action.sprint];
			var remapping_player_key2_sprint_toggle = global.player_[keyboard_or_gamepad][selected_remapping_player][2][action.sprint_toggle];
			var remapping_player_key2_left = global.player_[keyboard_or_gamepad][selected_remapping_player][2][action.left];
			var remapping_player_key2_right = global.player_[keyboard_or_gamepad][selected_remapping_player][2][action.right];
			var remapping_player_key2_down = global.player_[keyboard_or_gamepad][selected_remapping_player][2][action.down];
			var remapping_player_key2_up = global.player_[keyboard_or_gamepad][selected_remapping_player][2][action.up];
			var remapping_player_key2_tongue = global.player_[keyboard_or_gamepad][selected_remapping_player][2][action.tongue];
			var remapping_player_key2_zoom_in = global.player_[keyboard_or_gamepad][selected_remapping_player][2][action.zoom_in];
			var remapping_player_key2_zoom_out = global.player_[keyboard_or_gamepad][selected_remapping_player][2][action.zoom_out];
			var remapping_player_key2_accept = global.player_[keyboard_or_gamepad][selected_remapping_player][2][action.accept];
			var remapping_player_key2_back = global.player_[keyboard_or_gamepad][selected_remapping_player][2][action.back];
			
			#region /* Other player's keys */
			var remapping_other1_player_key_dive = global.player_[keyboard_or_gamepad][other1_remapping_player][1][action.dive];
			var remapping_other1_player_key_jump = global.player_[keyboard_or_gamepad][other1_remapping_player][1][action.jump];
			var remapping_other1_player_key_double_jump = global.player_[keyboard_or_gamepad][other1_remapping_player][1][action.double_jump];
			var remapping_other1_player_key_crouch = global.player_[keyboard_or_gamepad][other1_remapping_player][1][action.crouch];
			var remapping_other1_player_key_crouch_toggle = global.player_[keyboard_or_gamepad][other1_remapping_player][1][action.crouch_toggle];
			var remapping_other1_player_key_sprint = global.player_[keyboard_or_gamepad][other1_remapping_player][1][action.sprint];
			var remapping_other1_player_key_sprint_toggle = global.player_[keyboard_or_gamepad][other1_remapping_player][1][action.sprint_toggle];
			var remapping_other1_player_key_left = global.player_[keyboard_or_gamepad][other1_remapping_player][1][action.left];
			var remapping_other1_player_key_right = global.player_[keyboard_or_gamepad][other1_remapping_player][1][action.right];
			var remapping_other1_player_key_down = global.player_[keyboard_or_gamepad][other1_remapping_player][1][action.down];
			var remapping_other1_player_key_up = global.player_[keyboard_or_gamepad][other1_remapping_player][1][action.up];
			var remapping_other1_player_key_tongue = global.player_[keyboard_or_gamepad][other1_remapping_player][1][action.tongue];
			var remapping_other1_player_key_zoom_in = global.player_[keyboard_or_gamepad][other1_remapping_player][1][action.zoom_in];
			var remapping_other1_player_key_zoom_out = global.player_[keyboard_or_gamepad][other1_remapping_player][1][action.zoom_out];
			
			var remapping_other1_player_key2_dive = global.player_[keyboard_or_gamepad][other1_remapping_player][2][action.dive];
			var remapping_other1_player_key2_jump = global.player_[keyboard_or_gamepad][other1_remapping_player][2][action.jump];
			var remapping_other1_player_key2_double_jump = global.player_[keyboard_or_gamepad][other1_remapping_player][2][action.double_jump];
			var remapping_other1_player_key2_crouch = global.player_[keyboard_or_gamepad][other1_remapping_player][2][action.crouch];
			var remapping_other1_player_key2_crouch_toggle = global.player_[keyboard_or_gamepad][other1_remapping_player][2][action.crouch_toggle];
			var remapping_other1_player_key2_sprint = global.player_[keyboard_or_gamepad][other1_remapping_player][2][action.sprint];
			var remapping_other1_player_key2_sprint_toggle = global.player_[keyboard_or_gamepad][other1_remapping_player][2][action.sprint_toggle];
			var remapping_other1_player_key2_left = global.player_[keyboard_or_gamepad][other1_remapping_player][2][action.left];
			var remapping_other1_player_key2_right = global.player_[keyboard_or_gamepad][other1_remapping_player][2][action.right];
			var remapping_other1_player_key2_down = global.player_[keyboard_or_gamepad][other1_remapping_player][2][action.down];
			var remapping_other1_player_key2_up = global.player_[keyboard_or_gamepad][other1_remapping_player][2][action.up];
			var remapping_other1_player_key2_tongue = global.player_[keyboard_or_gamepad][other1_remapping_player][2][action.tongue];
			var remapping_other1_player_key2_zoom_in = global.player_[keyboard_or_gamepad][other1_remapping_player][2][action.zoom_in];
			var remapping_other1_player_key2_zoom_out = global.player_[keyboard_or_gamepad][other1_remapping_player][2][action.zoom_out];
			
			var remapping_other2_player_key_dive = global.player_[keyboard_or_gamepad][other2_remapping_player][1][action.dive];
			var remapping_other2_player_key_jump = global.player_[keyboard_or_gamepad][other2_remapping_player][1][action.jump];
			var remapping_other2_player_key_double_jump = global.player_[keyboard_or_gamepad][other2_remapping_player][1][action.double_jump];
			var remapping_other2_player_key_crouch = global.player_[keyboard_or_gamepad][other2_remapping_player][1][action.crouch];
			var remapping_other2_player_key_crouch_toggle = global.player_[keyboard_or_gamepad][other2_remapping_player][1][action.crouch_toggle];
			var remapping_other2_player_key_sprint = global.player_[keyboard_or_gamepad][other2_remapping_player][1][action.sprint];
			var remapping_other2_player_key_sprint_toggle = global.player_[keyboard_or_gamepad][other2_remapping_player][1][action.sprint_toggle];
			var remapping_other2_player_key_left = global.player_[keyboard_or_gamepad][other2_remapping_player][1][action.left];
			var remapping_other2_player_key_right = global.player_[keyboard_or_gamepad][other2_remapping_player][1][action.right];
			var remapping_other2_player_key_down = global.player_[keyboard_or_gamepad][other2_remapping_player][1][action.down];
			var remapping_other2_player_key_up = global.player_[keyboard_or_gamepad][other2_remapping_player][1][action.up];
			var remapping_other2_player_key_tongue = global.player_[keyboard_or_gamepad][other2_remapping_player][1][action.tongue];
			var remapping_other2_player_key_zoom_in = global.player_[keyboard_or_gamepad][other2_remapping_player][1][action.zoom_in];
			var remapping_other2_player_key_zoom_out = global.player_[keyboard_or_gamepad][other2_remapping_player][1][action.zoom_out];
			
			var remapping_other2_player_key2_dive = global.player_[keyboard_or_gamepad][other2_remapping_player][2][action.dive];
			var remapping_other2_player_key2_jump = global.player_[keyboard_or_gamepad][other2_remapping_player][2][action.jump];
			var remapping_other2_player_key2_double_jump = global.player_[keyboard_or_gamepad][other2_remapping_player][2][action.double_jump];
			var remapping_other2_player_key2_crouch = global.player_[keyboard_or_gamepad][other2_remapping_player][2][action.crouch];
			var remapping_other2_player_key2_crouch_toggle = global.player_[keyboard_or_gamepad][other2_remapping_player][2][action.crouch_toggle];
			var remapping_other2_player_key2_sprint = global.player_[keyboard_or_gamepad][other2_remapping_player][2][action.sprint];
			var remapping_other2_player_key2_sprint_toggle = global.player_[keyboard_or_gamepad][other2_remapping_player][2][action.sprint_toggle];
			var remapping_other2_player_key2_left = global.player_[keyboard_or_gamepad][other2_remapping_player][2][action.left];
			var remapping_other2_player_key2_right = global.player_[keyboard_or_gamepad][other2_remapping_player][2][action.right];
			var remapping_other2_player_key2_down = global.player_[keyboard_or_gamepad][other2_remapping_player][2][action.down];
			var remapping_other2_player_key2_up = global.player_[keyboard_or_gamepad][other2_remapping_player][2][action.up];
			var remapping_other2_player_key2_tongue = global.player_[keyboard_or_gamepad][other2_remapping_player][2][action.tongue];
			var remapping_other2_player_key2_zoom_in = global.player_[keyboard_or_gamepad][other2_remapping_player][2][action.zoom_in];
			var remapping_other2_player_key2_zoom_out = global.player_[keyboard_or_gamepad][other2_remapping_player][2][action.zoom_out];
			
			var remapping_other3_player_key_dive = global.player_[keyboard_or_gamepad][other3_remapping_player][1][action.dive];
			var remapping_other3_player_key_jump = global.player_[keyboard_or_gamepad][other3_remapping_player][1][action.jump];
			var remapping_other3_player_key_double_jump = global.player_[keyboard_or_gamepad][other3_remapping_player][1][action.double_jump];
			var remapping_other3_player_key_crouch = global.player_[keyboard_or_gamepad][other3_remapping_player][1][action.crouch];
			var remapping_other3_player_key_crouch_toggle = global.player_[keyboard_or_gamepad][other3_remapping_player][1][action.crouch_toggle];
			var remapping_other3_player_key_sprint = global.player_[keyboard_or_gamepad][other3_remapping_player][1][action.sprint];
			var remapping_other3_player_key_sprint_toggle = global.player_[keyboard_or_gamepad][other3_remapping_player][1][action.sprint_toggle];
			var remapping_other3_player_key_left = global.player_[keyboard_or_gamepad][other3_remapping_player][1][action.left];
			var remapping_other3_player_key_right = global.player_[keyboard_or_gamepad][other3_remapping_player][1][action.right];
			var remapping_other3_player_key_down = global.player_[keyboard_or_gamepad][other3_remapping_player][1][action.down];
			var remapping_other3_player_key_up = global.player_[keyboard_or_gamepad][other3_remapping_player][1][action.up];
			var remapping_other3_player_key_tongue = global.player_[keyboard_or_gamepad][other3_remapping_player][1][action.tongue];
			var remapping_other3_player_key_zoom_in = global.player_[keyboard_or_gamepad][other3_remapping_player][1][action.zoom_in];
			var remapping_other3_player_key_zoom_out = global.player_[keyboard_or_gamepad][other3_remapping_player][1][action.zoom_out];
			
			var remapping_other3_player_key2_dive = global.player_[keyboard_or_gamepad][other3_remapping_player][2][action.dive];
			var remapping_other3_player_key2_jump = global.player_[keyboard_or_gamepad][other3_remapping_player][2][action.jump];
			var remapping_other3_player_key2_double_jump = global.player_[keyboard_or_gamepad][other3_remapping_player][2][action.double_jump];
			var remapping_other3_player_key2_crouch = global.player_[keyboard_or_gamepad][other3_remapping_player][2][action.crouch];
			var remapping_other3_player_key2_crouch_toggle = global.player_[keyboard_or_gamepad][other3_remapping_player][2][action.crouch_toggle];
			var remapping_other3_player_key2_sprint = global.player_[keyboard_or_gamepad][other3_remapping_player][2][action.sprint];
			var remapping_other3_player_key2_sprint_toggle = global.player_[keyboard_or_gamepad][other3_remapping_player][2][action.sprint_toggle];
			var remapping_other3_player_key2_left = global.player_[keyboard_or_gamepad][other3_remapping_player][2][action.left];
			var remapping_other3_player_key2_right = global.player_[keyboard_or_gamepad][other3_remapping_player][2][action.right];
			var remapping_other3_player_key2_down = global.player_[keyboard_or_gamepad][other3_remapping_player][2][action.down];
			var remapping_other3_player_key2_up = global.player_[keyboard_or_gamepad][other3_remapping_player][2][action.up];
			var remapping_other3_player_key2_tongue = global.player_[keyboard_or_gamepad][other3_remapping_player][2][action.tongue];
			var remapping_other3_player_key2_zoom_in = global.player_[keyboard_or_gamepad][other3_remapping_player][2][action.zoom_in];
			var remapping_other3_player_key2_zoom_out = global.player_[keyboard_or_gamepad][other3_remapping_player][2][action.zoom_out];
			#endregion /* Other player's keys END */
			
			#endregion /* Remapping Player Key Variables END */
			
			#region /* Make keys red if in conflict with other keys */
			
			#region /* Key 1 Conflicts */
			
			#region /* Dive Conflict */
			if (remapping_player_key_dive = remapping_player_key_jump)
			|| (remapping_player_key_dive = remapping_player_key_crouch)
			|| (remapping_player_key_dive = remapping_player_key_crouch_toggle)
			|| (remapping_player_key_dive = remapping_player_key_sprint)
			|| (remapping_player_key_dive = remapping_player_key_sprint_toggle)
			|| (remapping_player_key_dive = remapping_player_key_left)
			|| (remapping_player_key_dive = remapping_player_key_right)
			|| (remapping_player_key_dive = remapping_player_key_down)
			|| (remapping_player_key_dive = remapping_player_key_up)
			|| (remapping_player_key_dive = remapping_player_key_tongue)
			|| (remapping_player_key_dive = remapping_player_key_zoom_in)
			|| (remapping_player_key_dive = remapping_player_key_zoom_out)
			
			|| (remapping_player_key_dive = remapping_player_key2_dive)
			|| (remapping_player_key_dive = remapping_player_key2_jump)
			|| (remapping_player_key_dive = remapping_player_key2_crouch)
			|| (remapping_player_key_dive = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key_dive = remapping_player_key2_sprint)
			|| (remapping_player_key_dive = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key_dive = remapping_player_key2_left)
			|| (remapping_player_key_dive = remapping_player_key2_right)
			|| (remapping_player_key_dive = remapping_player_key2_down)
			|| (remapping_player_key_dive = remapping_player_key2_up)
			|| (remapping_player_key_dive = remapping_player_key2_tongue)
			|| (remapping_player_key_dive = remapping_player_key2_zoom_in)
			|| (remapping_player_key_dive = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key_dive > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_dive + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_dive + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_dive = remapping_other1_player_key_dive)
			|| (remapping_player_key_dive = remapping_other1_player_key_jump)
			|| (remapping_player_key_dive = remapping_other1_player_key_crouch)
			|| (remapping_player_key_dive = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key_dive = remapping_other1_player_key_sprint)
			|| (remapping_player_key_dive = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key_dive = remapping_other1_player_key_left)
			|| (remapping_player_key_dive = remapping_other1_player_key_right)
			|| (remapping_player_key_dive = remapping_other1_player_key_down)
			|| (remapping_player_key_dive = remapping_other1_player_key_up)
			|| (remapping_player_key_dive = remapping_other1_player_key_tongue)
			|| (remapping_player_key_dive = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key_dive = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key_dive = remapping_other1_player_key2_dive)
			|| (remapping_player_key_dive = remapping_other1_player_key2_jump)
			|| (remapping_player_key_dive = remapping_other1_player_key2_crouch)
			|| (remapping_player_key_dive = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key_dive = remapping_other1_player_key2_sprint)
			|| (remapping_player_key_dive = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key_dive = remapping_other1_player_key2_left)
			|| (remapping_player_key_dive = remapping_other1_player_key2_right)
			|| (remapping_player_key_dive = remapping_other1_player_key2_down)
			|| (remapping_player_key_dive = remapping_other1_player_key2_up)
			|| (remapping_player_key_dive = remapping_other1_player_key2_tongue)
			|| (remapping_player_key_dive = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key_dive = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key_dive = remapping_other2_player_key_dive)
			|| (remapping_player_key_dive = remapping_other2_player_key_jump)
			|| (remapping_player_key_dive = remapping_other2_player_key_crouch)
			|| (remapping_player_key_dive = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key_dive = remapping_other2_player_key_sprint)
			|| (remapping_player_key_dive = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key_dive = remapping_other2_player_key_left)
			|| (remapping_player_key_dive = remapping_other2_player_key_right)
			|| (remapping_player_key_dive = remapping_other2_player_key_down)
			|| (remapping_player_key_dive = remapping_other2_player_key_up)
			|| (remapping_player_key_dive = remapping_other2_player_key_tongue)
			|| (remapping_player_key_dive = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key_dive = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key_dive = remapping_other2_player_key2_dive)
			|| (remapping_player_key_dive = remapping_other2_player_key2_jump)
			|| (remapping_player_key_dive = remapping_other2_player_key2_crouch)
			|| (remapping_player_key_dive = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key_dive = remapping_other2_player_key2_sprint)
			|| (remapping_player_key_dive = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key_dive = remapping_other2_player_key2_left)
			|| (remapping_player_key_dive = remapping_other2_player_key2_right)
			|| (remapping_player_key_dive = remapping_other2_player_key2_down)
			|| (remapping_player_key_dive = remapping_other2_player_key2_up)
			|| (remapping_player_key_dive = remapping_other2_player_key2_tongue)
			|| (remapping_player_key_dive = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key_dive = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key_dive = remapping_other3_player_key_dive)
			|| (remapping_player_key_dive = remapping_other3_player_key_jump)
			|| (remapping_player_key_dive = remapping_other3_player_key_crouch)
			|| (remapping_player_key_dive = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key_dive = remapping_other3_player_key_sprint)
			|| (remapping_player_key_dive = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key_dive = remapping_other3_player_key_left)
			|| (remapping_player_key_dive = remapping_other3_player_key_right)
			|| (remapping_player_key_dive = remapping_other3_player_key_down)
			|| (remapping_player_key_dive = remapping_other3_player_key_up)
			|| (remapping_player_key_dive = remapping_other3_player_key_tongue)
			|| (remapping_player_key_dive = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key_dive = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key_dive = remapping_other3_player_key2_dive)
			|| (remapping_player_key_dive = remapping_other3_player_key2_jump)
			|| (remapping_player_key_dive = remapping_other3_player_key2_crouch)
			|| (remapping_player_key_dive = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key_dive = remapping_other3_player_key2_sprint)
			|| (remapping_player_key_dive = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key_dive = remapping_other3_player_key2_left)
			|| (remapping_player_key_dive = remapping_other3_player_key2_right)
			|| (remapping_player_key_dive = remapping_other3_player_key2_down)
			|| (remapping_player_key_dive = remapping_other3_player_key2_up)
			|| (remapping_player_key_dive = remapping_other3_player_key2_tongue)
			|| (remapping_player_key_dive = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key_dive = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key_dive > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_dive + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_dive + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Dive Conflict END */
			
			#region /* Jump Conflict */
			if (remapping_player_key_jump = remapping_player_key_dive)
			|| (remapping_player_key_jump = remapping_player_key_crouch)
			|| (remapping_player_key_jump = remapping_player_key_crouch_toggle)
			|| (remapping_player_key_jump = remapping_player_key_sprint)
			|| (remapping_player_key_jump = remapping_player_key_sprint_toggle)
			|| (remapping_player_key_jump = remapping_player_key_left)
			|| (remapping_player_key_jump = remapping_player_key_right)
			|| (remapping_player_key_jump = remapping_player_key_down)
			|| (remapping_player_key_jump = remapping_player_key_up)
			|| (remapping_player_key_jump = remapping_player_key_tongue)
			|| (remapping_player_key_jump = remapping_player_key_zoom_in)
			|| (remapping_player_key_jump = remapping_player_key_zoom_out)
			
			|| (remapping_player_key_jump = remapping_player_key2_dive)
			|| (remapping_player_key_jump = remapping_player_key2_jump)
			|| (remapping_player_key_jump = remapping_player_key2_crouch)
			|| (remapping_player_key_jump = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key_jump = remapping_player_key2_sprint)
			|| (remapping_player_key_jump = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key_jump = remapping_player_key2_left)
			|| (remapping_player_key_jump = remapping_player_key2_right)
			|| (remapping_player_key_jump = remapping_player_key2_down)
			|| (remapping_player_key_jump = remapping_player_key2_up)
			|| (remapping_player_key_jump = remapping_player_key2_tongue)
			|| (remapping_player_key_jump = remapping_player_key2_zoom_in)
			|| (remapping_player_key_jump = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key_jump > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_jump + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_jump + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_jump = remapping_other1_player_key_dive)
			|| (remapping_player_key_jump = remapping_other1_player_key_jump)
			|| (remapping_player_key_jump = remapping_other1_player_key_crouch)
			|| (remapping_player_key_jump = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key_jump = remapping_other1_player_key_sprint)
			|| (remapping_player_key_jump = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key_jump = remapping_other1_player_key_left)
			|| (remapping_player_key_jump = remapping_other1_player_key_right)
			|| (remapping_player_key_jump = remapping_other1_player_key_down)
			|| (remapping_player_key_jump = remapping_other1_player_key_up)
			|| (remapping_player_key_jump = remapping_other1_player_key_tongue)
			|| (remapping_player_key_jump = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key_jump = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key_jump = remapping_other1_player_key2_dive)
			|| (remapping_player_key_jump = remapping_other1_player_key2_jump)
			|| (remapping_player_key_jump = remapping_other1_player_key2_crouch)
			|| (remapping_player_key_jump = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key_jump = remapping_other1_player_key2_sprint)
			|| (remapping_player_key_jump = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key_jump = remapping_other1_player_key2_left)
			|| (remapping_player_key_jump = remapping_other1_player_key2_right)
			|| (remapping_player_key_jump = remapping_other1_player_key2_down)
			|| (remapping_player_key_jump = remapping_other1_player_key2_up)
			|| (remapping_player_key_jump = remapping_other1_player_key2_tongue)
			|| (remapping_player_key_jump = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key_jump = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key_jump = remapping_other2_player_key_dive)
			|| (remapping_player_key_jump = remapping_other2_player_key_jump)
			|| (remapping_player_key_jump = remapping_other2_player_key_crouch)
			|| (remapping_player_key_jump = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key_jump = remapping_other2_player_key_sprint)
			|| (remapping_player_key_jump = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key_jump = remapping_other2_player_key_left)
			|| (remapping_player_key_jump = remapping_other2_player_key_right)
			|| (remapping_player_key_jump = remapping_other2_player_key_down)
			|| (remapping_player_key_jump = remapping_other2_player_key_up)
			|| (remapping_player_key_jump = remapping_other2_player_key_tongue)
			|| (remapping_player_key_jump = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key_jump = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key_jump = remapping_other2_player_key2_dive)
			|| (remapping_player_key_jump = remapping_other2_player_key2_jump)
			|| (remapping_player_key_jump = remapping_other2_player_key2_crouch)
			|| (remapping_player_key_jump = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key_jump = remapping_other2_player_key2_sprint)
			|| (remapping_player_key_jump = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key_jump = remapping_other2_player_key2_left)
			|| (remapping_player_key_jump = remapping_other2_player_key2_right)
			|| (remapping_player_key_jump = remapping_other2_player_key2_down)
			|| (remapping_player_key_jump = remapping_other2_player_key2_up)
			|| (remapping_player_key_jump = remapping_other2_player_key2_tongue)
			|| (remapping_player_key_jump = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key_jump = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key_jump = remapping_other3_player_key_dive)
			|| (remapping_player_key_jump = remapping_other3_player_key_jump)
			|| (remapping_player_key_jump = remapping_other3_player_key_crouch)
			|| (remapping_player_key_jump = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key_jump = remapping_other3_player_key_sprint)
			|| (remapping_player_key_jump = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key_jump = remapping_other3_player_key_left)
			|| (remapping_player_key_jump = remapping_other3_player_key_right)
			|| (remapping_player_key_jump = remapping_other3_player_key_down)
			|| (remapping_player_key_jump = remapping_other3_player_key_up)
			|| (remapping_player_key_jump = remapping_other3_player_key_tongue)
			|| (remapping_player_key_jump = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key_jump = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key_jump = remapping_other3_player_key2_dive)
			|| (remapping_player_key_jump = remapping_other3_player_key2_jump)
			|| (remapping_player_key_jump = remapping_other3_player_key2_crouch)
			|| (remapping_player_key_jump = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key_jump = remapping_other3_player_key2_sprint)
			|| (remapping_player_key_jump = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key_jump = remapping_other3_player_key2_left)
			|| (remapping_player_key_jump = remapping_other3_player_key2_right)
			|| (remapping_player_key_jump = remapping_other3_player_key2_down)
			|| (remapping_player_key_jump = remapping_other3_player_key2_up)
			|| (remapping_player_key_jump = remapping_other3_player_key2_tongue)
			|| (remapping_player_key_jump = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key_jump = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key_jump > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_jump + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_jump + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Jump Conflict END */
			
			#region /* Crouch Conflict */
			if (remapping_player_key_crouch = remapping_player_key_dive)
			|| (remapping_player_key_crouch = remapping_player_key_jump)
			|| (remapping_player_key_crouch = remapping_player_key_crouch_toggle)
			|| (remapping_player_key_crouch = remapping_player_key_sprint)
			|| (remapping_player_key_crouch = remapping_player_key_sprint_toggle)
			|| (remapping_player_key_crouch = remapping_player_key_left)
			|| (remapping_player_key_crouch = remapping_player_key_right)
			|| (remapping_player_key_crouch = remapping_player_key_down)
			|| (remapping_player_key_crouch = remapping_player_key_up)
			|| (remapping_player_key_crouch = remapping_player_key_tongue)
			|| (remapping_player_key_crouch = remapping_player_key_zoom_in)
			|| (remapping_player_key_crouch = remapping_player_key_zoom_out)
			
			|| (remapping_player_key_crouch = remapping_player_key2_dive)
			|| (remapping_player_key_crouch = remapping_player_key2_jump)
			|| (remapping_player_key_crouch = remapping_player_key2_crouch)
			|| (remapping_player_key_crouch = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key_crouch = remapping_player_key2_sprint)
			|| (remapping_player_key_crouch = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key_crouch = remapping_player_key2_left)
			|| (remapping_player_key_crouch = remapping_player_key2_right)
			|| (remapping_player_key_crouch = remapping_player_key2_down)
			|| (remapping_player_key_crouch = remapping_player_key2_up)
			|| (remapping_player_key_crouch = remapping_player_key2_tongue)
			|| (remapping_player_key_crouch = remapping_player_key2_zoom_in)
			|| (remapping_player_key_crouch = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key_crouch > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_crouch + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_crouch + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_crouch = remapping_other1_player_key_dive)
			|| (remapping_player_key_crouch = remapping_other1_player_key_jump)
			|| (remapping_player_key_crouch = remapping_other1_player_key_crouch)
			|| (remapping_player_key_crouch = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key_crouch = remapping_other1_player_key_sprint)
			|| (remapping_player_key_crouch = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key_crouch = remapping_other1_player_key_left)
			|| (remapping_player_key_crouch = remapping_other1_player_key_right)
			|| (remapping_player_key_crouch = remapping_other1_player_key_down)
			|| (remapping_player_key_crouch = remapping_other1_player_key_up)
			|| (remapping_player_key_crouch = remapping_other1_player_key_tongue)
			|| (remapping_player_key_crouch = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key_crouch = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key_crouch = remapping_other1_player_key2_dive)
			|| (remapping_player_key_crouch = remapping_other1_player_key2_jump)
			|| (remapping_player_key_crouch = remapping_other1_player_key2_crouch)
			|| (remapping_player_key_crouch = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key_crouch = remapping_other1_player_key2_sprint)
			|| (remapping_player_key_crouch = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key_crouch = remapping_other1_player_key2_left)
			|| (remapping_player_key_crouch = remapping_other1_player_key2_right)
			|| (remapping_player_key_crouch = remapping_other1_player_key2_down)
			|| (remapping_player_key_crouch = remapping_other1_player_key2_up)
			|| (remapping_player_key_crouch = remapping_other1_player_key2_tongue)
			|| (remapping_player_key_crouch = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key_crouch = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key_crouch = remapping_other2_player_key_dive)
			|| (remapping_player_key_crouch = remapping_other2_player_key_jump)
			|| (remapping_player_key_crouch = remapping_other2_player_key_crouch)
			|| (remapping_player_key_crouch = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key_crouch = remapping_other2_player_key_sprint)
			|| (remapping_player_key_crouch = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key_crouch = remapping_other2_player_key_left)
			|| (remapping_player_key_crouch = remapping_other2_player_key_right)
			|| (remapping_player_key_crouch = remapping_other2_player_key_down)
			|| (remapping_player_key_crouch = remapping_other2_player_key_up)
			|| (remapping_player_key_crouch = remapping_other2_player_key_tongue)
			|| (remapping_player_key_crouch = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key_crouch = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key_crouch = remapping_other2_player_key2_dive)
			|| (remapping_player_key_crouch = remapping_other2_player_key2_jump)
			|| (remapping_player_key_crouch = remapping_other2_player_key2_crouch)
			|| (remapping_player_key_crouch = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key_crouch = remapping_other2_player_key2_sprint)
			|| (remapping_player_key_crouch = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key_crouch = remapping_other2_player_key2_left)
			|| (remapping_player_key_crouch = remapping_other2_player_key2_right)
			|| (remapping_player_key_crouch = remapping_other2_player_key2_down)
			|| (remapping_player_key_crouch = remapping_other2_player_key2_up)
			|| (remapping_player_key_crouch = remapping_other2_player_key2_tongue)
			|| (remapping_player_key_crouch = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key_crouch = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key_crouch = remapping_other3_player_key_dive)
			|| (remapping_player_key_crouch = remapping_other3_player_key_jump)
			|| (remapping_player_key_crouch = remapping_other3_player_key_crouch)
			|| (remapping_player_key_crouch = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key_crouch = remapping_other3_player_key_sprint)
			|| (remapping_player_key_crouch = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key_crouch = remapping_other3_player_key_left)
			|| (remapping_player_key_crouch = remapping_other3_player_key_right)
			|| (remapping_player_key_crouch = remapping_other3_player_key_down)
			|| (remapping_player_key_crouch = remapping_other3_player_key_up)
			|| (remapping_player_key_crouch = remapping_other3_player_key_tongue)
			|| (remapping_player_key_crouch = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key_crouch = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key_crouch = remapping_other3_player_key2_dive)
			|| (remapping_player_key_crouch = remapping_other3_player_key2_jump)
			|| (remapping_player_key_crouch = remapping_other3_player_key2_crouch)
			|| (remapping_player_key_crouch = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key_crouch = remapping_other3_player_key2_sprint)
			|| (remapping_player_key_crouch = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key_crouch = remapping_other3_player_key2_left)
			|| (remapping_player_key_crouch = remapping_other3_player_key2_right)
			|| (remapping_player_key_crouch = remapping_other3_player_key2_down)
			|| (remapping_player_key_crouch = remapping_other3_player_key2_up)
			|| (remapping_player_key_crouch = remapping_other3_player_key2_tongue)
			|| (remapping_player_key_crouch = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key_crouch = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key_crouch > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_crouch + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_crouch + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Crouch Conflict END */
			
			#region /* Crouch Toggle Conflict */
			if (remapping_player_key_crouch_toggle = remapping_player_key_dive)
			|| (remapping_player_key_crouch_toggle = remapping_player_key_jump)
			|| (remapping_player_key_crouch_toggle = remapping_player_key_crouch)
			|| (remapping_player_key_crouch_toggle = remapping_player_key_sprint)
			|| (remapping_player_key_crouch_toggle = remapping_player_key_sprint_toggle)
			|| (remapping_player_key_crouch_toggle = remapping_player_key_left)
			|| (remapping_player_key_crouch_toggle = remapping_player_key_right)
			|| (remapping_player_key_crouch_toggle = remapping_player_key_down)
			|| (remapping_player_key_crouch_toggle = remapping_player_key_up)
			|| (remapping_player_key_crouch_toggle = remapping_player_key_tongue)
			|| (remapping_player_key_crouch_toggle = remapping_player_key_zoom_in)
			|| (remapping_player_key_crouch_toggle = remapping_player_key_zoom_out)
			
			|| (remapping_player_key_crouch_toggle = remapping_player_key2_dive)
			|| (remapping_player_key_crouch_toggle = remapping_player_key2_jump)
			|| (remapping_player_key_crouch_toggle = remapping_player_key2_crouch)
			|| (remapping_player_key_crouch_toggle = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key_crouch_toggle = remapping_player_key2_sprint)
			|| (remapping_player_key_crouch_toggle = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key_crouch_toggle = remapping_player_key2_left)
			|| (remapping_player_key_crouch_toggle = remapping_player_key2_right)
			|| (remapping_player_key_crouch_toggle = remapping_player_key2_down)
			|| (remapping_player_key_crouch_toggle = remapping_player_key2_up)
			|| (remapping_player_key_crouch_toggle = remapping_player_key2_tongue)
			|| (remapping_player_key_crouch_toggle = remapping_player_key2_zoom_in)
			|| (remapping_player_key_crouch_toggle = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key_crouch_toggle > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_crouch_toggle + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_crouch_toggle + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_crouch_toggle = remapping_other1_player_key_dive)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key_jump)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key_crouch)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key_sprint)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key_left)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key_right)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key_down)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key_up)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key_tongue)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key2_dive)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key2_jump)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key2_crouch)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key2_sprint)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key2_left)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key2_right)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key2_down)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key2_up)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key2_tongue)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key_crouch_toggle = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key_dive)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key_jump)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key_crouch)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key_sprint)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key_left)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key_right)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key_down)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key_up)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key_tongue)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key2_dive)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key2_jump)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key2_crouch)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key2_sprint)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key2_left)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key2_right)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key2_down)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key2_up)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key2_tongue)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key_crouch_toggle = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key_dive)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key_jump)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key_crouch)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key_sprint)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key_left)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key_right)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key_down)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key_up)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key_tongue)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key2_dive)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key2_jump)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key2_crouch)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key2_sprint)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key2_left)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key2_right)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key2_down)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key2_up)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key2_tongue)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key_crouch_toggle = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key_crouch_toggle > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_crouch_toggle + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_crouch_toggle + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Crouch Toggle Conflict END */
			
			#region /* Sprint Conflict */
			if (remapping_player_key_sprint = remapping_player_key_dive)
			|| (remapping_player_key_sprint = remapping_player_key_jump)
			|| (remapping_player_key_sprint = remapping_player_key_crouch)
			|| (remapping_player_key_sprint = remapping_player_key_crouch_toggle)
			|| (remapping_player_key_sprint = remapping_player_key_sprint_toggle)
			|| (remapping_player_key_sprint = remapping_player_key_left)
			|| (remapping_player_key_sprint = remapping_player_key_right)
			|| (remapping_player_key_sprint = remapping_player_key_down)
			|| (remapping_player_key_sprint = remapping_player_key_up)
			|| (remapping_player_key_sprint = remapping_player_key_tongue)
			|| (remapping_player_key_sprint = remapping_player_key_zoom_in)
			|| (remapping_player_key_sprint = remapping_player_key_zoom_out)
			
			|| (remapping_player_key_sprint = remapping_player_key2_dive)
			|| (remapping_player_key_sprint = remapping_player_key2_jump)
			|| (remapping_player_key_sprint = remapping_player_key2_crouch)
			|| (remapping_player_key_sprint = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key_sprint = remapping_player_key2_sprint)
			|| (remapping_player_key_sprint = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key_sprint = remapping_player_key2_left)
			|| (remapping_player_key_sprint = remapping_player_key2_right)
			|| (remapping_player_key_sprint = remapping_player_key2_down)
			|| (remapping_player_key_sprint = remapping_player_key2_up)
			|| (remapping_player_key_sprint = remapping_player_key2_tongue)
			|| (remapping_player_key_sprint = remapping_player_key2_zoom_in)
			|| (remapping_player_key_sprint = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key_sprint > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_sprint + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_sprint + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_sprint = remapping_other1_player_key_dive)
			|| (remapping_player_key_sprint = remapping_other1_player_key_jump)
			|| (remapping_player_key_sprint = remapping_other1_player_key_crouch)
			|| (remapping_player_key_sprint = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key_sprint = remapping_other1_player_key_sprint)
			|| (remapping_player_key_sprint = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key_sprint = remapping_other1_player_key_left)
			|| (remapping_player_key_sprint = remapping_other1_player_key_right)
			|| (remapping_player_key_sprint = remapping_other1_player_key_down)
			|| (remapping_player_key_sprint = remapping_other1_player_key_up)
			|| (remapping_player_key_sprint = remapping_other1_player_key_tongue)
			|| (remapping_player_key_sprint = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key_sprint = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key_sprint = remapping_other1_player_key2_dive)
			|| (remapping_player_key_sprint = remapping_other1_player_key2_jump)
			|| (remapping_player_key_sprint = remapping_other1_player_key2_crouch)
			|| (remapping_player_key_sprint = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key_sprint = remapping_other1_player_key2_sprint)
			|| (remapping_player_key_sprint = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key_sprint = remapping_other1_player_key2_left)
			|| (remapping_player_key_sprint = remapping_other1_player_key2_right)
			|| (remapping_player_key_sprint = remapping_other1_player_key2_down)
			|| (remapping_player_key_sprint = remapping_other1_player_key2_up)
			|| (remapping_player_key_sprint = remapping_other1_player_key2_tongue)
			|| (remapping_player_key_sprint = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key_sprint = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key_sprint = remapping_other2_player_key_dive)
			|| (remapping_player_key_sprint = remapping_other2_player_key_jump)
			|| (remapping_player_key_sprint = remapping_other2_player_key_crouch)
			|| (remapping_player_key_sprint = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key_sprint = remapping_other2_player_key_sprint)
			|| (remapping_player_key_sprint = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key_sprint = remapping_other2_player_key_left)
			|| (remapping_player_key_sprint = remapping_other2_player_key_right)
			|| (remapping_player_key_sprint = remapping_other2_player_key_down)
			|| (remapping_player_key_sprint = remapping_other2_player_key_up)
			|| (remapping_player_key_sprint = remapping_other2_player_key_tongue)
			|| (remapping_player_key_sprint = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key_sprint = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key_sprint = remapping_other2_player_key2_dive)
			|| (remapping_player_key_sprint = remapping_other2_player_key2_jump)
			|| (remapping_player_key_sprint = remapping_other2_player_key2_crouch)
			|| (remapping_player_key_sprint = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key_sprint = remapping_other2_player_key2_sprint)
			|| (remapping_player_key_sprint = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key_sprint = remapping_other2_player_key2_left)
			|| (remapping_player_key_sprint = remapping_other2_player_key2_right)
			|| (remapping_player_key_sprint = remapping_other2_player_key2_down)
			|| (remapping_player_key_sprint = remapping_other2_player_key2_up)
			|| (remapping_player_key_sprint = remapping_other2_player_key2_tongue)
			|| (remapping_player_key_sprint = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key_sprint = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key_sprint = remapping_other3_player_key_dive)
			|| (remapping_player_key_sprint = remapping_other3_player_key_jump)
			|| (remapping_player_key_sprint = remapping_other3_player_key_crouch)
			|| (remapping_player_key_sprint = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key_sprint = remapping_other3_player_key_sprint)
			|| (remapping_player_key_sprint = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key_sprint = remapping_other3_player_key_left)
			|| (remapping_player_key_sprint = remapping_other3_player_key_right)
			|| (remapping_player_key_sprint = remapping_other3_player_key_down)
			|| (remapping_player_key_sprint = remapping_other3_player_key_up)
			|| (remapping_player_key_sprint = remapping_other3_player_key_tongue)
			|| (remapping_player_key_sprint = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key_sprint = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key_sprint = remapping_other3_player_key2_dive)
			|| (remapping_player_key_sprint = remapping_other3_player_key2_jump)
			|| (remapping_player_key_sprint = remapping_other3_player_key2_crouch)
			|| (remapping_player_key_sprint = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key_sprint = remapping_other3_player_key2_sprint)
			|| (remapping_player_key_sprint = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key_sprint = remapping_other3_player_key2_left)
			|| (remapping_player_key_sprint = remapping_other3_player_key2_right)
			|| (remapping_player_key_sprint = remapping_other3_player_key2_down)
			|| (remapping_player_key_sprint = remapping_other3_player_key2_up)
			|| (remapping_player_key_sprint = remapping_other3_player_key2_tongue)
			|| (remapping_player_key_sprint = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key_sprint = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key_sprint > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_sprint + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_sprint + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Sprint Conflict END */
			
			#region /* Sprint Toggle Conflict */
			if (remapping_player_key_sprint_toggle = remapping_player_key_dive)
			|| (remapping_player_key_sprint_toggle = remapping_player_key_jump)
			|| (remapping_player_key_sprint_toggle = remapping_player_key_crouch)
			|| (remapping_player_key_sprint_toggle = remapping_player_key_crouch_toggle)
			|| (remapping_player_key_sprint_toggle = remapping_player_key_sprint)
			|| (remapping_player_key_sprint_toggle = remapping_player_key_left)
			|| (remapping_player_key_sprint_toggle = remapping_player_key_right)
			|| (remapping_player_key_sprint_toggle = remapping_player_key_down)
			|| (remapping_player_key_sprint_toggle = remapping_player_key_up)
			|| (remapping_player_key_sprint_toggle = remapping_player_key_tongue)
			|| (remapping_player_key_sprint_toggle = remapping_player_key_zoom_in)
			|| (remapping_player_key_sprint_toggle = remapping_player_key_zoom_out)
			
			|| (remapping_player_key_sprint_toggle = remapping_player_key2_dive)
			|| (remapping_player_key_sprint_toggle = remapping_player_key2_jump)
			|| (remapping_player_key_sprint_toggle = remapping_player_key2_crouch)
			|| (remapping_player_key_sprint_toggle = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key_sprint_toggle = remapping_player_key2_sprint)
			|| (remapping_player_key_sprint_toggle = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key_sprint_toggle = remapping_player_key2_left)
			|| (remapping_player_key_sprint_toggle = remapping_player_key2_right)
			|| (remapping_player_key_sprint_toggle = remapping_player_key2_down)
			|| (remapping_player_key_sprint_toggle = remapping_player_key2_up)
			|| (remapping_player_key_sprint_toggle = remapping_player_key2_tongue)
			|| (remapping_player_key_sprint_toggle = remapping_player_key2_zoom_in)
			|| (remapping_player_key_sprint_toggle = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key_sprint_toggle > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_sprint_toggle + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_sprint + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_sprint_toggle = remapping_other1_player_key_dive)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key_jump)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key_crouch)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key_sprint)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key_left)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key_right)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key_down)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key_up)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key_tongue)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key2_dive)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key2_jump)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key2_crouch)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key2_sprint)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key2_left)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key2_right)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key2_down)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key2_up)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key2_tongue)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key_sprint_toggle = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key_dive)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key_jump)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key_crouch)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key_sprint)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key_left)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key_right)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key_down)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key_up)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key_tongue)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key2_dive)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key2_jump)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key2_crouch)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key2_sprint)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key2_left)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key2_right)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key2_down)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key2_up)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key2_tongue)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key_sprint_toggle = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key_dive)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key_jump)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key_crouch)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key_sprint)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key_left)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key_right)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key_down)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key_up)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key_tongue)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key2_dive)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key2_jump)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key2_crouch)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key2_sprint)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key2_left)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key2_right)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key2_down)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key2_up)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key2_tongue)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key_sprint_toggle = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key_sprint_toggle > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_sprint_toggle + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_sprint_toggle + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Sprint Toggle Conflict END */
			
			#region /* Left Conflict */
			if (remapping_player_key_left = remapping_player_key_dive)
			|| (remapping_player_key_left = remapping_player_key_jump)
			|| (remapping_player_key_left = remapping_player_key_crouch)
			|| (remapping_player_key_left = remapping_player_key_crouch_toggle)
			|| (remapping_player_key_left = remapping_player_key_sprint)
			|| (remapping_player_key_left = remapping_player_key_sprint_toggle)
			|| (remapping_player_key_left = remapping_player_key_right)
			|| (remapping_player_key_left = remapping_player_key_down)
			|| (remapping_player_key_left = remapping_player_key_up)
			|| (remapping_player_key_left = remapping_player_key_tongue)
			|| (remapping_player_key_left = remapping_player_key_zoom_in)
			|| (remapping_player_key_left = remapping_player_key_zoom_out)
			
			|| (remapping_player_key_left = remapping_player_key2_dive)
			|| (remapping_player_key_left = remapping_player_key2_jump)
			|| (remapping_player_key_left = remapping_player_key2_crouch)
			|| (remapping_player_key_left = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key_left = remapping_player_key2_sprint)
			|| (remapping_player_key_left = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key_left = remapping_player_key2_left)
			|| (remapping_player_key_left = remapping_player_key2_right)
			|| (remapping_player_key_left = remapping_player_key2_down)
			|| (remapping_player_key_left = remapping_player_key2_up)
			|| (remapping_player_key_left = remapping_player_key2_tongue)
			|| (remapping_player_key_left = remapping_player_key2_zoom_in)
			|| (remapping_player_key_left = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key_left > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_left + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_left + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_left = remapping_other1_player_key_dive)
			|| (remapping_player_key_left = remapping_other1_player_key_jump)
			|| (remapping_player_key_left = remapping_other1_player_key_crouch)
			|| (remapping_player_key_left = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key_left = remapping_other1_player_key_sprint)
			|| (remapping_player_key_left = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key_left = remapping_other1_player_key_left)
			|| (remapping_player_key_left = remapping_other1_player_key_right)
			|| (remapping_player_key_left = remapping_other1_player_key_down)
			|| (remapping_player_key_left = remapping_other1_player_key_up)
			|| (remapping_player_key_left = remapping_other1_player_key_tongue)
			|| (remapping_player_key_left = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key_left = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key_left = remapping_other1_player_key2_dive)
			|| (remapping_player_key_left = remapping_other1_player_key2_jump)
			|| (remapping_player_key_left = remapping_other1_player_key2_crouch)
			|| (remapping_player_key_left = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key_left = remapping_other1_player_key2_sprint)
			|| (remapping_player_key_left = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key_left = remapping_other1_player_key2_left)
			|| (remapping_player_key_left = remapping_other1_player_key2_right)
			|| (remapping_player_key_left = remapping_other1_player_key2_down)
			|| (remapping_player_key_left = remapping_other1_player_key2_up)
			|| (remapping_player_key_left = remapping_other1_player_key2_tongue)
			|| (remapping_player_key_left = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key_left = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key_left = remapping_other2_player_key_dive)
			|| (remapping_player_key_left = remapping_other2_player_key_jump)
			|| (remapping_player_key_left = remapping_other2_player_key_crouch)
			|| (remapping_player_key_left = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key_left = remapping_other2_player_key_sprint)
			|| (remapping_player_key_left = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key_left = remapping_other2_player_key_left)
			|| (remapping_player_key_left = remapping_other2_player_key_right)
			|| (remapping_player_key_left = remapping_other2_player_key_down)
			|| (remapping_player_key_left = remapping_other2_player_key_up)
			|| (remapping_player_key_left = remapping_other2_player_key_tongue)
			|| (remapping_player_key_left = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key_left = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key_left = remapping_other2_player_key2_dive)
			|| (remapping_player_key_left = remapping_other2_player_key2_jump)
			|| (remapping_player_key_left = remapping_other2_player_key2_crouch)
			|| (remapping_player_key_left = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key_left = remapping_other2_player_key2_sprint)
			|| (remapping_player_key_left = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key_left = remapping_other2_player_key2_left)
			|| (remapping_player_key_left = remapping_other2_player_key2_right)
			|| (remapping_player_key_left = remapping_other2_player_key2_down)
			|| (remapping_player_key_left = remapping_other2_player_key2_up)
			|| (remapping_player_key_left = remapping_other2_player_key2_tongue)
			|| (remapping_player_key_left = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key_left = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key_left = remapping_other3_player_key_dive)
			|| (remapping_player_key_left = remapping_other3_player_key_jump)
			|| (remapping_player_key_left = remapping_other3_player_key_crouch)
			|| (remapping_player_key_left = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key_left = remapping_other3_player_key_sprint)
			|| (remapping_player_key_left = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key_left = remapping_other3_player_key_left)
			|| (remapping_player_key_left = remapping_other3_player_key_right)
			|| (remapping_player_key_left = remapping_other3_player_key_down)
			|| (remapping_player_key_left = remapping_other3_player_key_up)
			|| (remapping_player_key_left = remapping_other3_player_key_tongue)
			|| (remapping_player_key_left = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key_left = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key_left = remapping_other3_player_key2_dive)
			|| (remapping_player_key_left = remapping_other3_player_key2_jump)
			|| (remapping_player_key_left = remapping_other3_player_key2_crouch)
			|| (remapping_player_key_left = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key_left = remapping_other3_player_key2_sprint)
			|| (remapping_player_key_left = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key_left = remapping_other3_player_key2_left)
			|| (remapping_player_key_left = remapping_other3_player_key2_right)
			|| (remapping_player_key_left = remapping_other3_player_key2_down)
			|| (remapping_player_key_left = remapping_other3_player_key2_up)
			|| (remapping_player_key_left = remapping_other3_player_key2_tongue)
			|| (remapping_player_key_left = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key_left = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key_left > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_left + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_left + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Left Conflict END */
			
			#region /* Right Conflict */
			if (remapping_player_key_right = remapping_player_key_dive)
			|| (remapping_player_key_right = remapping_player_key_jump)
			|| (remapping_player_key_right = remapping_player_key_crouch)
			|| (remapping_player_key_right = remapping_player_key_crouch_toggle)
			|| (remapping_player_key_right = remapping_player_key_sprint)
			|| (remapping_player_key_right = remapping_player_key_sprint_toggle)
			|| (remapping_player_key_right = remapping_player_key_left)
			|| (remapping_player_key_right = remapping_player_key_down)
			|| (remapping_player_key_right = remapping_player_key_up)
			|| (remapping_player_key_right = remapping_player_key_tongue)
			|| (remapping_player_key_right = remapping_player_key_zoom_in)
			|| (remapping_player_key_right = remapping_player_key_zoom_out)
			
			|| (remapping_player_key_right = remapping_player_key2_dive)
			|| (remapping_player_key_right = remapping_player_key2_jump)
			|| (remapping_player_key_right = remapping_player_key2_crouch)
			|| (remapping_player_key_right = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key_right = remapping_player_key2_sprint)
			|| (remapping_player_key_right = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key_right = remapping_player_key2_left)
			|| (remapping_player_key_right = remapping_player_key2_right)
			|| (remapping_player_key_right = remapping_player_key2_down)
			|| (remapping_player_key_right = remapping_player_key2_up)
			|| (remapping_player_key_right = remapping_player_key2_tongue)
			|| (remapping_player_key_right = remapping_player_key2_zoom_in)
			|| (remapping_player_key_right = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key_right > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_right + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_right + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_right = remapping_other1_player_key_dive)
			|| (remapping_player_key_right = remapping_other1_player_key_jump)
			|| (remapping_player_key_right = remapping_other1_player_key_crouch)
			|| (remapping_player_key_right = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key_right = remapping_other1_player_key_sprint)
			|| (remapping_player_key_right = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key_right = remapping_other1_player_key_left)
			|| (remapping_player_key_right = remapping_other1_player_key_right)
			|| (remapping_player_key_right = remapping_other1_player_key_down)
			|| (remapping_player_key_right = remapping_other1_player_key_up)
			|| (remapping_player_key_right = remapping_other1_player_key_tongue)
			|| (remapping_player_key_right = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key_right = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key_right = remapping_other1_player_key2_dive)
			|| (remapping_player_key_right = remapping_other1_player_key2_jump)
			|| (remapping_player_key_right = remapping_other1_player_key2_crouch)
			|| (remapping_player_key_right = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key_right = remapping_other1_player_key2_sprint)
			|| (remapping_player_key_right = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key_right = remapping_other1_player_key2_left)
			|| (remapping_player_key_right = remapping_other1_player_key2_right)
			|| (remapping_player_key_right = remapping_other1_player_key2_down)
			|| (remapping_player_key_right = remapping_other1_player_key2_up)
			|| (remapping_player_key_right = remapping_other1_player_key2_tongue)
			|| (remapping_player_key_right = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key_right = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key_right = remapping_other2_player_key_dive)
			|| (remapping_player_key_right = remapping_other2_player_key_jump)
			|| (remapping_player_key_right = remapping_other2_player_key_crouch)
			|| (remapping_player_key_right = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key_right = remapping_other2_player_key_sprint)
			|| (remapping_player_key_right = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key_right = remapping_other2_player_key_left)
			|| (remapping_player_key_right = remapping_other2_player_key_right)
			|| (remapping_player_key_right = remapping_other2_player_key_down)
			|| (remapping_player_key_right = remapping_other2_player_key_up)
			|| (remapping_player_key_right = remapping_other2_player_key_tongue)
			|| (remapping_player_key_right = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key_right = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key_right = remapping_other2_player_key2_dive)
			|| (remapping_player_key_right = remapping_other2_player_key2_jump)
			|| (remapping_player_key_right = remapping_other2_player_key2_crouch)
			|| (remapping_player_key_right = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key_right = remapping_other2_player_key2_sprint)
			|| (remapping_player_key_right = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key_right = remapping_other2_player_key2_left)
			|| (remapping_player_key_right = remapping_other2_player_key2_right)
			|| (remapping_player_key_right = remapping_other2_player_key2_down)
			|| (remapping_player_key_right = remapping_other2_player_key2_up)
			|| (remapping_player_key_right = remapping_other2_player_key2_tongue)
			|| (remapping_player_key_right = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key_right = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key_right = remapping_other3_player_key_dive)
			|| (remapping_player_key_right = remapping_other3_player_key_jump)
			|| (remapping_player_key_right = remapping_other3_player_key_crouch)
			|| (remapping_player_key_right = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key_right = remapping_other3_player_key_sprint)
			|| (remapping_player_key_right = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key_right = remapping_other3_player_key_left)
			|| (remapping_player_key_right = remapping_other3_player_key_right)
			|| (remapping_player_key_right = remapping_other3_player_key_down)
			|| (remapping_player_key_right = remapping_other3_player_key_up)
			|| (remapping_player_key_right = remapping_other3_player_key_tongue)
			|| (remapping_player_key_right = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key_right = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key_right = remapping_other3_player_key2_dive)
			|| (remapping_player_key_right = remapping_other3_player_key2_jump)
			|| (remapping_player_key_right = remapping_other3_player_key2_crouch)
			|| (remapping_player_key_right = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key_right = remapping_other3_player_key2_sprint)
			|| (remapping_player_key_right = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key_right = remapping_other3_player_key2_left)
			|| (remapping_player_key_right = remapping_other3_player_key2_right)
			|| (remapping_player_key_right = remapping_other3_player_key2_down)
			|| (remapping_player_key_right = remapping_other3_player_key2_up)
			|| (remapping_player_key_right = remapping_other3_player_key2_tongue)
			|| (remapping_player_key_right = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key_right = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key_right > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_right + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_right + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Right Conflict END */
			
			#region /* Down Conflict */
			if (remapping_player_key_down = remapping_player_key_dive)
			|| (remapping_player_key_down = remapping_player_key_jump)
			|| (remapping_player_key_down = remapping_player_key_crouch)
			|| (remapping_player_key_down = remapping_player_key_crouch_toggle)
			|| (remapping_player_key_down = remapping_player_key_sprint)
			|| (remapping_player_key_down = remapping_player_key_sprint_toggle)
			|| (remapping_player_key_down = remapping_player_key_left)
			|| (remapping_player_key_down = remapping_player_key_right)
			|| (remapping_player_key_down = remapping_player_key_up)
			|| (remapping_player_key_down = remapping_player_key_tongue)
			|| (remapping_player_key_down = remapping_player_key_zoom_in)
			|| (remapping_player_key_down = remapping_player_key_zoom_out)
			
			|| (remapping_player_key_down = remapping_player_key2_dive)
			|| (remapping_player_key_down = remapping_player_key2_jump)
			|| (remapping_player_key_down = remapping_player_key2_crouch)
			|| (remapping_player_key_down = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key_down = remapping_player_key2_sprint)
			|| (remapping_player_key_down = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key_down = remapping_player_key2_left)
			|| (remapping_player_key_down = remapping_player_key2_right)
			|| (remapping_player_key_down = remapping_player_key2_down)
			|| (remapping_player_key_down = remapping_player_key2_up)
			|| (remapping_player_key_down = remapping_player_key2_tongue)
			|| (remapping_player_key_down = remapping_player_key2_zoom_in)
			|| (remapping_player_key_down = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key_down > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_down + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_down + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_down = remapping_other1_player_key_dive)
			|| (remapping_player_key_down = remapping_other1_player_key_jump)
			|| (remapping_player_key_down = remapping_other1_player_key_crouch)
			|| (remapping_player_key_down = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key_down = remapping_other1_player_key_sprint)
			|| (remapping_player_key_down = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key_down = remapping_other1_player_key_left)
			|| (remapping_player_key_down = remapping_other1_player_key_right)
			|| (remapping_player_key_down = remapping_other1_player_key_down)
			|| (remapping_player_key_down = remapping_other1_player_key_up)
			|| (remapping_player_key_down = remapping_other1_player_key_tongue)
			|| (remapping_player_key_down = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key_down = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key_down = remapping_other1_player_key2_dive)
			|| (remapping_player_key_down = remapping_other1_player_key2_jump)
			|| (remapping_player_key_down = remapping_other1_player_key2_crouch)
			|| (remapping_player_key_down = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key_down = remapping_other1_player_key2_sprint)
			|| (remapping_player_key_down = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key_down = remapping_other1_player_key2_left)
			|| (remapping_player_key_down = remapping_other1_player_key2_right)
			|| (remapping_player_key_down = remapping_other1_player_key2_down)
			|| (remapping_player_key_down = remapping_other1_player_key2_up)
			|| (remapping_player_key_down = remapping_other1_player_key2_tongue)
			|| (remapping_player_key_down = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key_down = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key_down = remapping_other2_player_key_dive)
			|| (remapping_player_key_down = remapping_other2_player_key_jump)
			|| (remapping_player_key_down = remapping_other2_player_key_crouch)
			|| (remapping_player_key_down = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key_down = remapping_other2_player_key_sprint)
			|| (remapping_player_key_down = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key_down = remapping_other2_player_key_left)
			|| (remapping_player_key_down = remapping_other2_player_key_right)
			|| (remapping_player_key_down = remapping_other2_player_key_down)
			|| (remapping_player_key_down = remapping_other2_player_key_up)
			|| (remapping_player_key_down = remapping_other2_player_key_tongue)
			|| (remapping_player_key_down = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key_down = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key_down = remapping_other2_player_key2_dive)
			|| (remapping_player_key_down = remapping_other2_player_key2_jump)
			|| (remapping_player_key_down = remapping_other2_player_key2_crouch)
			|| (remapping_player_key_down = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key_down = remapping_other2_player_key2_sprint)
			|| (remapping_player_key_down = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key_down = remapping_other2_player_key2_left)
			|| (remapping_player_key_down = remapping_other2_player_key2_right)
			|| (remapping_player_key_down = remapping_other2_player_key2_down)
			|| (remapping_player_key_down = remapping_other2_player_key2_up)
			|| (remapping_player_key_down = remapping_other2_player_key2_tongue)
			|| (remapping_player_key_down = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key_down = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key_down = remapping_other3_player_key_dive)
			|| (remapping_player_key_down = remapping_other3_player_key_jump)
			|| (remapping_player_key_down = remapping_other3_player_key_crouch)
			|| (remapping_player_key_down = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key_down = remapping_other3_player_key_sprint)
			|| (remapping_player_key_down = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key_down = remapping_other3_player_key_left)
			|| (remapping_player_key_down = remapping_other3_player_key_right)
			|| (remapping_player_key_down = remapping_other3_player_key_down)
			|| (remapping_player_key_down = remapping_other3_player_key_up)
			|| (remapping_player_key_down = remapping_other3_player_key_tongue)
			|| (remapping_player_key_down = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key_down = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key_down = remapping_other3_player_key2_dive)
			|| (remapping_player_key_down = remapping_other3_player_key2_jump)
			|| (remapping_player_key_down = remapping_other3_player_key2_crouch)
			|| (remapping_player_key_down = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key_down = remapping_other3_player_key2_sprint)
			|| (remapping_player_key_down = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key_down = remapping_other3_player_key2_left)
			|| (remapping_player_key_down = remapping_other3_player_key2_right)
			|| (remapping_player_key_down = remapping_other3_player_key2_down)
			|| (remapping_player_key_down = remapping_other3_player_key2_up)
			|| (remapping_player_key_down = remapping_other3_player_key2_tongue)
			|| (remapping_player_key_down = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key_down = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key_down > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_down + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_down + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Down Conflict END */
			
			#region /* Up Conflict */
			if (remapping_player_key_up = remapping_player_key_dive)
			|| (remapping_player_key_up = remapping_player_key_jump)
			|| (remapping_player_key_up = remapping_player_key_crouch)
			|| (remapping_player_key_up = remapping_player_key_crouch_toggle)
			|| (remapping_player_key_up = remapping_player_key_sprint)
			|| (remapping_player_key_up = remapping_player_key_sprint_toggle)
			|| (remapping_player_key_up = remapping_player_key_left)
			|| (remapping_player_key_up = remapping_player_key_right)
			|| (remapping_player_key_up = remapping_player_key_down)
			|| (remapping_player_key_up = remapping_player_key_tongue)
			|| (remapping_player_key_up = remapping_player_key_zoom_in)
			|| (remapping_player_key_up = remapping_player_key_zoom_out)
			
			|| (remapping_player_key_up = remapping_player_key2_dive)
			|| (remapping_player_key_up = remapping_player_key2_jump)
			|| (remapping_player_key_up = remapping_player_key2_crouch)
			|| (remapping_player_key_up = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key_up = remapping_player_key2_sprint)
			|| (remapping_player_key_up = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key_up = remapping_player_key2_left)
			|| (remapping_player_key_up = remapping_player_key2_right)
			|| (remapping_player_key_up = remapping_player_key2_down)
			|| (remapping_player_key_up = remapping_player_key2_up)
			|| (remapping_player_key_up = remapping_player_key2_tongue)
			|| (remapping_player_key_up = remapping_player_key2_zoom_in)
			|| (remapping_player_key_up = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key_up > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_up + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_up + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_up = remapping_other1_player_key_dive)
			|| (remapping_player_key_up = remapping_other1_player_key_jump)
			|| (remapping_player_key_up = remapping_other1_player_key_crouch)
			|| (remapping_player_key_up = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key_up = remapping_other1_player_key_sprint)
			|| (remapping_player_key_up = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key_up = remapping_other1_player_key_left)
			|| (remapping_player_key_up = remapping_other1_player_key_right)
			|| (remapping_player_key_up = remapping_other1_player_key_down)
			|| (remapping_player_key_up = remapping_other1_player_key_up)
			|| (remapping_player_key_up = remapping_other1_player_key_tongue)
			|| (remapping_player_key_up = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key_up = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key_up = remapping_other1_player_key2_dive)
			|| (remapping_player_key_up = remapping_other1_player_key2_jump)
			|| (remapping_player_key_up = remapping_other1_player_key2_crouch)
			|| (remapping_player_key_up = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key_up = remapping_other1_player_key2_sprint)
			|| (remapping_player_key_up = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key_up = remapping_other1_player_key2_left)
			|| (remapping_player_key_up = remapping_other1_player_key2_right)
			|| (remapping_player_key_up = remapping_other1_player_key2_down)
			|| (remapping_player_key_up = remapping_other1_player_key2_up)
			|| (remapping_player_key_up = remapping_other1_player_key2_tongue)
			|| (remapping_player_key_up = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key_up = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key_up = remapping_other2_player_key_dive)
			|| (remapping_player_key_up = remapping_other2_player_key_jump)
			|| (remapping_player_key_up = remapping_other2_player_key_crouch)
			|| (remapping_player_key_up = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key_up = remapping_other2_player_key_sprint)
			|| (remapping_player_key_up = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key_up = remapping_other2_player_key_left)
			|| (remapping_player_key_up = remapping_other2_player_key_right)
			|| (remapping_player_key_up = remapping_other2_player_key_down)
			|| (remapping_player_key_up = remapping_other2_player_key_up)
			|| (remapping_player_key_up = remapping_other2_player_key_tongue)
			|| (remapping_player_key_up = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key_up = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key_up = remapping_other2_player_key2_dive)
			|| (remapping_player_key_up = remapping_other2_player_key2_jump)
			|| (remapping_player_key_up = remapping_other2_player_key2_crouch)
			|| (remapping_player_key_up = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key_up = remapping_other2_player_key2_sprint)
			|| (remapping_player_key_up = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key_up = remapping_other2_player_key2_left)
			|| (remapping_player_key_up = remapping_other2_player_key2_right)
			|| (remapping_player_key_up = remapping_other2_player_key2_down)
			|| (remapping_player_key_up = remapping_other2_player_key2_up)
			|| (remapping_player_key_up = remapping_other2_player_key2_tongue)
			|| (remapping_player_key_up = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key_up = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key_up = remapping_other3_player_key_dive)
			|| (remapping_player_key_up = remapping_other3_player_key_jump)
			|| (remapping_player_key_up = remapping_other3_player_key_crouch)
			|| (remapping_player_key_up = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key_up = remapping_other3_player_key_sprint)
			|| (remapping_player_key_up = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key_up = remapping_other3_player_key_left)
			|| (remapping_player_key_up = remapping_other3_player_key_right)
			|| (remapping_player_key_up = remapping_other3_player_key_down)
			|| (remapping_player_key_up = remapping_other3_player_key_up)
			|| (remapping_player_key_up = remapping_other3_player_key_tongue)
			|| (remapping_player_key_up = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key_up = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key_up = remapping_other3_player_key2_dive)
			|| (remapping_player_key_up = remapping_other3_player_key2_jump)
			|| (remapping_player_key_up = remapping_other3_player_key2_crouch)
			|| (remapping_player_key_up = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key_up = remapping_other3_player_key2_sprint)
			|| (remapping_player_key_up = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key_up = remapping_other3_player_key2_left)
			|| (remapping_player_key_up = remapping_other3_player_key2_right)
			|| (remapping_player_key_up = remapping_other3_player_key2_down)
			|| (remapping_player_key_up = remapping_other3_player_key2_up)
			|| (remapping_player_key_up = remapping_other3_player_key2_tongue)
			|| (remapping_player_key_up = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key_up = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key_up > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_up + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_up + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Up Conflict END */
			
			#region /* Tongue Conflict */
			if (remapping_player_key_tongue = remapping_player_key_dive)
			|| (remapping_player_key_tongue = remapping_player_key_jump)
			|| (remapping_player_key_tongue = remapping_player_key_crouch)
			|| (remapping_player_key_tongue = remapping_player_key_crouch_toggle)
			|| (remapping_player_key_tongue = remapping_player_key_sprint)
			|| (remapping_player_key_tongue = remapping_player_key_sprint_toggle)
			|| (remapping_player_key_tongue = remapping_player_key_left)
			|| (remapping_player_key_tongue = remapping_player_key_right)
			|| (remapping_player_key_tongue = remapping_player_key_down)
			|| (remapping_player_key_tongue = remapping_player_key_up)
			|| (remapping_player_key_tongue = remapping_player_key_zoom_in)
			|| (remapping_player_key_tongue = remapping_player_key_zoom_out)
			
			|| (remapping_player_key_tongue = remapping_player_key2_dive)
			|| (remapping_player_key_tongue = remapping_player_key2_jump)
			|| (remapping_player_key_tongue = remapping_player_key2_crouch)
			|| (remapping_player_key_tongue = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key_tongue = remapping_player_key2_sprint)
			|| (remapping_player_key_tongue = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key_tongue = remapping_player_key2_left)
			|| (remapping_player_key_tongue = remapping_player_key2_right)
			|| (remapping_player_key_tongue = remapping_player_key2_down)
			|| (remapping_player_key_tongue = remapping_player_key2_up)
			|| (remapping_player_key_tongue = remapping_player_key2_tongue)
			|| (remapping_player_key_tongue = remapping_player_key2_zoom_in)
			|| (remapping_player_key_tongue = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key_tongue > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_tongue + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_tongue + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_tongue = remapping_other1_player_key_dive)
			|| (remapping_player_key_tongue = remapping_other1_player_key_jump)
			|| (remapping_player_key_tongue = remapping_other1_player_key_crouch)
			|| (remapping_player_key_tongue = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key_tongue = remapping_other1_player_key_sprint)
			|| (remapping_player_key_tongue = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key_tongue = remapping_other1_player_key_left)
			|| (remapping_player_key_tongue = remapping_other1_player_key_right)
			|| (remapping_player_key_tongue = remapping_other1_player_key_down)
			|| (remapping_player_key_tongue = remapping_other1_player_key_up)
			|| (remapping_player_key_tongue = remapping_other1_player_key_tongue)
			|| (remapping_player_key_tongue = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key_tongue = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key_tongue = remapping_other1_player_key2_dive)
			|| (remapping_player_key_tongue = remapping_other1_player_key2_jump)
			|| (remapping_player_key_tongue = remapping_other1_player_key2_crouch)
			|| (remapping_player_key_tongue = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key_tongue = remapping_other1_player_key2_sprint)
			|| (remapping_player_key_tongue = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key_tongue = remapping_other1_player_key2_left)
			|| (remapping_player_key_tongue = remapping_other1_player_key2_right)
			|| (remapping_player_key_tongue = remapping_other1_player_key2_down)
			|| (remapping_player_key_tongue = remapping_other1_player_key2_up)
			|| (remapping_player_key_tongue = remapping_other1_player_key2_tongue)
			|| (remapping_player_key_tongue = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key_tongue = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key_tongue = remapping_other2_player_key_dive)
			|| (remapping_player_key_tongue = remapping_other2_player_key_jump)
			|| (remapping_player_key_tongue = remapping_other2_player_key_crouch)
			|| (remapping_player_key_tongue = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key_tongue = remapping_other2_player_key_sprint)
			|| (remapping_player_key_tongue = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key_tongue = remapping_other2_player_key_left)
			|| (remapping_player_key_tongue = remapping_other2_player_key_right)
			|| (remapping_player_key_tongue = remapping_other2_player_key_down)
			|| (remapping_player_key_tongue = remapping_other2_player_key_up)
			|| (remapping_player_key_tongue = remapping_other2_player_key_tongue)
			|| (remapping_player_key_tongue = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key_tongue = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key_tongue = remapping_other2_player_key2_dive)
			|| (remapping_player_key_tongue = remapping_other2_player_key2_jump)
			|| (remapping_player_key_tongue = remapping_other2_player_key2_crouch)
			|| (remapping_player_key_tongue = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key_tongue = remapping_other2_player_key2_sprint)
			|| (remapping_player_key_tongue = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key_tongue = remapping_other2_player_key2_left)
			|| (remapping_player_key_tongue = remapping_other2_player_key2_right)
			|| (remapping_player_key_tongue = remapping_other2_player_key2_down)
			|| (remapping_player_key_tongue = remapping_other2_player_key2_up)
			|| (remapping_player_key_tongue = remapping_other2_player_key2_tongue)
			|| (remapping_player_key_tongue = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key_tongue = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key_tongue = remapping_other3_player_key_dive)
			|| (remapping_player_key_tongue = remapping_other3_player_key_jump)
			|| (remapping_player_key_tongue = remapping_other3_player_key_crouch)
			|| (remapping_player_key_tongue = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key_tongue = remapping_other3_player_key_sprint)
			|| (remapping_player_key_tongue = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key_tongue = remapping_other3_player_key_left)
			|| (remapping_player_key_tongue = remapping_other3_player_key_right)
			|| (remapping_player_key_tongue = remapping_other3_player_key_down)
			|| (remapping_player_key_tongue = remapping_other3_player_key_up)
			|| (remapping_player_key_tongue = remapping_other3_player_key_tongue)
			|| (remapping_player_key_tongue = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key_tongue = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key_tongue = remapping_other3_player_key2_dive)
			|| (remapping_player_key_tongue = remapping_other3_player_key2_jump)
			|| (remapping_player_key_tongue = remapping_other3_player_key2_crouch)
			|| (remapping_player_key_tongue = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key_tongue = remapping_other3_player_key2_sprint)
			|| (remapping_player_key_tongue = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key_tongue = remapping_other3_player_key2_left)
			|| (remapping_player_key_tongue = remapping_other3_player_key2_right)
			|| (remapping_player_key_tongue = remapping_other3_player_key2_down)
			|| (remapping_player_key_tongue = remapping_other3_player_key2_up)
			|| (remapping_player_key_tongue = remapping_other3_player_key2_tongue)
			|| (remapping_player_key_tongue = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key_tongue = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key_tongue > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_tongue + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_tongue + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Tongue Conflict END */
			
			#region /* Zoom In Conflict */
			if (remapping_player_key_zoom_in = remapping_player_key_dive)
			|| (remapping_player_key_zoom_in = remapping_player_key_jump)
			|| (remapping_player_key_zoom_in = remapping_player_key_crouch)
			|| (remapping_player_key_zoom_in = remapping_player_key_crouch_toggle)
			|| (remapping_player_key_zoom_in = remapping_player_key_sprint)
			|| (remapping_player_key_zoom_in = remapping_player_key_sprint_toggle)
			|| (remapping_player_key_zoom_in = remapping_player_key_left)
			|| (remapping_player_key_zoom_in = remapping_player_key_right)
			|| (remapping_player_key_zoom_in = remapping_player_key_down)
			|| (remapping_player_key_zoom_in = remapping_player_key_up)
			|| (remapping_player_key_zoom_in = remapping_player_key_tongue)
			|| (remapping_player_key_zoom_in = remapping_player_key_zoom_out)
			
			|| (remapping_player_key_zoom_in = remapping_player_key2_dive)
			|| (remapping_player_key_zoom_in = remapping_player_key2_jump)
			|| (remapping_player_key_zoom_in = remapping_player_key2_crouch)
			|| (remapping_player_key_zoom_in = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key_zoom_in = remapping_player_key2_sprint)
			|| (remapping_player_key_zoom_in = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key_zoom_in = remapping_player_key2_left)
			|| (remapping_player_key_zoom_in = remapping_player_key2_right)
			|| (remapping_player_key_zoom_in = remapping_player_key2_down)
			|| (remapping_player_key_zoom_in = remapping_player_key2_up)
			|| (remapping_player_key_zoom_in = remapping_player_key2_tongue)
			|| (remapping_player_key_zoom_in = remapping_player_key2_zoom_in)
			|| (remapping_player_key_zoom_in = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key_zoom_in > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_zoom_in + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_zoom_in + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_zoom_in = remapping_other1_player_key_dive)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key_jump)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key_crouch)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key_sprint)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key_left)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key_right)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key_down)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key_up)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key_tongue)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key_zoom_in = remapping_other1_player_key2_dive)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key2_jump)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key2_crouch)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key2_sprint)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key2_left)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key2_right)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key2_down)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key2_up)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key2_tongue)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key_zoom_in = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key_zoom_in = remapping_other2_player_key_dive)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key_jump)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key_crouch)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key_sprint)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key_left)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key_right)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key_down)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key_up)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key_tongue)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key_zoom_in = remapping_other2_player_key2_dive)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key2_jump)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key2_crouch)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key2_sprint)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key2_left)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key2_right)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key2_down)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key2_up)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key2_tongue)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key_zoom_in = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key_zoom_in = remapping_other3_player_key_dive)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key_jump)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key_crouch)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key_sprint)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key_left)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key_right)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key_down)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key_up)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key_tongue)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key_zoom_in = remapping_other3_player_key2_dive)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key2_jump)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key2_crouch)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key2_sprint)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key2_left)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key2_right)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key2_down)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key2_up)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key2_tongue)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key_zoom_in = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key_zoom_in > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_zoom_in + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_zoom_in + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Zoom In Conflict END */
			
			#region /* Zoom Out Conflict */
			if (remapping_player_key_zoom_out = remapping_player_key_dive)
			|| (remapping_player_key_zoom_out = remapping_player_key_jump)
			|| (remapping_player_key_zoom_out = remapping_player_key_crouch)
			|| (remapping_player_key_zoom_out = remapping_player_key_crouch_toggle)
			|| (remapping_player_key_zoom_out = remapping_player_key_sprint)
			|| (remapping_player_key_zoom_out = remapping_player_key_sprint_toggle)
			|| (remapping_player_key_zoom_out = remapping_player_key_left)
			|| (remapping_player_key_zoom_out = remapping_player_key_right)
			|| (remapping_player_key_zoom_out = remapping_player_key_down)
			|| (remapping_player_key_zoom_out = remapping_player_key_up)
			|| (remapping_player_key_zoom_out = remapping_player_key_tongue)
			|| (remapping_player_key_zoom_out = remapping_player_key_zoom_in)
			
			|| (remapping_player_key_zoom_out = remapping_player_key2_dive)
			|| (remapping_player_key_zoom_out = remapping_player_key2_jump)
			|| (remapping_player_key_zoom_out = remapping_player_key2_crouch)
			|| (remapping_player_key_zoom_out = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key_zoom_out = remapping_player_key2_sprint)
			|| (remapping_player_key_zoom_out = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key_zoom_out = remapping_player_key2_left)
			|| (remapping_player_key_zoom_out = remapping_player_key2_right)
			|| (remapping_player_key_zoom_out = remapping_player_key2_down)
			|| (remapping_player_key_zoom_out = remapping_player_key2_up)
			|| (remapping_player_key_zoom_out = remapping_player_key2_tongue)
			|| (remapping_player_key_zoom_out = remapping_player_key2_zoom_in)
			|| (remapping_player_key_zoom_out = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key_zoom_out > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_zoom_out + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_zoom_out + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_zoom_out = remapping_other1_player_key_dive)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key_jump)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key_crouch)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key_sprint)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key_left)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key_right)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key_down)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key_up)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key_tongue)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key_zoom_out = remapping_other1_player_key2_dive)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key2_jump)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key2_crouch)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key2_sprint)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key2_left)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key2_right)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key2_down)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key2_up)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key2_tongue)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key_zoom_out = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key_zoom_out = remapping_other2_player_key_dive)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key_jump)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key_crouch)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key_sprint)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key_left)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key_right)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key_down)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key_up)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key_tongue)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key_zoom_out = remapping_other2_player_key2_dive)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key2_jump)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key2_crouch)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key2_sprint)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key2_left)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key2_right)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key2_down)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key2_up)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key2_tongue)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key_zoom_out = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key_zoom_out = remapping_other3_player_key_dive)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key_jump)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key_crouch)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key_sprint)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key_left)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key_right)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key_down)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key_up)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key_tongue)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key_zoom_out = remapping_other3_player_key2_dive)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key2_jump)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key2_crouch)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key2_sprint)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key2_left)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key2_right)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key2_down)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key2_up)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key2_tongue)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key_zoom_out = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key_zoom_out > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key1_x - 34, menu_y_remap_key_zoom_out + menu_y_offset - 34, key1_x + 33, menu_y_remap_key_zoom_out + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Zoom Out Conflict END */
			
			#endregion /* Key 1 Conflicts END */
			
			#region /* Key 2 Conflicts */
			
			#region /* Dive 2 Conflict */
			if (remapping_player_key2_dive = remapping_player_key_dive)
			|| (remapping_player_key2_dive = remapping_player_key_jump)
			|| (remapping_player_key2_dive = remapping_player_key_crouch)
			|| (remapping_player_key2_dive = remapping_player_key_crouch_toggle)
			|| (remapping_player_key2_dive = remapping_player_key_sprint)
			|| (remapping_player_key2_dive = remapping_player_key_sprint_toggle)
			|| (remapping_player_key2_dive = remapping_player_key_left)
			|| (remapping_player_key2_dive = remapping_player_key_right)
			|| (remapping_player_key2_dive = remapping_player_key_down)
			|| (remapping_player_key2_dive = remapping_player_key_up)
			|| (remapping_player_key2_dive = remapping_player_key_tongue)
			|| (remapping_player_key2_dive = remapping_player_key_zoom_in)
			|| (remapping_player_key2_dive = remapping_player_key_zoom_out)
			
			|| (remapping_player_key2_dive = remapping_player_key2_jump)
			|| (remapping_player_key2_dive = remapping_player_key2_crouch)
			|| (remapping_player_key2_dive = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key2_dive = remapping_player_key2_sprint)
			|| (remapping_player_key2_dive = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key2_dive = remapping_player_key2_left)
			|| (remapping_player_key2_dive = remapping_player_key2_right)
			|| (remapping_player_key2_dive = remapping_player_key2_down)
			|| (remapping_player_key2_dive = remapping_player_key2_up)
			|| (remapping_player_key2_dive = remapping_player_key2_tongue)
			|| (remapping_player_key2_dive = remapping_player_key2_zoom_in)
			|| (remapping_player_key2_dive = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key2_dive > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_dive + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_dive + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_dive = remapping_other1_player_key_dive)
			|| (remapping_player_key2_dive = remapping_other1_player_key_jump)
			|| (remapping_player_key2_dive = remapping_other1_player_key_crouch)
			|| (remapping_player_key2_dive = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key2_dive = remapping_other1_player_key_sprint)
			|| (remapping_player_key2_dive = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key2_dive = remapping_other1_player_key_left)
			|| (remapping_player_key2_dive = remapping_other1_player_key_right)
			|| (remapping_player_key2_dive = remapping_other1_player_key_down)
			|| (remapping_player_key2_dive = remapping_other1_player_key_up)
			|| (remapping_player_key2_dive = remapping_other1_player_key_tongue)
			|| (remapping_player_key2_dive = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key2_dive = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key2_dive = remapping_other1_player_key2_dive)
			|| (remapping_player_key2_dive = remapping_other1_player_key2_jump)
			|| (remapping_player_key2_dive = remapping_other1_player_key2_crouch)
			|| (remapping_player_key2_dive = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key2_dive = remapping_other1_player_key2_sprint)
			|| (remapping_player_key2_dive = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key2_dive = remapping_other1_player_key2_left)
			|| (remapping_player_key2_dive = remapping_other1_player_key2_right)
			|| (remapping_player_key2_dive = remapping_other1_player_key2_down)
			|| (remapping_player_key2_dive = remapping_other1_player_key2_up)
			|| (remapping_player_key2_dive = remapping_other1_player_key2_tongue)
			|| (remapping_player_key2_dive = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key2_dive = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key2_dive = remapping_other2_player_key_dive)
			|| (remapping_player_key2_dive = remapping_other2_player_key_jump)
			|| (remapping_player_key2_dive = remapping_other2_player_key_crouch)
			|| (remapping_player_key2_dive = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key2_dive = remapping_other2_player_key_sprint)
			|| (remapping_player_key2_dive = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key2_dive = remapping_other2_player_key_left)
			|| (remapping_player_key2_dive = remapping_other2_player_key_right)
			|| (remapping_player_key2_dive = remapping_other2_player_key_down)
			|| (remapping_player_key2_dive = remapping_other2_player_key_up)
			|| (remapping_player_key2_dive = remapping_other2_player_key_tongue)
			|| (remapping_player_key2_dive = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key2_dive = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key2_dive = remapping_other2_player_key2_dive)
			|| (remapping_player_key2_dive = remapping_other2_player_key2_jump)
			|| (remapping_player_key2_dive = remapping_other2_player_key2_crouch)
			|| (remapping_player_key2_dive = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key2_dive = remapping_other2_player_key2_sprint)
			|| (remapping_player_key2_dive = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key2_dive = remapping_other2_player_key2_left)
			|| (remapping_player_key2_dive = remapping_other2_player_key2_right)
			|| (remapping_player_key2_dive = remapping_other2_player_key2_down)
			|| (remapping_player_key2_dive = remapping_other2_player_key2_up)
			|| (remapping_player_key2_dive = remapping_other2_player_key2_tongue)
			|| (remapping_player_key2_dive = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key2_dive = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key2_dive = remapping_other3_player_key_dive)
			|| (remapping_player_key2_dive = remapping_other3_player_key_jump)
			|| (remapping_player_key2_dive = remapping_other3_player_key_crouch)
			|| (remapping_player_key2_dive = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key2_dive = remapping_other3_player_key_sprint)
			|| (remapping_player_key2_dive = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key2_dive = remapping_other3_player_key_left)
			|| (remapping_player_key2_dive = remapping_other3_player_key_right)
			|| (remapping_player_key2_dive = remapping_other3_player_key_down)
			|| (remapping_player_key2_dive = remapping_other3_player_key_up)
			|| (remapping_player_key2_dive = remapping_other3_player_key_tongue)
			|| (remapping_player_key2_dive = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key2_dive = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key2_dive = remapping_other3_player_key2_dive)
			|| (remapping_player_key2_dive = remapping_other3_player_key2_jump)
			|| (remapping_player_key2_dive = remapping_other3_player_key2_crouch)
			|| (remapping_player_key2_dive = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key2_dive = remapping_other3_player_key2_sprint)
			|| (remapping_player_key2_dive = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key2_dive = remapping_other3_player_key2_left)
			|| (remapping_player_key2_dive = remapping_other3_player_key2_right)
			|| (remapping_player_key2_dive = remapping_other3_player_key2_down)
			|| (remapping_player_key2_dive = remapping_other3_player_key2_up)
			|| (remapping_player_key2_dive = remapping_other3_player_key2_tongue)
			|| (remapping_player_key2_dive = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key2_dive = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key2_dive > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_dive + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_dive + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Dive 2 Conflict END */
			
			#region /* Jump 2 Conflict */
			if (remapping_player_key2_jump = remapping_player_key_dive)
			|| (remapping_player_key2_jump = remapping_player_key_jump)
			|| (remapping_player_key2_jump = remapping_player_key_crouch)
			|| (remapping_player_key2_jump = remapping_player_key_crouch_toggle)
			|| (remapping_player_key2_jump = remapping_player_key_sprint)
			|| (remapping_player_key2_jump = remapping_player_key_sprint_toggle)
			|| (remapping_player_key2_jump = remapping_player_key_left)
			|| (remapping_player_key2_jump = remapping_player_key_right)
			|| (remapping_player_key2_jump = remapping_player_key_down)
			|| (remapping_player_key2_jump = remapping_player_key_up)
			|| (remapping_player_key2_jump = remapping_player_key_tongue)
			|| (remapping_player_key2_jump = remapping_player_key_zoom_in)
			|| (remapping_player_key2_jump = remapping_player_key_zoom_out)
			
			|| (remapping_player_key2_jump = remapping_player_key2_dive)
			|| (remapping_player_key2_jump = remapping_player_key2_crouch)
			|| (remapping_player_key2_jump = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key2_jump = remapping_player_key2_sprint)
			|| (remapping_player_key2_jump = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key2_jump = remapping_player_key2_left)
			|| (remapping_player_key2_jump = remapping_player_key2_right)
			|| (remapping_player_key2_jump = remapping_player_key2_down)
			|| (remapping_player_key2_jump = remapping_player_key2_up)
			|| (remapping_player_key2_jump = remapping_player_key2_tongue)
			|| (remapping_player_key2_jump = remapping_player_key2_zoom_in)
			|| (remapping_player_key2_jump = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key2_jump > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_jump + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_jump + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_jump = remapping_other1_player_key_dive)
			|| (remapping_player_key2_jump = remapping_other1_player_key_jump)
			|| (remapping_player_key2_jump = remapping_other1_player_key_crouch)
			|| (remapping_player_key2_jump = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key2_jump = remapping_other1_player_key_sprint)
			|| (remapping_player_key2_jump = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key2_jump = remapping_other1_player_key_left)
			|| (remapping_player_key2_jump = remapping_other1_player_key_right)
			|| (remapping_player_key2_jump = remapping_other1_player_key_down)
			|| (remapping_player_key2_jump = remapping_other1_player_key_up)
			|| (remapping_player_key2_jump = remapping_other1_player_key_tongue)
			|| (remapping_player_key2_jump = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key2_jump = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key2_jump = remapping_other1_player_key2_dive)
			|| (remapping_player_key2_jump = remapping_other1_player_key2_jump)
			|| (remapping_player_key2_jump = remapping_other1_player_key2_crouch)
			|| (remapping_player_key2_jump = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key2_jump = remapping_other1_player_key2_sprint)
			|| (remapping_player_key2_jump = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key2_jump = remapping_other1_player_key2_left)
			|| (remapping_player_key2_jump = remapping_other1_player_key2_right)
			|| (remapping_player_key2_jump = remapping_other1_player_key2_down)
			|| (remapping_player_key2_jump = remapping_other1_player_key2_up)
			|| (remapping_player_key2_jump = remapping_other1_player_key2_tongue)
			|| (remapping_player_key2_jump = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key2_jump = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key2_jump = remapping_other2_player_key_dive)
			|| (remapping_player_key2_jump = remapping_other2_player_key_jump)
			|| (remapping_player_key2_jump = remapping_other2_player_key_crouch)
			|| (remapping_player_key2_jump = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key2_jump = remapping_other2_player_key_sprint)
			|| (remapping_player_key2_jump = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key2_jump = remapping_other2_player_key_left)
			|| (remapping_player_key2_jump = remapping_other2_player_key_right)
			|| (remapping_player_key2_jump = remapping_other2_player_key_down)
			|| (remapping_player_key2_jump = remapping_other2_player_key_up)
			|| (remapping_player_key2_jump = remapping_other2_player_key_tongue)
			|| (remapping_player_key2_jump = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key2_jump = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key2_jump = remapping_other2_player_key2_dive)
			|| (remapping_player_key2_jump = remapping_other2_player_key2_jump)
			|| (remapping_player_key2_jump = remapping_other2_player_key2_crouch)
			|| (remapping_player_key2_jump = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key2_jump = remapping_other2_player_key2_sprint)
			|| (remapping_player_key2_jump = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key2_jump = remapping_other2_player_key2_left)
			|| (remapping_player_key2_jump = remapping_other2_player_key2_right)
			|| (remapping_player_key2_jump = remapping_other2_player_key2_down)
			|| (remapping_player_key2_jump = remapping_other2_player_key2_up)
			|| (remapping_player_key2_jump = remapping_other2_player_key2_tongue)
			|| (remapping_player_key2_jump = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key2_jump = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key2_jump = remapping_other3_player_key_dive)
			|| (remapping_player_key2_jump = remapping_other3_player_key_jump)
			|| (remapping_player_key2_jump = remapping_other3_player_key_crouch)
			|| (remapping_player_key2_jump = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key2_jump = remapping_other3_player_key_sprint)
			|| (remapping_player_key2_jump = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key2_jump = remapping_other3_player_key_left)
			|| (remapping_player_key2_jump = remapping_other3_player_key_right)
			|| (remapping_player_key2_jump = remapping_other3_player_key_down)
			|| (remapping_player_key2_jump = remapping_other3_player_key_up)
			|| (remapping_player_key2_jump = remapping_other3_player_key_tongue)
			|| (remapping_player_key2_jump = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key2_jump = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key2_jump = remapping_other3_player_key2_dive)
			|| (remapping_player_key2_jump = remapping_other3_player_key2_jump)
			|| (remapping_player_key2_jump = remapping_other3_player_key2_crouch)
			|| (remapping_player_key2_jump = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key2_jump = remapping_other3_player_key2_sprint)
			|| (remapping_player_key2_jump = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key2_jump = remapping_other3_player_key2_left)
			|| (remapping_player_key2_jump = remapping_other3_player_key2_right)
			|| (remapping_player_key2_jump = remapping_other3_player_key2_down)
			|| (remapping_player_key2_jump = remapping_other3_player_key2_up)
			|| (remapping_player_key2_jump = remapping_other3_player_key2_tongue)
			|| (remapping_player_key2_jump = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key2_jump = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key2_jump > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_jump + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_jump + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Jump 2 Conflict END */
			
			#region /* Crouch 2 Conflict */
			if (remapping_player_key2_crouch = remapping_player_key_dive)
			|| (remapping_player_key2_crouch = remapping_player_key_jump)
			|| (remapping_player_key2_crouch = remapping_player_key_crouch)
			|| (remapping_player_key2_crouch = remapping_player_key_crouch_toggle)
			|| (remapping_player_key2_crouch = remapping_player_key_sprint)
			|| (remapping_player_key2_crouch = remapping_player_key_sprint_toggle)
			|| (remapping_player_key2_crouch = remapping_player_key_left)
			|| (remapping_player_key2_crouch = remapping_player_key_right)
			|| (remapping_player_key2_crouch = remapping_player_key_down)
			|| (remapping_player_key2_crouch = remapping_player_key_up)
			|| (remapping_player_key2_crouch = remapping_player_key_tongue)
			|| (remapping_player_key2_crouch = remapping_player_key_zoom_in)
			|| (remapping_player_key2_crouch = remapping_player_key_zoom_out)
			
			|| (remapping_player_key2_crouch = remapping_player_key2_dive)
			|| (remapping_player_key2_crouch = remapping_player_key2_jump)
			|| (remapping_player_key2_crouch = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key2_crouch = remapping_player_key2_sprint)
			|| (remapping_player_key2_crouch = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key2_crouch = remapping_player_key2_left)
			|| (remapping_player_key2_crouch = remapping_player_key2_right)
			|| (remapping_player_key2_crouch = remapping_player_key2_down)
			|| (remapping_player_key2_crouch = remapping_player_key2_up)
			|| (remapping_player_key2_crouch = remapping_player_key2_tongue)
			|| (remapping_player_key2_crouch = remapping_player_key2_zoom_in)
			|| (remapping_player_key2_crouch = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key2_crouch > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_crouch + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_crouch + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_crouch = remapping_other1_player_key_dive)
			|| (remapping_player_key2_crouch = remapping_other1_player_key_jump)
			|| (remapping_player_key2_crouch = remapping_other1_player_key_crouch)
			|| (remapping_player_key2_crouch = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key2_crouch = remapping_other1_player_key_sprint)
			|| (remapping_player_key2_crouch = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key2_crouch = remapping_other1_player_key_left)
			|| (remapping_player_key2_crouch = remapping_other1_player_key_right)
			|| (remapping_player_key2_crouch = remapping_other1_player_key_down)
			|| (remapping_player_key2_crouch = remapping_other1_player_key_up)
			|| (remapping_player_key2_crouch = remapping_other1_player_key_tongue)
			|| (remapping_player_key2_crouch = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key2_crouch = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key2_crouch = remapping_other1_player_key2_dive)
			|| (remapping_player_key2_crouch = remapping_other1_player_key2_jump)
			|| (remapping_player_key2_crouch = remapping_other1_player_key2_crouch)
			|| (remapping_player_key2_crouch = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key2_crouch = remapping_other1_player_key2_sprint)
			|| (remapping_player_key2_crouch = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key2_crouch = remapping_other1_player_key2_left)
			|| (remapping_player_key2_crouch = remapping_other1_player_key2_right)
			|| (remapping_player_key2_crouch = remapping_other1_player_key2_down)
			|| (remapping_player_key2_crouch = remapping_other1_player_key2_up)
			|| (remapping_player_key2_crouch = remapping_other1_player_key2_tongue)
			|| (remapping_player_key2_crouch = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key2_crouch = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key2_crouch = remapping_other2_player_key_dive)
			|| (remapping_player_key2_crouch = remapping_other2_player_key_jump)
			|| (remapping_player_key2_crouch = remapping_other2_player_key_crouch)
			|| (remapping_player_key2_crouch = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key2_crouch = remapping_other2_player_key_sprint)
			|| (remapping_player_key2_crouch = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key2_crouch = remapping_other2_player_key_left)
			|| (remapping_player_key2_crouch = remapping_other2_player_key_right)
			|| (remapping_player_key2_crouch = remapping_other2_player_key_down)
			|| (remapping_player_key2_crouch = remapping_other2_player_key_up)
			|| (remapping_player_key2_crouch = remapping_other2_player_key_tongue)
			|| (remapping_player_key2_crouch = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key2_crouch = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key2_crouch = remapping_other2_player_key2_dive)
			|| (remapping_player_key2_crouch = remapping_other2_player_key2_jump)
			|| (remapping_player_key2_crouch = remapping_other2_player_key2_crouch)
			|| (remapping_player_key2_crouch = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key2_crouch = remapping_other2_player_key2_sprint)
			|| (remapping_player_key2_crouch = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key2_crouch = remapping_other2_player_key2_left)
			|| (remapping_player_key2_crouch = remapping_other2_player_key2_right)
			|| (remapping_player_key2_crouch = remapping_other2_player_key2_down)
			|| (remapping_player_key2_crouch = remapping_other2_player_key2_up)
			|| (remapping_player_key2_crouch = remapping_other2_player_key2_tongue)
			|| (remapping_player_key2_crouch = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key2_crouch = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key2_crouch = remapping_other3_player_key_dive)
			|| (remapping_player_key2_crouch = remapping_other3_player_key_jump)
			|| (remapping_player_key2_crouch = remapping_other3_player_key_crouch)
			|| (remapping_player_key2_crouch = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key2_crouch = remapping_other3_player_key_sprint)
			|| (remapping_player_key2_crouch = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key2_crouch = remapping_other3_player_key_left)
			|| (remapping_player_key2_crouch = remapping_other3_player_key_right)
			|| (remapping_player_key2_crouch = remapping_other3_player_key_down)
			|| (remapping_player_key2_crouch = remapping_other3_player_key_up)
			|| (remapping_player_key2_crouch = remapping_other3_player_key_tongue)
			|| (remapping_player_key2_crouch = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key2_crouch = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key2_crouch = remapping_other3_player_key2_dive)
			|| (remapping_player_key2_crouch = remapping_other3_player_key2_jump)
			|| (remapping_player_key2_crouch = remapping_other3_player_key2_crouch)
			|| (remapping_player_key2_crouch = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key2_crouch = remapping_other3_player_key2_sprint)
			|| (remapping_player_key2_crouch = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key2_crouch = remapping_other3_player_key2_left)
			|| (remapping_player_key2_crouch = remapping_other3_player_key2_right)
			|| (remapping_player_key2_crouch = remapping_other3_player_key2_down)
			|| (remapping_player_key2_crouch = remapping_other3_player_key2_up)
			|| (remapping_player_key2_crouch = remapping_other3_player_key2_tongue)
			|| (remapping_player_key2_crouch = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key2_crouch = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key2_crouch > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_crouch + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_crouch + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Crouch 2 Conflict END */
			
			#region /* Crouch Toggle 2 Conflict */
			if (remapping_player_key2_crouch_toggle = remapping_player_key_dive)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key_jump)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key_crouch)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key_crouch_toggle)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key_sprint)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key_sprint_toggle)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key_left)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key_right)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key_down)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key_up)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key_tongue)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key_zoom_in)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key_zoom_out)
			
			|| (remapping_player_key2_crouch_toggle = remapping_player_key2_dive)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key2_jump)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key2_crouch)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key2_sprint)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key2_left)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key2_right)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key2_down)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key2_up)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key2_tongue)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key2_zoom_in)
			|| (remapping_player_key2_crouch_toggle = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key2_crouch_toggle > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_crouch_toggle + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_crouch_toggle + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_crouch_toggle = remapping_other1_player_key_dive)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key_jump)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key_crouch)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key_sprint)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key_left)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key_right)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key_down)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key_up)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key_tongue)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key2_dive)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key2_jump)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key2_crouch)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key2_sprint)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key2_left)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key2_right)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key2_down)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key2_up)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key2_tongue)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key2_crouch_toggle = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key_dive)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key_jump)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key_crouch)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key_sprint)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key_left)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key_right)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key_down)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key_up)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key_tongue)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key2_dive)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key2_jump)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key2_crouch)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key2_sprint)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key2_left)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key2_right)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key2_down)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key2_up)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key2_tongue)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key2_crouch_toggle = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key_dive)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key_jump)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key_crouch)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key_sprint)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key_left)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key_right)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key_down)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key_up)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key_tongue)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key2_dive)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key2_jump)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key2_crouch)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key2_sprint)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key2_left)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key2_right)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key2_down)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key2_up)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key2_tongue)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key2_crouch_toggle = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key2_crouch_toggle > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_crouch_toggle + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_crouch_toggle + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Crouch Toggle 2 Conflict END */
			
			#region /* Sprint 2 Conflict */
			if (remapping_player_key2_sprint = remapping_player_key_dive)
			|| (remapping_player_key2_sprint = remapping_player_key_jump)
			|| (remapping_player_key2_sprint = remapping_player_key_crouch)
			|| (remapping_player_key2_sprint = remapping_player_key_crouch_toggle)
			|| (remapping_player_key2_sprint = remapping_player_key_sprint)
			|| (remapping_player_key2_sprint = remapping_player_key_sprint_toggle)
			|| (remapping_player_key2_sprint = remapping_player_key_left)
			|| (remapping_player_key2_sprint = remapping_player_key_right)
			|| (remapping_player_key2_sprint = remapping_player_key_down)
			|| (remapping_player_key2_sprint = remapping_player_key_up)
			|| (remapping_player_key2_sprint = remapping_player_key_tongue)
			|| (remapping_player_key2_sprint = remapping_player_key_zoom_in)
			|| (remapping_player_key2_sprint = remapping_player_key_zoom_out)
			
			|| (remapping_player_key2_sprint = remapping_player_key2_dive)
			|| (remapping_player_key2_sprint = remapping_player_key2_jump)
			|| (remapping_player_key2_sprint = remapping_player_key2_crouch)
			|| (remapping_player_key2_sprint = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key2_sprint = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key2_sprint = remapping_player_key2_left)
			|| (remapping_player_key2_sprint = remapping_player_key2_right)
			|| (remapping_player_key2_sprint = remapping_player_key2_down)
			|| (remapping_player_key2_sprint = remapping_player_key2_up)
			|| (remapping_player_key2_sprint = remapping_player_key2_tongue)
			|| (remapping_player_key2_sprint = remapping_player_key2_zoom_in)
			|| (remapping_player_key2_sprint = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key2_sprint > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_sprint + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_sprint + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_sprint = remapping_other1_player_key_dive)
			|| (remapping_player_key2_sprint = remapping_other1_player_key_jump)
			|| (remapping_player_key2_sprint = remapping_other1_player_key_crouch)
			|| (remapping_player_key2_sprint = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key2_sprint = remapping_other1_player_key_sprint)
			|| (remapping_player_key2_sprint = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key2_sprint = remapping_other1_player_key_left)
			|| (remapping_player_key2_sprint = remapping_other1_player_key_right)
			|| (remapping_player_key2_sprint = remapping_other1_player_key_down)
			|| (remapping_player_key2_sprint = remapping_other1_player_key_up)
			|| (remapping_player_key2_sprint = remapping_other1_player_key_tongue)
			|| (remapping_player_key2_sprint = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key2_sprint = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key2_sprint = remapping_other1_player_key2_dive)
			|| (remapping_player_key2_sprint = remapping_other1_player_key2_jump)
			|| (remapping_player_key2_sprint = remapping_other1_player_key2_crouch)
			|| (remapping_player_key2_sprint = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key2_sprint = remapping_other1_player_key2_sprint)
			|| (remapping_player_key2_sprint = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key2_sprint = remapping_other1_player_key2_left)
			|| (remapping_player_key2_sprint = remapping_other1_player_key2_right)
			|| (remapping_player_key2_sprint = remapping_other1_player_key2_down)
			|| (remapping_player_key2_sprint = remapping_other1_player_key2_up)
			|| (remapping_player_key2_sprint = remapping_other1_player_key2_tongue)
			|| (remapping_player_key2_sprint = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key2_sprint = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key2_sprint = remapping_other2_player_key_dive)
			|| (remapping_player_key2_sprint = remapping_other2_player_key_jump)
			|| (remapping_player_key2_sprint = remapping_other2_player_key_crouch)
			|| (remapping_player_key2_sprint = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key2_sprint = remapping_other2_player_key_sprint)
			|| (remapping_player_key2_sprint = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key2_sprint = remapping_other2_player_key_left)
			|| (remapping_player_key2_sprint = remapping_other2_player_key_right)
			|| (remapping_player_key2_sprint = remapping_other2_player_key_down)
			|| (remapping_player_key2_sprint = remapping_other2_player_key_up)
			|| (remapping_player_key2_sprint = remapping_other2_player_key_tongue)
			|| (remapping_player_key2_sprint = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key2_sprint = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key2_sprint = remapping_other2_player_key2_dive)
			|| (remapping_player_key2_sprint = remapping_other2_player_key2_jump)
			|| (remapping_player_key2_sprint = remapping_other2_player_key2_crouch)
			|| (remapping_player_key2_sprint = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key2_sprint = remapping_other2_player_key2_sprint)
			|| (remapping_player_key2_sprint = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key2_sprint = remapping_other2_player_key2_left)
			|| (remapping_player_key2_sprint = remapping_other2_player_key2_right)
			|| (remapping_player_key2_sprint = remapping_other2_player_key2_down)
			|| (remapping_player_key2_sprint = remapping_other2_player_key2_up)
			|| (remapping_player_key2_sprint = remapping_other2_player_key2_tongue)
			|| (remapping_player_key2_sprint = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key2_sprint = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key2_sprint = remapping_other3_player_key_dive)
			|| (remapping_player_key2_sprint = remapping_other3_player_key_jump)
			|| (remapping_player_key2_sprint = remapping_other3_player_key_crouch)
			|| (remapping_player_key2_sprint = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key2_sprint = remapping_other3_player_key_sprint)
			|| (remapping_player_key2_sprint = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key2_sprint = remapping_other3_player_key_left)
			|| (remapping_player_key2_sprint = remapping_other3_player_key_right)
			|| (remapping_player_key2_sprint = remapping_other3_player_key_down)
			|| (remapping_player_key2_sprint = remapping_other3_player_key_up)
			|| (remapping_player_key2_sprint = remapping_other3_player_key_tongue)
			|| (remapping_player_key2_sprint = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key2_sprint = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key2_sprint = remapping_other3_player_key2_dive)
			|| (remapping_player_key2_sprint = remapping_other3_player_key2_jump)
			|| (remapping_player_key2_sprint = remapping_other3_player_key2_crouch)
			|| (remapping_player_key2_sprint = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key2_sprint = remapping_other3_player_key2_sprint)
			|| (remapping_player_key2_sprint = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key2_sprint = remapping_other3_player_key2_left)
			|| (remapping_player_key2_sprint = remapping_other3_player_key2_right)
			|| (remapping_player_key2_sprint = remapping_other3_player_key2_down)
			|| (remapping_player_key2_sprint = remapping_other3_player_key2_up)
			|| (remapping_player_key2_sprint = remapping_other3_player_key2_tongue)
			|| (remapping_player_key2_sprint = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key2_sprint = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key2_sprint > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_sprint + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_sprint + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Sprint 2 Conflict END */
			
			#region /* Sprint Toggle 2 Conflict */
			if (remapping_player_key2_sprint_toggle = remapping_player_key_dive)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key_jump)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key_crouch)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key_crouch_toggle)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key_sprint)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key_sprint_toggle)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key_left)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key_right)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key_down)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key_up)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key_tongue)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key_zoom_in)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key_zoom_out)
			
			|| (remapping_player_key2_sprint_toggle = remapping_player_key2_dive)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key2_jump)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key2_crouch)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key2_sprint)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key2_left)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key2_right)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key2_down)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key2_up)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key2_tongue)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key2_zoom_in)
			|| (remapping_player_key2_sprint_toggle = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key2_sprint_toggle > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_sprint_toggle + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_sprint + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_sprint_toggle = remapping_other1_player_key_dive)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key_jump)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key_crouch)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key_sprint)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key_left)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key_right)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key_down)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key_up)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key_tongue)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key2_dive)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key2_jump)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key2_crouch)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key2_sprint)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key2_left)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key2_right)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key2_down)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key2_up)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key2_tongue)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key2_sprint_toggle = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key_dive)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key_jump)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key_crouch)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key_sprint)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key_left)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key_right)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key_down)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key_up)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key_tongue)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key2_dive)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key2_jump)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key2_crouch)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key2_sprint)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key2_left)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key2_right)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key2_down)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key2_up)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key2_tongue)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key2_sprint_toggle = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key_dive)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key_jump)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key_crouch)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key_sprint)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key_left)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key_right)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key_down)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key_up)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key_tongue)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key2_dive)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key2_jump)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key2_crouch)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key2_sprint)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key2_left)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key2_right)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key2_down)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key2_up)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key2_tongue)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key2_sprint_toggle = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key2_sprint_toggle > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_sprint_toggle + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_sprint_toggle + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Sprint Toggle 2 Conflict END */
			
			#region /* Left 2 Conflict */
			if (remapping_player_key2_left = remapping_player_key_dive)
			|| (remapping_player_key2_left = remapping_player_key_jump)
			|| (remapping_player_key2_left = remapping_player_key_crouch)
			|| (remapping_player_key2_left = remapping_player_key_crouch_toggle)
			|| (remapping_player_key2_left = remapping_player_key_sprint)
			|| (remapping_player_key2_left = remapping_player_key_sprint_toggle)
			|| (remapping_player_key2_left = remapping_player_key_left)
			|| (remapping_player_key2_left = remapping_player_key_right)
			|| (remapping_player_key2_left = remapping_player_key_down)
			|| (remapping_player_key2_left = remapping_player_key_up)
			|| (remapping_player_key2_left = remapping_player_key_tongue)
			|| (remapping_player_key2_left = remapping_player_key_zoom_in)
			|| (remapping_player_key2_left = remapping_player_key_zoom_out)
			
			|| (remapping_player_key2_left = remapping_player_key2_dive)
			|| (remapping_player_key2_left = remapping_player_key2_jump)
			|| (remapping_player_key2_left = remapping_player_key2_crouch)
			|| (remapping_player_key2_left = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key2_left = remapping_player_key2_sprint)
			|| (remapping_player_key2_left = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key2_left = remapping_player_key2_right)
			|| (remapping_player_key2_left = remapping_player_key2_down)
			|| (remapping_player_key2_left = remapping_player_key2_up)
			|| (remapping_player_key2_left = remapping_player_key2_tongue)
			|| (remapping_player_key2_left = remapping_player_key2_zoom_in)
			|| (remapping_player_key2_left = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key2_left > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_left + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_left + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_left = remapping_other1_player_key_dive)
			|| (remapping_player_key2_left = remapping_other1_player_key_jump)
			|| (remapping_player_key2_left = remapping_other1_player_key_crouch)
			|| (remapping_player_key2_left = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key2_left = remapping_other1_player_key_sprint)
			|| (remapping_player_key2_left = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key2_left = remapping_other1_player_key_left)
			|| (remapping_player_key2_left = remapping_other1_player_key_right)
			|| (remapping_player_key2_left = remapping_other1_player_key_down)
			|| (remapping_player_key2_left = remapping_other1_player_key_up)
			|| (remapping_player_key2_left = remapping_other1_player_key_tongue)
			|| (remapping_player_key2_left = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key2_left = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key2_left = remapping_other1_player_key2_dive)
			|| (remapping_player_key2_left = remapping_other1_player_key2_jump)
			|| (remapping_player_key2_left = remapping_other1_player_key2_crouch)
			|| (remapping_player_key2_left = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key2_left = remapping_other1_player_key2_sprint)
			|| (remapping_player_key2_left = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key2_left = remapping_other1_player_key2_left)
			|| (remapping_player_key2_left = remapping_other1_player_key2_right)
			|| (remapping_player_key2_left = remapping_other1_player_key2_down)
			|| (remapping_player_key2_left = remapping_other1_player_key2_up)
			|| (remapping_player_key2_left = remapping_other1_player_key2_tongue)
			|| (remapping_player_key2_left = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key2_left = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key2_left = remapping_other2_player_key_dive)
			|| (remapping_player_key2_left = remapping_other2_player_key_jump)
			|| (remapping_player_key2_left = remapping_other2_player_key_crouch)
			|| (remapping_player_key2_left = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key2_left = remapping_other2_player_key_sprint)
			|| (remapping_player_key2_left = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key2_left = remapping_other2_player_key_left)
			|| (remapping_player_key2_left = remapping_other2_player_key_right)
			|| (remapping_player_key2_left = remapping_other2_player_key_down)
			|| (remapping_player_key2_left = remapping_other2_player_key_up)
			|| (remapping_player_key2_left = remapping_other2_player_key_tongue)
			|| (remapping_player_key2_left = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key2_left = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key2_left = remapping_other2_player_key2_dive)
			|| (remapping_player_key2_left = remapping_other2_player_key2_jump)
			|| (remapping_player_key2_left = remapping_other2_player_key2_crouch)
			|| (remapping_player_key2_left = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key2_left = remapping_other2_player_key2_sprint)
			|| (remapping_player_key2_left = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key2_left = remapping_other2_player_key2_left)
			|| (remapping_player_key2_left = remapping_other2_player_key2_right)
			|| (remapping_player_key2_left = remapping_other2_player_key2_down)
			|| (remapping_player_key2_left = remapping_other2_player_key2_up)
			|| (remapping_player_key2_left = remapping_other2_player_key2_tongue)
			|| (remapping_player_key2_left = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key2_left = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key2_left = remapping_other3_player_key_dive)
			|| (remapping_player_key2_left = remapping_other3_player_key_jump)
			|| (remapping_player_key2_left = remapping_other3_player_key_crouch)
			|| (remapping_player_key2_left = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key2_left = remapping_other3_player_key_sprint)
			|| (remapping_player_key2_left = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key2_left = remapping_other3_player_key_left)
			|| (remapping_player_key2_left = remapping_other3_player_key_right)
			|| (remapping_player_key2_left = remapping_other3_player_key_down)
			|| (remapping_player_key2_left = remapping_other3_player_key_up)
			|| (remapping_player_key2_left = remapping_other3_player_key_tongue)
			|| (remapping_player_key2_left = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key2_left = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key2_left = remapping_other3_player_key2_dive)
			|| (remapping_player_key2_left = remapping_other3_player_key2_jump)
			|| (remapping_player_key2_left = remapping_other3_player_key2_crouch)
			|| (remapping_player_key2_left = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key2_left = remapping_other3_player_key2_sprint)
			|| (remapping_player_key2_left = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key2_left = remapping_other3_player_key2_left)
			|| (remapping_player_key2_left = remapping_other3_player_key2_right)
			|| (remapping_player_key2_left = remapping_other3_player_key2_down)
			|| (remapping_player_key2_left = remapping_other3_player_key2_up)
			|| (remapping_player_key2_left = remapping_other3_player_key2_tongue)
			|| (remapping_player_key2_left = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key2_left = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key2_left > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_left + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_left + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Left 2 Conflict END */
			
			#region /* Right 2 Conflict */
			if (remapping_player_key2_right = remapping_player_key_dive)
			|| (remapping_player_key2_right = remapping_player_key_jump)
			|| (remapping_player_key2_right = remapping_player_key_crouch)
			|| (remapping_player_key2_right = remapping_player_key_crouch_toggle)
			|| (remapping_player_key2_right = remapping_player_key_sprint)
			|| (remapping_player_key2_right = remapping_player_key_sprint_toggle)
			|| (remapping_player_key2_right = remapping_player_key_left)
			|| (remapping_player_key2_right = remapping_player_key_right)
			|| (remapping_player_key2_right = remapping_player_key_down)
			|| (remapping_player_key2_right = remapping_player_key_up)
			|| (remapping_player_key2_right = remapping_player_key_tongue)
			|| (remapping_player_key2_right = remapping_player_key_zoom_in)
			|| (remapping_player_key2_right = remapping_player_key_zoom_out)
			
			|| (remapping_player_key2_right = remapping_player_key2_dive)
			|| (remapping_player_key2_right = remapping_player_key2_jump)
			|| (remapping_player_key2_right = remapping_player_key2_crouch)
			|| (remapping_player_key2_right = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key2_right = remapping_player_key2_sprint)
			|| (remapping_player_key2_right = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key2_right = remapping_player_key2_left)
			|| (remapping_player_key2_right = remapping_player_key2_down)
			|| (remapping_player_key2_right = remapping_player_key2_up)
			|| (remapping_player_key2_right = remapping_player_key2_tongue)
			|| (remapping_player_key2_right = remapping_player_key2_zoom_in)
			|| (remapping_player_key2_right = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key2_right > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_right + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_right + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_right = remapping_other1_player_key_dive)
			|| (remapping_player_key2_right = remapping_other1_player_key_jump)
			|| (remapping_player_key2_right = remapping_other1_player_key_crouch)
			|| (remapping_player_key2_right = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key2_right = remapping_other1_player_key_sprint)
			|| (remapping_player_key2_right = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key2_right = remapping_other1_player_key_left)
			|| (remapping_player_key2_right = remapping_other1_player_key_right)
			|| (remapping_player_key2_right = remapping_other1_player_key_down)
			|| (remapping_player_key2_right = remapping_other1_player_key_up)
			|| (remapping_player_key2_right = remapping_other1_player_key_tongue)
			|| (remapping_player_key2_right = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key2_right = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key2_right = remapping_other1_player_key2_dive)
			|| (remapping_player_key2_right = remapping_other1_player_key2_jump)
			|| (remapping_player_key2_right = remapping_other1_player_key2_crouch)
			|| (remapping_player_key2_right = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key2_right = remapping_other1_player_key2_sprint)
			|| (remapping_player_key2_right = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key2_right = remapping_other1_player_key2_left)
			|| (remapping_player_key2_right = remapping_other1_player_key2_right)
			|| (remapping_player_key2_right = remapping_other1_player_key2_down)
			|| (remapping_player_key2_right = remapping_other1_player_key2_up)
			|| (remapping_player_key2_right = remapping_other1_player_key2_tongue)
			|| (remapping_player_key2_right = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key2_right = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key2_right = remapping_other2_player_key_dive)
			|| (remapping_player_key2_right = remapping_other2_player_key_jump)
			|| (remapping_player_key2_right = remapping_other2_player_key_crouch)
			|| (remapping_player_key2_right = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key2_right = remapping_other2_player_key_sprint)
			|| (remapping_player_key2_right = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key2_right = remapping_other2_player_key_left)
			|| (remapping_player_key2_right = remapping_other2_player_key_right)
			|| (remapping_player_key2_right = remapping_other2_player_key_down)
			|| (remapping_player_key2_right = remapping_other2_player_key_up)
			|| (remapping_player_key2_right = remapping_other2_player_key_tongue)
			|| (remapping_player_key2_right = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key2_right = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key2_right = remapping_other2_player_key2_dive)
			|| (remapping_player_key2_right = remapping_other2_player_key2_jump)
			|| (remapping_player_key2_right = remapping_other2_player_key2_crouch)
			|| (remapping_player_key2_right = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key2_right = remapping_other2_player_key2_sprint)
			|| (remapping_player_key2_right = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key2_right = remapping_other2_player_key2_left)
			|| (remapping_player_key2_right = remapping_other2_player_key2_right)
			|| (remapping_player_key2_right = remapping_other2_player_key2_down)
			|| (remapping_player_key2_right = remapping_other2_player_key2_up)
			|| (remapping_player_key2_right = remapping_other2_player_key2_tongue)
			|| (remapping_player_key2_right = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key2_right = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key2_right = remapping_other3_player_key_dive)
			|| (remapping_player_key2_right = remapping_other3_player_key_jump)
			|| (remapping_player_key2_right = remapping_other3_player_key_crouch)
			|| (remapping_player_key2_right = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key2_right = remapping_other3_player_key_sprint)
			|| (remapping_player_key2_right = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key2_right = remapping_other3_player_key_left)
			|| (remapping_player_key2_right = remapping_other3_player_key_right)
			|| (remapping_player_key2_right = remapping_other3_player_key_down)
			|| (remapping_player_key2_right = remapping_other3_player_key_up)
			|| (remapping_player_key2_right = remapping_other3_player_key_tongue)
			|| (remapping_player_key2_right = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key2_right = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key2_right = remapping_other3_player_key2_dive)
			|| (remapping_player_key2_right = remapping_other3_player_key2_jump)
			|| (remapping_player_key2_right = remapping_other3_player_key2_crouch)
			|| (remapping_player_key2_right = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key2_right = remapping_other3_player_key2_sprint)
			|| (remapping_player_key2_right = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key2_right = remapping_other3_player_key2_left)
			|| (remapping_player_key2_right = remapping_other3_player_key2_right)
			|| (remapping_player_key2_right = remapping_other3_player_key2_down)
			|| (remapping_player_key2_right = remapping_other3_player_key2_up)
			|| (remapping_player_key2_right = remapping_other3_player_key2_tongue)
			|| (remapping_player_key2_right = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key2_right = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key2_right > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_right + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_right + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Right 2 Conflict END */
			
			#region /* Down 2 Conflict */
			if (remapping_player_key2_down = remapping_player_key_dive)
			|| (remapping_player_key2_down = remapping_player_key_jump)
			|| (remapping_player_key2_down = remapping_player_key_crouch)
			|| (remapping_player_key2_down = remapping_player_key_crouch_toggle)
			|| (remapping_player_key2_down = remapping_player_key_sprint)
			|| (remapping_player_key2_down = remapping_player_key_sprint_toggle)
			|| (remapping_player_key2_down = remapping_player_key_left)
			|| (remapping_player_key2_down = remapping_player_key_right)
			|| (remapping_player_key2_down = remapping_player_key_down)
			|| (remapping_player_key2_down = remapping_player_key_up)
			|| (remapping_player_key2_down = remapping_player_key_tongue)
			|| (remapping_player_key2_down = remapping_player_key_zoom_in)
			|| (remapping_player_key2_down = remapping_player_key_zoom_out)
			
			|| (remapping_player_key2_down = remapping_player_key2_dive)
			|| (remapping_player_key2_down = remapping_player_key2_jump)
			|| (remapping_player_key2_down = remapping_player_key2_crouch)
			|| (remapping_player_key2_down = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key2_down = remapping_player_key2_sprint)
			|| (remapping_player_key2_down = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key2_down = remapping_player_key2_left)
			|| (remapping_player_key2_down = remapping_player_key2_right)
			|| (remapping_player_key2_down = remapping_player_key2_up)
			|| (remapping_player_key2_down = remapping_player_key2_tongue)
			|| (remapping_player_key2_down = remapping_player_key2_zoom_in)
			|| (remapping_player_key2_down = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key2_down > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_down + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_down + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_down = remapping_other1_player_key_dive)
			|| (remapping_player_key2_down = remapping_other1_player_key_jump)
			|| (remapping_player_key2_down = remapping_other1_player_key_crouch)
			|| (remapping_player_key2_down = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key2_down = remapping_other1_player_key_sprint)
			|| (remapping_player_key2_down = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key2_down = remapping_other1_player_key_left)
			|| (remapping_player_key2_down = remapping_other1_player_key_right)
			|| (remapping_player_key2_down = remapping_other1_player_key_down)
			|| (remapping_player_key2_down = remapping_other1_player_key_up)
			|| (remapping_player_key2_down = remapping_other1_player_key_tongue)
			|| (remapping_player_key2_down = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key2_down = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key2_down = remapping_other1_player_key2_dive)
			|| (remapping_player_key2_down = remapping_other1_player_key2_jump)
			|| (remapping_player_key2_down = remapping_other1_player_key2_crouch)
			|| (remapping_player_key2_down = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key2_down = remapping_other1_player_key2_sprint)
			|| (remapping_player_key2_down = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key2_down = remapping_other1_player_key2_left)
			|| (remapping_player_key2_down = remapping_other1_player_key2_right)
			|| (remapping_player_key2_down = remapping_other1_player_key2_down)
			|| (remapping_player_key2_down = remapping_other1_player_key2_up)
			|| (remapping_player_key2_down = remapping_other1_player_key2_tongue)
			|| (remapping_player_key2_down = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key2_down = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key2_down = remapping_other2_player_key_dive)
			|| (remapping_player_key2_down = remapping_other2_player_key_jump)
			|| (remapping_player_key2_down = remapping_other2_player_key_crouch)
			|| (remapping_player_key2_down = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key2_down = remapping_other2_player_key_sprint)
			|| (remapping_player_key2_down = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key2_down = remapping_other2_player_key_left)
			|| (remapping_player_key2_down = remapping_other2_player_key_right)
			|| (remapping_player_key2_down = remapping_other2_player_key_down)
			|| (remapping_player_key2_down = remapping_other2_player_key_up)
			|| (remapping_player_key2_down = remapping_other2_player_key_tongue)
			|| (remapping_player_key2_down = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key2_down = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key2_down = remapping_other2_player_key2_dive)
			|| (remapping_player_key2_down = remapping_other2_player_key2_jump)
			|| (remapping_player_key2_down = remapping_other2_player_key2_crouch)
			|| (remapping_player_key2_down = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key2_down = remapping_other2_player_key2_sprint)
			|| (remapping_player_key2_down = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key2_down = remapping_other2_player_key2_left)
			|| (remapping_player_key2_down = remapping_other2_player_key2_right)
			|| (remapping_player_key2_down = remapping_other2_player_key2_down)
			|| (remapping_player_key2_down = remapping_other2_player_key2_up)
			|| (remapping_player_key2_down = remapping_other2_player_key2_tongue)
			|| (remapping_player_key2_down = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key2_down = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key2_down = remapping_other3_player_key_dive)
			|| (remapping_player_key2_down = remapping_other3_player_key_jump)
			|| (remapping_player_key2_down = remapping_other3_player_key_crouch)
			|| (remapping_player_key2_down = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key2_down = remapping_other3_player_key_sprint)
			|| (remapping_player_key2_down = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key2_down = remapping_other3_player_key_left)
			|| (remapping_player_key2_down = remapping_other3_player_key_right)
			|| (remapping_player_key2_down = remapping_other3_player_key_down)
			|| (remapping_player_key2_down = remapping_other3_player_key_up)
			|| (remapping_player_key2_down = remapping_other3_player_key_tongue)
			|| (remapping_player_key2_down = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key2_down = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key2_down = remapping_other3_player_key2_dive)
			|| (remapping_player_key2_down = remapping_other3_player_key2_jump)
			|| (remapping_player_key2_down = remapping_other3_player_key2_crouch)
			|| (remapping_player_key2_down = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key2_down = remapping_other3_player_key2_sprint)
			|| (remapping_player_key2_down = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key2_down = remapping_other3_player_key2_left)
			|| (remapping_player_key2_down = remapping_other3_player_key2_right)
			|| (remapping_player_key2_down = remapping_other3_player_key2_down)
			|| (remapping_player_key2_down = remapping_other3_player_key2_up)
			|| (remapping_player_key2_down = remapping_other3_player_key2_tongue)
			|| (remapping_player_key2_down = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key2_down = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key2_down > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_down + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_down + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Down 2 Conflict END */
			
			#region /* Up 2 Conflict */
			if (remapping_player_key2_up = remapping_player_key_dive)
			|| (remapping_player_key2_up = remapping_player_key_jump)
			|| (remapping_player_key2_up = remapping_player_key_crouch)
			|| (remapping_player_key2_up = remapping_player_key_crouch_toggle)
			|| (remapping_player_key2_up = remapping_player_key_sprint)
			|| (remapping_player_key2_up = remapping_player_key_sprint_toggle)
			|| (remapping_player_key2_up = remapping_player_key_left)
			|| (remapping_player_key2_up = remapping_player_key_right)
			|| (remapping_player_key2_up = remapping_player_key_down)
			|| (remapping_player_key2_up = remapping_player_key_up)
			|| (remapping_player_key2_up = remapping_player_key_tongue)
			|| (remapping_player_key2_up = remapping_player_key_zoom_in)
			|| (remapping_player_key2_up = remapping_player_key_zoom_out)
			
			|| (remapping_player_key2_up = remapping_player_key2_dive)
			|| (remapping_player_key2_up = remapping_player_key2_jump)
			|| (remapping_player_key2_up = remapping_player_key2_crouch)
			|| (remapping_player_key2_up = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key2_up = remapping_player_key2_sprint)
			|| (remapping_player_key2_up = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key2_up = remapping_player_key2_left)
			|| (remapping_player_key2_up = remapping_player_key2_right)
			|| (remapping_player_key2_up = remapping_player_key2_down)
			|| (remapping_player_key2_up = remapping_player_key2_tongue)
			|| (remapping_player_key2_up = remapping_player_key2_zoom_in)
			|| (remapping_player_key2_up = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key2_up > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_up + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_up + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_up = remapping_other1_player_key_dive)
			|| (remapping_player_key2_up = remapping_other1_player_key_jump)
			|| (remapping_player_key2_up = remapping_other1_player_key_crouch)
			|| (remapping_player_key2_up = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key2_up = remapping_other1_player_key_sprint)
			|| (remapping_player_key2_up = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key2_up = remapping_other1_player_key_left)
			|| (remapping_player_key2_up = remapping_other1_player_key_right)
			|| (remapping_player_key2_up = remapping_other1_player_key_down)
			|| (remapping_player_key2_up = remapping_other1_player_key_up)
			|| (remapping_player_key2_up = remapping_other1_player_key_tongue)
			|| (remapping_player_key2_up = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key2_up = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key2_up = remapping_other1_player_key2_dive)
			|| (remapping_player_key2_up = remapping_other1_player_key2_jump)
			|| (remapping_player_key2_up = remapping_other1_player_key2_crouch)
			|| (remapping_player_key2_up = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key2_up = remapping_other1_player_key2_sprint)
			|| (remapping_player_key2_up = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key2_up = remapping_other1_player_key2_left)
			|| (remapping_player_key2_up = remapping_other1_player_key2_right)
			|| (remapping_player_key2_up = remapping_other1_player_key2_down)
			|| (remapping_player_key2_up = remapping_other1_player_key2_up)
			|| (remapping_player_key2_up = remapping_other1_player_key2_tongue)
			|| (remapping_player_key2_up = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key2_up = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key2_up = remapping_other2_player_key_dive)
			|| (remapping_player_key2_up = remapping_other2_player_key_jump)
			|| (remapping_player_key2_up = remapping_other2_player_key_crouch)
			|| (remapping_player_key2_up = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key2_up = remapping_other2_player_key_sprint)
			|| (remapping_player_key2_up = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key2_up = remapping_other2_player_key_left)
			|| (remapping_player_key2_up = remapping_other2_player_key_right)
			|| (remapping_player_key2_up = remapping_other2_player_key_down)
			|| (remapping_player_key2_up = remapping_other2_player_key_up)
			|| (remapping_player_key2_up = remapping_other2_player_key_tongue)
			|| (remapping_player_key2_up = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key2_up = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key2_up = remapping_other2_player_key2_dive)
			|| (remapping_player_key2_up = remapping_other2_player_key2_jump)
			|| (remapping_player_key2_up = remapping_other2_player_key2_crouch)
			|| (remapping_player_key2_up = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key2_up = remapping_other2_player_key2_sprint)
			|| (remapping_player_key2_up = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key2_up = remapping_other2_player_key2_left)
			|| (remapping_player_key2_up = remapping_other2_player_key2_right)
			|| (remapping_player_key2_up = remapping_other2_player_key2_down)
			|| (remapping_player_key2_up = remapping_other2_player_key2_up)
			|| (remapping_player_key2_up = remapping_other2_player_key2_tongue)
			|| (remapping_player_key2_up = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key2_up = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key2_up = remapping_other3_player_key_dive)
			|| (remapping_player_key2_up = remapping_other3_player_key_jump)
			|| (remapping_player_key2_up = remapping_other3_player_key_crouch)
			|| (remapping_player_key2_up = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key2_up = remapping_other3_player_key_sprint)
			|| (remapping_player_key2_up = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key2_up = remapping_other3_player_key_left)
			|| (remapping_player_key2_up = remapping_other3_player_key_right)
			|| (remapping_player_key2_up = remapping_other3_player_key_down)
			|| (remapping_player_key2_up = remapping_other3_player_key_up)
			|| (remapping_player_key2_up = remapping_other3_player_key_tongue)
			|| (remapping_player_key2_up = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key2_up = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key2_up = remapping_other3_player_key2_dive)
			|| (remapping_player_key2_up = remapping_other3_player_key2_jump)
			|| (remapping_player_key2_up = remapping_other3_player_key2_crouch)
			|| (remapping_player_key2_up = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key2_up = remapping_other3_player_key2_sprint)
			|| (remapping_player_key2_up = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key2_up = remapping_other3_player_key2_left)
			|| (remapping_player_key2_up = remapping_other3_player_key2_right)
			|| (remapping_player_key2_up = remapping_other3_player_key2_down)
			|| (remapping_player_key2_up = remapping_other3_player_key2_up)
			|| (remapping_player_key2_up = remapping_other3_player_key2_tongue)
			|| (remapping_player_key2_up = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key2_up = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key2_up > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_up + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_up + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Up 2 Conflict END */
			
			#region /* Tongue 2 Conflict */
			if (remapping_player_key2_tongue = remapping_player_key_dive)
			|| (remapping_player_key2_tongue = remapping_player_key_jump)
			|| (remapping_player_key2_tongue = remapping_player_key_crouch)
			|| (remapping_player_key2_tongue = remapping_player_key_crouch_toggle)
			|| (remapping_player_key2_tongue = remapping_player_key_sprint)
			|| (remapping_player_key2_tongue = remapping_player_key_sprint_toggle)
			|| (remapping_player_key2_tongue = remapping_player_key_left)
			|| (remapping_player_key2_tongue = remapping_player_key_right)
			|| (remapping_player_key2_tongue = remapping_player_key_down)
			|| (remapping_player_key2_tongue = remapping_player_key_up)
			|| (remapping_player_key2_tongue = remapping_player_key_tongue)
			|| (remapping_player_key2_tongue = remapping_player_key_zoom_in)
			|| (remapping_player_key2_tongue = remapping_player_key_zoom_out)
			
			|| (remapping_player_key2_tongue = remapping_player_key2_dive)
			|| (remapping_player_key2_tongue = remapping_player_key2_jump)
			|| (remapping_player_key2_tongue = remapping_player_key2_crouch)
			|| (remapping_player_key2_tongue = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key2_tongue = remapping_player_key2_sprint)
			|| (remapping_player_key2_tongue = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key2_tongue = remapping_player_key2_left)
			|| (remapping_player_key2_tongue = remapping_player_key2_right)
			|| (remapping_player_key2_tongue = remapping_player_key2_down)
			|| (remapping_player_key2_tongue = remapping_player_key2_up)
			|| (remapping_player_key2_tongue = remapping_player_key2_zoom_in)
			|| (remapping_player_key2_tongue = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key2_tongue > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_tongue + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_tongue + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_tongue = remapping_other1_player_key_dive)
			|| (remapping_player_key2_tongue = remapping_other1_player_key_jump)
			|| (remapping_player_key2_tongue = remapping_other1_player_key_crouch)
			|| (remapping_player_key2_tongue = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key2_tongue = remapping_other1_player_key_sprint)
			|| (remapping_player_key2_tongue = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key2_tongue = remapping_other1_player_key_left)
			|| (remapping_player_key2_tongue = remapping_other1_player_key_right)
			|| (remapping_player_key2_tongue = remapping_other1_player_key_down)
			|| (remapping_player_key2_tongue = remapping_other1_player_key_up)
			|| (remapping_player_key2_tongue = remapping_other1_player_key_tongue)
			|| (remapping_player_key2_tongue = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key2_tongue = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key2_tongue = remapping_other1_player_key2_dive)
			|| (remapping_player_key2_tongue = remapping_other1_player_key2_jump)
			|| (remapping_player_key2_tongue = remapping_other1_player_key2_crouch)
			|| (remapping_player_key2_tongue = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key2_tongue = remapping_other1_player_key2_sprint)
			|| (remapping_player_key2_tongue = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key2_tongue = remapping_other1_player_key2_left)
			|| (remapping_player_key2_tongue = remapping_other1_player_key2_right)
			|| (remapping_player_key2_tongue = remapping_other1_player_key2_down)
			|| (remapping_player_key2_tongue = remapping_other1_player_key2_up)
			|| (remapping_player_key2_tongue = remapping_other1_player_key2_tongue)
			|| (remapping_player_key2_tongue = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key2_tongue = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key2_tongue = remapping_other2_player_key_dive)
			|| (remapping_player_key2_tongue = remapping_other2_player_key_jump)
			|| (remapping_player_key2_tongue = remapping_other2_player_key_crouch)
			|| (remapping_player_key2_tongue = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key2_tongue = remapping_other2_player_key_sprint)
			|| (remapping_player_key2_tongue = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key2_tongue = remapping_other2_player_key_left)
			|| (remapping_player_key2_tongue = remapping_other2_player_key_right)
			|| (remapping_player_key2_tongue = remapping_other2_player_key_down)
			|| (remapping_player_key2_tongue = remapping_other2_player_key_up)
			|| (remapping_player_key2_tongue = remapping_other2_player_key_tongue)
			|| (remapping_player_key2_tongue = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key2_tongue = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key2_tongue = remapping_other2_player_key2_dive)
			|| (remapping_player_key2_tongue = remapping_other2_player_key2_jump)
			|| (remapping_player_key2_tongue = remapping_other2_player_key2_crouch)
			|| (remapping_player_key2_tongue = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key2_tongue = remapping_other2_player_key2_sprint)
			|| (remapping_player_key2_tongue = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key2_tongue = remapping_other2_player_key2_left)
			|| (remapping_player_key2_tongue = remapping_other2_player_key2_right)
			|| (remapping_player_key2_tongue = remapping_other2_player_key2_down)
			|| (remapping_player_key2_tongue = remapping_other2_player_key2_up)
			|| (remapping_player_key2_tongue = remapping_other2_player_key2_tongue)
			|| (remapping_player_key2_tongue = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key2_tongue = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key2_tongue = remapping_other3_player_key_dive)
			|| (remapping_player_key2_tongue = remapping_other3_player_key_jump)
			|| (remapping_player_key2_tongue = remapping_other3_player_key_crouch)
			|| (remapping_player_key2_tongue = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key2_tongue = remapping_other3_player_key_sprint)
			|| (remapping_player_key2_tongue = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key2_tongue = remapping_other3_player_key_left)
			|| (remapping_player_key2_tongue = remapping_other3_player_key_right)
			|| (remapping_player_key2_tongue = remapping_other3_player_key_down)
			|| (remapping_player_key2_tongue = remapping_other3_player_key_up)
			|| (remapping_player_key2_tongue = remapping_other3_player_key_tongue)
			|| (remapping_player_key2_tongue = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key2_tongue = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key2_tongue = remapping_other3_player_key2_dive)
			|| (remapping_player_key2_tongue = remapping_other3_player_key2_jump)
			|| (remapping_player_key2_tongue = remapping_other3_player_key2_crouch)
			|| (remapping_player_key2_tongue = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key2_tongue = remapping_other3_player_key2_sprint)
			|| (remapping_player_key2_tongue = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key2_tongue = remapping_other3_player_key2_left)
			|| (remapping_player_key2_tongue = remapping_other3_player_key2_right)
			|| (remapping_player_key2_tongue = remapping_other3_player_key2_down)
			|| (remapping_player_key2_tongue = remapping_other3_player_key2_up)
			|| (remapping_player_key2_tongue = remapping_other3_player_key2_tongue)
			|| (remapping_player_key2_tongue = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key2_tongue = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key2_tongue > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_tongue + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_tongue + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Tongue 2 Conflict END */
			
			#region /* Zoom In 2 Conflict */
			if (remapping_player_key2_zoom_in = remapping_player_key_dive)
			|| (remapping_player_key2_zoom_in = remapping_player_key_jump)
			|| (remapping_player_key2_zoom_in = remapping_player_key_crouch)
			|| (remapping_player_key2_zoom_in = remapping_player_key_crouch_toggle)
			|| (remapping_player_key2_zoom_in = remapping_player_key_sprint)
			|| (remapping_player_key2_zoom_in = remapping_player_key_sprint_toggle)
			|| (remapping_player_key2_zoom_in = remapping_player_key_left)
			|| (remapping_player_key2_zoom_in = remapping_player_key_right)
			|| (remapping_player_key2_zoom_in = remapping_player_key_down)
			|| (remapping_player_key2_zoom_in = remapping_player_key_up)
			|| (remapping_player_key2_zoom_in = remapping_player_key_tongue)
			|| (remapping_player_key2_zoom_in = remapping_player_key_zoom_in)
			|| (remapping_player_key2_zoom_in = remapping_player_key_zoom_out)
			
			|| (remapping_player_key2_zoom_in = remapping_player_key2_dive)
			|| (remapping_player_key2_zoom_in = remapping_player_key2_jump)
			|| (remapping_player_key2_zoom_in = remapping_player_key2_crouch)
			|| (remapping_player_key2_zoom_in = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key2_zoom_in = remapping_player_key2_sprint)
			|| (remapping_player_key2_zoom_in = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key2_zoom_in = remapping_player_key2_left)
			|| (remapping_player_key2_zoom_in = remapping_player_key2_right)
			|| (remapping_player_key2_zoom_in = remapping_player_key2_down)
			|| (remapping_player_key2_zoom_in = remapping_player_key2_up)
			|| (remapping_player_key2_zoom_in = remapping_player_key2_tongue)
			|| (remapping_player_key2_zoom_in = remapping_player_key2_zoom_out)
			{
				if (remapping_player_key2_zoom_in > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_zoom_in + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_zoom_in + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_zoom_in = remapping_other1_player_key_dive)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key_jump)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key_crouch)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key_sprint)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key_left)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key_right)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key_down)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key_up)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key_tongue)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key2_dive)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key2_jump)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key2_crouch)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key2_sprint)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key2_left)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key2_right)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key2_down)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key2_up)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key2_tongue)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key2_zoom_in = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key_dive)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key_jump)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key_crouch)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key_sprint)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key_left)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key_right)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key_down)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key_up)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key_tongue)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key2_dive)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key2_jump)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key2_crouch)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key2_sprint)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key2_left)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key2_right)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key2_down)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key2_up)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key2_tongue)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key2_zoom_in = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key_dive)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key_jump)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key_crouch)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key_sprint)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key_left)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key_right)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key_down)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key_up)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key_tongue)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key2_dive)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key2_jump)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key2_crouch)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key2_sprint)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key2_left)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key2_right)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key2_down)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key2_up)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key2_tongue)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key2_zoom_in = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key2_zoom_in > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_zoom_in + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_zoom_in + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Zoom In 2 Conflict END */
			
			#region /* Zoom Out 2 Conflict */
			if (remapping_player_key2_zoom_out = remapping_player_key_dive)
			|| (remapping_player_key2_zoom_out = remapping_player_key_jump)
			|| (remapping_player_key2_zoom_out = remapping_player_key_crouch)
			|| (remapping_player_key2_zoom_out = remapping_player_key_crouch_toggle)
			|| (remapping_player_key2_zoom_out = remapping_player_key_sprint)
			|| (remapping_player_key2_zoom_out = remapping_player_key_sprint_toggle)
			|| (remapping_player_key2_zoom_out = remapping_player_key_left)
			|| (remapping_player_key2_zoom_out = remapping_player_key_right)
			|| (remapping_player_key2_zoom_out = remapping_player_key_down)
			|| (remapping_player_key2_zoom_out = remapping_player_key_up)
			|| (remapping_player_key2_zoom_out = remapping_player_key_tongue)
			|| (remapping_player_key2_zoom_out = remapping_player_key_zoom_in)
			|| (remapping_player_key2_zoom_out = remapping_player_key_zoom_out)
			
			|| (remapping_player_key2_zoom_out = remapping_player_key2_dive)
			|| (remapping_player_key2_zoom_out = remapping_player_key2_jump)
			|| (remapping_player_key2_zoom_out = remapping_player_key2_crouch)
			|| (remapping_player_key2_zoom_out = remapping_player_key2_crouch_toggle)
			|| (remapping_player_key2_zoom_out = remapping_player_key2_sprint)
			|| (remapping_player_key2_zoom_out = remapping_player_key2_sprint_toggle)
			|| (remapping_player_key2_zoom_out = remapping_player_key2_left)
			|| (remapping_player_key2_zoom_out = remapping_player_key2_right)
			|| (remapping_player_key2_zoom_out = remapping_player_key2_down)
			|| (remapping_player_key2_zoom_out = remapping_player_key2_up)
			|| (remapping_player_key2_zoom_out = remapping_player_key2_tongue)
			|| (remapping_player_key2_zoom_out = remapping_player_key2_zoom_in)
			{
				if (remapping_player_key2_zoom_out > 0)
				{
					draw_set_alpha(1);
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_zoom_out + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_zoom_out + menu_y_offset + 33, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_zoom_out = remapping_other1_player_key_dive)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key_jump)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key_crouch)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key_crouch_toggle)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key_sprint)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key_sprint_toggle)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key_left)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key_right)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key_down)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key_up)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key_tongue)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key_zoom_in)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key_zoom_out)
			
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key2_dive)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key2_jump)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key2_crouch)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key2_crouch_toggle)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key2_sprint)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key2_sprint_toggle)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key2_left)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key2_right)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key2_down)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key2_up)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key2_tongue)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key2_zoom_in)
			|| (remapping_player_key2_zoom_out = remapping_other1_player_key2_zoom_out)
			
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key_dive)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key_jump)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key_crouch)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key_crouch_toggle)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key_sprint)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key_sprint_toggle)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key_left)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key_right)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key_down)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key_up)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key_tongue)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key_zoom_in)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key_zoom_out)
			
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key2_dive)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key2_jump)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key2_crouch)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key2_crouch_toggle)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key2_sprint)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key2_sprint_toggle)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key2_left)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key2_right)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key2_down)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key2_up)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key2_tongue)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key2_zoom_in)
			|| (remapping_player_key2_zoom_out = remapping_other2_player_key2_zoom_out)
			
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key_dive)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key_jump)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key_crouch)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key_crouch_toggle)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key_sprint)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key_sprint_toggle)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key_left)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key_right)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key_down)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key_up)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key_tongue)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key_zoom_in)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key_zoom_out)
			
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key2_dive)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key2_jump)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key2_crouch)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key2_crouch_toggle)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key2_sprint)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key2_sprint_toggle)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key2_left)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key2_right)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key2_down)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key2_up)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key2_tongue)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key2_zoom_in)
			|| (remapping_player_key2_zoom_out = remapping_other3_player_key2_zoom_out)
			{
				if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
				&& (remapping_player_key2_zoom_out > 0)
				{
					draw_set_alpha(scr_wave(1, 0.1, 1, 0));
					draw_roundrect_color(key2_x - 34, menu_y_remap_key_zoom_out + menu_y_offset - 34, key2_x + 33, menu_y_remap_key_zoom_out + menu_y_offset + 33, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /* Zoom Out 2 Conflict END */
			
			#endregion /* Key 2 Conflicts END */
			
			#endregion /* Make keys red if in conflict with other keys END */
			
			scr_draw_remap_key("remap_key_dive", l10n_text("Dive"), remapping_player_key_dive, remapping_player_key2_dive, key1_x, menu_y_remap_key_dive);
			scr_draw_remap_key("remap_key_jump", l10n_text("Jump"), remapping_player_key_jump, remapping_player_key2_jump, key1_x, menu_y_remap_key_jump);
			if (remapping_player == 0)
			&& (allow_player1_double_jump >= 3)
			|| (remapping_player == 1)
			&& (allow_player2_double_jump >= 3)
			|| (remapping_player == 2)
			&& (allow_player3_double_jump >= 3)
			|| (remapping_player == 3)
			&& (allow_player4_double_jump >= 3)
			{
				scr_draw_remap_key("remap_key_double_jump", l10n_text("Multi Jump"), remapping_player_key_double_jump, remapping_player_key2_double_jump, key1_x, menu_y_remap_key_double_jump);
			}
			else
			if (remapping_player == 0)
			&& (allow_player1_double_jump == -1)
			|| (remapping_player == 1)
			&& (allow_player2_double_jump == -1)
			|| (remapping_player == 2)
			&& (allow_player3_double_jump == -1)
			|| (remapping_player == 3)
			&& (allow_player4_double_jump == -1)
			{
				scr_draw_remap_key("remap_key_double_jump", l10n_text("Infinite Jump"), remapping_player_key_double_jump, remapping_player_key2_double_jump, key1_x, menu_y_remap_key_double_jump);
			}
			else
			{
				scr_draw_remap_key("remap_key_double_jump", l10n_text("Double Jump"), remapping_player_key_double_jump, remapping_player_key2_double_jump, key1_x, menu_y_remap_key_double_jump);
			}
			scr_draw_remap_key("remap_key_crouch", l10n_text("Crouch"), remapping_player_key_crouch, remapping_player_key2_crouch, key1_x, menu_y_remap_key_crouch);
			scr_draw_remap_key("remap_key_crouch_toggle", l10n_text("Crouch Toggle"), remapping_player_key_crouch_toggle, remapping_player_key2_crouch_toggle, key1_x, menu_y_remap_key_crouch_toggle);
			scr_draw_remap_key("remap_key_sprint", l10n_text("Sprint"), remapping_player_key_sprint, remapping_player_key2_sprint, key1_x, menu_y_remap_key_sprint);
			scr_draw_remap_key("remap_key_sprint_toggle", l10n_text("Sprint Toggle"), remapping_player_key_sprint_toggle, remapping_player_key2_sprint_toggle, key1_x, menu_y_remap_key_sprint_toggle);
			scr_draw_remap_key("remap_key_left", l10n_text("Left"), remapping_player_key_left, remapping_player_key2_left, key1_x, menu_y_remap_key_left);
			scr_draw_remap_key("remap_key_right", l10n_text("Right"), remapping_player_key_right, remapping_player_key2_right, key1_x, menu_y_remap_key_right);
			scr_draw_remap_key("remap_key_down", l10n_text("Down"), remapping_player_key_down, remapping_player_key2_down, key1_x, menu_y_remap_key_down);
			scr_draw_remap_key("remap_key_up", l10n_text("Up"), remapping_player_key_up, remapping_player_key2_up, key1_x, menu_y_remap_key_up);
			scr_draw_remap_key("remap_key_tongue", l10n_text("Tongue"), remapping_player_key_tongue, remapping_player_key2_tongue, key1_x, menu_y_remap_key_tongue);
			scr_draw_remap_key("remap_key_zoom_in", l10n_text("Zoom In"), remapping_player_key_zoom_in, remapping_player_key2_zoom_in, key1_x, menu_y_remap_key_zoom_in);
			scr_draw_remap_key("remap_key_zoom_out", l10n_text("Zoom Out"), remapping_player_key_zoom_out, remapping_player_key2_zoom_out, key1_x, menu_y_remap_key_zoom_out);
			scr_draw_remap_key("remap_key_accept", l10n_text("Accept"), remapping_player_key_accept, remapping_player_key2_accept, key1_x, menu_y_remap_key_accept);
			scr_draw_remap_key("remap_key_back", l10n_text("Back"), remapping_player_key_back, remapping_player_key2_back, key1_x, menu_y_remap_key_back);
			
			#endregion /* Show the keys for every player END */
			
		}
		#endregion /* Show what key is used END */
		
		scr_options_reset_controls_to_default_settings(430, menu_y_remap_reset);
		
		#region /* Keyboards Controls Remapping Navigation */
		if (menu_joystick_delay <= 0)
		{
			
			#region /* Remap key dive */
			if (menu == "remap_key_dive")
			&& (can_remap_key == false)
			&& (input_key == false)
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					if (can_change_profile)
					{
						menu = "remap_select_profile";
					}
					else
					{
						menu = "remap_select_player";
					}
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_jump";
					menu_delay = 3;
				}
			}
			#endregion /* Remap key dive END */
			
			else
			
			#region /* Remap key jump */
			if (menu == "remap_key_jump")
			&& (can_remap_key == false)
			&& (input_key == false)
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					if (remapping_player == 0)
					&& (allow_player1_dive)
					|| (remapping_player == 1)
					&& (allow_player2_dive)
					|| (remapping_player == 2)
					&& (allow_player3_dive)
					|| (remapping_player == 3)
					&& (allow_player4_dive)
					{
						menu = "remap_key_dive";
					}
					else
					if (can_change_profile)
					{
						menu = "remap_select_profile";
					}
					else
					{
						menu = "remap_select_player";
					}
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					if (remapping_player == 0)
					&& (allow_player1_double_jump >= 2)
					|| (remapping_player == 1)
					&& (allow_player2_double_jump >= 2)
					|| (remapping_player == 2)
					&& (allow_player3_double_jump >= 2)
					|| (remapping_player == 3)
					&& (allow_player4_double_jump >= 2)
					|| (remapping_player == 0)
					&& (allow_player1_double_jump == -1)
					|| (remapping_player == 1)
					&& (allow_player2_double_jump == -1)
					|| (remapping_player == 2)
					&& (allow_player3_double_jump == -1)
					|| (remapping_player == 3)
					&& (allow_player4_double_jump == -1)
					{
						menu = "remap_key_double_jump";
					}
					else
					{
						menu = "remap_key_crouch";
					}
					menu_delay = 3;
				}
			}
			#endregion /* Remap key jump END */
			
			else
			
			#region /* Remap key double jump */
			if (menu == "remap_key_double_jump")
			&& (can_remap_key == false)
			&& (input_key == false)
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_jump";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_crouch";
					menu_delay = 3;
				}
			}
			#endregion /* Remap key double jump END */
			
			else
			
			#region /* Remap key crouch */
			if (menu == "remap_key_crouch")
			&& (can_remap_key == false)
			&& (input_key == false)
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					if (remapping_player == 0)
					&& (allow_player1_double_jump >= 2)
					|| (remapping_player == 1)
					&& (allow_player2_double_jump >= 2)
					|| (remapping_player == 2)
					&& (allow_player3_double_jump >= 2)
					|| (remapping_player == 3)
					&& (allow_player4_double_jump >= 2)
					|| (remapping_player == 0)
					&& (allow_player1_double_jump == -1)
					|| (remapping_player == 1)
					&& (allow_player2_double_jump == -1)
					|| (remapping_player == 2)
					&& (allow_player3_double_jump == -1)
					|| (remapping_player == 3)
					&& (allow_player4_double_jump == -1)
					{
						menu = "remap_key_double_jump";
					}
					else
					{
						menu = "remap_key_jump";
					}
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_crouch_toggle";
					menu_delay = 3;
				}
			}
			#endregion /* Remap key crouch END */
			
			else
			
			#region /* Remap key crouch toggle */
			if (menu == "remap_key_crouch_toggle")
			&& (can_remap_key == false)
			&& (input_key == false)
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_crouch";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_sprint";
					menu_delay = 3;
				}
			}
			#endregion /* Remap key crouch toggle END */
			
			else
			
			#region /* Remap key sprint */
			if (menu == "remap_key_sprint")
			&& (can_remap_key == false)
			&& (input_key == false)
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_crouch_toggle";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_sprint_toggle";
					menu_delay = 3;
				}
			}
			#endregion /* Remap key sprint END */
			
			else
			
			#region /* Remap key sprint toggle */
			if (menu == "remap_key_sprint_toggle")
			&& (can_remap_key == false)
			&& (input_key == false)
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_sprint";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_left";
					menu_delay = 3;
				}
			}
			#endregion /* Remap key sprint toggle END */
			
			else
			
			#region /* Remap key left */
			if (menu == "remap_key_left")
			&& (can_remap_key == false)
			&& (input_key == false)
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_sprint_toggle";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_right";
					menu_delay = 3;
				}
			}
			#endregion /* Remap key left END */
			
			else
			
			#region /* Remap key right */
			if (menu == "remap_key_right")
			&& (can_remap_key == false)
			&& (input_key == false)
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_left";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_down";
					menu_delay = 3;
				}
			}
			#endregion /* Remap key right END */
			
			else
			
			#region /* Remap key down */
			if (menu == "remap_key_down")
			&& (can_remap_key == false)
			&& (input_key == false)
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_right";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_up";
					menu_delay = 3;
				}
			}
			#endregion /* Remap key down END */
			
			else
			
			#region /* Remap key up */
			if (menu == "remap_key_up")
			&& (can_remap_key == false)
			&& (input_key == false)
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_down";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					if (remapping_player == 0)
					&& (allow_player1_tongue)
					|| (remapping_player == 1)
					&& (allow_player2_tongue)
					|| (remapping_player == 2)
					&& (allow_player3_tongue)
					|| (remapping_player == 3)
					&& (allow_player4_tongue)
					{
						menu = "remap_key_tongue";
					}
					else
					{
						menu = "remap_key_zoom_in";
					}
					menu_delay = 3;
				}
			}
			#endregion /* Remap key up END */
			
			else
			
			#region /* Remap Key Tongue */
			if (menu == "remap_key_tongue")
			&& (can_remap_key == false)
			&& (input_key == false)
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_up";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_zoom_in";
					menu_delay = 3;
				}
			}
			#endregion /* Remap Key Tongue END */
			
			else
			
			#region /* Remap Key Zoom In */
			if (menu == "remap_key_zoom_in")
			&& (can_remap_key == false)
			&& (input_key == false)
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					if (remapping_player == 0)
					&& (allow_player1_tongue)
					|| (remapping_player == 1)
					&& (allow_player2_tongue)
					|| (remapping_player == 2)
					&& (allow_player3_tongue)
					|| (remapping_player == 3)
					&& (allow_player4_tongue)
					{
						menu = "remap_key_tongue";
					}
					else
					{
						menu = "remap_key_up";
					}
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_zoom_out";
					menu_delay = 3;
				}
			}
			#endregion /* Remap Key Zoom In END */
			
			else
			
			#region /* Remap Key Zoom Out */
			if (menu == "remap_key_zoom_out")
			&& (can_remap_key == false)
			&& (input_key == false)
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_zoom_in";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_accept";
					menu_delay = 3;
				}
			}
			#endregion /* Remap Key Zoom Out END */
			
			else
			
			#region /* Remap Key Accept */
			if (menu == "remap_key_accept")
			&& (can_remap_key == false)
			&& (input_key == false)
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_zoom_out";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_back";
					menu_delay = 3;
				}
			}
			#endregion /* Remap Key Accept END */
			
			else
			
			#region /* Remap Key Back */
			if (menu == "remap_key_back")
			&& (can_remap_key == false)
			&& (input_key == false)
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_accept";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_reset";
					menu_delay = 3;
				}
			}
			#endregion /* Remap Key Back END */
			
			else
			
			#region /* Remap reset */
			if (menu == "remap_reset")
			&& (can_remap_key == false)
			&& (input_key == false)
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_back";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "up_is_also_jump";
					menu_delay = 3;
				}
			}
			#endregion /* Remap reset END */
			
			#region /* Menu remap key number */
			if (menu == "remap_key_dive")
			|| (menu == "remap_key_jump")
			|| (menu == "remap_key_double_jump")
			|| (menu == "remap_key_crouch")
			|| (menu == "remap_key_crouch_toggle")
			|| (menu == "remap_key_sprint")
			|| (menu == "remap_key_sprint_toggle")
			|| (menu == "remap_key_left")
			|| (menu == "remap_key_right")
			|| (menu == "remap_key_down")
			|| (menu == "remap_key_up")
			|| (menu == "remap_key_tongue")
			|| (menu == "remap_key_zoom_in")
			|| (menu == "remap_key_zoom_out")
			|| (menu == "remap_key_accept")
			|| (menu == "remap_key_back")
			{
				if (key_left)
				&& (can_remap_key == false)
				&& (input_key == false)
				&& (menu_delay == 0)
				&& (menu_joystick_delay == 0)
				|| (key_right)
				&& (can_remap_key == false)
				&& (input_key == false)
				&& (menu_delay == 0)
				&& (menu_joystick_delay == 0)
				{
					if (menu_remap_key_number == 0)
					{
						menu_remap_key_number = 2;
						menu_delay = 3;
					}
					else
					if (menu_remap_key_number == 2)
					{
						menu_remap_key_number = 0;
						menu_delay = 3;
					}
				}
			}
			#endregion /* Menu remap key number */
			
		}
		
		#endregion /* Keyboards Controls Remapping Navigation END */
		
		#endregion /* Remap Keyboard and Mouse or Gamepad END */
		
		#region /* Controls checkmarks and dropdown menu settings */
		if (remapping_player == 0)
		{
			var global_up_is_also_jump = global.player1_up_is_also_jump;
			var global_double_tap_to_run = global.player1_double_tap_to_run;
			var global_sprint_toggle = global.player1_sprint_toggle;
			var global_double_tap_to_dive = global.player1_double_tap_to_dive;
			var global_cancel_dive_by_pressing_jump_or_dive_button = global.player1_cancel_dive_by_pressing_jump_or_dive_button;
			var global_cancel_dive_by_pressing_opposite_direction = global.player1_cancel_dive_by_pressing_opposite_direction;
			var global_down_and_jump_to_groundpound = global.player1_down_and_jump_to_groundpound;
			var global_show_controls = global.player1_show_controls;
			var global_drop_from_rope = global.player1_drop_from_rope;
			var global_wall_jump_setting = global.player1_wall_jump_setting;
		}
		else
		if (remapping_player == 1)
		{
			var global_up_is_also_jump = global.player2_up_is_also_jump;
			var global_double_tap_to_run = global.player2_double_tap_to_run;
			var global_sprint_toggle = global.player2_sprint_toggle;
			var global_double_tap_to_dive = global.player2_double_tap_to_dive;
			var global_cancel_dive_by_pressing_jump_or_dive_button = global.player2_cancel_dive_by_pressing_jump_or_dive_button;
			var global_cancel_dive_by_pressing_opposite_direction = global.player2_cancel_dive_by_pressing_opposite_direction;
			var global_down_and_jump_to_groundpound = global.player2_down_and_jump_to_groundpound;
			var global_show_controls = global.player2_show_controls;
			var global_drop_from_rope = global.player2_drop_from_rope;
			var global_wall_jump_setting = global.player2_wall_jump_setting;
		}
		else
		if (remapping_player == 2)
		{
			var global_up_is_also_jump = global.player3_up_is_also_jump;
			var global_double_tap_to_run = global.player3_double_tap_to_run;
			var global_sprint_toggle = global.player3_sprint_toggle;
			var global_double_tap_to_dive = global.player3_double_tap_to_dive;
			var global_cancel_dive_by_pressing_jump_or_dive_button = global.player3_cancel_dive_by_pressing_jump_or_dive_button;
			var global_cancel_dive_by_pressing_opposite_direction = global.player3_cancel_dive_by_pressing_opposite_direction;
			var global_down_and_jump_to_groundpound = global.player3_down_and_jump_to_groundpound;
			var global_show_controls = global.player3_show_controls;
			var global_drop_from_rope = global.player3_drop_from_rope;
			var global_wall_jump_setting = global.player3_wall_jump_setting;
		}
		else
		if (remapping_player == 3)
		{
			var global_up_is_also_jump = global.player4_up_is_also_jump;
			var global_double_tap_to_run = global.player4_double_tap_to_run;
			var global_sprint_toggle = global.player4_sprint_toggle;
			var global_double_tap_to_dive = global.player4_double_tap_to_dive;
			var global_cancel_dive_by_pressing_jump_or_dive_button = global.player4_cancel_dive_by_pressing_jump_or_dive_button;
			var global_cancel_dive_by_pressing_opposite_direction = global.player4_cancel_dive_by_pressing_opposite_direction;
			var global_down_and_jump_to_groundpound = global.player4_down_and_jump_to_groundpound;
			var global_show_controls = global.player4_show_controls;
			var global_drop_from_rope = global.player4_drop_from_rope;
			var global_wall_jump_setting = global.player4_wall_jump_setting;
		}
		draw_menu_checkmark(390, menu_y_up_is_also_jump + menu_y_offset, l10n_text("Up is also jump"), "up_is_also_jump", global_up_is_also_jump);
		draw_menu_checkmark(390, menu_y_double_tap_direction_to_run + menu_y_offset, l10n_text("Double-tap direction to run"), "double_tap_to_run", global_double_tap_to_run);
		draw_menu_checkmark(390, menu_y_always_run + menu_y_offset, l10n_text("Always run"), "always_run", global_sprint_toggle);
		draw_menu_checkmark(390, menu_y_double_tap_direction_to_dive + menu_y_offset, l10n_text("Double-tap direction to dive"), "double_tap_to_dive", global_double_tap_to_dive);
		draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_jump_or_dive_button + menu_y_offset, l10n_text("Cancel dive by pressing the jump or dive key"), "cancel_dive_by_pressing_jump_or_dive_button", global_cancel_dive_by_pressing_jump_or_dive_button);
		draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_opposite_direction + menu_y_offset, l10n_text("Cancel dive by pressing the opposite direction"), "cancel_dive_by_pressing_opposite_direction", global_cancel_dive_by_pressing_opposite_direction);
		draw_menu_checkmark(390, menu_y_down_and_jump_to_groundpound + menu_y_offset, l10n_text("Down + Jump to Ground Pound"), "down_and_jump_to_groundpound", global_down_and_jump_to_groundpound);
		if (global.settings_sidebar_menu == "controller_settings")
		{
			draw_menu_checkmark(390, menu_y_show_prompt_when_changing_controller + menu_y_offset, l10n_text("Show prompt when changing to gamepad"), "show_prompt_when_changing_controller", global.show_prompt_when_changing_to_gamepad);
		}
		else
		{
			draw_menu_checkmark(390, menu_y_show_prompt_when_changing_controller + menu_y_offset, l10n_text("Show prompt when changing to keyboard and mouse"), "show_prompt_when_changing_controller", global.show_prompt_when_changing_to_keyboard_and_mouse);
		}
		draw_menu_checkmark(390, menu_y_always_show_gamepad_buttons + menu_y_offset, l10n_text("Always Show Gamepad Buttons"), "always_show_gamepad_buttons", global.always_show_gamepad_buttons);
		if (global.enable_options_for_pc)
		&& (global.settings_sidebar_menu == "controller_settings")
		{
			draw_menu_dropdown(390, menu_y_chosen_controller_used + menu_y_offset, l10n_text("Chosen Controller Used"), "chosen_controller_used", global.chosen_controller_used, l10n_text("Xbox One"), l10n_text("Xbox Series X/S"), l10n_text("Nintendo Switch"), l10n_text("Playstation 4"), l10n_text("Playstation 5"));
		}
		if (os_type != os_ios)
		&& (os_type != os_android)
		{
			draw_menu_dropdown(390, menu_y_show_controls+ menu_y_offset, l10n_text("Show Controls"), "show_controls", global_show_controls, l10n_text("Never Show"), l10n_text("After 1 Second"), l10n_text("After 2 Seconds"), l10n_text("After 3 Seconds"), l10n_text("After 4 Seconds"), l10n_text("After 5 Seconds"), l10n_text("After 6 Seconds"), l10n_text("After 7 Seconds"), l10n_text("After 8 Seconds"), l10n_text("After 9 Seconds"), l10n_text("Always Show"));
		}
		draw_menu_dropdown(390, menu_y_drop_down_from_rope + menu_y_offset, l10n_text("Drop down from rope"), "drop_from_rope", global_drop_from_rope, l10n_text("Release Jump"), l10n_text("Down or Jump"), l10n_text("Only Down"), l10n_text("Only Jump"), l10n_text("Down + Jump"));
		draw_menu_dropdown(390, menu_y_wall_jump_setting + menu_y_offset, l10n_text("Wall Jump"), "wall_jump_setting", global_wall_jump_setting, l10n_text("Off"), l10n_text("When touching wall"), l10n_text("When holding towards the wall"));
		#endregion /* Controls checkmarks and dropdown menu settings END */
		
		#region /* Menu cursor y position */
		if (menu == "chosen_controller_used")
		{
			menu_cursor_y_position = menu_y_chosen_controller_used + 100;
		}
		if (menu == "show_controls")
		{
			menu_cursor_y_position = menu_y_show_controls + 100;
		}
		if (menu == "drop_from_rope")
		{
			menu_cursor_y_position = menu_y_drop_down_from_rope;
		}
		if (menu == "wall_jump_setting")
		{
			menu_cursor_y_position = menu_y_wall_jump_setting;
		}
		#endregion /* Menu cursor y position END */
		
		/* Have multiple profiles so that for example Joycons upright or on the side can work */
		if (remapping_player == 0)
		{
			var remapping_profile = global.player1_profile;
		}
		else
		if (remapping_player == 1)
		{
			var remapping_profile = global.player2_profile;
		}
		else
		if (remapping_player == 2)
		{
			var remapping_profile = global.player3_profile;
		}
		else
		if (remapping_player == 3)
		{
			var remapping_profile = global.player4_profile;
		}
		draw_menu_dropdown(390, 120 + menu_y_offset, l10n_text("Remap This Profile"), "remap_select_profile", remapping_profile, l10n_text("Profile 1"), l10n_text("Profile 2"), l10n_text("Profile 3"), l10n_text("Profile 4")); /* Remap Select Profile - Which profile do you want to remap the controls for? */
		
		draw_menu_dropdown(390, 50 + menu_y_offset, l10n_text("Remap This Player"), "remap_select_player", remapping_player, l10n_text("Player 1"), l10n_text("Player 2"), l10n_text("Player 3"), l10n_text("Player 4")); /* Remap Select Player - Which player do you want to remap the controls for? */
		
		#region /* Show the player when they can input a gamepad button to remap controls */
		if (input_key)
		{
			draw_set_alpha(0.75);
			draw_rectangle_color(window_get_width() * 0.5 - 300, 12, window_get_width() * 0.5 + 300, 84, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			
			if (remapping_player == 0) /* Text saying input gamepad button now for player 1 */
			{
				scr_draw_text_outlined(window_get_width() * 0.5, 32, l10n_text("INPUT BUTTON NOW FOR PLAYER 1"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			}
			
			else
			
			if (remapping_player == 1) /* Text saying input gamepad button now for player 2 */
			{
				scr_draw_text_outlined(window_get_width() * 0.5, 32, l10n_text("INPUT BUTTON NOW FOR PLAYER 2"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			}
			
			else
			
			if (remapping_player == 2) /* Text saying input gamepad button now for player 3 */
			{
				scr_draw_text_outlined(window_get_width() * 0.5, 32, l10n_text("INPUT BUTTON NOW FOR PLAYER 3"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			}
			
			else
			
			if (remapping_player == 3) /* Text saying input gamepad button now for player 4 */
			{
				scr_draw_text_outlined(window_get_width() * 0.5, 32, l10n_text("INPUT BUTTON NOW FOR PLAYER 4"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			}
			
			scr_draw_text_outlined(window_get_width() * 0.5 - 10, 64, l10n_text("Buttons can be disabled using"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			if (global.controls_used_for_menu_navigation == "controller")
			|| (global.always_show_gamepad_buttons)
			{
				scr_draw_gamepad_buttons(gp_start, window_get_width() * 0.5 + (string_width(l10n_text("Buttons can be disabled using")) * 0.5) - 32, 64, 0.50, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, vk_escape, window_get_width() * 0.5 + (string_width(l10n_text("Buttons can be disabled using")) * 0.5) - 32, 64, 0.50, 0.50, 0, c_white, 1);
			}
		}
		#endregion /* Show the player when they can input a gamepad button to remap controls END */
		
		#region /* Menu Navigation */
		if (menu_joystick_delay <= 0)
		&& (can_navigate)
		{
			
			#region /* Remap Select Player Navigation */
			if (menu == "remap_select_player")
			{
				menu_cursor_y_position = 0;
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					if (global.settings_sidebar_menu == "controller_settings")
					&& (global.enable_options_for_pc)
					{
						menu = "chosen_controller_used"
					}
					else
					if (global.enable_options_for_pc)
					{
						menu = "show_prompt_when_changing_controller";
					}
					else
					{
						menu = "show_controls";
					}
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					if (can_change_profile)
					{
						menu = "remap_select_profile";
					}
					else
					if (remapping_player == 0)
					&& (allow_player1_dive)
					|| (remapping_player == 1)
					&& (allow_player2_dive)
					|| (remapping_player == 2)
					&& (allow_player3_dive)
					|| (remapping_player == 3)
					&& (allow_player4_dive)
					{
						menu = "remap_key_dive";
					}
					else
					{
						menu = "remap_key_jump";
					}
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player > 0)
				{
					remapping_player --;
					if (global.sprite_select_player[remapping_player + 1] == noone)
					{
						character_portrait_for_player_update_directory[remapping_player + 1] = true
						alarm[0] = true;
					}
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player < 3)
				{
					remapping_player ++;
					if (global.sprite_select_player[remapping_player + 1] == noone)
					{
						character_portrait_for_player_update_directory[remapping_player + 1] = true
						alarm[0] = true;
					}
					menu_delay = 3;
				}
			}
			#endregion /* Remap Select Player Navigation END */
			
			else
			
			#region /* Remap Select Profile Navigation */
			if (menu == "remap_select_profile")
			{
				menu_cursor_y_position = 0;
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "remap_select_player";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					if (remapping_player == 0)
					&& (allow_player1_dive)
					|| (remapping_player == 1)
					&& (allow_player2_dive)
					|| (remapping_player == 2)
					&& (allow_player3_dive)
					|| (remapping_player == 3)
					&& (allow_player4_dive)
					{
						menu = "remap_key_dive";
					}
					else
					{
						menu = "remap_key_jump";
					}
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown)
				{
					scr_config_save();
					ini_open(working_directory + "config.ini");
					if (remapping_player == 0)
					&& (global.player1_profile > 0)
					{
						global.player1_profile --;
						if (!ini_section_exists("player1_profile" + string(remapping_profile)))
						{
							scr_set_default_remapping_player1_gamepad(true);
							scr_set_default_remapping_player1_keyboard(true);
						}
					}
					else
					if (remapping_player == 1)
					&& (global.player2_profile > 0)
					{
						global.player2_profile --;
						if (!ini_section_exists("player2_profile" + string(remapping_profile)))
						{
							scr_set_default_remapping_player2_gamepad(true);
							scr_set_default_remapping_player2_keyboard(true);
						}
					}
					else
					if (remapping_player == 2)
					&& (global.player3_profile > 0)
					{
						global.player3_profile --;
						if (!ini_section_exists("player3_profile" + string(remapping_profile)))
						{
							scr_set_default_remapping_player3_gamepad(true);
							scr_set_default_remapping_player3_keyboard(true);
						}
					}
					else
					if (remapping_player == 3)
					&& (global.player4_profile > 0)
					{
						global.player4_profile --;
						if (!ini_section_exists("player4_profile" + string(remapping_profile)))
						{
							scr_set_default_remapping_player4_gamepad(true);
							scr_set_default_remapping_player4_keyboard(true);
						}
					}
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					menu_delay = 3;
					scr_config_load();
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown)
				{
					scr_config_save();
					ini_open(working_directory + "config.ini");
					if (remapping_player == 0)
					&& (global.player1_profile < 3)
					{
						global.player1_profile ++;
						if (!ini_section_exists("player1_profile" + string(remapping_profile)))
						{
							scr_set_default_remapping_player1_gamepad(true);
							scr_set_default_remapping_player1_keyboard(true);
						}
					}
					else
					if (remapping_player == 1)
					&& (global.player2_profile < 3)
					{
						global.player2_profile ++;
						if (!ini_section_exists("player2_profile" + string(remapping_profile)))
						{
							scr_set_default_remapping_player2_gamepad(true);
							scr_set_default_remapping_player2_keyboard(true);
						}
					}
					else
					if (remapping_player == 2)
					&& (global.player3_profile < 3)
					{
						global.player3_profile ++;
						if (!ini_section_exists("player3_profile" + string(remapping_profile)))
						{
							scr_set_default_remapping_player3_gamepad(true);
							scr_set_default_remapping_player3_keyboard(true);
						}
					}
					else
					if (remapping_player == 3)
					&& (global.player4_profile < 3)
					{
						global.player4_profile ++;
						if (!ini_section_exists("player4_profile" + string(remapping_profile)))
						{
							scr_set_default_remapping_player4_gamepad(true);
							scr_set_default_remapping_player4_keyboard(true);
						}
					}
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					menu_delay = 3;
					scr_config_load();
				}
			}
			#endregion /* Remap Select Profile Navigation END */
			
			else
			
			#region /* Up Key is Jump Key Navigation */
			if (menu == "up_is_also_jump")
			{
				menu_cursor_y_position = menu_y_up_is_also_jump;
				if (key_up)
				&& (menu_delay == 0)
				{
					menu = "remap_reset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				{
					menu = "double_tap_to_run";
					menu_delay = 3;
				}
			}
			#endregion /* Up Key is Jump Key Navigation END */
			
			else
			
			#region /* Double Tap To Run Navigation */
			if (menu == "double_tap_to_run")
			{
				menu_cursor_y_position = menu_y_double_tap_direction_to_run;
				if (key_up)
				&& (menu_delay == 0)
				{
					menu = "up_is_also_jump";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				{
					menu = "always_run";
					menu_delay = 3;
				}
			}
			#endregion /* Double Tap To Run Navigation END */
			
			else
			
			#region /* Always Run Navigation */
			if (menu == "always_run")
			{
				menu_cursor_y_position = menu_y_always_run;
				if (key_up)
				&& (menu_delay == 0)
				{
					menu = "double_tap_to_run";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				{
					if (remapping_player == 0)
					&& (allow_player1_dive)
					|| (remapping_player == 1)
					&& (allow_player2_dive)
					|| (remapping_player == 2)
					&& (allow_player3_dive)
					|| (remapping_player == 3)
					&& (allow_player4_dive)
					{
						menu = "double_tap_to_dive";
					}
					else
					{
						menu = "down_and_jump_to_groundpound";
					}
					menu_delay = 3;
				}
			}
			#endregion /* Always Run Navigation END */
			
			else
			
			#region /* Double tap to dive Navigation */
			if (menu == "double_tap_to_dive")
			{
				menu_cursor_y_position = menu_y_double_tap_direction_to_dive;
				if (key_up)
				&& (menu_delay == 0)
				{
					menu = "always_run";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				{
					if (remapping_player == 0)
					&& (allow_player1_dive)
					|| (remapping_player == 1)
					&& (allow_player2_dive)
					|| (remapping_player == 2)
					&& (allow_player3_dive)
					|| (remapping_player == 3)
					&& (allow_player4_dive)
					{
						menu = "cancel_dive_by_pressing_jump_or_dive_button";
					}
					else
					{
						menu = "down_and_jump_to_groundpound";
					}
					menu_delay = 3;
				}
			}
			#endregion /* Double tap to dive Navigation END */
			
			else
			
			#region /* Cancel dive by pressing the jump or dive key Navigation */
			if (menu == "cancel_dive_by_pressing_jump_or_dive_button")
			{
				menu_cursor_y_position = menu_y_cancel_dive_by_pressing_jump_or_dive_button;
				if (key_up)
				&& (menu_delay == 0)
				{
					if (remapping_player == 0)
					&& (allow_player1_dive)
					|| (remapping_player == 1)
					&& (allow_player2_dive)
					|| (remapping_player == 2)
					&& (allow_player3_dive)
					|| (remapping_player == 3)
					&& (allow_player4_dive)
					{
						menu = "double_tap_to_dive";
					}
					else
					{
						menu = "always_run";
					}
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				{
					if (remapping_player == 0)
					&& (allow_player1_dive)
					|| (remapping_player == 1)
					&& (allow_player2_dive)
					|| (remapping_player == 2)
					&& (allow_player3_dive)
					|| (remapping_player == 3)
					&& (allow_player4_dive)
					{
						menu = "cancel_dive_by_pressing_opposite_direction";
					}
					else
					{
						menu = "down_and_jump_to_groundpound";
					}
					menu_delay = 3;
				}
			}
			#endregion /* Cancel dive by pressing the jump or dive key Navigation END */
			
			else
			
			#region /* Cancel dive by pressing the opposite direction Navigation */
			if (menu == "cancel_dive_by_pressing_opposite_direction")
			{
				menu_cursor_y_position = menu_y_cancel_dive_by_pressing_opposite_direction;
				if (key_up)
				&& (menu_delay == 0)
				{
					if (remapping_player == 0)
					&& (allow_player1_dive)
					|| (remapping_player == 1)
					&& (allow_player2_dive)
					|| (remapping_player == 2)
					&& (allow_player3_dive)
					|| (remapping_player == 3)
					&& (allow_player4_dive)
					{
						menu = "cancel_dive_by_pressing_jump_or_dive_button";
					}
					else
					{
						menu = "always_run";
					}
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				{
					menu = "down_and_jump_to_groundpound";
					menu_delay = 3;
				}
			}
			#endregion /* Cancel dive by pressing the opposite direction Navigation END */
			
			else
			
			#region /* Down + Jump to Ground Pound Navigation */
			if (menu == "down_and_jump_to_groundpound")
			{
				menu_cursor_y_position = menu_y_down_and_jump_to_groundpound;
				if (key_up)
				&& (menu_delay == 0)
				{
					if (remapping_player == 0)
					&& (allow_player1_dive)
					|| (remapping_player == 1)
					&& (allow_player2_dive)
					|| (remapping_player == 2)
					&& (allow_player3_dive)
					|| (remapping_player == 3)
					&& (allow_player4_dive)
					{
						menu = "cancel_dive_by_pressing_opposite_direction";
					}
					else
					{
						menu = "always_run";
					}
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				{
					menu = "wall_jump_setting";
					menu_delay = 3;
				}
			}
			#endregion /* Down + Jump to Ground Pound Navigation END */
			
			else
			
			#region /* Navigate Wall Jump Setting */
			if (menu == "wall_jump_setting")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "down_and_jump_to_groundpound";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "drop_from_rope";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 0)
				&& (global.player1_wall_jump_setting> 0)
				{
					global.player1_wall_jump_setting--;
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 0)
				&& (global.player1_wall_jump_setting<2)
				{
					global.player1_wall_jump_setting++;
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 1)
				&& (global.player2_wall_jump_setting> 0)
				{
					global.player2_wall_jump_setting--;
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 1)
				&& (global.player2_wall_jump_setting<2)
				{
					global.player2_wall_jump_setting++;
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 2)
				&& (global.player3_wall_jump_setting> 0)
				{
					global.player3_wall_jump_setting--;
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 2)
				&& (global.player3_wall_jump_setting<2)
				{
					global.player3_wall_jump_setting++;
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 3)
				&& (global.player4_wall_jump_setting> 0)
				{
					global.player4_wall_jump_setting--;
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 3)
				&& (global.player4_wall_jump_setting<2)
				{
					global.player4_wall_jump_setting++;
					menu_delay = 3;
				}
			}
			#endregion /* Navigate Wall Jump Setting END */
			
			else
			
			#region /* Navigate Drop From Rope Setting */
			if (menu == "drop_from_rope")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "wall_jump_setting";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "show_controls";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 0)
				&& (global.player1_drop_from_rope > 0)
				{
					global.player1_drop_from_rope --;
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 0)
				&& (global.player1_drop_from_rope < 4)
				{
					global.player1_drop_from_rope ++;
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 1)
				&& (global.player2_drop_from_rope > 0)
				{
					global.player2_drop_from_rope --;
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 1)
				&& (global.player2_drop_from_rope < 4)
				{
					global.player2_drop_from_rope ++;
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 2)
				&& (global.player3_drop_from_rope > 0)
				{
					global.player3_drop_from_rope --;
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 2)
				&& (global.player3_drop_from_rope < 4)
				{
					global.player3_drop_from_rope ++;
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 3)
				&& (global.player4_drop_from_rope > 0)
				{
					global.player4_drop_from_rope --;
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 3)
				&& (global.player4_drop_from_rope < 4)
				{
					global.player4_drop_from_rope ++;
					menu_delay = 3;
				}
			}
			#endregion /* Navigate Drop From Rope Setting END */
			
			else
			
			#region /* Navigate Show Controls Settings */
			if (menu == "show_controls")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "drop_from_rope";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					if (global.enable_options_for_pc)
					{
						menu = "show_prompt_when_changing_controller";
					}
					else
					{
						menu = "remap_select_player";
					}
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 0)
				&& (global.player1_show_controls> 0)
				{
					global.player1_show_controls --;
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 0)
				&& (global.player1_show_controls< 10)
				{
					global.player1_show_controls++;
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 1)
				&& (global.player2_show_controls> 0)
				{
					global.player2_show_controls --;
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 1)
				&& (global.player2_show_controls< 10)
				{
					global.player2_show_controls++;
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 2)
				&& (global.player3_show_controls> 0)
				{
					global.player3_show_controls --;
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 2)
				&& (global.player3_show_controls< 10)
				{
					global.player3_show_controls++;
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 3)
				&& (global.player4_show_controls> 0)
				{
					global.player4_show_controls --;
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (remapping_player == 3)
				&& (global.player4_show_controls< 10)
				{
					global.player4_show_controls++;
					menu_delay = 3;
				}
			}
			#endregion /* Navigate Show Controls Settings END */
			
			else
			
			#region /* Show prompt when changing controller Navigation */
			if (menu == "show_prompt_when_changing_controller")
			{
				menu_cursor_y_position = menu_y_show_prompt_when_changing_controller;
				if (key_up)
				&& (menu_delay == 0)
				{
					menu = "show_controls";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				{
					if (global.settings_sidebar_menu == "controller_settings")
					&& (global.enable_options_for_pc)
					{
						menu = "always_show_gamepad_buttons";
					}
					else
					{
						menu = "remap_select_player";
					}
					menu_delay = 3;
				}
			}
			#endregion /* Show prompt when changing controller Navigation END */
			
			else
			
			#region /* Always Show Gamepad Buttons Navigation */
			if (menu == "always_show_gamepad_buttons")
			{
				menu_cursor_y_position = menu_y_always_show_gamepad_buttons;
				if (key_up)
				&& (menu_delay == 0)
				{
					if (global.enable_options_for_pc)
					{
						menu = "show_prompt_when_changing_controller"
					}
					else
					{
						menu = "show_controls";
					}
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				{
					if (global.settings_sidebar_menu == "controller_settings")
					&& (global.enable_options_for_pc)
					{
						menu = "chosen_controller_used"
					}
					else
					{
						menu = "remap_select_player";
					}
					menu_delay = 3;
				}
			}
			#endregion /* Always Show Gamepad Buttons Navigation END */
			
			else
			
			#region /* Navigate Chosen Controller Used Settings */
			if (menu == "chosen_controller_used")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					if (global.settings_sidebar_menu == "controller_settings")
					&& (global.enable_options_for_pc)
					{
						menu = "always_show_gamepad_buttons";
					}
					else
					if (global.enable_options_for_pc)
					{
						menu = "show_prompt_when_changing_controller";
					}
					else
					{
						menu = "show_controls";
					}
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "remap_select_player";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (global.chosen_controller_used > 0)
				{
					global.chosen_controller_used --;
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (global.chosen_controller_used < 4)
				{
					global.chosen_controller_used ++;
					menu_delay = 3;
				}
			}
			#endregion /* Navigate Show Controls Settings END */
			
		}
		
		#region /* Accept */
		if (key_a_pressed)
		|| (mouse_check_button_released(mb_left))
		&& (mouse_get_x > 370)
		{
			if (menu == "up_is_also_jump") && (menu_delay == 0){
			if (remapping_player == 0){if (global.player1_up_is_also_jump){global.player1_up_is_also_jump = false;}else{global.player1_up_is_also_jump = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 1){if (global.player2_up_is_also_jump){global.player2_up_is_also_jump = false;}else{global.player2_up_is_also_jump = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 2){if (global.player3_up_is_also_jump){global.player3_up_is_also_jump = false;}else{global.player3_up_is_also_jump = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 3){if (global.player4_up_is_also_jump){global.player4_up_is_also_jump = false;}else{global.player4_up_is_also_jump = true;}
			menu_delay = 3;
			}
			}
			
			if (menu == "double_tap_to_run") && (menu_delay == 0){
			if (remapping_player == 0){if (global.player1_double_tap_to_run){global.player1_double_tap_to_run = false;}else{global.player1_double_tap_to_run = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 1){if (global.player2_double_tap_to_run){global.player2_double_tap_to_run = false;}else{global.player2_double_tap_to_run = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 2){if (global.player3_double_tap_to_run){global.player3_double_tap_to_run = false;}else{global.player3_double_tap_to_run = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 3){if (global.player4_double_tap_to_run){global.player4_double_tap_to_run = false;}else{global.player4_double_tap_to_run = true;}
			menu_delay = 3;
			}
			}
			
			if (menu == "always_run") && (menu_delay == 0){
			if (remapping_player == 0){if (global.player1_sprint_toggle){global.player1_sprint_toggle = false;}else{global.player1_sprint_toggle = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 1){if (global.player2_sprint_toggle){global.player2_sprint_toggle = false;}else{global.player2_sprint_toggle = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 2){if (global.player3_sprint_toggle){global.player3_sprint_toggle = false;}else{global.player3_sprint_toggle = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 3){if (global.player4_sprint_toggle){global.player4_sprint_toggle = false;}else{global.player4_sprint_toggle = true;}
			menu_delay = 3;
			}
			}
			
			if (menu == "double_tap_to_dive") && (menu_delay == 0){
			if (remapping_player == 0){if (global.player1_double_tap_to_dive){global.player1_double_tap_to_dive = false;}else{global.player1_double_tap_to_dive = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 1){if (global.player2_double_tap_to_dive){global.player2_double_tap_to_dive = false;}else{global.player2_double_tap_to_dive = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 2){if (global.player3_double_tap_to_dive){global.player3_double_tap_to_dive = false;}else{global.player3_double_tap_to_dive = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 3){if (global.player4_double_tap_to_dive){global.player4_double_tap_to_dive = false;}else{global.player4_double_tap_to_dive = true;}
			menu_delay = 3;
			}
			}
			
			if (menu == "cancel_dive_by_pressing_jump_or_dive_button") && (menu_delay == 0){
			if (remapping_player == 0){if (global.player1_cancel_dive_by_pressing_jump_or_dive_button){global.player1_cancel_dive_by_pressing_jump_or_dive_button = false;}else{global.player1_cancel_dive_by_pressing_jump_or_dive_button = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 1){if (global.player2_cancel_dive_by_pressing_jump_or_dive_button){global.player2_cancel_dive_by_pressing_jump_or_dive_button = false;}else{global.player2_cancel_dive_by_pressing_jump_or_dive_button = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 2){if (global.player3_cancel_dive_by_pressing_jump_or_dive_button){global.player3_cancel_dive_by_pressing_jump_or_dive_button = false;}else{global.player3_cancel_dive_by_pressing_jump_or_dive_button = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 3){if (global.player4_cancel_dive_by_pressing_jump_or_dive_button){global.player4_cancel_dive_by_pressing_jump_or_dive_button = false;}else{global.player4_cancel_dive_by_pressing_jump_or_dive_button = true;}
			menu_delay = 3;
			}
			}
			
			if (menu == "cancel_dive_by_pressing_opposite_direction") && (menu_delay == 0){
			if (remapping_player == 0){if (global.player1_cancel_dive_by_pressing_opposite_direction){global.player1_cancel_dive_by_pressing_opposite_direction = false;}else{global.player1_cancel_dive_by_pressing_opposite_direction = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 1){if (global.player2_cancel_dive_by_pressing_opposite_direction){global.player2_cancel_dive_by_pressing_opposite_direction = false;}else{global.player2_cancel_dive_by_pressing_opposite_direction = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 2){if (global.player3_cancel_dive_by_pressing_opposite_direction){global.player3_cancel_dive_by_pressing_opposite_direction = false;}else{global.player3_cancel_dive_by_pressing_opposite_direction = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 3){if (global.player4_cancel_dive_by_pressing_opposite_direction){global.player4_cancel_dive_by_pressing_opposite_direction = false;}else{global.player4_cancel_dive_by_pressing_opposite_direction = true;}
			menu_delay = 3;
			}
			}
			
			if (menu == "down_and_jump_to_groundpound") && (menu_delay == 0){
			if (remapping_player == 0){if (global.player1_down_and_jump_to_groundpound){global.player1_down_and_jump_to_groundpound = false;}else{global.player1_down_and_jump_to_groundpound = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 1){if (global.player2_down_and_jump_to_groundpound){global.player2_down_and_jump_to_groundpound = false;}else{global.player2_down_and_jump_to_groundpound = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 2){if (global.player3_down_and_jump_to_groundpound){global.player3_down_and_jump_to_groundpound = false;}else{global.player3_down_and_jump_to_groundpound = true;}
			menu_delay = 3;
			}
			else
			if (remapping_player == 3){if (global.player4_down_and_jump_to_groundpound){global.player4_down_and_jump_to_groundpound = false;}else{global.player4_down_and_jump_to_groundpound = true;}
			menu_delay = 3;
			}
			}
			
			if (menu == "show_prompt_when_changing_controller")
			&& (menu_delay == 0)
			{
				if (global.settings_sidebar_menu == "controller_settings")
				{
					if (global.show_prompt_when_changing_to_gamepad)
					{
						global.show_prompt_when_changing_to_gamepad = false;
					}
					else
					{
						global.show_prompt_when_changing_to_gamepad = true;
					}
				}
				else
				{
					if (global.show_prompt_when_changing_to_keyboard_and_mouse)
					{
						global.show_prompt_when_changing_to_keyboard_and_mouse = false;
					}
					else
					{
						global.show_prompt_when_changing_to_keyboard_and_mouse = true;
					}
				}
				menu_delay = 3;
			}
			
			if (menu == "always_show_gamepad_buttons")
			&& (menu_delay == 0)
			{
				if (global.always_show_gamepad_buttons)
				{
					global.always_show_gamepad_buttons = false;
				}
				else
				{
					global.always_show_gamepad_buttons = true;
				}
				menu_delay = 3;
			}
			
		}
		#endregion /* Accept END */
		
		#endregion /* Menu Navigation END */
		
	}
	#endregion /* Controls Options END */
	
}