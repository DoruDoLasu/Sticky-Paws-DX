function scr_character_select_menu_draw()
{
	/* Player 1 Key Accept Pressed */ player1_key_a_pressed = (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][1][action.accept])) || (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][2][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][1][1][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][1][2][action.accept])) || (keyboard_check_pressed(vk_space));
	/* Player 1 Key Back Pressed */ player1_key_b_pressed = (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][1][action.back])) || (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][2][action.back])) || (keyboard_check_pressed(global.player_[inp.key][1][1][action.back])) || (keyboard_check_pressed(global.player_[inp.key][1][2][action.back])) || (keyboard_check_pressed(vk_escape));
	/* Player 2 Key Accept Pressed */ player2_key_a_pressed = (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][1][action.accept])) || (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][2][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][2][1][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][2][2][action.accept]));
	/* Player 2 Key Back Pressed */ player2_key_b_pressed = (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][1][action.back])) || (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][2][action.back])) || (keyboard_check_pressed(global.player_[inp.key][2][1][action.back])) || (keyboard_check_pressed(global.player_[inp.key][2][2][action.back]));
	/* Player 3 Key Accept Pressed */ player3_key_a_pressed = (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][1][action.accept])) || (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][2][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][3][1][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][3][2][action.accept]));
	/* Player 3 Key Back Pressed */ player3_key_b_pressed = (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][1][action.back])) || (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][2][action.back])) || (keyboard_check_pressed(global.player_[inp.key][3][1][action.back])) || (keyboard_check_pressed(global.player_[inp.key][3][2][action.back]));
	/* Player 4 Key Accept Pressed */ player4_key_a_pressed = (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][1][action.accept])) || (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][2][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][4][1][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][4][2][action.accept]));
	/* Player 4 Key Back Pressed */ player4_key_b_pressed = (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][1][action.back])) || (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][2][action.back])) || (keyboard_check_pressed(global.player_[inp.key][4][1][action.back])) || (keyboard_check_pressed(global.player_[inp.key][4][2][action.back]));
	
	arrow_offset = 125;
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var window_width_half = get_window_width * 0.5;
	var window_height_half = get_window_height * 0.5;
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	if (menu == "select_character")
	|| (menu == "back_from_character_select")
	|| (menu == "manage_character")
	|| (menu == "search_character_id")
	|| (menu == "input_name_ok")
	|| (menu == "input_name_cancel")
	{
		
		#region /* Player positions and scale for each character display */
		player_display_x[1] = -465;
		player_display_x[2] = -155;
		player_display_x[3] = +155;
		player_display_x[4] = +465;
		player1_scale = 0.85;
		player2_scale = 0.85;
		player3_scale = 0.85;
		player4_scale = 0.85;
		#endregion /* Player positions and scale for each character display END */
		
		#region /* Give feedback that you have selected a character, run this before the character portrait code */
		if (player1_accept_selection)
		{
			draw_sprite_ext(spr_select_character_background, image_index, get_window_width * 0.5 + player_display_x[1], get_window_height * 0.5, player1_scale, player1_scale, 0, global.player1_color, 1);
		}
		if (player2_accept_selection)
		{
			draw_sprite_ext(spr_select_character_background, image_index, get_window_width * 0.5 + player_display_x[2], get_window_height * 0.5, player2_scale, player2_scale, 0, global.player2_color, 1);
		}
		if (player3_accept_selection)
		{
			draw_sprite_ext(spr_select_character_background, image_index, get_window_width * 0.5 + player_display_x[3], get_window_height * 0.5, player3_scale, player3_scale, 0, global.player3_color, 1);
		}
		if (player4_accept_selection)
		{
			draw_sprite_ext(spr_select_character_background, image_index, get_window_width * 0.5 + player_display_x[4], get_window_height * 0.5, player4_scale, player4_scale, 0, global.player4_color, 1);
		}
		#endregion /* Give feedback that you have selected a character, run this before the character portrait code END */
		
		#region /* Display Selected Characters, run this before the "play the game" text code */
		if (global.playergame >= 0)
		|| (global.skip_how_many_people_are_playing_screen)
		{
			scr_character_portrait_for_player_draw(1);
		}
		if (global.playergame >= 1)
		|| (global.skip_how_many_people_are_playing_screen)
		{
			scr_character_portrait_for_player_draw(2);
		}
		if (global.playergame >= 2)
		|| (global.skip_how_many_people_are_playing_screen)
		{
			scr_character_portrait_for_player_draw(3);
		}
		if (global.playergame >= 3)
		|| (global.skip_how_many_people_are_playing_screen)
		{
			scr_character_portrait_for_player_draw(4);
		}
		#endregion /* Display Selected Characters, run this before the "play the game" text code END */
		
		#region /* Play the game text */
		
		#region /* Draw Play the game text */
		if (play_the_game_text_y_lerp > -70) /* Only draw if it's within view */
		&& (play_the_game_text_y_lerp < display_get_gui_height() + 70)
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, play_the_game_text_y_lerp - 32, get_window_width, play_the_game_text_y_lerp + 32))
			&& (global.controls_used_for_menu_navigation == "mouse")
			{
				draw_rectangle_color(0, play_the_game_text_y_lerp - 32 - 4, get_window_width, play_the_game_text_y_lerp + 32 + 4, c_red, c_yellow, c_yellow, c_red, false);
			}
			draw_rectangle_color(0, play_the_game_text_y_lerp - 32, get_window_width, play_the_game_text_y_lerp + 32, c_black, c_black, c_black, c_black, false);
			scr_draw_text_outlined(get_window_width * 0.5 -40, play_the_game_text_y_lerp, l10n_text("Play the game!"), global.default_text_size * 2, c_black, c_white, 1);
			
			if (player1_accept_selection)
			&& (player2_accept_selection != 0)
			&& (player3_accept_selection != 0)
			&& (player4_accept_selection != 0)
			{
				draw_set_alpha(0.9);
				draw_rectangle_color(get_window_width * 0.5 - (string_width(l10n_text("Player 1 starts the game")) * 0.5), play_the_game_text_y_lerp + 32, get_window_width * 0.5 + (string_width(l10n_text("Player 1 starts the game")) * 0.5), play_the_game_text_y_lerp + 64, c_black, c_black, c_black, c_black, false);
				draw_set_alpha(1);
				scr_draw_text_outlined(get_window_width * 0.5, play_the_game_text_y_lerp + 45, l10n_text("Player 1 starts the game"), global.default_text_size, c_black, global.player1_color, 1);
				
				#region /* Show Key A on screen */
				if (gamepad_is_connected(global.player1_slot))
				&& (global.controls_used_for_menu_navigation == "controller")
				|| (global.always_show_gamepad_buttons)
				{
					scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.accept], get_window_width * 0.5 + (string_width(l10n_text("Play the game!")) * 0.5) + 64, play_the_game_text_y_lerp, 0.5, c_white, 1);
				}
				else
				{
					if (global.player_[inp.key][1][1][action.accept] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][1][action.accept], get_window_width * 0.5 + (string_width(l10n_text("Play the game!")) * 0.5) + 64, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player_[inp.key][1][2][action.accept] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][2][action.accept], get_window_width * 0.5 + (string_width(l10n_text("Play the game!")) * 0.5) + 64, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + (string_width(l10n_text("Play the game!")) * 0.5) + 64, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
				}
				#endregion /* Show Key A on screen END */
				
			}
			else
			if (player1_accept_selection != 0)
			&& (player2_accept_selection)
			&& (player3_accept_selection != 0)
			&& (player4_accept_selection != 0)
			{
				scr_draw_text_outlined(get_window_width * 0.5, play_the_game_text_y_lerp + 45, l10n_text("Player 2 starts the game"), global.default_text_size, c_black, global.player2_color, 1);
				
				#region /* Show Key A on screen */
				if (gamepad_is_connected(global.player2_slot))
				{
					scr_draw_gamepad_buttons(global.player_[inp.gp][2][1][action.accept], get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, c_white, 1);
				}
				else
				{
					if (global.player_[inp.key][2][1][action.accept] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][1][action.accept], get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player_[inp.key][2][2][action.accept] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][2][action.accept], get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
				}
				#endregion /* Show Key A on screen END */
				
			}
			else
			if (player1_accept_selection != 0)
			&& (player2_accept_selection != 0)
			&& (player3_accept_selection)
			&& (player4_accept_selection != 0)
			{
				scr_draw_text_outlined(get_window_width * 0.5, play_the_game_text_y_lerp + 45, l10n_text("Player 3 starts the game"), global.default_text_size, c_black, global.player3_color, 1);
				
				#region /* Show Key A on screen */
				if (gamepad_is_connected(global.player3_slot))
				{
					scr_draw_gamepad_buttons(global.player_[inp.gp][3][1][action.accept], get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, c_white, 1);
				}
				else
				{
					if (global.player_[inp.key][3][1][action.accept] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][1][action.accept], get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player_[inp.key][3][2][action.accept] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][2][action.accept], get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
				}
				#endregion /* Show Key A on screen END */
				
			}
			else
			if (player1_accept_selection != 0)
			&& (player2_accept_selection != 0)
			&& (player3_accept_selection != 0)
			&& (player4_accept_selection)
			{
				scr_draw_text_outlined(get_window_width * 0.5, play_the_game_text_y_lerp + 45, l10n_text("Player 4 starts the game"), global.default_text_size, c_black, global.player4_color, 1);
				
				#region /* Show Key A on screen */
				if (gamepad_is_connected(global.player4_slot))
				{
					scr_draw_gamepad_buttons(global.player_[inp.gp][4][1][action.accept], get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, c_white, 1);
				}
				else
				{
					if (global.player_[inp.key][4][1][action.accept] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][1][action.accept], get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player_[inp.key][4][2][action.accept] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][2][action.accept], get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
				}
				#endregion /* Show Key A on screen END */
				
			}
		}
		#endregion /* Draw Play the game text END */
		
		#endregion /* Play the game text END */
		
		xx[1] = lerp(xx[1], player_display_x[1], 0.1);
		xx[2] = lerp(xx[2], player_display_x[2], 0.1);
		xx[3] = lerp(xx[3], player_display_x[3], 0.1);
		xx[4] = lerp(xx[4], player_display_x[4], 0.1);
		
		#region /* All code before menu navigation code */
		
		#region /* Select your character text */
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (get_window_width <= 1350)
		{
			scr_draw_text_outlined(get_window_width * 0.5 + 128, 70, l10n_text("Select your character!"), global.default_text_size * 2, c_black, c_white, 1);
		}
		else
		{
			scr_draw_text_outlined(get_window_width * 0.5, 70, l10n_text("Select your character!"), global.default_text_size * 2, c_black, c_white, 1);
		}
		#endregion /* Select your character text END */
		
		var back_y = 0;
		var manage_characters_y = 42;
		if (global.enable_manage_characters)
		{
			var draw_search_id_y = 42 * 2;
		}
		else
		{
			var draw_search_id_y = 42 * 1;
		}
		
		#region /* Show Back key when you can go back to main menu */
		if (global.character_select_in_this_menu == "main_game")
		{
			draw_menu_button(-32, back_y, l10n_text("Back"), "back_from_character_select", "main_game");
		}
		else
		{
			draw_menu_button(-32, back_y, l10n_text("Back"), "back_from_character_select", "level_editor");
		}
		draw_sprite_ext(spr_icons_back, 0, + 20, + 21, 1, 1, 0, c_white, 1);
		#endregion /* Show Back key when you can go back to main menu END */
		
		#region /* Manage Characters */
		if (global.enable_manage_characters)
		{
			draw_menu_button(-32, manage_characters_y, l10n_text("Manage Characters"), "manage_character", "click_copy_character");
			if (key_a_pressed)
			&& (menu == "manage_character")
			{
				menu = "click_copy_character";
				menu_delay = 3;
			}
		}
		#endregion /* Manage Characters END */
		
		#region /* Search Character ID Button */
		draw_menu_button(-32, draw_search_id_y, l10n_text("Search Character ID"), "search_character_id", "search_character_id");
		
		#region /* Draw Search Key */
		if (gamepad_is_connected(global.player1_slot))
		&& (global.controls_used_for_menu_navigation == "controller")
		|| (global.always_show_gamepad_buttons)
		{
			scr_draw_gamepad_buttons(gp_face4, 16, draw_search_id_y + 21, 0.5, c_white, 1);
		}
		#endregion /* Draw Search key END */
		
		if (can_input_player1_name == false)
		&& (can_input_player2_name == false)
		&& (can_input_player3_name == false)
		&& (can_input_player4_name == false)
		&& (menu_delay == 0)
		&& (open_sub_menu == false)
		{
			if (menu == "search_character_id")
			&& (key_a_pressed)
			|| (gamepad_button_check_pressed(global.player1_slot, gp_face4))
			|| (gamepad_button_check_pressed(global.player2_slot, gp_face4))
			|| (gamepad_button_check_pressed(global.player3_slot, gp_face4))
			|| (gamepad_button_check_pressed(global.player4_slot, gp_face4))
			|| (gamepad_button_check_pressed(4, gp_face4))
			|| (point_in_rectangle(mouse_get_x, mouse_get_y, 0, draw_search_id_y + 2, 370, draw_search_id_y + 41))
			&& (mouse_check_button_released(mb_left))
			{
				keyboard_string = "";
				search_id = "";
				content_type = "character";
				menu = "search_id_ok";
				select_custom_level_menu_open = false;
				menu_delay = 3;
			}
		}
		if (menu == "search_level_id")
		&& (key_up)
		&& (menu_delay == 0)
		&& (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			can_navigate = true;
			select_custom_level_menu_open = true;
			menu = "online_level_list";
			lerp_on = true;
		}
		if (menu == "search_level_id")
		&& (key_down)
		&& (menu_delay == 0)
		&& (menu_joystick_delay <= 0)
		&& (show_level_editor_corner_menu)
		{
			menu_delay = 3;
			can_navigate = true;
			select_custom_level_menu_open = true;
			menu = "level_editor_play";
			scroll_to = floor(global.select_level_index / row);
			lerp_on = true;
		}
		if (menu == "search_level_id")
		{
			open_sub_menu = false;
			show_level_editor_corner_menu = true;
			scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
		}
		#endregion /* Search Character ID Button END */
		
		#endregion /* All code before menu navigation code END */
		
		#region /* If players haven't joined the game */
		if (can_input_player1_name == false)
		&& (can_input_player2_name == false)
		&& (can_input_player3_name == false)
		&& (can_input_player4_name == false)
		{
			
			#region /* Player 1 Join Text */
			if (player1_accept_selection <= -1 && !player1_automatically_join)
			{
				var player_join_x = window_width_half + player_display_x[1];
				var player_join_y = window_height_half;
				draw_set_halign(fa_right);
				if (point_in_rectangle(mouse_get_x, mouse_get_y, player_join_x - 150, player_join_y - 32, player_join_x + 150, player_join_y + 32) && global.controls_used_for_menu_navigation == "mouse")
				{
					player_menu[1] = "select_character";
					menu = "select_character";
					draw_set_alpha(0.5);
					draw_rectangle_color(player_join_x - 150, player_join_y - 32, player_join_x + 150, player_join_y + 32, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(1);
					var player_join_outline_color = c_white;
				}
				else
				{
					var player_join_outline_color = c_black;
				}
				scr_draw_text_outlined(player_join_x + 60, player_join_y, l10n_text("Player 1 Join"), global.default_text_size, player_join_outline_color, global.player1_color, 1);
				
				#region /* Key A */
				var controls_used_for_navigation = global.controls_used_for_menu_navigation;
				var player1_key_accept_1 = global.player_[inp.key][1][1][action.accept];
				var player1_key_accept_2 = global.player_[inp.key][1][2][action.accept];
				if ((menu == "select_character" && controls_used_for_navigation != "mouse") || controls_used_for_navigation == "mouse")
				{
					if (gamepad_is_connected(global.player1_slot) && (controls_used_for_navigation == "controller" || global.always_show_gamepad_buttons))
					{
						scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.accept], player_join_x + 90, player_join_y, 0.5, c_white, 1);
					}
					else
					{
						var keyboard_sprite_index = 0;
						if (player1_key_accept_1 > noone)
						{
							keyboard_sprite_index = player1_key_accept_1;
						}
						else if (player1_key_accept_2 > noone)
						{
							keyboard_sprite_index = player1_key_accept_2;
						}
						if (keyboard_sprite_index > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, keyboard_sprite_index, player_join_x + 90, player_join_y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, player_join_x + 90, player_join_y, 0.5, 0.5, 0, c_white, 1);
						}
					}
				}
				#endregion /* Key A END */
				
			}
			#endregion /* Player 1 Join Text END */
			
			#region /* Player 2 Join Text */
			if (player2_accept_selection <= -1 && !player2_automatically_join && (global.playergame >= 1 || global.skip_how_many_people_are_playing_screen))
			{
				var player_join_x = window_width_half + player_display_x[2];
				var player_join_y = window_height_half + 32;
				draw_set_halign(fa_right);
				if (point_in_rectangle(mouse_get_x, mouse_get_y, player_join_x - 150, player_join_y - 32, player_join_x + 150, player_join_y + 32) && global.controls_used_for_menu_navigation == "mouse")
				{
					player_menu[2] = "select_character";
					menu = "select_character";
					draw_set_alpha(0.5);
					draw_rectangle_color(player_join_x - 150, player_join_y - 32, player_join_x + 150, player_join_y + 32, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(1);
					var player_join_outline_color = c_white;
				}
				else
				{
					var player_join_outline_color = c_black;
				}
				scr_draw_text_outlined(player_join_x + 60, player_join_y, l10n_text("Player 2 Join"), global.default_text_size, player_join_outline_color, global.player2_color, 1);
				
				#region /* Key A */
				var controls_used_for_navigation = global.controls_used_for_menu_navigation;
				var player2_key_accept_1 = global.player_[inp.key][2][1][action.accept];
				var player2_key_accept_2 = global.player_[inp.key][2][2][action.accept];
				if (gamepad_is_connected(global.player2_slot) || global.always_show_gamepad_buttons)
				{
					scr_draw_gamepad_buttons(global.player_[inp.gp][2][1][action.accept], player_join_x + 90, player_join_y, 0.5, c_white, 1);
				}
				else
				{
					var keyboard_sprite_index = 0;
					if (player2_key_accept_1 > noone)
					{
						keyboard_sprite_index = player2_key_accept_1;
					}
					else if (player2_key_accept_2 > noone)
					{
						keyboard_sprite_index = player2_key_accept_2;
					}
					if (keyboard_sprite_index > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, keyboard_sprite_index, player_join_x + 90, player_join_y, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, player_join_x + 90, player_join_y, 0.5, 0.5, 0, c_white, 1);
					}
				}
				#endregion /* Key A END */
				
			}
			#endregion /* Player 2 Join Text END */
			
			#region /* Player 3 Join Text */
			if (player3_accept_selection <= -1 && !player3_automatically_join && (global.playergame >= 2 || global.skip_how_many_people_are_playing_screen))
			{
				var player_join_x = window_width_half + player_display_x[3];
				var player_join_y = window_height_half;
				draw_set_halign(fa_right);
				if (point_in_rectangle(mouse_get_x, mouse_get_y, player_join_x - 150, player_join_y - 32, player_join_x + 150, player_join_y + 32) && global.controls_used_for_menu_navigation == "mouse")
				{
					player_menu[3] = "select_character";
					menu = "select_character";
					draw_set_alpha(0.5);
					draw_rectangle_color(player_join_x - 150, player_join_y - 32, player_join_x + 150, player_join_y + 32, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(1);
					var player_join_outline_color = c_white;
				}
				else
				{
					var player_join_outline_color = c_black;
				}
				scr_draw_text_outlined(player_join_x + 60, player_join_y, l10n_text("Player 3 Join"), global.default_text_size, player_join_outline_color, global.player3_color, 1);
				
				#region /* Key A */
				var controls_used_for_navigation = global.controls_used_for_menu_navigation;
				var player3_key_accept_1 = global.player_[inp.key][3][1][action.accept];
				var player3_key_accept_2 = global.player_[inp.key][3][2][action.accept];
				if (gamepad_is_connected(global.player3_slot) || global.always_show_gamepad_buttons)
				{
					scr_draw_gamepad_buttons(global.player_[inp.gp][3][1][action.accept], player_join_x + 90, player_join_y, 0.5, c_white, 1);
				}
				else
				{
					var keyboard_sprite_index = 0;
					if (player3_key_accept_1 > noone)
					{
						keyboard_sprite_index = player3_key_accept_1;
					}
					else if (player3_key_accept_2 > noone)
					{
						keyboard_sprite_index = player3_key_accept_2;
					}
					if (keyboard_sprite_index > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, keyboard_sprite_index, player_join_x + 90, player_join_y, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, player_join_x + 90, player_join_y, 0.5, 0.5, 0, c_white, 1);
					}
				}
				#endregion /* Key A END */
				
			}
			#endregion /* Player 3 Join Text END */
			
			#region /* Player 4 Join Text */
			if (player4_accept_selection <= -1 && !player4_automatically_join && (global.playergame >= 3 || global.skip_how_many_people_are_playing_screen))
			{
				var player_join_x = window_width_half + player_display_x[4];
				var player_join_y = window_height_half + 32;
				draw_set_halign(fa_right);
				if (point_in_rectangle(mouse_get_x, mouse_get_y, player_join_x - 150, player_join_y - 32, player_join_x + 150, player_join_y + 32) && global.controls_used_for_menu_navigation == "mouse")
				{
					player_menu[4] = "select_character";
					menu = "select_character";
					draw_set_alpha(0.5);
					draw_rectangle_color(player_join_x - 150, player_join_y - 32, player_join_x + 150, player_join_y + 32, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(1);
					var player_join_outline_color = c_white;
				}
				else
				{
					var player_join_outline_color = c_black;
				}
				scr_draw_text_outlined(player_join_x + 60, player_join_y, l10n_text("Player 4 Join"), global.default_text_size, player_join_outline_color, global.player4_color, 1);
				
				#region /* Key A */
				var controls_used_for_navigation = global.controls_used_for_menu_navigation;
				var player4_key_accept_1 = global.player_[inp.key][4][1][action.accept];
				var player4_key_accept_2 = global.player_[inp.key][4][2][action.accept];
				if (gamepad_is_connected(global.player4_slot) || global.always_show_gamepad_buttons)
				{
					scr_draw_gamepad_buttons(global.player_[inp.gp][4][1][action.accept], player_join_x + 90, player_join_y, 0.5, c_white, 1);
				}
				else
				{
					var keyboard_sprite_index = 0;
					if (player4_key_accept_1 > noone)
					{
						keyboard_sprite_index = player4_key_accept_1;
					}
					else if (player4_key_accept_2 > noone)
					{
						keyboard_sprite_index = player4_key_accept_2;
					}
					if (keyboard_sprite_index > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, keyboard_sprite_index, player_join_x + 90, player_join_y, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, player_join_x + 90, player_join_y, 0.5, 0.5, 0, c_white, 1);
					}
				}
				#endregion /* Key A END */
				
			}
			#endregion /* Player 4 Join Text END */
			
		}
		#endregion /* If players haven't joined the game END */
		
	}
	else
	
	#region /* Draw Manage Characters Menu */
	{
		scr_character_manage_menu_draw();
	}
	#endregion /* Draw Manage Characters Menu END */
	
}