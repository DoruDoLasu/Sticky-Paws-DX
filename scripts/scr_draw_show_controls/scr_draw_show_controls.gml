function scr_draw_show_controls(what_player = 1)
{
	var get_window_height = display_get_gui_height();
	
	#region /* Set correct variables for players */
	if (what_player == 1)
	{
		var player_instance = player1;
		var show_player_controls_y = show_player1_controls_y;
		var player_show_controls_alpha = player1_show_controls_alpha;
		var can_spawn_player = can_spawn_player1;
		var player_show_dive_key_x = player1_show_dive_key_x;
		var player_show_jump_key_x = player1_show_jump_key_x;
		var player_show_crouch_key_x = player1_show_crouch_key_x;
		var player_show_sprint_key_x = player1_show_sprint_key_x;
		var player_show_left_key_x = player1_show_left_key_x;
		var player_show_right_key_x = player1_show_right_key_x;
		var player_show_down_key_x = player1_show_down_key_x;
		var player_show_up_key_x = player1_show_up_key_x;
	}
	else
	if (what_player == 2)
	{
		var player_instance = player2;
		var show_player_controls_y = show_player2_controls_y;
		var player_show_controls_alpha = player2_show_controls_alpha;
		var can_spawn_player = can_spawn_player2;
		var player_show_dive_key_x = player2_show_dive_key_x;
		var player_show_jump_key_x = player2_show_jump_key_x;
		var player_show_crouch_key_x = player2_show_crouch_key_x;
		var player_show_sprint_key_x = player2_show_sprint_key_x;
		var player_show_left_key_x = player2_show_left_key_x;
		var player_show_right_key_x = player2_show_right_key_x;
		var player_show_down_key_x = player2_show_down_key_x;
		var player_show_up_key_x = player2_show_up_key_x;
	}
	else
	if (what_player == 3)
	{
		var player_instance = player3;
		var show_player_controls_y = show_player3_controls_y;
		var player_show_controls_alpha = player3_show_controls_alpha;
		var can_spawn_player = can_spawn_player3;
		var player_show_dive_key_x = player3_show_dive_key_x;
		var player_show_jump_key_x = player3_show_jump_key_x;
		var player_show_crouch_key_x = player3_show_crouch_key_x;
		var player_show_sprint_key_x = player3_show_sprint_key_x;
		var player_show_left_key_x = player3_show_left_key_x;
		var player_show_right_key_x = player3_show_right_key_x;
		var player_show_down_key_x = player3_show_down_key_x;
		var player_show_up_key_x = player3_show_up_key_x;
	}
	else
	if (what_player == 4)
	{
		var player_instance = player4;
		var show_player_controls_y = show_player4_controls_y;
		var player_show_controls_alpha = player4_show_controls_alpha;
		var can_spawn_player = can_spawn_player4;
		var player_show_dive_key_x = player4_show_dive_key_x;
		var player_show_jump_key_x = player4_show_jump_key_x;
		var player_show_crouch_key_x = player4_show_crouch_key_x;
		var player_show_sprint_key_x = player4_show_sprint_key_x;
		var player_show_left_key_x = player4_show_left_key_x;
		var player_show_right_key_x = player4_show_right_key_x;
		var player_show_down_key_x = player4_show_down_key_x;
		var player_show_up_key_x = player4_show_up_key_x;
	}
	
	var player_show_controls = global.player1_show_controls;
	var player_color = global.player1_color;
	var player_can_play = global.player1_can_play;
	
	var player_gamepad_button_dive = global.player_[inp.gp][1][1][action.dive];
	var player_gamepad_button2_dive = global.player_[inp.gp][1][2][action.dive];
	var player_key_dive = global.player_[inp.key][what_player][1][action.dive];
	var player_key2_dive = global.player_[inp.key][1][2][action.dive];
	
	var player_gamepad_button_jump = global.player_[inp.gp][1][1][action.jump];
	var player_gamepad_button2_jump = global.player_[inp.gp][1][2][action.jump];
	var player_key_jump = global.player_[inp.key][what_player][1][action.jump];
	var player_key2_jump = global.player_[inp.key][1][2][action.jump];
	
	var player_gamepad_button_accept = global.player_[inp.gp][1][1][action.accept];
	var player_gamepad_button2_accept = global.player_[inp.gp][1][2][action.accept];
	var player_key_accept = global.player_[inp.key][what_player][1][action.accept];
	var player_key2_accept = global.player_[inp.key][1][2][action.accept];
	
	var player_gamepad_button_crouch = global.player_[inp.gp][1][1][action.crouch];
	var player_gamepad_button2_crouch = global.player_[inp.gp][1][2][action.crouch];
	var player_key_crouch = global.player_[inp.key][what_player][1][action.crouch];
	var player_key2_crouch = global.player_[inp.key][1][2][action.crouch];
	
	var player_gamepad_button_crouch_toggle = global.player_[inp.gp][1][1][action.crouch_toggle];
	var player_gamepad_button2_crouch_toggle = global.player_[inp.gp][1][2][action.crouch_toggle];
	var player_key_crouch_toggle = global.player_[inp.key][what_player][1][action.crouch_toggle];
	var player_key2_crouch_toggle = global.player_[inp.key][1][2][action.crouch_toggle];
	
	var player_gamepad_button_sprint = global.player_[inp.gp][1][1][action.sprint];
	var player_gamepad_button2_sprint = global.player_[inp.gp][1][2][action.sprint];
	var player_key_sprint = global.player_[inp.key][what_player][1][action.sprint];
	var player_key2_sprint = global.player_[inp.key][1][2][action.sprint];
	
	var player_sprint_toggle = global.player1_sprint_toggle;
	var player_gamepad_button_sprint_toggle = global.player_[inp.gp][1][1][action.sprint_toggle];
	var player_gamepad_button2_sprint_toggle = global.player_[inp.gp][1][2][action.sprint_toggle];
	var player_key_sprint_toggle = global.player_[inp.key][what_player][1][action.sprint_toggle];
	var player_key2_sprint_toggle = global.player_[inp.key][1][2][action.sprint_toggle];
	
	var player_gamepad_button_left = global.player_[inp.gp][1][1][action.left];
	var player_gamepad_button2_left = global.player_[inp.gp][1][2][action.left];
	var player_key_left = global.player_[inp.key][what_player][1][action.left];
	var player_key2_left = global.player_[inp.key][1][2][action.left];
	
	var player_gamepad_button_right = global.player_[inp.gp][1][1][action.right];
	var player_gamepad_button2_right = global.player_[inp.gp][1][2][action.right];
	var player_key_right = global.player_[inp.key][what_player][1][action.right];
	var player_key2_right = global.player_[inp.key][1][2][action.right];
	
	var player_gamepad_button_down = global.player_[inp.gp][1][1][action.down];
	var player_gamepad_button2_down = global.player_[inp.gp][1][2][action.down];
	var player_key_down = global.player_[inp.key][what_player][1][action.down];
	var player_key2_down = global.player_[inp.key][1][2][action.down];
	
	var player_gamepad_button_up = global.player_[inp.gp][1][1][action.up];
	var player_gamepad_button2_up = global.player_[inp.gp][1][2][action.up];
	var player_key_up = global.player_[inp.key][what_player][1][action.up];
	var player_key2_up = global.player_[inp.key][1][2][action.up];
	#endregion /* Set correct variables for players END */
	
	#region /* Show Controls for Player */
	if (player_instance > 0)
	and (instance_exists(player_instance))
	and (player_instance.partner_character == false)
	and (asset_get_type("obj_player") == asset_object)
	and (instance_exists(obj_player))
	and (player_show_controls >= true)
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		
		#region /* Show Player Dive Key */
		if (gamepad_is_connected(what_player - 1))
		and (global.controls_used_for_menu_navigation == "controller")
		and (player_gamepad_button_dive > noone)
		or (global.always_show_gamepad_buttons == true)
		{
			scr_draw_text_outlined(player_show_dive_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Pounce"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			scr_draw_gamepad_buttons(player_gamepad_button_dive, player_show_dive_key_x, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
		}
		else
		if (gamepad_is_connected(what_player - 1))
		and (global.controls_used_for_menu_navigation == "controller")
		and (player_gamepad_button2_dive > noone)
		or (global.always_show_gamepad_buttons == true)
		{
			scr_draw_text_outlined(player_show_dive_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Pounce"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			scr_draw_gamepad_buttons(player_gamepad_button2_dive, player_show_dive_key_x, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
		}
		else
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		and (player_key_dive > noone)
		{
			scr_draw_text_outlined(player_show_dive_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Pounce"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			draw_sprite_ext(spr_keyboard_keys, player_key_dive, player_show_dive_key_x, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
		}
		else
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		and (player_key2_dive > noone)
		{
			scr_draw_text_outlined(player_show_dive_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Pounce"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			draw_sprite_ext(spr_keyboard_keys, player_key2_dive, player_show_dive_key_x, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
		}
		#endregion /* Show Player Dive Key END */
		
		#region /* Show Player Jump Key */
		if (gamepad_is_connected(what_player - 1))
		and (global.controls_used_for_menu_navigation == "controller")
		and (player_gamepad_button_jump > noone)
		or (global.always_show_gamepad_buttons == true)
		{
			scr_draw_text_outlined(player_show_jump_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Jump"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			scr_draw_gamepad_buttons(player_gamepad_button_jump, player_show_jump_key_x, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
		}
		else
		if (gamepad_is_connected(what_player - 1))
		and (global.controls_used_for_menu_navigation == "controller")
		and (player_gamepad_button2_jump > noone)
		or (global.always_show_gamepad_buttons == true)
		{
			scr_draw_text_outlined(player_show_jump_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Jump"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			scr_draw_gamepad_buttons(player_gamepad_button2_jump, player_show_jump_key_x, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
		}
		else
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		and (player_key_jump > noone)
		{
			scr_draw_text_outlined(player_show_jump_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Jump"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			draw_sprite_ext(spr_keyboard_keys, player_key_jump, player_show_jump_key_x, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
		}
		else
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		and (player_key2_jump > noone)
		{
			scr_draw_text_outlined(player_show_jump_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Jump"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			draw_sprite_ext(spr_keyboard_keys, player_key2_jump, player_show_jump_key_x, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
		}
		#endregion /* Show Player Jump Key END */
		
		#region /* Show Player Crouch Key */
		if (gamepad_is_connected(what_player - 1))
		and (global.controls_used_for_menu_navigation == "controller")
		and (player_gamepad_button_crouch > noone)
		or (global.always_show_gamepad_buttons == true)
		{
			scr_draw_text_outlined(player_show_crouch_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Crouch"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			scr_draw_gamepad_buttons(player_gamepad_button_crouch, player_show_crouch_key_x, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
		}
		else
		if (gamepad_is_connected(what_player - 1))
		and (global.controls_used_for_menu_navigation == "controller")
		and (player_gamepad_button2_crouch > noone)
		or (global.always_show_gamepad_buttons == true)
		{
			scr_draw_text_outlined(player_show_crouch_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Crouch"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			scr_draw_gamepad_buttons(player_gamepad_button2_crouch, player_show_crouch_key_x, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
		}
		else
		if (gamepad_is_connected(what_player - 1))
		and (global.controls_used_for_menu_navigation == "controller")
		and (player_gamepad_button_crouch_toggle > noone)
		or (global.always_show_gamepad_buttons == true)
		{
			scr_draw_text_outlined(player_show_crouch_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Crouch"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			scr_draw_gamepad_buttons(player_gamepad_button_crouch_toggle, player_show_crouch_key_x, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
		}
		else
		if (gamepad_is_connected(what_player - 1))
		and (global.controls_used_for_menu_navigation == "controller")
		and (player_gamepad_button2_crouch_toggle > noone)
		or (global.always_show_gamepad_buttons == true)
		{
			scr_draw_text_outlined(player_show_crouch_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Crouch"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			scr_draw_gamepad_buttons(player_gamepad_button2_crouch_toggle, player_show_crouch_key_x, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
		}
		else
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		and (player_key_crouch > noone)
		{
			scr_draw_text_outlined(player_show_crouch_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Crouch"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			draw_sprite_ext(spr_keyboard_keys, player_key_crouch, player_show_crouch_key_x, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
		}
		else
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		and (player_key2_crouch > noone)
		{
			scr_draw_text_outlined(player_show_crouch_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Crouch"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			draw_sprite_ext(spr_keyboard_keys, player_key2_crouch, player_show_crouch_key_x, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
		}
		else
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		and (player_key_crouch_toggle > noone)
		{
			scr_draw_text_outlined(player_show_crouch_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Crouch"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			draw_sprite_ext(spr_keyboard_keys, player_key_crouch_toggle, player_show_crouch_key_x, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
		}
		else
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		and (player_key2_crouch_toggle > noone)
		{
			scr_draw_text_outlined(player_show_crouch_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Crouch"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			draw_sprite_ext(spr_keyboard_keys, player_key2_crouch_toggle, player_show_crouch_key_x, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
		}
		#endregion /* Show Player Crouch Key END */
		
		#region /* Show Player Sprint Key */
		if (player_sprint_toggle == false)
		{
			if (gamepad_is_connected(what_player - 1))
			and (global.controls_used_for_menu_navigation == "controller")
			and (player_gamepad_button_sprint > noone)
			or (global.always_show_gamepad_buttons == true)
			{
				scr_draw_text_outlined(player_show_sprint_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Sprint"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
				scr_draw_gamepad_buttons(player_gamepad_button_sprint, player_show_sprint_key_x, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(what_player - 1))
			and (global.controls_used_for_menu_navigation == "controller")
			and (player_gamepad_button2_sprint > noone)
			or (global.always_show_gamepad_buttons == true)
			{
				scr_draw_text_outlined(player_show_sprint_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Sprint"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
				scr_draw_gamepad_buttons(player_gamepad_button2_sprint, player_show_sprint_key_x, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(what_player - 1))
			and (global.controls_used_for_menu_navigation == "controller")
			and (player_gamepad_button_sprint_toggle > noone)
			or (global.always_show_gamepad_buttons == true)
			{
				scr_draw_text_outlined(player_show_sprint_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Sprint"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
				scr_draw_gamepad_buttons(player_gamepad_button_sprint_toggle, player_show_sprint_key_x, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(what_player - 1))
			and (global.controls_used_for_menu_navigation == "controller")
			and (player_gamepad_button2_sprint_toggle > noone)
			or (global.always_show_gamepad_buttons == true)
			{
				scr_draw_text_outlined(player_show_sprint_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Sprint"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
				scr_draw_gamepad_buttons(player_gamepad_button2_sprint_toggle, player_show_sprint_key_x, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (player_key_sprint > noone)
			{
				scr_draw_text_outlined(player_show_sprint_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Sprint"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, player_key_sprint, player_show_sprint_key_x, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (player_key2_sprint > noone)
			{
				scr_draw_text_outlined(player_show_sprint_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Sprint"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, player_key2_sprint, player_show_sprint_key_x, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (player_key_sprint_toggle > noone)
			{
				scr_draw_text_outlined(player_show_sprint_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Sprint"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, player_key_sprint_toggle, player_show_sprint_key_x, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (player_key2_sprint_toggle > noone)
			{
				scr_draw_text_outlined(player_show_sprint_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Sprint"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, player_key2_sprint_toggle, player_show_sprint_key_x, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
			}
		}
		#endregion /* Show Player Sprint Key END */
		
		#region /* Show Player Left Key */
		if (gamepad_is_connected(what_player - 1))
		and (global.controls_used_for_menu_navigation == "controller")
		and (player_gamepad_button_left > noone)
		or (global.always_show_gamepad_buttons == true)
		{
			scr_draw_text_outlined(player_show_left_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Left"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			scr_draw_gamepad_buttons(player_gamepad_button_left, player_show_left_key_x, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
		}
		else
		if (gamepad_is_connected(what_player - 1))
		and (global.controls_used_for_menu_navigation == "controller")
		and (player_gamepad_button2_left > noone)
		or (global.always_show_gamepad_buttons == true)
		{
			scr_draw_text_outlined(player_show_left_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Left"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			scr_draw_gamepad_buttons(player_gamepad_button2_left, player_show_left_key_x, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
		}
		else
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		and (player_key_left > noone)
		{
			scr_draw_text_outlined(player_show_left_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Left"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			draw_sprite_ext(spr_keyboard_keys, player_key_left, player_show_left_key_x, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
		}
		else
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		and (player_key2_left > noone)
		{
			scr_draw_text_outlined(player_show_left_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Left"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			draw_sprite_ext(spr_keyboard_keys, player_key2_left, player_show_left_key_x, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
		}
		#endregion /* Show Player Left Key END */
		
		#region /* Show Player Right Key */
		if (gamepad_is_connected(what_player - 1))
		and (global.controls_used_for_menu_navigation == "controller")
		and (player_gamepad_button_right > noone)
		or (global.always_show_gamepad_buttons == true)
		{
			scr_draw_text_outlined(player_show_right_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Right"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			scr_draw_gamepad_buttons(player_gamepad_button_right, player_show_right_key_x, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
		}
		else
		if (gamepad_is_connected(what_player - 1))
		and (global.controls_used_for_menu_navigation == "controller")
		and (player_gamepad_button2_right > noone)
		or (global.always_show_gamepad_buttons == true)
		{
			scr_draw_text_outlined(player_show_right_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Right"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			scr_draw_gamepad_buttons(player_gamepad_button2_right, player_show_right_key_x, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
		}
		else
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		and (player_key_right > noone)
		{
			scr_draw_text_outlined(player_show_right_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Right"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			draw_sprite_ext(spr_keyboard_keys, player_key_right, player_show_right_key_x, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
		}
		else
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		and (player_key2_right > noone)
		{
			scr_draw_text_outlined(player_show_right_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Right"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			draw_sprite_ext(spr_keyboard_keys, player_key2_right, player_show_right_key_x, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
		}
		#endregion /* Show Player Right Key END */
		
		#region /* Show Player Down Key */
		if (gamepad_is_connected(what_player - 1))
		and (global.controls_used_for_menu_navigation == "controller")
		and (player_gamepad_button_down > noone)
		or (global.always_show_gamepad_buttons == true)
		{
			scr_draw_text_outlined(player_show_down_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Down"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			scr_draw_gamepad_buttons(player_gamepad_button_down, player_show_down_key_x, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
		}
		else
		if (gamepad_is_connected(what_player - 1))
		and (global.controls_used_for_menu_navigation == "controller")
		and (player_gamepad_button2_down > noone)
		or (global.always_show_gamepad_buttons == true)
		{
			scr_draw_text_outlined(player_show_down_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Down"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			scr_draw_gamepad_buttons(player_gamepad_button2_down, player_show_down_key_x, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
		}
		else
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		and (player_key_down > noone)
		{
			scr_draw_text_outlined(player_show_down_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Down"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			draw_sprite_ext(spr_keyboard_keys, player_key_down, player_show_down_key_x, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
		}
		else
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		and (player_key2_down > noone)
		{
			scr_draw_text_outlined(player_show_down_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Down"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			draw_sprite_ext(spr_keyboard_keys, player_key2_down, player_show_down_key_x, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
		}
		#endregion /* Show Player Down Key END */
		
		#region /* Show Player Up Key */
		if (gamepad_is_connected(what_player - 1))
		and (global.controls_used_for_menu_navigation == "controller")
		and (player_gamepad_button_up > noone)
		or (global.always_show_gamepad_buttons == true)
		{
			scr_draw_text_outlined(player_show_up_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Up"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			scr_draw_gamepad_buttons(player_gamepad_button_up, player_show_up_key_x, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
		}
		else
		if (gamepad_is_connected(what_player - 1))
		and (global.controls_used_for_menu_navigation == "controller")
		and (player_gamepad_button2_up > noone)
		or (global.always_show_gamepad_buttons == true)
		{
			scr_draw_text_outlined(player_show_up_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Up"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			scr_draw_gamepad_buttons(player_gamepad_button2_up, player_show_up_key_x, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
		}
		else
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		and (player_key_up > noone)
		{
			scr_draw_text_outlined(player_show_up_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Up"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			draw_sprite_ext(spr_keyboard_keys, player_key_up, player_show_up_key_x, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
		}
		else
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		and (player_key2_up > noone)
		{
			scr_draw_text_outlined(player_show_up_key_x + 22, get_window_height - show_player_controls_y, l10n_text("Up"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			draw_sprite_ext(spr_keyboard_keys, player_key2_up, player_show_up_key_x, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
		}
		#endregion /* Show Player Down Key END */
		
	}
	else
	if (player_instance <= 0)
	and (asset_get_type("obj_player") == asset_object)
	and (instance_exists(obj_player))
	and (player_can_play == true)
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		
		#region /* Show Player Join Game Key */
		if (can_spawn_player == true)
		and (lives > 0)
		and (player_show_controls >= 1)
		{
			scr_draw_text_outlined(30, get_window_height - show_player_controls_y, l10n_text("Join Game"), global.default_text_size, c_black, player_color, player_show_controls_alpha);
			
			if (gamepad_is_connected(what_player - 1))
			and (global.controls_used_for_menu_navigation == "controller")
			or (global.always_show_gamepad_buttons == true)
			{
				if (player_gamepad_button_accept > noone)
				{
					scr_draw_gamepad_buttons(player_gamepad_button_accept, 252, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
				}
				else
				if (player_gamepad_button2_accept > noone)
				{
					scr_draw_gamepad_buttons(player_gamepad_button2_accept, 252, get_window_height - show_player_controls_y, 0.5, c_white, player_show_controls_alpha);
				}
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (player_key_accept > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, player_key_accept, 252, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (player_key2_accept > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, player_key2_accept, 252, get_window_height - show_player_controls_y, 0.5, 0.5, 0, c_white, player_show_controls_alpha);
			}
		}
		#endregion /* Show Player Join Game Key END */
		
	}
	#endregion /* Show Controls for Player END */
	
}