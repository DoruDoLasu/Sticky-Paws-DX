///scr_character_select_menu()
function scr_character_select_menu()
{
	var voice=noone;
	
	if (menu = "select_character")
	or (menu = "back_from_character_select")
	{
		image_alpha=0;
		
	xx1=lerp(xx1,player1_display_x,0.1);
	xx2=lerp(xx2,player2_display_x,0.1);
	xx3=lerp(xx3,player3_display_x,0.1);
	xx4=lerp(xx4,player4_display_x,0.1);
	play_the_game_text_y = 200;
	
	#region /*All code before menu navigation code*/
	
	#region /*Select your character text*/
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_outlined(window_get_width()/2,70,"Select your character!",global.default_text_size*2,c_black,c_white,1);
	#endregion /*Select your character text END*/

	#region /*Show Back key when you can go back to main menu*/
	if (global.character_select_in_this_menu = "game")
	{
		draw_menu_button(0,0,"Back","back_from_character_select","main_game");
	}
	else
	{
		draw_menu_button(0,0,"Back","back_from_character_select","leveleditor");
	}
	if (player1_menu = "back_from_character_select")
	{
		if (global.controls_used_for_menu_navigation="keyboard")
		or (global.controls_used_for_menu_navigation="controller")
		{
			draw_sprite_ext(spr_menu_cursor,menu_cursor_index,400,20,1,1,180,c_white,1);
		}
		
		if (keyboard_check_pressed(global.player1_key_down))
		and (!keyboard_check_pressed(global.player1_key_up))
		or (gamepad_button_check_pressed(0,gp_padd))
		and (!gamepad_button_check_pressed(0,gp_padu))
		or (gamepad_axis_value(0,gp_axislv)>0)
		and (menu_joystick1_delay <= 0)
		or (global.controls_used_for_menu_navigation = "mouse")
		{
			if (menu_delay = 0)
			{
				menu_delay = 3;
				player1_menu = "select_character";
				menu = "select_character";
			}
		}
	}
	#endregion /*Show Back key when you can go back to main menu END*/
	
	#region /*Positions and Scale for each character display*/
	
	#region /*Player positions and scale for each character display*/
	player1_display_x = -465;
	player2_display_x = -155;
	player3_display_x = +155;
	player4_display_x = +465;
	player1_scale = 0.85;
	player2_scale = 0.85;
	player3_scale = 0.85;
	player4_scale = 0.85;
	#endregion /*Player positions and scale for each character display END*/
	
	#endregion /*Positions and Scale for each character display*/

	max_number_of_characters = 1;/*Update this whenever you add more playable characters!*/
	max_number_of_colors = 15;/*Update this whenever you add more colors!*/
	
	#region /*Give feedback that you have selected a character*/
	if (asset_get_type("spr_select_character_background")==asset_sprite)
	{
		if (player1_accept_selection = true)
		{
			draw_sprite_ext(spr_select_character_background,image_index,window_get_width()/2+player1_display_x,window_get_height()/2,player1_scale,player1_scale,0,global.player1_color,1);
		}
		if (player2_accept_selection = true)
		{
			draw_sprite_ext(spr_select_character_background,image_index,window_get_width()/2+player2_display_x,window_get_height()/2,player2_scale,player2_scale,0,global.player2_color,1);
		}
		if (player3_accept_selection = true)
		{
			draw_sprite_ext(spr_select_character_background,image_index,window_get_width()/2+player3_display_x,window_get_height()/2,player3_scale,player3_scale,0,global.player3_color,1);
		}
		if (player4_accept_selection = true)
		{
			draw_sprite_ext(spr_select_character_background,image_index,window_get_width()/2+player4_display_x,window_get_height()/2,player4_scale,player4_scale,0,global.player4_color,1);
		}
	}
	#endregion /*Give feedback that you have selected a character END*/
	
	#region /*If players haven't joined the game*/
	if (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	{
		if (player1_accept_selection <= -1)
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player1_display_x-150, window_get_height()/2-32, window_get_width()/2+player1_display_x+150, window_get_height()/2+32))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_set_alpha(0.5);
				draw_rectangle_color(window_get_width()/2+player1_display_x-150, window_get_height()/2-32, window_get_width()/2+player1_display_x+150, window_get_height()/2+32, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
			
			draw_text_outlined(window_get_width()/2+player1_display_x-40,window_get_height()/2,"Player 1 Join",global.default_text_size,c_black,global.player1_color,1);
		
			if (gamepad_button_check_pressed(0, gp_face1))
			or (keyboard_check_pressed(global.player1_key_jump))
			or (mouse_check_button_pressed(mb_left))
			and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player1_display_x-150, window_get_height()/2-32, window_get_width()/2+player1_display_x+150, window_get_height()/2+32))
			{
				if (menu_delay = 0)
				{
					menu_delay = 3;
					player1_accept_selection = 0;
				}
			}
		
			#region /*Key A*/
			if (gamepad_is_connected(0))
			and (asset_get_type("spr_xbox_buttons")==asset_sprite)
			and (global.controls_used_for_menu_navigation = "controller")
			{
				draw_sprite_ext(spr_xbox_buttons,0,window_get_width()/2+player1_display_x+70,window_get_height()/2,0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					if (global.player1_key_jump > noone)
					{
						draw_sprite_ext(spr_keyboard_keys,global.player1_key_jump,window_get_width()/2+player1_display_x+70,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+player1_display_x+70,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
				}
			}
			#endregion /*Key A END*/
		
		}
		if (player2_accept_selection <= -1)
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player2_display_x-150, window_get_height()/2-32, window_get_width()/2+player2_display_x+150, window_get_height()/2+32))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_set_alpha(0.5);
				draw_rectangle_color(window_get_width()/2+player2_display_x-150, window_get_height()/2-32, window_get_width()/2+player2_display_x+150, window_get_height()/2+32, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
			
			draw_text_outlined(window_get_width()/2+player2_display_x-40,window_get_height()/2,"Player 2 Join",global.default_text_size,c_black,global.player2_color,1);
		
			if (gamepad_button_check_pressed(1, gp_face1))
			or (keyboard_check_pressed(global.player2_key_jump))
			or (mouse_check_button_pressed(mb_left))
			and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player2_display_x-150, window_get_height()/2-32, window_get_width()/2+player2_display_x+150, window_get_height()/2+32))
			{
				if (menu_delay = 0)
				{
					menu_delay = 3;
					player2_accept_selection = 0;
				}
			}
		
			#region /*Key A*/
			if (gamepad_is_connected(1))
			and (asset_get_type("spr_xbox_buttons")==asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons,1,window_get_width()/2+player1_display_x+70,window_get_height()/2,0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					if (global.player2_key_jump > noone)
					{
						draw_sprite_ext(spr_keyboard_keys,global.player2_key_jump,window_get_width()/2+player2_display_x+70,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+player2_display_x+70,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
				}
			}
			#endregion /*Key A END*/
		
		}
		if (player3_accept_selection <= -1)
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player3_display_x-150, window_get_height()/2-32, window_get_width()/2+player3_display_x+150, window_get_height()/2+32))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_set_alpha(0.5);
				draw_rectangle_color(window_get_width()/2+player3_display_x-150, window_get_height()/2-32, window_get_width()/2+player3_display_x+150, window_get_height()/2+32, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
			
			draw_text_outlined(window_get_width()/2+player3_display_x-40,window_get_height()/2,"Player 3 Join",global.default_text_size,c_black,global.player3_color,1);
		
			if (gamepad_button_check_pressed(2, gp_face1))
			or (keyboard_check_pressed(global.player3_key_jump))
			or (mouse_check_button_pressed(mb_left))
			and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player3_display_x-150, window_get_height()/2-32, window_get_width()/2+player3_display_x+150, window_get_height()/2+32))
			{
				if (menu_delay = 0)
				{
					menu_delay = 3;
					player3_accept_selection = 0;
				}
			}
		
			#region /*Key A*/
			if (gamepad_is_connected(2))
			and (asset_get_type("spr_xbox_buttons")==asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons,2,window_get_width()/2+player1_display_x+70,window_get_height()/2,0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					if (global.player3_key_jump > noone)
					{
						draw_sprite_ext(spr_keyboard_keys,global.player3_key_jump,window_get_width()/2+player3_display_x+70,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+player3_display_x+70,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
				}
			}
			#endregion /*Key A END*/
		
		}
		if (player4_accept_selection <= -1)
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player4_display_x-150, window_get_height()/2-32, window_get_width()/2+player4_display_x+150, window_get_height()/2+32))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_set_alpha(0.5);
				draw_rectangle_color(window_get_width()/2+player4_display_x-150, window_get_height()/2-32, window_get_width()/2+player4_display_x+150, window_get_height()/2+32, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
			
			draw_text_outlined(window_get_width()/2+player4_display_x-40,window_get_height()/2,"Player 4 Join",global.default_text_size,c_black,global.player4_color,1);
		
			if (gamepad_button_check_pressed(3, gp_face1))
			or (keyboard_check_pressed(global.player4_key_jump))
			or (mouse_check_button_pressed(mb_left))
			and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player4_display_x-150, window_get_height()/2-32, window_get_width()/2+player4_display_x+150, window_get_height()/2+32))
			{
				if (menu_delay = 0)
				{
					menu_delay = 3;
					player4_accept_selection = 0;
				}
			}
		
			#region /*Key A*/
			if (gamepad_is_connected(3))
			and (asset_get_type("spr_xbox_buttons")==asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons,3,window_get_width()/2+player4_display_x+70,window_get_height()/2,0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					if (global.player4_key_jump > noone)
					{
						draw_sprite_ext(spr_keyboard_keys,global.player4_key_jump,window_get_width()/2+player4_display_x+70,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+player4_display_x+70,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
				}
			}
			#endregion /*Key A END*/
		
		}
	}
	#endregion /*If players haven't joined the game END*/
	
	#region /*Display Selected Characters*/
	
	#region /*Player 1*/
	if (global.sprite_select_player_1> noone)
	and (player1_accept_selection >= 0)
	{
		draw_sprite_ext(global.sprite_select_player_1,0,window_get_width()/2+xx1,window_get_height()/2,player1_scale*player1_select_portrait_xscale,player1_scale*player1_select_portrait_yscale,0,global.hex_color_for_player_1,1);
		if (can_input_player1_name = true)
		or (can_input_player2_name = true)
		or (can_input_player3_name = true)
		or (can_input_player4_name = true)
		{
			draw_sprite_ext(global.sprite_select_player_1,0,window_get_width()/2+xx1,window_get_height()/2,player1_scale*player1_select_portrait_xscale,player1_scale*player1_select_portrait_yscale,0,c_black,0.5);
		}
	}
	#endregion /*Player 1 END*/
	
	#region /*Player 2*/
	if (global.sprite_select_player_2> noone)
	and (player2_accept_selection >= 0)
	{
		draw_sprite_ext(global.sprite_select_player_2,0,window_get_width()/2+xx2,window_get_height()/2,player2_scale*player2_select_portrait_xscale,player2_scale*player2_select_portrait_yscale,0,global.hex_color_for_player_2,1);
		if (can_input_player1_name = true)
		or (can_input_player2_name = true)
		or (can_input_player3_name = true)
		or (can_input_player4_name = true)
		{
			draw_sprite_ext(global.sprite_select_player_2,0,window_get_width()/2+xx2,window_get_height()/2,player2_scale*player2_select_portrait_xscale,player2_scale*player2_select_portrait_yscale,0,c_black,0.5);
		}
	}
	#endregion /*Player 2 END*/
	
	#region /*Player 3*/
	if (global.sprite_select_player_3> noone)
	and (player3_accept_selection >= 0)
	{
		draw_sprite_ext(global.sprite_select_player_3,0,window_get_width()/2+xx3,window_get_height()/2,player3_scale*player3_select_portrait_xscale,player3_scale*player3_select_portrait_yscale,0,global.hex_color_for_player_3,1);
		if (can_input_player1_name = true)
		or (can_input_player2_name = true)
		or (can_input_player3_name = true)
		or (can_input_player4_name = true)
		{
			draw_sprite_ext(global.sprite_select_player_3,0,window_get_width()/2+xx3,window_get_height()/2,player3_scale*player3_select_portrait_xscale,player3_scale*player3_select_portrait_yscale,0,c_black,0.5);
		}
	}
	#endregion /*Player 3 END*/
	
	#region /*Player 4*/
	if (global.sprite_select_player_4> noone)
	and (player4_accept_selection >= 0)
	{
		draw_sprite_ext(global.sprite_select_player_4,0,window_get_width()/2+xx4,window_get_height()/2,player4_scale*player4_select_portrait_xscale,player4_scale*player4_select_portrait_yscale,0,global.hex_color_for_player_4,1);
		if (can_input_player1_name = true)
		or (can_input_player2_name = true)
		or (can_input_player3_name = true)
		or (can_input_player4_name = true)
		{
			draw_sprite_ext(global.sprite_select_player_4,0,window_get_width()/2+xx4,window_get_height()/2,player4_scale*player4_select_portrait_xscale,player4_scale*player4_select_portrait_yscale,0,c_black,0.5);
		}
	}
	#endregion /*Player 4 END*/
	
	#endregion /*Display Selected Characters END*/

	#region /*Show left and right arrows when selecting character*/
	if (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	{
	
		#region /*Player 1*/
		if (player1_menu = "select_character")
		or (global.controls_used_for_menu_navigation="mouse")
		{
			if (player1_accept_selection = false)
			{
				
				if (gamepad_button_check_pressed(0, gp_face2))
				and (menu_delay = 0)
				or (keyboard_check_pressed(ord("X")))
				and (menu_delay = 0)
				or (keyboard_check_pressed(vk_backspace))
				and (menu_delay = 0)
				or (keyboard_check_pressed(vk_escape))
				and (menu_delay = 0)
				or (keyboard_check_pressed(global.player1_key_dive))
				and (menu_delay = 0)
				or (keyboard_check_pressed(global.player1_key2_dive))
				and (menu_delay = 0)
				{
					menu_delay = 3;
					player1_accept_selection = -1;
				}
				
				#region /*Key Left*/
				if (global.character_for_player_1>0)
				{
					if (gamepad_is_connected(0))
					and (asset_get_type("spr_xbox_buttons") == asset_sprite)
					and (global.controls_used_for_menu_navigation = "controller")
					{
						draw_sprite_ext(spr_xbox_buttons,4,window_get_width()/2+player1_display_x-75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
					else
					if (asset_get_type("spr_keyboard_keys")==asset_sprite)
					{
						if (global.player1_key_left > noone)
						{
							draw_sprite_ext(spr_keyboard_keys,global.player1_key_left,window_get_width()/2+player1_display_x-75,window_get_height()/2,0.5,0.5,0,c_white,1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+player1_display_x-75,window_get_height()/2,0.5,0.5,0,c_white,1);
						}
					}
					
					if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player1_display_x-75-16, window_get_height()/2-16, window_get_width()/2+player1_display_x-75+16, window_get_height()/2+16))
					and (global.controls_used_for_menu_navigation="mouse")
					{
						player1_menu = "select_character";
						draw_set_alpha(0.5);
						draw_rectangle_color(window_get_width()/2+player1_display_x-75-16, window_get_height()/2-16, window_get_width()/2+player1_display_x-75+16, window_get_height()/2+16, c_white, c_white, c_white, c_white, false);
						draw_set_alpha(1);
					}
				}
				#endregion /*Key Left END*/
			
				#region /*Key Right*/
				if (file_exists("Characters/Character "+string(global.character_for_player_1+1)+"/Data/character_config.ini"))
				or (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1+1-global.max_number_of_official_characters)+"/Data/character_config.ini"))
				{
					if (gamepad_is_connected(0))
					and (asset_get_type("spr_xbox_buttons") == asset_sprite)
					and (global.controls_used_for_menu_navigation = "controller")
					{
						draw_sprite_ext(spr_xbox_buttons,6,window_get_width()/2+player1_display_x+75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
					else
					if (asset_get_type("spr_keyboard_keys")==asset_sprite)
					{
						if (global.player1_key_right > noone)
						{
							draw_sprite_ext(spr_keyboard_keys,global.player1_key_right,window_get_width()/2+player1_display_x+75,window_get_height()/2,0.5,0.5,0,c_white,1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+player1_display_x+75,window_get_height()/2,0.5,0.5,0,c_white,1);
						}
					}
				
					if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player1_display_x+75-16, window_get_height()/2-16, window_get_width()/2+player1_display_x+75+16, window_get_height()/2+16))
					and (global.controls_used_for_menu_navigation="mouse")
					{
						player1_menu = "select_character";
						draw_set_alpha(0.5);
						draw_rectangle_color(window_get_width()/2+player1_display_x+75-16, window_get_height()/2-16, window_get_width()/2+player1_display_x+75+16, window_get_height()/2+16, c_white, c_white, c_white, c_white, false);
						draw_set_alpha(1);
					}
				}
				#endregion /*Key Right END*/
			
			}
		}
		#endregion /*Player 1 END*/

		#region /*Player 2*/
		if (player2_menu = "select_character")
		or (global.controls_used_for_menu_navigation="mouse")
		{
			if (player2_accept_selection = false)
			{
				
				if (gamepad_button_check_pressed(1, gp_face2))
				and (menu_delay = 0)
				or (keyboard_check_pressed(global.player2_key_dive))
				and (menu_delay = 0)
				or (keyboard_check_pressed(global.player2_key2_dive))
				and (menu_delay = 0)
				{
					menu_delay = 3;
					player2_accept_selection = -1;
				}
				
				#region /*Key Left*/
				if (global.character_for_player_2>0)
				{
					if (gamepad_is_connected(1))
					and (asset_get_type("spr_xbox_buttons") == asset_sprite)
					{
						draw_sprite_ext(spr_xbox_buttons,4,window_get_width()/2+player2_display_x-75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
					else
					if (asset_get_type("spr_keyboard_keys")==asset_sprite)
					{
						if (global.player2_key_left > noone)
						{
							draw_sprite_ext(spr_keyboard_keys,global.player2_key_left,window_get_width()/2+player2_display_x-75,window_get_height()/2,0.5,0.5,0,c_white,1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+player2_display_x-75,window_get_height()/2,0.5,0.5,0,c_white,1);
						}
					}
			
					if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player2_display_x-75-16, window_get_height()/2-16, window_get_width()/2+player2_display_x-75+16, window_get_height()/2+16))
					and (global.controls_used_for_menu_navigation="mouse")
					{
						player2_menu = "select_character";
						draw_set_alpha(0.5);
						draw_rectangle_color(window_get_width()/2+player2_display_x-75-16, window_get_height()/2-16, window_get_width()/2+player2_display_x-75+16, window_get_height()/2+16, c_white, c_white, c_white, c_white, false);
						draw_set_alpha(1);
					}
				}
				#endregion /*Key Left END*/
			
				#region /*Key Right*/
				if (file_exists("Characters/Character "+string(global.character_for_player_2+1)+"/Data/character_config.ini"))
				or (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2+1-global.max_number_of_official_characters)+"/Data/character_config.ini"))
				{
					if (gamepad_is_connected(1))
					and (asset_get_type("spr_xbox_buttons") == asset_sprite)
					{
						draw_sprite_ext(spr_xbox_buttons,6,window_get_width()/2+player2_display_x+75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
					else
					if (asset_get_type("spr_keyboard_keys")==asset_sprite)
					{
						if (global.player2_key_right > noone)
						{
							draw_sprite_ext(spr_keyboard_keys,global.player2_key_right,window_get_width()/2+player2_display_x+75,window_get_height()/2,0.5,0.5,0,c_white,1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+player2_display_x+75,window_get_height()/2,0.5,0.5,0,c_white,1);
						}
					}
			
					if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player2_display_x+75-16, window_get_height()/2-16, window_get_width()/2+player2_display_x+75+16, window_get_height()/2+16))
					and (global.controls_used_for_menu_navigation="mouse")
					{
						player2_menu = "select_character";
						draw_set_alpha(0.5);
						draw_rectangle_color(window_get_width()/2+player2_display_x+75-16, window_get_height()/2-16, window_get_width()/2+player2_display_x+75+16, window_get_height()/2+16, c_white, c_white, c_white, c_white, false);
						draw_set_alpha(1);
					}
				}
				#endregion /*Key Right END*/
			
			}
		}
		#endregion /*Player 2 END*/

		#region /*Player 3*/
		if (player3_menu = "select_character")
		or (global.controls_used_for_menu_navigation="mouse")
		{
			if (player3_accept_selection = false)
			{
				
				if (gamepad_button_check_pressed(2, gp_face2))
				and (menu_delay = 0)
				or (keyboard_check_pressed(global.player3_key_dive))
				and (menu_delay = 0)
				or (keyboard_check_pressed(global.player3_key2_dive))
				and (menu_delay = 0)
				{
					menu_delay = 3;
					player3_accept_selection = -1;
				}
				
				#region /*Key Left*/
				if (global.character_for_player_3>0)
				{
					if (gamepad_is_connected(2))
					and (asset_get_type("spr_xbox_buttons") == asset_sprite)
					{
						draw_sprite_ext(spr_xbox_buttons,4,window_get_width()/2+player3_display_x-75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
					else
					if (asset_get_type("spr_keyboard_keys")==asset_sprite)
					{
						if (global.player3_key_left > noone)
						{
							draw_sprite_ext(spr_keyboard_keys,global.player3_key_left,window_get_width()/2+player3_display_x-75,window_get_height()/2,0.5,0.5,0,c_white,1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+player3_display_x-75,window_get_height()/2,0.5,0.5,0,c_white,1);
						}
					}
			
					if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player3_display_x-75-16, window_get_height()/2-16, window_get_width()/2+player3_display_x-75+16, window_get_height()/2+16))
					and (global.controls_used_for_menu_navigation="mouse")
					{
						player3_menu = "select_character";
						draw_set_alpha(0.5);
						draw_rectangle_color(window_get_width()/2+player3_display_x-75-16, window_get_height()/2-16, window_get_width()/2+player3_display_x-75+16, window_get_height()/2+16, c_white, c_white, c_white, c_white, false);
						draw_set_alpha(1);
					}
				}
				#endregion /*Key Left END*/
			
				#region /*Key Right*/
				if (file_exists("Characters/Character "+string(global.character_for_player_3+1)+"/Data/character_config.ini"))
				or (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3+1-global.max_number_of_official_characters)+"/Data/character_config.ini"))
				{
					if (gamepad_is_connected(2))
					and (asset_get_type("spr_xbox_buttons") == asset_sprite)
					{
						draw_sprite_ext(spr_xbox_buttons,6,window_get_width()/2+player3_display_x+75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
					else
					if (asset_get_type("spr_keyboard_keys")==asset_sprite)
					{
						if (global.player3_key_right > noone)
						{
							draw_sprite_ext(spr_keyboard_keys,global.player3_key_right,window_get_width()/2+player3_display_x+75,window_get_height()/2,0.5,0.5,0,c_white,1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+player3_display_x+75,window_get_height()/2,0.5,0.5,0,c_white,1);
						}
					}
			
					if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player3_display_x+75-16, window_get_height()/2-16, window_get_width()/2+player3_display_x+75+16, window_get_height()/2+16))
					and (global.controls_used_for_menu_navigation="mouse")
					{
						player3_menu = "select_character";
						draw_set_alpha(0.5);
						draw_rectangle_color(window_get_width()/2+player3_display_x+75-16, window_get_height()/2-16, window_get_width()/2+player3_display_x+75+16, window_get_height()/2+16, c_white, c_white, c_white, c_white, false);
						draw_set_alpha(1);
					}
				}
				#endregion /*Key Right*/
			
			}
		}
		#endregion /*Player 3 END*/
	
		#region /*Player 4*/
		if (player4_menu = "select_character")
		or (global.controls_used_for_menu_navigation="mouse")
		{
			if (player4_accept_selection = false)
			{
				
				if (gamepad_button_check_pressed(3, gp_face2))
				and (menu_delay = 0)
				or (keyboard_check_pressed(global.player4_key_dive))
				and (menu_delay = 0)
				or (keyboard_check_pressed(global.player4_key2_dive))
				and (menu_delay = 0)
				{
					menu_delay = 3;
					player4_accept_selection = -1;
				}
				
				#region /*Key Left*/
				if (global.character_for_player_4>0)
				{
					if (gamepad_is_connected(3))
					and (asset_get_type("spr_xbox_buttons") == asset_sprite)
					{
						draw_sprite_ext(spr_xbox_buttons,4,window_get_width()/2+player4_display_x-75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
					else
					if (asset_get_type("spr_keyboard_keys")==asset_sprite)
					{
						if (global.player4_key_left > noone)
						{
							draw_sprite_ext(spr_keyboard_keys,global.player4_key_left,window_get_width()/2+player4_display_x-75,window_get_height()/2,0.5,0.5,0,c_white,1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+player4_display_x-75,window_get_height()/2,0.5,0.5,0,c_white,1);
						}
					}
			
					if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player4_display_x-75-16, window_get_height()/2-16, window_get_width()/2+player4_display_x-75+16, window_get_height()/2+16))
					and (global.controls_used_for_menu_navigation="mouse")
					{
						player4_menu = "select_character";
						draw_set_alpha(0.5);
						draw_rectangle_color(window_get_width()/2+player4_display_x-75-16, window_get_height()/2-16, window_get_width()/2+player4_display_x-75+16, window_get_height()/2+16, c_white, c_white, c_white, c_white, false);
						draw_set_alpha(1);
					}
				}
				#endregion /*Key Left END*/
			
				#region /*Key Right*/
				if (file_exists("Characters/Character "+string(global.character_for_player_4+1)+"/Data/character_config.ini"))
				or (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4+1-global.max_number_of_official_characters)+"/Data/character_config.ini"))
				{
					if (gamepad_is_connected(3))
					and (asset_get_type("spr_xbox_buttons") == asset_sprite)
					{
						draw_sprite_ext(spr_xbox_buttons,6,window_get_width()/2+player4_display_x+75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
					else
					if (asset_get_type("spr_keyboard_keys")==asset_sprite)
					{
						if (global.player4_key_right > noone)
						{
							draw_sprite_ext(spr_keyboard_keys,global.player4_key_right,window_get_width()/2+player4_display_x+75,window_get_height()/2,0.5,0.5,0,c_white,1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+player4_display_x+75,window_get_height()/2,0.5,0.5,0,c_white,1);
						}
					}
			
					if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player4_display_x+75-16, window_get_height()/2-16, window_get_width()/2+player4_display_x+75+16, window_get_height()/2+16))
					and (global.controls_used_for_menu_navigation="mouse")
					{
						player4_menu = "select_character";
						draw_set_alpha(0.5);
						draw_rectangle_color(window_get_width()/2+player4_display_x+75-16, window_get_height()/2-16, window_get_width()/2+player4_display_x+75+16, window_get_height()/2+16, c_white, c_white, c_white, c_white, false);
						draw_set_alpha(1);
					}
				}
				#endregion /*Key Right END*/
			
			}
		}
		#endregion /*Player 4 END*/
	
	}
	#endregion /*Show left and right arrows when selecting character END*/

	#region /*Tell the players what buttons to push to select or cancel a selection*/

	#region /*Player 1: Tell the player what button to push to select or cancel a selection*/
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);

	if (player1_menu!="select_name")
	and (player1_menu!="back_from_character_select")
	and (player1_menu!="player_add")
	and (player1_menu!="player_subtract")
	and (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	or (global.controls_used_for_menu_navigation="mouse")
	{
		if (player1_accept_selection = false)
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player1_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player1_display_x+100, window_get_height()/2+150+20))
			and (global.controls_used_for_menu_navigation="mouse")
			{
				player1_menu = "select_character";
			
				draw_set_alpha(0.75);
				draw_rectangle_color(window_get_width()/2+player1_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player1_display_x+100, window_get_height()/2+150+20, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		
			#region /*Accept Text*/
			draw_text_outlined(
			window_get_width()/2+player1_display_x-30,
			window_get_height()/2+150,
			"Accept:",global.default_text_size,c_black,c_white,1);
			#endregion /*Accept Text END*/
	
			#region /*Key A*/
			if (gamepad_is_connected(0))
			and (asset_get_type("spr_xbox_buttons")==asset_sprite)
			and (global.controls_used_for_menu_navigation = "controller")
			{
				draw_sprite_ext(spr_xbox_buttons,0,window_get_width()/2+player1_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					if (global.player1_key_jump > noone)
					{
						draw_sprite_ext(spr_keyboard_keys,global.player1_key_jump,window_get_width()/2+player1_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+player1_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
					}
				}
			}
			#endregion /*Key A END*/
		
		}
		else
		if (player1_accept_selection = true)
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player1_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player1_display_x+100, window_get_height()/2+150+20))
			and (global.controls_used_for_menu_navigation="mouse")
			{
				player1_menu = "select_character";
			
				draw_set_alpha(0.75);
				draw_rectangle_color(window_get_width()/2+player1_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player1_display_x+100, window_get_height()/2+150+20, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(0.5);
				draw_rectangle_color(window_get_width()/2+player1_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player1_display_x+100, window_get_height()/2+150+20, c_red, c_red, c_red, c_red, false);
				draw_set_alpha(1);
			}
		
			#region /*Cancel Text*/
			draw_text_outlined(window_get_width()/2+player1_display_x-30,window_get_height()/2+150,"Cancel:",global.default_text_size,c_black,c_white,1);
			#endregion /*Cancel Text END*/
		
			#region /*Key B*/
			if (gamepad_is_connected(0))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			and (global.controls_used_for_menu_navigation = "controller")
			{
				draw_sprite_ext(spr_xbox_buttons,1,window_get_width()/2+player1_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					if (global.player1_key_dive > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player1_key_dive, window_get_width()/2+player1_display_x+40, window_get_height()/2+150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player1_key2_dive > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player1_key2_dive, window_get_width()/2+player1_display_x+40, window_get_height()/2+150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player1_key_sprint > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player1_key_sprint, window_get_width()/2+player1_display_x+40, window_get_height()/2+150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player1_key2_sprint > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player1_key2_sprint, window_get_width()/2+player1_display_x+40, window_get_height()/2+150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys, 0, window_get_width()/2+player1_display_x+40, window_get_height()/2+150, 0.5, 0.5, 0, c_white, 1);
					}
				}
			}
			#endregion /*Key B END*/
		
		}
	}
	#endregion /*Player 1: Tell the player what button to push to select or cancel a selection END*/

	#region /*Player 2: Tell the player what button to push to select or cancel a selection*/
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);

	if (player2_menu!="select_name")
	and (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	or (global.controls_used_for_menu_navigation="mouse")
	{
		if (player2_accept_selection = false)
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player2_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player2_display_x+100, window_get_height()/2+150+20))
			and (global.controls_used_for_menu_navigation="mouse")
			{
				player2_menu = "select_character";
			
				draw_set_alpha(0.75);
				draw_rectangle_color(window_get_width()/2+player2_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player2_display_x+100, window_get_height()/2+150+20, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		
			#region /*Accept Text*/
			draw_text_outlined(window_get_width()/2+player2_display_x-30,window_get_height()/2+150,"Accept:",global.default_text_size,c_black,c_white,1);
			#endregion /*Accept Text END*/
		
			#region /*Key A*/
			if (gamepad_is_connected(1))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons,0,window_get_width()/2+player2_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					if (global.player2_key_jump > noone)
					{
						draw_sprite_ext(spr_keyboard_keys,global.player2_key_jump,window_get_width()/2+player2_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+player2_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
					}
				}
			}
			#endregion /*Key A END*/
		
		}
		else
		if (player2_accept_selection = true)
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player2_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player2_display_x+100, window_get_height()/2+150+20))
			and (global.controls_used_for_menu_navigation="mouse")
			{
				player2_menu = "select_character";
			
				draw_set_alpha(0.75);
				draw_rectangle_color(window_get_width()/2+player2_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player2_display_x+100, window_get_height()/2+150+20, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(0.5);
				draw_rectangle_color(window_get_width()/2+player2_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player2_display_x+100, window_get_height()/2+150+20, c_red, c_red, c_red, c_red, false);
				draw_set_alpha(1);
			}
		
			#region /*Cancel Text*/
			draw_text_outlined(window_get_width()/2+player2_display_x-30,window_get_height()/2+150,"Cancel:",global.default_text_size,c_black,c_white,1);
			#endregion /*Cancel Text END*/
		
			#region /*Key B*/
			if (gamepad_is_connected(1))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons,1,window_get_width()/2+player2_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					if (global.player2_key_dive > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player2_key_dive, window_get_width()/2+player2_display_x+40, window_get_height()/2+150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player2_key2_dive > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player2_key2_dive, window_get_width()/2+player2_display_x+40, window_get_height()/2+150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player2_key_sprint > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player2_key_sprint, window_get_width()/2+player2_display_x+40, window_get_height()/2+150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player2_key2_sprint > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player2_key2_sprint, window_get_width()/2+player2_display_x+40, window_get_height()/2+150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys, 0, window_get_width()/2+player2_display_x+40, window_get_height()/2+150, 0.5, 0.5, 0, c_white, 1);
					}
				}
			}
			#endregion /*Key B END*/
		
		}
	}
	#endregion /*Player 2: Tell the player what button to push to select or cancel a selection END*/

	#region /*Player 3: Tell the player what button to push to select or cancel a selection*/
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);

	if (player3_menu!="select_name")
	and (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	or (global.controls_used_for_menu_navigation="mouse")
	{
		if (player3_accept_selection = false)
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player3_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player3_display_x+100, window_get_height()/2+150+20))
			and (global.controls_used_for_menu_navigation="mouse")
			{
				player3_menu = "select_character";
			
				draw_set_alpha(0.75);
				draw_rectangle_color(window_get_width()/2+player3_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player3_display_x+100, window_get_height()/2+150+20, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		
			#region /*Accept Text*/
			draw_text_outlined(window_get_width()/2+player3_display_x-30,window_get_height()/2+150,"Accept:",global.default_text_size,c_black,c_white,1);
			#endregion /*Accept Text END*/
	
			#region /*Key A*/
			if (gamepad_is_connected(2))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons,0,window_get_width()/2+player3_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					if (global.player3_key_jump > noone)
					{
						draw_sprite_ext(spr_keyboard_keys,global.player3_key_jump,window_get_width()/2+player3_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+player3_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
					}
				}
			}
			#endregion /*Key A END*/
		
		}
		else
		if (player3_accept_selection = true)
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player3_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player3_display_x+100, window_get_height()/2+150+20))
			and (global.controls_used_for_menu_navigation="mouse")
			{
				player3_menu = "select_character";
			
				draw_set_alpha(0.75);
				draw_rectangle_color(window_get_width()/2+player3_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player3_display_x+100, window_get_height()/2+150+20, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(0.5);
				draw_rectangle_color(window_get_width()/2+player3_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player3_display_x+100, window_get_height()/2+150+20, c_red, c_red, c_red, c_red, false);
				draw_set_alpha(1);
			}
		
			#region /*Cancel Text*/
			draw_text_outlined(window_get_width()/2+player3_display_x-30,window_get_height()/2+150,"Cancel:",global.default_text_size,c_black,c_white,1);
			#endregion /*Cancel Text END*/
	
			#region /*Key B*/
			if (gamepad_is_connected(2))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons,1,window_get_width()/2+player3_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					if (global.player3_key_dive > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player3_key_dive, window_get_width()/2+player3_display_x+40, window_get_height()/2+150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player3_key2_dive > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player3_key2_dive, window_get_width()/2+player3_display_x+40, window_get_height()/2+150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player3_key_sprint > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player3_key_sprint, window_get_width()/2+player3_display_x+40, window_get_height()/2+150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player3_key2_sprint > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player3_key2_sprint, window_get_width()/2+player3_display_x+40, window_get_height()/2+150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys, 0, window_get_width()/2+player3_display_x+40, window_get_height()/2+150, 0.5, 0.5, 0, c_white, 1);
					}
				}
			}
			#endregion /*Key B END*/
		
		}
	}
	#endregion /*Player 3: Tell the player what button to push to select or cancel a selection END*/

	#region /*Player 4: Tell the player what button to push to select or cancel a selection*/
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);

	if (player4_menu!="select_name")
	and (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	or (global.controls_used_for_menu_navigation="mouse")
	{
		if (player4_accept_selection = false)
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player4_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player4_display_x+100, window_get_height()/2+150+20))
			and (global.controls_used_for_menu_navigation="mouse")
			{
				player4_menu = "select_character";
			
				draw_set_alpha(0.75);
				draw_rectangle_color(window_get_width()/2+player4_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player4_display_x+100, window_get_height()/2+150+20, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		
			#region /*Accept Text*/
			draw_text_outlined(window_get_width()/2+player4_display_x-30,window_get_height()/2+150,"Accept:",global.default_text_size,c_black,c_white,1);
			#endregion /*Accept Text END*/
	
			#region /*Key A*/
			if (gamepad_is_connected(3))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons,0,window_get_width()/2+player4_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					if (global.player4_key_jump > noone)
					{
						draw_sprite_ext(spr_keyboard_keys,global.player4_key_jump,window_get_width()/2+player4_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+player4_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
					}
				}
			}
			#endregion /*Key A END*/
	
		}
		else
		if (player4_accept_selection = true)
		{
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player4_display_x-100,
			window_get_height()/2+150-20,
			window_get_width()/2+player4_display_x+100,
			window_get_height()/2+150+20))
			and (global.controls_used_for_menu_navigation="mouse")
			{
				player4_menu = "select_character";
			
				draw_set_alpha(0.75);
				draw_rectangle_color(
				window_get_width()/2+player4_display_x-100,
				window_get_height()/2+150-20,
				window_get_width()/2+player4_display_x+100,
				window_get_height()/2+150+20,
				c_white,c_white,c_white,c_white,false);
				draw_set_alpha(0.5);
				draw_rectangle_color(
				window_get_width()/2+player4_display_x-100,
				window_get_height()/2+150-20,
				window_get_width()/2+player4_display_x+100,
				window_get_height()/2+150+20,
				c_red,c_red,c_red,c_red,false);
				draw_set_alpha(1);
			}
		
			#region /*Cancel Text*/
			draw_text_outlined(window_get_width()/2+player4_display_x-30,window_get_height()/2+150,"Cancel:",global.default_text_size,c_black,c_white,1);
			#endregion /*Cancel Text END*/
	
			#region /*Key B*/
			if (gamepad_is_connected(3))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons,1,window_get_width()/2+player4_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					if (global.player4_key_dive > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player4_key_dive, window_get_width()/2+player4_display_x+40, window_get_height()/2+150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player4_key2_dive > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player4_key2_dive, window_get_width()/2+player4_display_x+40, window_get_height()/2+150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player4_key_sprint > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player4_key_sprint, window_get_width()/2+player4_display_x+40, window_get_height()/2+150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player4_key2_sprint > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player4_key2_sprint, window_get_width()/2+player4_display_x+40, window_get_height()/2+150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys, 0, window_get_width()/2+player4_display_x+40, window_get_height()/2+150, 0.5, 0.5, 0, c_white, 1);
					}
				}
			}
			#endregion /*Key B END*/
	
		}
	}
	#endregion /*Player 4: Tell the player what button to push to select or cancel a selection END*/

	#region /*Tell player 1 what button to push to enter a name*/
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);

	if (player1_menu = "select_name")
	and (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	and (global.controls_used_for_menu_navigation != "mouse")
	{
	
		#region /*Accept Text*/
		draw_text_outlined(window_get_width()/2+player1_display_x-30,window_get_height()/2+280,"Enter Name:",global.default_text_size,c_black,c_white,1);
		#endregion /*Accept Text END*/
	
		#region /*Key A*/
		if (gamepad_is_connected(0))
		and (asset_get_type("spr_xbox_buttons") == asset_sprite)
		and (global.controls_used_for_menu_navigation = "controller")
		{
			draw_sprite_ext(spr_xbox_buttons,0,window_get_width()/2+player1_display_x+70,window_get_height()/2+280,0.5,0.5,0,c_white,1);
		}
		else
		{
			if (asset_get_type("spr_keyboard_keys")==asset_sprite)
			{
				if (global.player1_key_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys,global.player1_key_jump,window_get_width()/2+player1_display_x+70,window_get_height()/2+280,0.5,0.5,0,c_white,1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+player1_display_x+70,window_get_height()/2+280,0.5,0.5,0,c_white,1);
				}
			}
		}
		#endregion /*Key A END*/
	
	}
	#endregion /*Tell player 1 what button to push to enter a name END*/

	#region /*Tell player 2 what button to push to enter a name*/
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);

	if (player2_menu = "select_name")
	and (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	and (global.controls_used_for_menu_navigation != "mouse")
	{
	
		#region /*Accept Text*/
		draw_text_outlined(window_get_width()/2+player2_display_x-30,window_get_height()/2+280,"Enter Name:",global.default_text_size,c_black,c_white,1);
		#endregion /*Accept Text END*/
	
		#region /*Key A*/
		if (gamepad_is_connected(1))
		and (asset_get_type("spr_xbox_buttons") == asset_sprite)
		{
			draw_sprite_ext(spr_xbox_buttons,0,window_get_width()/2+player2_display_x+70,window_get_height()/2+280,0.5,0.5,0,c_white,1);
		}
		else
		{
			if (asset_get_type("spr_keyboard_keys")==asset_sprite)
			{
				if (global.player2_key_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys,global.player2_key_jump,window_get_width()/2+player2_display_x+70,window_get_height()/2+280,0.5,0.5,0,c_white,1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+player2_display_x+70,window_get_height()/2+280,0.5,0.5,0,c_white,1);
				}
			}
		}
		#endregion /*Key A END*/
	
	}
	#endregion /*Tell player 2 what button to push to enter a name END*/

	#region /*Tell player 3 what button to push to enter a name*/
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);

	if (player3_menu = "select_name")
	and (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	and (global.controls_used_for_menu_navigation != "mouse")
	{
	
		#region /*Accept Text*/
		draw_text_outlined(window_get_width()/2+player3_display_x-30,window_get_height()/2+280,"Enter Name:",global.default_text_size,c_black,c_white,1);
		#endregion /*Accept Text END*/
	
		#region /*Key A*/
		if (gamepad_is_connected(2))
		and (asset_get_type("spr_xbox_buttons") == asset_sprite)
		{
			draw_sprite_ext(spr_xbox_buttons,0,window_get_width()/2+player3_display_x+70,window_get_height()/2+280,0.5,0.5,0,c_white,1);
		}
		else
		{
			if (asset_get_type("spr_keyboard_keys")==asset_sprite)
			{
				if (global.player3_key_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys,global.player3_key_jump,window_get_width()/2+player3_display_x+70,window_get_height()/2+280,0.5,0.5,0,c_white,1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+player3_display_x+70,window_get_height()/2+280,0.5,0.5,0,c_white,1);
				}
			}
		}
		#endregion /*Key A END*/
	
	}
	#endregion /*Tell player 3 what button to push to enter a name END*/

	#region /*Tell player 4 what button to push to enter a name*/
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);

	if (player4_menu = "select_name")
	and (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	and (global.controls_used_for_menu_navigation != "mouse")
	{
	
		#region /*Accept Text*/
		draw_text_outlined(window_get_width()/2+player4_display_x-30,window_get_height()/2+280,"Enter Name:",global.default_text_size,c_black,c_white,1);
		#endregion /*Accept Text END*/
	
		#region /*Key A*/
		if (gamepad_is_connected(3))
		and (asset_get_type("spr_xbox_buttons") == asset_sprite)
		{
			draw_sprite_ext(spr_xbox_buttons,0,window_get_width()/2+player4_display_x+70,window_get_height()/2+280,0.5,0.5,0,c_white,1);
		}
		else
		{
			if (asset_get_type("spr_keyboard_keys")==asset_sprite)
			{
				if (global.player4_key_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys,global.player4_key_jump,window_get_width()/2+player4_display_x+70,window_get_height()/2+280,0.5,0.5,0,c_white,1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+player4_display_x+70,window_get_height()/2+280,0.5,0.5,0,c_white,1);
				}
			}
		}
		#endregion /*Key A END*/
	
	}
	#endregion /*Tell player 4 what button to push to enter a name END*/

	#endregion /*Tell the players what buttons to push to select or cancel a selection END*/

	#region /*Tell the player the inputed name*/
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);

	#region /*Player 1*/
	
	#region /*Opaque transparent black box*/
	if (can_input_player1_name = true)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	{
		draw_set_alpha(0.5);
		draw_rectangle_color(window_get_width()/2+player1_display_x-155, window_get_height()/2+200, window_get_width()/2+player1_display_x+155, window_get_height()/2+310, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	}
	#endregion /*Opaque transparent black box END*/
	
	#region /*Box where name is written on*/
	draw_set_alpha(1);
	draw_rectangle_color(window_get_width()/2+player1_display_x-150, window_get_height()/2+250-16, window_get_width()/2+player1_display_x+150, window_get_height()/2+250+16, global.player1_color, global.player1_color, global.player1_color, global.player1_color, false);
	
	if (player1_menu = "select_name")
	or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player1_display_x-150, window_get_height()/2+250-16, window_get_width()/2+player1_display_x+150, window_get_height()/2+250+16))
	and (global.controls_used_for_menu_navigation="mouse")
	and (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	{
		draw_set_alpha(0.9);
	}
	else
	{
		draw_set_alpha(0.5);
	}
	draw_rectangle_color(window_get_width()/2+player1_display_x-150, window_get_height()/2+250-16, window_get_width()/2+player1_display_x+150, window_get_height()/2+250+16, c_white, c_white, c_white, c_white, false);
	
	draw_set_alpha(1);
	draw_rectangle_color(window_get_width()/2+player1_display_x-150, window_get_height()/2+250-16, window_get_width()/2+player1_display_x+150, window_get_height()/2+250+16, c_black, c_black, c_black, c_black, true);
	#endregion /*Box where name is written on END*/
	
	#region /*Inputed Name Text*/
	if (can_input_player1_name = true)
	{
		if (name_enter_blink<1)
		{
			draw_text_outlined(window_get_width()/2+player1_display_x+4, window_get_height()/2+250, string(global.player1_name)+"|", global.default_text_size, c_black, c_white, 1);
		}
		else
		{
			draw_text_outlined(window_get_width()/2+player1_display_x, window_get_height()/2+250, string(global.player1_name), global.default_text_size, c_black, c_white, 1);
		}
	}
	else
	{
		if (global.player1_name ="")
		{
			draw_text_outlined(window_get_width()/2+player1_display_x, window_get_height()/2+250, "Player 1", global.default_text_size, c_white, c_black, 1);
		}
		else
		{
			draw_text_outlined(window_get_width()/2+player1_display_x, window_get_height()/2+250, string(global.player1_name), global.default_text_size, c_white, c_black, 1);
		}
	}
	#endregion /*Inputed Name Text END*/
	
	#endregion /*Player 1 END*/

	#region /*Player 2*/
	
	#region /*Opaque transparent black box*/
	if (can_input_player1_name = false)
	and (can_input_player2_name = true)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	{
		draw_set_alpha(0.5);
		draw_rectangle_color(window_get_width()/2+player2_display_x-155, window_get_height()/2+200, window_get_width()/2+player2_display_x+155, window_get_height()/2+310, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	}
	#endregion /*Opaque transparent black box END*/
	
	#region /*Box where name is written on*/
	draw_set_alpha(1);
	draw_rectangle_color(window_get_width()/2+player2_display_x-150, window_get_height()/2+250-16, window_get_width()/2+player2_display_x+150, window_get_height()/2+250+16, global.player2_color, global.player2_color, global.player2_color, global.player2_color, false);
	
	if (player2_menu = "select_name")
	or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player2_display_x-150, window_get_height()/2+250-16, window_get_width()/2+player2_display_x+150, window_get_height()/2+250+16))
	and (global.controls_used_for_menu_navigation="mouse")
	and (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	{
		draw_set_alpha(0.9);
	}
	else
	{
		draw_set_alpha(0.5);
	}
	draw_rectangle_color(window_get_width()/2+player2_display_x-150, window_get_height()/2+250-16, window_get_width()/2+player2_display_x+150, window_get_height()/2+250+16, c_white, c_white, c_white, c_white, false);
	
	draw_set_alpha(1);
	draw_rectangle_color(window_get_width()/2+player2_display_x-150, window_get_height()/2+250-16, window_get_width()/2+player2_display_x+150, window_get_height()/2+250+16, c_black, c_black, c_black, c_black, true);
	#endregion /*Box where name is written on END*/
	
	#region /*Inputed Name Text*/
	if (can_input_player2_name = true)
	{
		if (name_enter_blink<1)
		{
			draw_text_outlined(window_get_width()/2+player2_display_x+4, window_get_height()/2+250, string(global.player2_name)+"|", global.default_text_size, c_black, c_white, 1);
		}
		else
		{
			draw_text_outlined(window_get_width()/2+player2_display_x, window_get_height()/2+250, string(global.player2_name), global.default_text_size, c_black, c_white, 1);
		}
	}
	else
	{
		if (global.player2_name ="")
		{
			draw_text_outlined(window_get_width()/2+player2_display_x, window_get_height()/2+250, "Player 2",global.default_text_size, c_white, c_black, 1);
		}
		else
		{
			draw_text_outlined(window_get_width()/2+player2_display_x, window_get_height()/2+250, string(global.player2_name), global.default_text_size, c_white, c_black, 1);
		}
	}
	#endregion /*Inputed Name Text END*/
	
	#endregion /*Player 2 END*/

	#region /*Player 3*/
	
	#region /*Opaque transparent black box*/
	if (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = true)
	and (can_input_player4_name = false)
	{
		draw_set_alpha(0.5);
		draw_rectangle_color(window_get_width()/2+player3_display_x-155, window_get_height()/2+200, window_get_width()/2+player3_display_x+155, window_get_height()/2+310, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	}
	#endregion /*Opaque transparent black box END*/
	
	#region /*Box where name is written on*/
	draw_set_alpha(1);
	draw_rectangle_color(window_get_width()/2+player3_display_x-150, window_get_height()/2+250-16, window_get_width()/2+player3_display_x+150, window_get_height()/2+250+16, global.player3_color, global.player3_color, global.player3_color, global.player3_color, false);
	
	if (player3_menu = "select_name")
	or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player3_display_x-150, window_get_height()/2+250-16, window_get_width()/2+player3_display_x+150, window_get_height()/2+250+16))
	and (global.controls_used_for_menu_navigation="mouse")
	and (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	{
		draw_set_alpha(0.9);
	}
	else
	{
		draw_set_alpha(0.5);
	}
	draw_rectangle_color(window_get_width()/2+player3_display_x-150, window_get_height()/2+250-16, window_get_width()/2+player3_display_x+150, window_get_height()/2+250+16, c_white, c_white, c_white, c_white, false);
	
	draw_set_alpha(1);
	draw_rectangle_color(window_get_width()/2+player3_display_x-150, window_get_height()/2+250-16, window_get_width()/2+player3_display_x+150, window_get_height()/2+250+16, c_black, c_black, c_black, c_black, true);
	#endregion /*Box where name is written on END*/
	
	#region /*Inputed Name Text*/
	if (can_input_player3_name = true)
	{
		if (name_enter_blink<1)
		{
			draw_text_outlined(window_get_width()/2+player3_display_x+4, window_get_height()/2+250, string(global.player3_name)+"|", global.default_text_size, c_black, c_white, 1);
		}
		else
		{
			draw_text_outlined(window_get_width()/2+player3_display_x, window_get_height()/2+250, string(global.player3_name), global.default_text_size, c_black, c_white, 1);
		}
	}
	else
	{
		if (global.player3_name ="")
		{
			draw_text_outlined(window_get_width()/2+player3_display_x, window_get_height()/2+250, "Player 3", global.default_text_size, c_white, c_black, 1);
		}
		else
		{
			draw_text_outlined(window_get_width()/2+player3_display_x, window_get_height()/2+250, string(global.player3_name), global.default_text_size, c_white, c_black, 1);
		}
	}
	#endregion /*Inputed Name Text END*/
	
	#endregion /*Player 3 END*/

	#region /*Player 4*/
	
	#region /*Opaque transparent black box*/
	if (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = true)
	{
		draw_set_alpha(0.5);
		draw_rectangle_color(window_get_width()/2+player4_display_x-155, window_get_height()/2+200, window_get_width()/2+player4_display_x+155, window_get_height()/2+310, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	}
	#endregion /*Opaque transparent black box END*/
	
	#region /*Box where name is written on*/
	draw_set_alpha(1);
	draw_rectangle_color(window_get_width()/2+player4_display_x-150, window_get_height()/2+250-16, window_get_width()/2+player4_display_x+150, window_get_height()/2+250+16, global.player4_color, global.player4_color, global.player4_color, global.player4_color, false);
	
	if (player4_menu = "select_name")
	or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player4_display_x-150, window_get_height()/2+250-16, window_get_width()/2+player4_display_x+150, window_get_height()/2+250+16))
	and (global.controls_used_for_menu_navigation="mouse")
	and (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	{
		draw_set_alpha(0.9);
	}
	else
	{
		draw_set_alpha(0.5);
	}
	draw_rectangle_color(window_get_width()/2+player4_display_x-150, window_get_height()/2+250-16, window_get_width()/2+player4_display_x+150, window_get_height()/2+250+16, c_white, c_white, c_white, c_white, false);
	
	draw_set_alpha(1);
	draw_rectangle_color(window_get_width()/2+player4_display_x-150, window_get_height()/2+250-16, window_get_width()/2+player4_display_x+150, window_get_height()/2+250+16, c_black, c_black, c_black, c_black, true);
	#endregion /*Box where name is written on END*/
	
	#region /*Inputed Name Text*/
	if (can_input_player4_name = true)
	{
		if (name_enter_blink<1)
		{
			draw_text_outlined(window_get_width()/2+player4_display_x+4, window_get_height()/2+250, string(global.player4_name)+"|", global.default_text_size, c_black, c_white, 1);
		}
		else
		{
			draw_text_outlined(window_get_width()/2+player4_display_x, window_get_height()/2+250, string(global.player4_name), global.default_text_size, c_black, c_white, 1);
		}
	}
	else
	{
		if (global.player4_name ="")
		{
			draw_text_outlined(window_get_width()/2+player4_display_x, window_get_height()/2+250, "Player 4", global.default_text_size, c_white, c_black, 1);
		}
		else
		{
			draw_text_outlined(window_get_width()/2+player4_display_x, window_get_height()/2+250, string(global.player4_name), global.default_text_size, c_white, c_black, 1);
		}
	}
	#endregion /*Inputed Name Text END*/
	
	#endregion /*Player 4 END*/

	#endregion /*Tell the player the inputed name END*/
	
	#region /*Name Enter Blinking*/
	name_enter_blink+=0.05;
	if (name_enter_blink>1.5)
	{
		name_enter_blink=0;
	}
	#endregion /*Name Enter Blinking END*/
	
	#region /*Name Input*/
	
	#region /*PLAYER 1 INPUT NAME NOW*/
	if (can_input_player1_name = true)
	{
		draw_set_alpha(1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		
		global.player1_name =keyboard_string;
		
		#region /*Limit Name Input Length for Player 1*/
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		
		if (string_length(global.player1_name)>=20)
		{
			draw_text_outlined(
			window_get_width()/2+player1_display_x+100,
			window_get_height()/2+290,
			"20/20",global.default_text_size,c_black,c_white,1);
		}
		else
		{
			draw_text_outlined(
			window_get_width()/2+player1_display_x+100,
			window_get_height()/2+290,
			string(string_length(global.player1_name))+"/20",global.default_text_size,c_black,c_ltgray,1);
		}
		
		if (string_length(global.player1_name)>20)
		{
			global.player1_name =string_copy(global.player1_name,1,20);
		}
		#endregion /*Limit Name Input Length for Player 1 END*/
		
	}
	#endregion /*PLAYER 1 INPUT NAME NOW END*/

	#region /*PLAYER 2 INPUT NAME NOW*/
	if (can_input_player2_name = true)
	{
		draw_set_alpha(1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		
		global.player2_name =keyboard_string;
		
		#region /*Limit Name Input Length for Player 2*/
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		
		if (string_length(global.player2_name)>=20)
		{
			draw_text_outlined(
			window_get_width()/2+player2_display_x+100,
			window_get_height()/2+290,
			"20/20",global.default_text_size,c_black,c_white,2);
		}
		else
		{
			draw_text_outlined(
			window_get_width()/2+player2_display_x+100,
			window_get_height()/2+290,
			string(string_length(global.player2_name))+"/20",global.default_text_size,c_black,c_ltgray,1);
		}
		
		if (string_length(global.player2_name)>20)
		{
			global.player2_name =string_copy(global.player2_name,1,20);
		}
		#endregion /*Limit Name Input Length for Player 2 END*/
		
	}
	#endregion /*PLAYER 2 INPUT NAME NOW END*/

	#region /*PLAYER 3 INPUT NAME NOW*/
	if (can_input_player3_name = true)
	{
		draw_set_alpha(1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		
		global.player3_name =keyboard_string;
		
		#region /*Limit Name Input Length for Player 1*/
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		
		if (string_length(global.player3_name)>=20)
		{
			draw_text_outlined(
			window_get_width()/2+player3_display_x+100,
			window_get_height()/2+290,
			"20/20",global.default_text_size,c_black,c_white,1);
		}
		else
		{
			draw_text_outlined(
			window_get_width()/2+player3_display_x+100,
			window_get_height()/2+290,
			string(string_length(global.player3_name))+"/20",global.default_text_size,c_black,c_ltgray,1);
		}
		
		if (string_length(global.player3_name)>20)
		{
			global.player3_name =string_copy(global.player3_name,1,20);
		}
		#endregion /*Limit Name Input Length for Player 3 END*/
		
	}
	#endregion /*PLAYER 3 INPUT NAME NOW END*/

	#region /*PLAYER 4 INPUT NAME NOW*/
	if (can_input_player4_name = true)
	{
		draw_set_alpha(1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		
		global.player4_name =keyboard_string;
		
		#region /*Limit Name Input Length for Player 4*/
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		
		if (string_length(global.player4_name)>=20)
		{
			draw_text_outlined(
			window_get_width()/2+player4_display_x+100,
			window_get_height()/2+290,
			"20/20",global.default_text_size,c_black,c_white,1);
		}
		else
		{
			draw_text_outlined(
			window_get_width()/2+player4_display_x+100,
			window_get_height()/2+290,
			string(string_length(global.player4_name))+"/20",global.default_text_size,c_black,c_ltgray,1);
		}
		
		if (string_length(global.player4_name)>20)
		{
			global.player4_name =string_copy(global.player4_name,1,20);
		}
		#endregion /*Limit Name Input Length for Player 4 END*/
		
	}
	#endregion /*PLAYER 4 INPUT NAME NOW END*/

	#region /*Press enter when done typing*/
	if (can_input_player1_name = true)
	or (can_input_player2_name = true)
	or (can_input_player3_name = true)
	or (can_input_player4_name = true)
	{
		if (keyboard_check_pressed(vk_escape))
		or (keyboard_check_pressed(vk_enter))
		{
			if (menu_delay=0)
			{
				menu_delay=3;
				can_input_player1_name = false;
				can_input_player2_name = false;
				can_input_player3_name = false;
				can_input_player4_name = false;
			}
		}
	}
	#endregion /*Press enter when done typing END*/
	
	#region /*Limit Name Input Length for all players*/
	if (string_length(keyboard_string)>20)
	{
		keyboard_string=string_copy(keyboard_string,1,20);
	}
	#endregion /*Limit Name Input Length for all players END*/
	
	#endregion /*Name Input END*/
	
	#endregion /*All code before menu navigation code END*/
	
	#region /*Menu Navigation*/
	if (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	{
	if (player1_menu = "select_character")
	{
	/*Navigate Character Selection*/
	
	#region /*Player 1*/
		if (menu_joystick1_delay<=0)
		and (input_key= false)
		and (can_navigate= true)
		and (player1_accept_selection = false)
		{
			
			#region /*Player 1 change portrait when clicking left or right*/
			
			#region /*Player 1 Key Left (change portrait sprites)*/
			if (keyboard_check_pressed(global.player1_key_left))
			and (!keyboard_check_pressed(global.player1_key_right))
			or (gamepad_button_check_pressed(0,gp_padl))
			and (!gamepad_button_check_pressed(0,gp_padr))
			or (gamepad_axis_value(0,gp_axislh)<0)
			and (menu_joystick1_delay<=0)
			or (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player1_display_x-75-16,
			window_get_height()/2-16,
			window_get_width()/2+player1_display_x-75+16,
			window_get_height()/2+16))
			and (mouse_check_button_pressed(mb_left))
			{
				if (menu_delay=0)
				and (global.character_for_player_1>0)
				{
					menu_delay=3;
					menu_joystick1_delay=30;
					if (global.character_for_player_1>0)
					{
						global.character_for_player_1-=1;
						xx1=player1_display_x-32;
					}
					else
					{
						global.character_for_player_1=0;
					}
					
					sprite_delete(global.sprite_select_player_1);
					
					#region /*Characterselect portrait x and y origin points*/
					if (file_exists("Characters/Character "+string(global.character_for_player_1)+"/Data/sprite_origin_point.ini"))
					or (file_exists(working_directory + "Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini"))
					{
						if (file_exists("Characters/Character "+string(global.character_for_player_1)+"/Data/sprite_origin_point.ini"))
						{
							ini_open("Characters/Character "+string(global.character_for_player_1)+"/Data/sprite_origin_point.ini");
						}
						else
						{
							ini_open(working_directory + "Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini");
						}
						
						#region /*Characterselect portrait x and y origin points*/
						#region /*Characterselect portrait y origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
						{
							character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
						}
						else
						{
							character_select_portrait_yorig = 0;
						}
						#endregion /*Characterselect portrait y origin point END*/

						#region /*Characterselect portrait x origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
						{
							character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
						}
						else
						{
							character_select_portrait_xorig = 0;
						}
						#endregion /*Characterselect portrait x origin point END*/
						#endregion /*Characterselect portrait x and y origin points END*/
						
						#region /*Sprite stand x and y origin points*/
						#region /*Sprite stand y origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
						{
							sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
						}
						else
						{
							sprite_stand_yorig = 0;
						}
						#endregion /*Sprite stand y origin point END*/

						#region /*Sprite stand x origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
						{
							sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
						}
						else
						{
							sprite_stand_xorig = 0;
						}
						#endregion /*Sprite stand x origin point END*/
						#endregion /*Sprite stand x and y origin points END*/
						
						#region /*Characterselect portrait x_scale and y_scale origin points*/
						#region /*Characterselect portrait y_scale origin point*/
						if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
						{
							player1_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
						}
						else
						{
							player1_select_portrait_yscale = 1;
						}
						#endregion /*Characterselect portrait y_scale origin point END*/

						#region /*Characterselect portrait x_scale origin point*/
						if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
						{
							player1_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
						}
						else
						{
							player1_select_portrait_xscale = 1;
						}
						#endregion /*Characterselect portrait x_scale origin point END*/
						#endregion /*Characterselect portrait x_scale and y_scale origin points END*/
						
						ini_close();
					}
					else
					{
						character_select_portrait_xorig = 0;
						character_select_portrait_yorig = 0;
						sprite_stand_xorig = 0;
						sprite_stand_yorig = 0;
						player1_select_portrait_xscale = 1;
						player1_select_portrait_yscale = 1;
					}
					#endregion /*Characterselect portrait x and y origin points END*/
					
					#region /*Player 1 official character select portrait sprite*/
					if (file_exists("Characters/Character "+string(global.character_for_player_1)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_player_1 = sprite_add("Characters/Character "+string(global.character_for_player_1)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
					}
					else
					if (file_exists("Characters/Character "+string(global.character_for_player_1)+"/Sprites/stand.png"))
					{
						global.sprite_select_player_1 = sprite_add("Characters/Character "+string(global.character_for_player_1)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
					}
					#endregion /*Player 1 official character select portrait sprite END*/
					
					else
					
					#region /*Player 1 character select portrait sprite*/
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_player_1 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
					}
					else
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Sprites/stand.png"))
					{
						global.sprite_select_player_1 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
					}
					else
					{
						global.sprite_select_player_1 = noone;
					}
					#endregion /*Player 1 character select portrait sprite END*/
					
				}
			}
			#endregion /*Player 1 Key Left (change portrait sprites) END*/
	
			#region /*Player 1 Key Right (change portrait sprites)*/
			if (keyboard_check_pressed(global.player1_key_right))
			and (!keyboard_check_pressed(global.player1_key_left))
			or (gamepad_button_check_pressed(0,gp_padr))
			and (!gamepad_button_check_pressed(0,gp_padl))
			or (gamepad_axis_value(0,gp_axislh)>0)
			and (menu_joystick1_delay<=0)
			or (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player1_display_x+75-16,
			window_get_height()/2-16,
			window_get_width()/2+player1_display_x+75+16,
			window_get_height()/2+16))
			and (mouse_check_button_pressed(mb_left))
			{
				if (menu_delay=0)
				{
					menu_delay=3;
					menu_joystick1_delay=30;
					if (file_exists("Characters/Character "+string(global.character_for_player_1+1)+"/Data/character_config.ini"))
					{
						global.character_for_player_1+=1;
						xx1=player1_display_x+32;
					}
					else
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1+1-global.max_number_of_official_characters)+"/Data/character_config.ini"))
					{
						global.character_for_player_1+=1;
						xx1=player1_display_x+32;
					}
					
					sprite_delete(global.sprite_select_player_1);
					
					#region /*Characterselect portrait x and y origin points*/
					if (file_exists("Characters/Character "+string(global.character_for_player_1)+"/Data/sprite_origin_point.ini"))
					or (file_exists(working_directory + "Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini"))
					{
					if (file_exists("Characters/Character "+string(global.character_for_player_1)+"/Data/sprite_origin_point.ini"))
					{
					ini_open("Characters/Character "+string(global.character_for_player_1)+"/Data/sprite_origin_point.ini");
					}
					else
					{
					ini_open(working_directory + "Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini");
					}
						
					#region /*Characterselect portrait x and y origin points*/
					#region /*Characterselect portrait y origin point*/
					if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
					{
					character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
					}
					else
					{
					character_select_portrait_yorig = 0;
					}
					#endregion /*Characterselect portrait y origin point END*/

					#region /*Characterselect portrait x origin point*/
					if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
					{
					character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
					}
					else
					{
					character_select_portrait_xorig = 0;
					}
					#endregion /*Characterselect portrait x origin point END*/
					#endregion /*Characterselect portrait x and y origin points END*/
						
					#region /*Sprite stand x and y origin points*/
					#region /*Sprite stand y origin point*/
					if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
					{
					sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
					}
					else
					{
					sprite_stand_yorig = 0;
					}
					#endregion /*Sprite stand y origin point END*/

					#region /*Sprite stand x origin point*/
					if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
					{
					sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
					}
					else
					{
					sprite_stand_xorig = 0;
					}
					#endregion /*Sprite stand x origin point END*/
					#endregion /*Sprite stand x and y origin points END*/
						
					#region /*Characterselect portrait x_scale and y_scale origin points*/
					#region /*Characterselect portrait y_scale origin point*/
					if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
					{
						player1_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
					}
					else
					{
						player1_select_portrait_yscale = 1;
					}
					#endregion /*Characterselect portrait y_scale origin point END*/

					#region /*Characterselect portrait x_scale origin point*/
					if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
					{
						player1_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
					}
					else
					{
						player1_select_portrait_xscale = 1;
					}
					#endregion /*Characterselect portrait x_scale origin point END*/
					#endregion /*Characterselect portrait x_scale and y_scale origin points END*/
						
					ini_close();
					}
					else
					{
					character_select_portrait_xorig = 0;
					character_select_portrait_yorig = 0;
					sprite_stand_xorig = 0;
					sprite_stand_yorig = 0;
					player1_select_portrait_xscale = 1;
					player1_select_portrait_yscale = 1;
					}
					#endregion /*Characterselect portrait x and y origin points END*/
					
					#region /*Player 1 official character select portrait sprite*/
					if (file_exists("Characters/Character "+string(global.character_for_player_1)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_player_1 = sprite_add("Characters/Character "+string(global.character_for_player_1)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
					}
					else
					if (file_exists("Characters/Character "+string(global.character_for_player_1)+"/Sprites/stand.png"))
					{
						global.sprite_select_player_1 = sprite_add("Characters/Character "+string(global.character_for_player_1)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
					}
					#endregion /*Player 1 official character select portrait sprite END*/
					
					else
					
					#region /*Player 1 character select portrait sprite*/
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_player_1 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
					}
					else
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Sprites/stand.png"))
					{
						global.sprite_select_player_1 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
					}
					else
					{
						global.sprite_select_player_1 = noone;
					}
					#endregion /*Player 1 character select portrait sprite END*/
					
				}
			}
			#endregion /*Player 1 Key Right (change portrait sprites) END*/
			
			#endregion /*Player 1 change portrait when clicking left or right END*/
			
		}
	#endregion /*Player 1 END*/
	
	#region /*Player 1 key up*/
	if (keyboard_check_pressed(global.player1_key_up))
	and (!keyboard_check_pressed(global.player1_key_down))
	or (gamepad_button_check_pressed(0,gp_padu))
	and (!gamepad_button_check_pressed(0,gp_padd))
	or (gamepad_axis_value(0,gp_axislv)<0)
	and (menu_joystick1_delay <= 0)
	{
		if (menu_delay = 0)
		{
			menu_delay = 3;
			menu_joystick1_delay = 30;
			player1_menu = "back_from_character_select";
			menu = "back_from_character_select";
		}
	}
	#endregion /*Player 1 key up END*/
	
	#region /*Player 1 key down*/
	if (keyboard_check_pressed(global.player1_key_down))
	and (!keyboard_check_pressed(global.player1_key_up))
	or (gamepad_button_check_pressed(0,gp_padd))
	and (!gamepad_button_check_pressed(0,gp_padu))
	or (gamepad_axis_value(0,gp_axislv)>0)
	and (menu_joystick1_delay <= 0)
	{
		if (menu_delay = 0)
		and (player1_accept_selection >= 0)
		{
			menu_delay = 3;
			menu_joystick1_delay = 30;
			player1_accept_selection = 0;
			player1_menu = "select_name";
		}
	}
	#endregion /*Player 1 key down END*/
	
	}
	if (player1_menu = "select_name")
	{
	
	#region /*Player 1 key up*/
	if (keyboard_check_pressed(global.player1_key_up))
	and (!keyboard_check_pressed(global.player1_key_down))
	or (gamepad_button_check_pressed(0,gp_padu))
	and (!gamepad_button_check_pressed(0,gp_padd))
	or (gamepad_axis_value(0,gp_axislv)<0)
	and (menu_joystick1_delay <= 0)
	{
		if (menu_delay = 0)
		{
			menu_delay = 3;
			menu_joystick1_delay = 30;
			player1_menu = "select_character";
		}
	}
	#endregion /*Player 1 key up END*/
	
	if (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	{
		if (key_a_pressed)
		{
			if (menu_delay=0)
			{
				menu_delay=3;
				keyboard_string=global.player1_name;
				can_input_player1_name = true;
				can_input_player2_name = false;
				can_input_player3_name = false;
				can_input_player4_name = false;
			}
		}
	}
}

	if (player2_menu = "select_character")
	{
	
	/*Navigate Character Selection*/
	
	#region /*Player 2*/
		if (menu_joystick2_delay<=0)
		and (input_key= false)
		and (can_navigate= true)
		and (player2_accept_selection = false)
		{
			
			#region /*Player 2 change portrait when clicking left or right*/
			
			#region /*Player 2 Key Left (change portrait sprites)*/
			if (keyboard_check_pressed(global.player2_key_left))
			and (!keyboard_check_pressed(global.player2_key_right))
			or (gamepad_button_check_pressed(1,gp_padl))
			and (!gamepad_button_check_pressed(1,gp_padr))
			or (gamepad_axis_value(1,gp_axislh)<0)
			and (menu_joystick2_delay<=0)
			or (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player2_display_x-75-16,
			window_get_height()/2-16,
			window_get_width()/2+player2_display_x-75+16,
			window_get_height()/2+16))
			and (mouse_check_button_pressed(mb_left))
			{
				if (menu_delay=0)
				and (global.character_for_player_2>0)
				{
					menu_delay = 10;
					menu_joystick2_delay = 30;
					if (global.character_for_player_2>0)
					{
						global.character_for_player_2-=1;
						xx2=player2_display_x-32;
					}
					else
					{
						global.character_for_player_2=0;
					}
					
					sprite_delete(global.sprite_select_player_2);
					
					#region /*Characterselect portrait x and y origin points*/
					if (file_exists("Characters/Character "+string(global.character_for_player_2)+"/Data/sprite_origin_point.ini"))
					or (file_exists(working_directory + "Custom Characters/Character "+string(global.character_for_player_2-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini"))
					{
						if (file_exists("Characters/Character "+string(global.character_for_player_2)+"/Data/sprite_origin_point.ini"))
						{
							ini_open("Characters/Character "+string(global.character_for_player_2)+"/Data/sprite_origin_point.ini");
						}
						else
						{
							ini_open(working_directory + "Custom Characters/Character "+string(global.character_for_player_2-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini");
						}
						
						#region /*Characterselect portrait x and y origin points*/
						#region /*Characterselect portrait y origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
						{
							character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
						}
						else
						{
							character_select_portrait_yorig = 0;
						}
						#endregion /*Characterselect portrait y origin point END*/

						#region /*Characterselect portrait x origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
						{
							character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
						}
						else
						{
							character_select_portrait_xorig = 0;
						}
						#endregion /*Characterselect portrait x origin point END*/
						#endregion /*Characterselect portrait x and y origin points END*/
						
						#region /*Sprite stand x and y origin points*/
						#region /*Sprite stand y origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
						{
							sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
						}
						else
						{
							sprite_stand_yorig = 0;
						}
						#endregion /*Sprite stand y origin point END*/

						#region /*Sprite stand x origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
						{
							sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
						}
						else
						{
							sprite_stand_xorig = 0;
						}
						#endregion /*Sprite stand x origin point END*/
						#endregion /*Sprite stand x and y origin points END*/
						
						#region /*Characterselect portrait x_scale and y_scale origin points*/
						#region /*Characterselect portrait y_scale origin point*/
						if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
						{
							player2_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
						}
						else
						{
							player2_select_portrait_yscale = 1;
						}
						#endregion /*Characterselect portrait y_scale origin point END*/

						#region /*Characterselect portrait x_scale origin point*/
						if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
						{
							player2_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
						}
						else
						{
							player2_select_portrait_xscale = 1;
						}
						#endregion /*Characterselect portrait x_scale origin point END*/
						#endregion /*Characterselect portrait x_scale and y_scale origin points END*/
						
						ini_close();
					}
					else
					{
						character_select_portrait_xorig = 0;
						character_select_portrait_yorig = 0;
						sprite_stand_xorig = 0;
						sprite_stand_yorig = 0;
						player2_select_portrait_xscale = 1;
						player2_select_portrait_yscale = 1;
					}
					#endregion /*Characterselect portrait x and y origin points END*/
					
					#region /*Player 2 official character select portrait sprite*/
					if (file_exists("Characters/Character "+string(global.character_for_player_2)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_player_2 = sprite_add("Characters/Character "+string(global.character_for_player_2)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
					}
					else
					if (file_exists("Characters/Character "+string(global.character_for_player_2)+"/Sprites/stand.png"))
					{
						global.sprite_select_player_2 = sprite_add("Characters/Character "+string(global.character_for_player_2)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
					}
					#endregion /*Player 2 official character select portrait sprite END*/
					
					else
					
					#region /*Player 2 character select portrait sprite*/
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_player_2 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
					}
					else
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2-global.max_number_of_official_characters)+"/Sprites/stand.png"))
					{
						global.sprite_select_player_2 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2-global.max_number_of_official_characters)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
					}
					else
					{
						global.sprite_select_player_2 = noone;
					}
					#endregion /*Player 2 character select portrait sprite END*/
					
				}
			}
			#endregion /*Player 2 Key Left (change portrait sprites) END*/
	
			#region /*Player 2 Key Right (change portrait sprites)*/
			if (keyboard_check_pressed(global.player2_key_right))
			and (!keyboard_check_pressed(global.player2_key_left))
			or (gamepad_button_check_pressed(1,gp_padr))
			and (!gamepad_button_check_pressed(1,gp_padl))
			or (gamepad_axis_value(1,gp_axislh)>0)
			and (menu_joystick2_delay<=0)
			or (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player2_display_x+75-16,
			window_get_height()/2-16,
			window_get_width()/2+player2_display_x+75+16,
			window_get_height()/2+16))
			and (mouse_check_button_pressed(mb_left))
			{
				if (menu_delay=0)
				{
					menu_delay = 10;
					menu_joystick2_delay = 30;
					if (file_exists("Characters/Character "+string(global.character_for_player_2+1)+"/Data/character_config.ini"))
					{
						global.character_for_player_2+=1;
						xx2=player2_display_x+32;
					}
					else
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2+1-global.max_number_of_official_characters)+"/Data/character_config.ini"))
					{
						global.character_for_player_2+=1;
						xx2=player2_display_x+32;
					}
					
					sprite_delete(global.sprite_select_player_2);
					
					#region /*Characterselect portrait x and y origin points*/
					if (file_exists("Characters/Character "+string(global.character_for_player_2)+"/Data/sprite_origin_point.ini"))
					or (file_exists(working_directory + "Custom Characters/Character "+string(global.character_for_player_2-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini"))
					{
						if (file_exists("Characters/Character "+string(global.character_for_player_2)+"/Data/sprite_origin_point.ini"))
						{
							ini_open("Characters/Character "+string(global.character_for_player_2)+"/Data/sprite_origin_point.ini");
						}
						else
						{
							ini_open(working_directory + "Custom Characters/Character "+string(global.character_for_player_2-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini");
						}
						
						#region /*Characterselect portrait x and y origin points*/
						#region /*Characterselect portrait y origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
						{
							character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
						}
						else
						{
							character_select_portrait_yorig = 0;
						}
						#endregion /*Characterselect portrait y origin point END*/

						#region /*Characterselect portrait x origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
						{
							character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
						}
						else
						{
							character_select_portrait_xorig = 0;
						}
						#endregion /*Characterselect portrait x origin point END*/
						#endregion /*Characterselect portrait x and y origin points END*/
						
						#region /*Sprite stand x and y origin points*/
						#region /*Sprite stand y origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
						{
							sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
						}
						else
						{
							sprite_stand_yorig = 0;
						}
						#endregion /*Sprite stand y origin point END*/

						#region /*Sprite stand x origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
						{
							sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
						}
						else
						{
							sprite_stand_xorig = 0;
						}
						#endregion /*Sprite stand x origin point END*/
						#endregion /*Sprite stand x and y origin points END*/
						
						#region /*Characterselect portrait x_scale and y_scale origin points*/
						#region /*Characterselect portrait y_scale origin point*/
						if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
						{
							player2_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
						}
						else
						{
							player2_select_portrait_yscale = 1;
						}
						#endregion /*Characterselect portrait y_scale origin point END*/

						#region /*Characterselect portrait x_scale origin point*/
						if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
						{
							player2_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
						}
						else
						{
							player2_select_portrait_xscale = 1;
						}
						#endregion /*Characterselect portrait x_scale origin point END*/
						#endregion /*Characterselect portrait x_scale and y_scale origin points END*/
						
						ini_close();
					}
					else
					{
						character_select_portrait_xorig = 0;
						character_select_portrait_yorig = 0;
						sprite_stand_xorig = 0;
						sprite_stand_yorig = 0;
						player2_select_portrait_xscale = 1;
						player2_select_portrait_yscale = 1;
					}
					#endregion /*Characterselect portrait x and y origin points END*/
					
					#region /*Player 2 official character select portrait sprite*/
					if (file_exists("Characters/Character "+string(global.character_for_player_2)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_player_2 = sprite_add("Characters/Character "+string(global.character_for_player_2)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
					}
					else
					if (file_exists("Characters/Character "+string(global.character_for_player_2)+"/Sprites/stand.png"))
					{
						global.sprite_select_player_2 = sprite_add("Characters/Character "+string(global.character_for_player_2)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
					}
					#endregion /*Player 2 official character select portrait sprite END*/
					
					else
					
					#region /*Player 2 character select portrait sprite*/
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_player_2 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
					}
					else
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2-global.max_number_of_official_characters)+"/Sprites/stand.png"))
					{
						global.sprite_select_player_2 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2-global.max_number_of_official_characters)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
					}
					else
					{
						global.sprite_select_player_2 = noone;
					}
					#endregion /*Player 2 character select portrait sprite END*/
					
				}
			}
			#endregion /*Player 2 Key Right (change portrait sprites) END*/
			
			#endregion /*Player 2 change portrait when clicking left or right END*/
			
	}
#endregion /*Player 2 END*/

	#region /*Player 2 key down*/
	if (keyboard_check_pressed(global.player2_key_down))
	and (!keyboard_check_pressed(global.player2_key_up))
	or (gamepad_button_check_pressed(1,gp_padd))
	and (!gamepad_button_check_pressed(1,gp_padu))
	or (gamepad_axis_value(1,gp_axislv)>0)
	and (menu_joystick2_delay <= 0)
	{
		if (menu_delay = 0)
		and (player2_accept_selection >= 0)
		{
			menu_delay = 3;
			menu_joystick2_delay = 30;
			player2_menu = "select_name";
		}
	}
	#endregion /*Player 2 key down END*/
	}
	if (player2_menu = "select_name")
	{
		
		#region /*Player 2 key up*/
		if (keyboard_check_pressed(global.player2_key_up))
		and (!keyboard_check_pressed(global.player2_key_down))
		or (gamepad_button_check_pressed(1,gp_padu))
		and (!gamepad_button_check_pressed(1,gp_padd))
		or (gamepad_axis_value(1,gp_axislv)<0)
		and (menu_joystick2_delay<=0)
		{
			if (menu_delay=0)
			{
				menu_delay=3;
				menu_joystick2_delay=30;
				player2_menu = "select_character";
			}
		}
		#endregion /*Player 2 key up END*/
		
	if (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	{
		if (gamepad_button_check_pressed(1,gp_face1))
		or (keyboard_check_pressed(global.player2_key_jump))
		or (keyboard_check_pressed(global.player2_key2_jump))
		{
			if (menu_delay=0)
			{
				menu_delay=3;
				keyboard_string=global.player2_name;
				can_input_player1_name = false;
				can_input_player2_name = true;
				can_input_player3_name = false;
				can_input_player4_name = false;
			}
		}
	}
}


	if (player3_menu = "select_character")
	{
		
	/*Navigate Character Selection*/
	
	#region /*Player 3*/
		if (menu_joystick3_delay<=0)
		and (input_key= false)
		and (can_navigate= true)
		and (player3_accept_selection = false)
		{
			
			#region /*Player 3 change portrait when clicking left or right*/
			
			#region /*Player 3 Key Left (change portrait sprites)*/
			if (keyboard_check_pressed(global.player3_key_left))
			and (!keyboard_check_pressed(global.player3_key_right))
			or (gamepad_button_check_pressed(2,gp_padl))
			and (!gamepad_button_check_pressed(2,gp_padr))
			or (gamepad_axis_value(2,gp_axislh)<0)
			and (menu_joystick3_delay<=0)
			or (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player3_display_x-75-16,
			window_get_height()/2-16,
			window_get_width()/2+player3_display_x-75+16,
			window_get_height()/2+16))
			and (mouse_check_button_pressed(mb_left))
			{
				if (menu_delay=0)
				and (global.character_for_player_3>0)
				{
					menu_delay = 10;
					menu_joystick3_delay = 30;
					if (global.character_for_player_3>0)
					{
						global.character_for_player_3-=1;
						xx3=player3_display_x-32;
					}
					else
					{
						global.character_for_player_3=0;
					}
					
					sprite_delete(global.sprite_select_player_3);
					
					#region /*Characterselect portrait x and y origin points*/
					if (file_exists("Characters/Character "+string(global.character_for_player_3)+"/Data/sprite_origin_point.ini"))
					or (file_exists(working_directory + "Custom Characters/Character "+string(global.character_for_player_3-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini"))
					{
						if (file_exists("Characters/Character "+string(global.character_for_player_3)+"/Data/sprite_origin_point.ini"))
						{
							ini_open("Characters/Character "+string(global.character_for_player_3)+"/Data/sprite_origin_point.ini");
						}
						else
						{
							ini_open(working_directory + "Custom Characters/Character "+string(global.character_for_player_3-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini");
						}
						
						#region /*Characterselect portrait x and y origin points*/
						#region /*Characterselect portrait y origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
						{
							character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
						}
						else
						{
							character_select_portrait_yorig = 0;
						}
						#endregion /*Characterselect portrait y origin point END*/

						#region /*Characterselect portrait x origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
						{
							character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
						}
						else
						{
							character_select_portrait_xorig = 0;
						}
						#endregion /*Characterselect portrait x origin point END*/
						#endregion /*Characterselect portrait x and y origin points END*/
						
						#region /*Sprite stand x and y origin points*/
						#region /*Sprite stand y origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
						{
							sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
						}
						else
						{
							sprite_stand_yorig = 0;
						}
						#endregion /*Sprite stand y origin point END*/

						#region /*Sprite stand x origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
						{
							sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
						}
						else
						{
							sprite_stand_xorig = 0;
						}
						#endregion /*Sprite stand x origin point END*/
						#endregion /*Sprite stand x and y origin points END*/
						
						#region /*Characterselect portrait x_scale and y_scale origin points*/
						#region /*Characterselect portrait y_scale origin point*/
						if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
						{
							player3_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
						}
						else
						{
							player3_select_portrait_yscale = 1;
						}
						#endregion /*Characterselect portrait y_scale origin point END*/

						#region /*Characterselect portrait x_scale origin point*/
						if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
						{
							player3_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
						}
						else
						{
							player3_select_portrait_xscale = 1;
						}
						#endregion /*Characterselect portrait x_scale origin point END*/
						#endregion /*Characterselect portrait x_scale and y_scale origin points END*/
						
						ini_close();
					}
					else
					{
						character_select_portrait_xorig = 0;
						character_select_portrait_yorig = 0;
						sprite_stand_xorig = 0;
						sprite_stand_yorig = 0;
						player3_select_portrait_xscale = 1;
						player3_select_portrait_yscale = 1;
					}
					#endregion /*Characterselect portrait x and y origin points END*/
					
					#region /*Player 3 official character select portrait sprite*/
					if (file_exists("Characters/Character "+string(global.character_for_player_3)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_player_3 = sprite_add("Characters/Character "+string(global.character_for_player_3)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
					}
					else
					if (file_exists("Characters/Character "+string(global.character_for_player_3)+"/Sprites/stand.png"))
					{
						global.sprite_select_player_3 = sprite_add("Characters/Character "+string(global.character_for_player_3)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
					}
					#endregion /*Player 3 official character select portrait sprite END*/
					
					else
					
					#region /*Player 3 character select portrait sprite*/
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_player_3 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
					}
					else
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3-global.max_number_of_official_characters)+"/Sprites/stand.png"))
					{
						global.sprite_select_player_3 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3-global.max_number_of_official_characters)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
					}
					else
					{
						global.sprite_select_player_3 = noone;
					}
					#endregion /*Player 3 character select portrait sprite END*/
					
				}
			}
			#endregion /*Player 3 Key Left (change portrait sprites) END*/
	
			#region /*Player 3 Key Right (change portrait sprites)*/
			if (keyboard_check_pressed(global.player3_key_right))
			and (!keyboard_check_pressed(global.player3_key_left))
			or (gamepad_button_check_pressed(2,gp_padr))
			and (!gamepad_button_check_pressed(2,gp_padl))
			or (gamepad_axis_value(2,gp_axislh)>0)
			and (menu_joystick3_delay<=0)
			or (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player3_display_x+75-16,
			window_get_height()/2-16,
			window_get_width()/2+player3_display_x+75+16,
			window_get_height()/2+16))
			and (mouse_check_button_pressed(mb_left))
			{
				if (menu_delay=0)
				{
					menu_delay = 10;
					menu_joystick3_delay = 30;
					if (file_exists("Characters/Character "+string(global.character_for_player_3+1)+"/Data/character_config.ini"))
					{
						global.character_for_player_3+=1;
						xx3=player3_display_x+32;
					}
					else
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3+1-global.max_number_of_official_characters)+"/Data/character_config.ini"))
					{
						global.character_for_player_3+=1;
						xx3=player3_display_x+32;
					}
					
					sprite_delete(global.sprite_select_player_3);
					
					#region /*Characterselect portrait x and y origin points*/
					if (file_exists("Characters/Character "+string(global.character_for_player_3)+"/Data/sprite_origin_point.ini"))
					or (file_exists(working_directory + "Custom Characters/Character "+string(global.character_for_player_3-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini"))
					{
						if (file_exists("Characters/Character "+string(global.character_for_player_3)+"/Data/sprite_origin_point.ini"))
						{
							ini_open("Characters/Character "+string(global.character_for_player_3)+"/Data/sprite_origin_point.ini");
						}
						else
						{
							ini_open(working_directory + "Custom Characters/Character "+string(global.character_for_player_3-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini");
						}
						
						#region /*Characterselect portrait x and y origin points*/
						#region /*Characterselect portrait y origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
						{
							character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
						}
						else
						{
							character_select_portrait_yorig = 0;
						}
						#endregion /*Characterselect portrait y origin point END*/

						#region /*Characterselect portrait x origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
						{
							character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
						}
						else
						{
							character_select_portrait_xorig = 0;
						}
						#endregion /*Characterselect portrait x origin point END*/
						#endregion /*Characterselect portrait x and y origin points END*/
						
						#region /*Sprite stand x and y origin points*/
						#region /*Sprite stand y origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
						{
							sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
						}
						else
						{
							sprite_stand_yorig = 0;
						}
						#endregion /*Sprite stand y origin point END*/

						#region /*Sprite stand x origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
						{
							sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
						}
						else
						{
							sprite_stand_xorig = 0;
						}
						#endregion /*Sprite stand x origin point END*/
						#endregion /*Sprite stand x and y origin points END*/
						
						#region /*Sprite stand x and y origin points*/
						#region /*Sprite stand y origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
						{
							sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
						}
						else
						{
							sprite_stand_yorig = 0;
						}
						#endregion /*Sprite stand y origin point END*/

						#region /*Sprite stand x origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
						{
							sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
						}
						else
						{
							sprite_stand_xorig = 0;
						}
						#endregion /*Sprite stand x origin point END*/
						#endregion /*Sprite stand x and y origin points END*/
						
						#region /*Characterselect portrait x_scale and y_scale origin points*/
						#region /*Characterselect portrait y_scale origin point*/
						if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
						{
							player3_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
						}
						else
						{
							player3_select_portrait_yscale = 1;
						}
						#endregion /*Characterselect portrait y_scale origin point END*/

						#region /*Characterselect portrait x_scale origin point*/
						if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
						{
							player3_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
						}
						else
						{
							player3_select_portrait_xscale = 1;
						}
						#endregion /*Characterselect portrait x_scale origin point END*/
						#endregion /*Characterselect portrait x_scale and y_scale origin points END*/
						
						ini_close();
					}
					else
					{
						character_select_portrait_xorig = 0;
						character_select_portrait_yorig = 0;
						sprite_stand_xorig = 0;
						sprite_stand_yorig = 0;
						player3_select_portrait_xscale = 1;
						player3_select_portrait_yscale = 1;
					}
					#endregion /*Characterselect portrait x and y origin points END*/
					
					#region /*Player 3 official character select portrait sprite*/
					if (file_exists("Characters/Character "+string(global.character_for_player_3)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_player_3 = sprite_add("Characters/Character "+string(global.character_for_player_3)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
					}
					else
					if (file_exists("Characters/Character "+string(global.character_for_player_3)+"/Sprites/stand.png"))
					{
						global.sprite_select_player_3 = sprite_add("Characters/Character "+string(global.character_for_player_3)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
					}
					#endregion /*Player 3 official character select portrait sprite END*/
					
					else
					
					#region /*Player 3 character select portrait sprite*/
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_player_3 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
					}
					else
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3-global.max_number_of_official_characters)+"/Sprites/stand.png"))
					{
						global.sprite_select_player_3 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3-global.max_number_of_official_characters)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
					}
					else
					{
						global.sprite_select_player_3 = noone;
					}
					#endregion /*Player 3 character select portrait sprite END*/
					
				}
			}
			#endregion /*Player 3 Key Right (change portrait sprites) END*/
			
			#endregion /*Player 3 change portrait when clicking left or right END*/
	
		}
	#endregion /*Player 3 END*/

	#region /*Player 3 key down*/
	if (keyboard_check_pressed(global.player3_key_down))
	and (!keyboard_check_pressed(global.player3_key_up))
	or (gamepad_button_check_pressed(2,gp_padd))
	and (!gamepad_button_check_pressed(2,gp_padu))
	or (gamepad_axis_value(2,gp_axislv)>0)
	and (menu_joystick3_delay <= 0)
	{
		if (menu_delay = 0)
		and (player3_accept_selection >= 0)
		{
			menu_delay = 3;
			menu_joystick3_delay = 30;
			player3_menu = "select_name";
		}
	}
	#endregion /*Player 3 key down END*/
	}
	if (player3_menu = "select_name")
	{
	
		#region /*Player 3 key up*/
		if (keyboard_check_pressed(global.player3_key_up))
		and (!keyboard_check_pressed(global.player3_key_down))
		or (gamepad_button_check_pressed(2,gp_padu))
		and (!gamepad_button_check_pressed(2,gp_padd))
		or (gamepad_axis_value(2,gp_axislv)<0)
		and (menu_joystick3_delay<=0)
		{
			if (menu_delay=0)
			{
				menu_delay=3;
				menu_joystick3_delay=30;
				player3_menu = "select_character";
			}
		}
		#endregion /*Player 3 key up END*/
		
	if (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	{
		if (gamepad_button_check_pressed(2,gp_face1))
		or (keyboard_check_pressed(global.player3_key_jump))
		or (keyboard_check_pressed(global.player3_key2_jump))
		{
			if (menu_delay=0)
			{
				menu_delay=3;
				keyboard_string=global.player3_name;
				can_input_player1_name = false;
				can_input_player3_name = false;
				can_input_player3_name = true;
				can_input_player4_name = false;
			}
		}
	}
}


	if (player4_menu = "select_character")
	{
	/*Navigate Character Selection*/
	
	#region /*Player 4*/
		if (menu_joystick4_delay<=0)
		and (input_key= false)
		and (can_navigate= true)
		and (player4_accept_selection = false)
		{
			
			#region /*Player 4 change portrait when clicking left or right*/
			
			#region /*Player 4 Key Left (change portrait sprites)*/
			if (keyboard_check_pressed(global.player4_key_left))
			and (!keyboard_check_pressed(global.player4_key_right))
			or (gamepad_button_check_pressed(3,gp_padl))
			and (!gamepad_button_check_pressed(3,gp_padr))
			or (gamepad_axis_value(3,gp_axislh)<0)
			and (menu_joystick4_delay<=0)
			or (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player4_display_x-75-16,
			window_get_height()/2-16,
			window_get_width()/2+player4_display_x-75+16,
			window_get_height()/2+16))
			and (mouse_check_button_pressed(mb_left))
			{
				if (menu_delay=0)
				and (global.character_for_player_4>0)
				{
					menu_delay = 10;
					menu_joystick4_delay = 30;
					if (global.character_for_player_4>0)
					{
						global.character_for_player_4-=1;
						xx4=player4_display_x-32;
					}
					else
					{
						global.character_for_player_4=0;
					}
					
					sprite_delete(global.sprite_select_player_4);
					
					#region /*Characterselect portrait x and y origin points*/
					if (file_exists("Characters/Character "+string(global.character_for_player_4)+"/Data/sprite_origin_point.ini"))
					or (file_exists(working_directory + "Custom Characters/Character "+string(global.character_for_player_4-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini"))
					{
						if (file_exists("Characters/Character "+string(global.character_for_player_4)+"/Data/sprite_origin_point.ini"))
						{
							ini_open("Characters/Character "+string(global.character_for_player_4)+"/Data/sprite_origin_point.ini");
						}
						else
						{
							ini_open(working_directory + "Custom Characters/Character "+string(global.character_for_player_4-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini");
						}
						
						#region /*Characterselect portrait x and y origin points*/
						#region /*Characterselect portrait y origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
						{
							character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
						}
						else
						{
							character_select_portrait_yorig = 0;
						}
						#endregion /*Characterselect portrait y origin point END*/

						#region /*Characterselect portrait x origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
						{
							character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
						}
						else
						{
							character_select_portrait_xorig = 0;
						}
						#endregion /*Characterselect portrait x origin point END*/
						#endregion /*Characterselect portrait x and y origin points END*/
						
						#region /*Sprite stand x and y origin points*/
						#region /*Sprite stand y origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
						{
							sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
						}
						else
						{
							sprite_stand_yorig = 0;
						}
						#endregion /*Sprite stand y origin point END*/

						#region /*Sprite stand x origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
						{
							sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
						}
						else
						{
							sprite_stand_xorig = 0;
						}
						#endregion /*Sprite stand x origin point END*/
						#endregion /*Sprite stand x and y origin points END*/
						
						#region /*Sprite stand x and y origin points*/
						#region /*Sprite stand y origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
						{
							sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
						}
						else
						{
							sprite_stand_yorig = 0;
						}
						#endregion /*Sprite stand y origin point END*/

						#region /*Sprite stand x origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
						{
							sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
						}
						else
						{
							sprite_stand_xorig = 0;
						}
						#endregion /*Sprite stand x origin point END*/
						#endregion /*Sprite stand x and y origin points END*/
						
						#region /*Characterselect portrait x_scale and y_scale origin points*/
						#region /*Characterselect portrait y_scale origin point*/
						if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
						{
							player4_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
						}
						else
						{
							player4_select_portrait_yscale = 1;
						}
						#endregion /*Characterselect portrait y_scale origin point END*/

						#region /*Characterselect portrait x_scale origin point*/
						if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
						{
							player4_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
						}
						else
						{
							player4_select_portrait_xscale = 1;
						}
						#endregion /*Characterselect portrait x_scale origin point END*/
						#endregion /*Characterselect portrait x_scale and y_scale origin points END*/
						
						ini_close();
					}
					else
					{
						character_select_portrait_xorig = 0;
						character_select_portrait_yorig = 0;
						sprite_stand_xorig = 0;
						sprite_stand_yorig = 0;
						player4_select_portrait_xscale = 1;
						player4_select_portrait_yscale = 1;
					}
					#endregion /*Characterselect portrait x and y origin points END*/
					
					#region /*Player 4 official character select portrait sprite*/
					if (file_exists("Characters/Character "+string(global.character_for_player_4)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_player_4 = sprite_add("Characters/Character "+string(global.character_for_player_4)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
					}
					else
					if (file_exists("Characters/Character "+string(global.character_for_player_4)+"/Sprites/stand.png"))
					{
						global.sprite_select_player_4 = sprite_add("Characters/Character "+string(global.character_for_player_4)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
					}
					#endregion /*Player 4 official character select portrait sprite END*/
					
					else
					
					#region /*Player 4 character select portrait sprite*/
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_player_4 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
					}
					else
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4-global.max_number_of_official_characters)+"/Sprites/stand.png"))
					{
						global.sprite_select_player_4 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4-global.max_number_of_official_characters)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
					}
					else
					{
						global.sprite_select_player_4 = noone;
					}
					#endregion /*Player 4 character select portrait sprite END*/
					
				}
			}
			#endregion /*Player 4 Key Left (change portrait sprites) END*/
	
			#region /*Player 4 Key Right (change portrait sprites)*/
			if (keyboard_check_pressed(global.player4_key_right))
			and (!keyboard_check_pressed(global.player4_key_left))
			or (gamepad_button_check_pressed(3,gp_padr))
			and (!gamepad_button_check_pressed(3,gp_padl))
			or (gamepad_axis_value(3,gp_axislh)>0)
			and (menu_joystick4_delay<=0)
			or (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player4_display_x+75-16,
			window_get_height()/2-16,
			window_get_width()/2+player4_display_x+75+16,
			window_get_height()/2+16))
			and (mouse_check_button_pressed(mb_left))
			{
				if (menu_delay=0)
				{
					menu_delay = 10;
					menu_joystick4_delay = 30;
					if (file_exists("Characters/Character "+string(global.character_for_player_4+1)+"/Data/character_config.ini"))
					{
						global.character_for_player_4+=1;
						xx4=player4_display_x+32;
					}
					else
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4+1-global.max_number_of_official_characters)+"/Data/character_config.ini"))
					{
						global.character_for_player_4+=1;
						xx4=player4_display_x+32;
					}
					
					sprite_delete(global.sprite_select_player_4);
					
					#region /*Characterselect portrait x and y origin points*/
					if (file_exists("Characters/Character "+string(global.character_for_player_4)+"/Data/sprite_origin_point.ini"))
					or (file_exists(working_directory + "Custom Characters/Character "+string(global.character_for_player_4-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini"))
					{
						if (file_exists("Characters/Character "+string(global.character_for_player_4)+"/Data/sprite_origin_point.ini"))
						{
							ini_open("Characters/Character "+string(global.character_for_player_4)+"/Data/sprite_origin_point.ini");
						}
						else
						{
							ini_open(working_directory + "Custom Characters/Character "+string(global.character_for_player_4-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini");
						}
						
						#region /*Characterselect portrait x and y origin points*/
						#region /*Characterselect portrait y origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
						{
							character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
						}
						else
						{
							character_select_portrait_yorig = 0;
						}
						#endregion /*Characterselect portrait y origin point END*/

						#region /*Characterselect portrait x origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
						{
							character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
						}
						else
						{
							character_select_portrait_xorig = 0;
						}
						#endregion /*Characterselect portrait x origin point END*/
						#endregion /*Characterselect portrait x and y origin points END*/
						
						#region /*Sprite stand x and y origin points*/
						#region /*Sprite stand y origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
						{
							sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
						}
						else
						{
							sprite_stand_yorig = 0;
						}
						#endregion /*Sprite stand y origin point END*/

						#region /*Sprite stand x origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
						{
							sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
						}
						else
						{
							sprite_stand_xorig = 0;
						}
						#endregion /*Sprite stand x origin point END*/
						#endregion /*Sprite stand x and y origin points END*/
						
						#region /*Sprite stand x and y origin points*/
						#region /*Sprite stand y origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
						{
							sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
						}
						else
						{
							sprite_stand_yorig = 0;
						}
						#endregion /*Sprite stand y origin point END*/

						#region /*Sprite stand x origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
						{
							sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
						}
						else
						{
							sprite_stand_xorig = 0;
						}
						#endregion /*Sprite stand x origin point END*/
						#endregion /*Sprite stand x and y origin points END*/
						
						#region /*Characterselect portrait x_scale and y_scale origin points*/
						#region /*Characterselect portrait y_scale origin point*/
						if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
						{
							player4_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
						}
						else
						{
							player4_select_portrait_yscale = 1;
						}
						#endregion /*Characterselect portrait y_scale origin point END*/

						#region /*Characterselect portrait x_scale origin point*/
						if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
						{
							player4_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
						}
						else
						{
							player4_select_portrait_xscale = 1;
						}
						#endregion /*Characterselect portrait x_scale origin point END*/
						#endregion /*Characterselect portrait x_scale and y_scale origin points END*/
						
						ini_close();
					}
					else
					{
						character_select_portrait_xorig = 0;
						character_select_portrait_yorig = 0;
						sprite_stand_xorig = 0;
						sprite_stand_yorig = 0;
						player4_select_portrait_xscale = 1;
						player4_select_portrait_yscale = 1;
					}
					#endregion /*Characterselect portrait x and y origin points END*/
					
					#region /*Player 4 official character select portrait sprite*/
					if (file_exists("Characters/Character "+string(global.character_for_player_4)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_player_4 = sprite_add("Characters/Character "+string(global.character_for_player_4)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
					}
					else
					if (file_exists("Characters/Character "+string(global.character_for_player_4)+"/Sprites/stand.png"))
					{
						global.sprite_select_player_4 = sprite_add("Characters/Character "+string(global.character_for_player_4)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
					}
					#endregion /*Player 4 official character select portrait sprite END*/
					
					else
					
					#region /*Player 4 character select portrait sprite*/
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_player_4 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
					}
					else
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4-global.max_number_of_official_characters)+"/Sprites/stand.png"))
					{
						global.sprite_select_player_4 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4-global.max_number_of_official_characters)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
					}
					else
					{
						global.sprite_select_player_4 = noone;
					}
					#endregion /*Player 4 character select portrait sprite END*/
					
				}
			}
			#endregion /*Player 4 Key Right (change portrait sprites) END*/
			
			#endregion /*Player 4 change portrait when clicking left or right END*/
			
		}
	#endregion /*Player 4 END*/

	#region /*Player 4 key down*/
	if (keyboard_check_pressed(global.player4_key_down))
	and (!keyboard_check_pressed(global.player4_key_up))
	or (gamepad_button_check_pressed(3,gp_padd))
	and (!gamepad_button_check_pressed(3,gp_padu))
	or (gamepad_axis_value(3,gp_axislv)>0)
	and (menu_joystick4_delay <= 0)
	{
		if (menu_delay = 0)
		and (player4_accept_selection >= 0)
		{
			menu_delay = 3;
			menu_joystick4_delay = 30;
			player4_menu = "select_name";
		}
	}
	#endregion /*Player 4 key down END*/
	}
	if (player4_menu = "select_name")
	{
		
		#region /*Player 4 key up*/
		if (keyboard_check_pressed(global.player4_key_up))
		and (!keyboard_check_pressed(global.player4_key_down))
		or (gamepad_button_check_pressed(3,gp_padu))
		and (!gamepad_button_check_pressed(3,gp_padd))
		or (gamepad_axis_value(3,gp_axislv)<0)
		and (menu_joystick4_delay<=0)
		{
			if (menu_delay=0)
			{
				menu_delay=3;
				menu_joystick4_delay=30;
				player4_menu = "select_character";
			}
		}
		#endregion /*Player 4 key up END*/
		
	if (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	{
		if (gamepad_button_check_pressed(3,gp_face1))
		or (keyboard_check_pressed(global.player4_key_jump))
		or (keyboard_check_pressed(global.player4_key2_jump))
		{
			if (menu_delay=0)
			{
				menu_delay=3;
				keyboard_string=global.player4_name;
				can_input_player1_name = false;
				can_input_player2_name = false;
				can_input_player3_name = false;
				can_input_player4_name = true;
			}
		}
	}
}

}
#endregion /*Menu Navigation END*/

#region /*Click on name to input name*/
if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
window_get_width()/2+player1_display_x-150,
window_get_height()/2+250-16,
window_get_width()/2+player1_display_x+150,
window_get_height()/2+250+16))
and (mouse_check_button_pressed(mb_left))
and (menu_delay=0)
{
	menu_delay=3;
	keyboard_string=global.player1_name;
	can_input_player1_name = true;
	can_input_player2_name = false;
	can_input_player3_name = false;
	can_input_player4_name = false;
}
if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
window_get_width()/2+player2_display_x-150,
window_get_height()/2+250-16,
window_get_width()/2+player2_display_x+150,
window_get_height()/2+250+16))
and (mouse_check_button_pressed(mb_left))
and (menu_delay=0)
{
	menu_delay=3;
	keyboard_string=global.player2_name;
	can_input_player1_name = false;
	can_input_player2_name = true;
	can_input_player3_name = false;
	can_input_player4_name = false;
}
if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
window_get_width()/2+player3_display_x-150,
window_get_height()/2+250-16,
window_get_width()/2+player3_display_x+150,
window_get_height()/2+250+16))
and (mouse_check_button_pressed(mb_left))
and (menu_delay=0)
{
	menu_delay=3;
	keyboard_string=global.player3_name;
	can_input_player1_name = false;
	can_input_player2_name = false;
	can_input_player3_name = true;
	can_input_player4_name = false;
}
if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
window_get_width()/2+player4_display_x-150,
window_get_height()/2+250-16,
window_get_width()/2+player4_display_x+150,
window_get_height()/2+250+16))
and (mouse_check_button_pressed(mb_left))
and (menu_delay=0)
{
	menu_delay=3;
	keyboard_string=global.player4_name;
	can_input_player1_name = false;
	can_input_player2_name = false;
	can_input_player3_name = false;
	can_input_player4_name = true;
}
#endregion /*Click on name to input name END*/

	#region /*Accept and Back*/
	if (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	{
		
		#region /*Accept*/
		if (key_a_pressed)
		or (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
		window_get_width()/2+player1_display_x-100,
		window_get_height()/2+150-20,
		window_get_width()/2+player1_display_x+100,
		window_get_height()/2+150+20))
		and (mouse_check_button_pressed(mb_left))
		{
			if (player1_accept_selection = false)
			and (player1_menu = "select_character")
			and (menu_delay=0)
			{
				menu_delay=3;
				player1_accept_selection = true;
				global.player1_can_play = true;
				if (global.character_for_player_1=0)
				{
					audio_stop_sound(voice);
					voice=audio_play_sound(menuvoice_select_character0,0,0);
					audio_sound_gain(menuvoice_select_character0,global.voices_volume,0);
				}
				else
				if (global.character_for_player_1=1)
				{
					audio_stop_sound(voice);
					voice=audio_play_sound(menuvoice_select_character1,0,0);
					audio_sound_gain(menuvoice_select_character1,global.voices_volume,0);
				}
				audio_stop_sound(menuvoice_1player);
				audio_stop_sound(menuvoice_2player);
				audio_stop_sound(menuvoice_3player);
				audio_stop_sound(menuvoice_4player);
			}
		}
		if (gamepad_button_check_pressed(1,gp_face1))
		or (keyboard_check_pressed(global.player2_key_jump))
		or (keyboard_check_pressed(global.player2_key2_jump))
		or (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
		window_get_width()/2+player2_display_x-100,
		window_get_height()/2+150-20,
		window_get_width()/2+player2_display_x+100,
		window_get_height()/2+150+20))
		and (mouse_check_button_pressed(mb_left))
		{
			if (player2_accept_selection = false)
			and (player2_menu = "select_character")
			and (menu_delay=0)
			{
				menu_delay=3;
				player2_accept_selection = true;
				global.player2_can_play = true;
				if (global.character_for_player_2=0)
				{
					audio_stop_sound(voice);
					voice=audio_play_sound(menuvoice_select_character0,0,0);
					audio_sound_gain(menuvoice_select_character0,global.voices_volume,0);
				}
				else
				if (global.character_for_player_2=1)
				{
					audio_stop_sound(voice);
					voice=audio_play_sound(menuvoice_select_character1,0,0);
					audio_sound_gain(menuvoice_select_character1,global.voices_volume,0);
				}
				audio_stop_sound(menuvoice_1player);
				audio_stop_sound(menuvoice_2player);
				audio_stop_sound(menuvoice_3player);
				audio_stop_sound(menuvoice_4player);
			}
		}
		if (gamepad_button_check_pressed(2,gp_face1))
		or (keyboard_check_pressed(global.player3_key_jump))
		or (keyboard_check_pressed(global.player3_key2_jump))
		or (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
		window_get_width()/2+player3_display_x-100,
		window_get_height()/2+150-20,
		window_get_width()/2+player3_display_x+100,
		window_get_height()/2+150+20))
		and (mouse_check_button_pressed(mb_left))
		{
			if (player3_accept_selection = false)
			and (player3_menu = "select_character")
			and (menu_delay=0)
			{
				menu_delay=3;
				player3_accept_selection = true;
				global.player3_can_play = true;
				if (global.character_for_player_3=0)
				{
					audio_stop_sound(voice);
					voice=audio_play_sound(menuvoice_select_character0,0,0);
					audio_sound_gain(menuvoice_select_character0,global.voices_volume,0);
				}
				else
				if (global.character_for_player_3=1)
				{
					audio_stop_sound(voice);
					voice=audio_play_sound(menuvoice_select_character1,0,0);
					audio_sound_gain(menuvoice_select_character1,global.voices_volume,0);
				}
				audio_stop_sound(menuvoice_1player);
				audio_stop_sound(menuvoice_2player);
				audio_stop_sound(menuvoice_3player);
				audio_stop_sound(menuvoice_4player);
			}
		}
		if (gamepad_button_check_pressed(3,gp_face1))
		or (keyboard_check_pressed(global.player4_key_jump))
		or (keyboard_check_pressed(global.player4_key2_jump))
		or (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
		window_get_width()/2+player4_display_x-100,
		window_get_height()/2+150-20,
		window_get_width()/2+player4_display_x+100,
		window_get_height()/2+150+20))
		and (mouse_check_button_pressed(mb_left))
		{
			if (player4_accept_selection = false)
			and (player4_menu = "select_character")
			and (menu_delay=0)
			{
				menu_delay=3;
				player4_accept_selection = true;
				global.player4_can_play = true;
				if (global.character_for_player_4=0)
				{
					audio_stop_sound(voice);
					voice=audio_play_sound(menuvoice_select_character0,0,0);
					audio_sound_gain(menuvoice_select_character0,global.voices_volume,0);
				}
				else
				if (global.character_for_player_4=1)
				{
					audio_stop_sound(voice);
					voice=audio_play_sound(menuvoice_select_character1,0,0);
					audio_sound_gain(menuvoice_select_character1,global.voices_volume,0);
				}
				audio_stop_sound(menuvoice_1player);
				audio_stop_sound(menuvoice_2player);
				audio_stop_sound(menuvoice_3player);
				audio_stop_sound(menuvoice_4player);
			}
		}
	
	#region /*Start Game*/
	
	#region /*If player 1 has selected a character, be able to start game*/
	if (player1_accept_selection = true)
	and (player2_accept_selection != 0)
	and (player3_accept_selection != 0)
	and (player4_accept_selection != 0)
	{
		player_start_game = true;
	}
	else
	if (player1_accept_selection != 0)
	and (player2_accept_selection = true)
	and (player3_accept_selection != 0)
	and (player4_accept_selection != 0)
	{
		player_start_game = true;
	}
	else
	if (player1_accept_selection != 0)
	and (player2_accept_selection != 0)
	and (player3_accept_selection = true)
	and (player4_accept_selection != 0)
	{
		player_start_game = true;
	}
	else
	if (player1_accept_selection != 0)
	and (player2_accept_selection != 0)
	and (player3_accept_selection != 0)
	and (player4_accept_selection = true)
	{
		player_start_game = true;
	}
	else
	{
		player_start_game= false;
	}
	#endregion /*If player 1 has selected a character, be able to start game END*/
	
	#endregion /*Start Game END*/
	
	if (player1_accept_selection = true)
	and (player2_accept_selection != 0)
	and (player3_accept_selection != 0)
	and (player4_accept_selection != 0)
	and (keyboard_check_pressed(global.player1_key_jump))
	or (player1_accept_selection = true)
	and (player2_accept_selection != 0)
	and (player3_accept_selection != 0)
	and (player4_accept_selection != 0)
	and (keyboard_check_pressed(global.player1_key2_jump))
	
	or (player1_accept_selection = -1)
	and (player2_accept_selection = true)
	and (player3_accept_selection != 0)
	and (player4_accept_selection != 0)
	and (keyboard_check_pressed(global.player2_key_jump))
	or (player1_accept_selection = -1)
	and (player2_accept_selection = true)
	and (player3_accept_selection != 0)
	and (player4_accept_selection != 0)
	and (keyboard_check_pressed(global.player2_key2_jump))
	
	or (player1_accept_selection = -1)
	and (player2_accept_selection = -1)
	and (player3_accept_selection = true)
	and (player4_accept_selection != 0)
	and (keyboard_check_pressed(global.player3_key_jump))
	or (player1_accept_selection = -1)
	and (player2_accept_selection = -1)
	and (player3_accept_selection = true)
	and (player4_accept_selection != 0)
	and (keyboard_check_pressed(global.player3_key2_jump))
	
	or (player1_accept_selection = -1)
	and (player2_accept_selection = -1)
	and (player3_accept_selection = -1)
	and (player4_accept_selection = true)
	and (keyboard_check_pressed(global.player4_key_jump))
	or (player1_accept_selection = -1)
	and (player2_accept_selection = -1)
	and (player3_accept_selection = -1)
	and (player4_accept_selection = true)
	and (keyboard_check_pressed(global.player4_key2_jump))
	
	or (player_start_game = true)
	and (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),0,play_the_game_text_y-32,window_get_width(),play_the_game_text_y+32,))
	and (mouse_check_button_pressed(mb_left))
	{
		if (can_input_player1_name = false)
		and (can_input_player2_name = false)
		and (can_input_player3_name = false)
		and (can_input_player4_name = false)
		and (menu_delay = 0)
		{
			if (global.character_select_in_this_menu = "game")
			{
				can_navigate = false;
				menu_delay = 999;
			}
			else
			{
				menu = "select_custom_level";
				can_navigate = true;
				menu_delay = 3;
				player1_accept_selection = false;
				player2_accept_selection = false;
				player3_accept_selection = false;
				player4_accept_selection = false;
				can_input_player1_name = false;
				can_input_player2_name = false;
				can_input_player3_name = false;
				can_input_player4_name = false;
			}
		}
	}
	#endregion /*Accept END*/
	
	#region /*Back / Cancel Selection*/
	
	#region /*Player 1 Back / Cancel Selection*/
	if (key_b_pressed)
	or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player1_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player1_display_x+100, window_get_height()/2+150+20))
	and (mouse_check_button_pressed(mb_left))
	{
		if (player1_accept_selection = true)
		and (menu_delay=0)
		{
			menu_delay=3;
			player1_accept_selection = false;
			global.player1_can_play = false;
			can_navigate= true;
		}
	}
	#endregion /*Player 1 Back / Cancel Selection END*/
	
	#region /*Player 2 Back / Cancel Selection*/
	if (gamepad_button_check_pressed(1,gp_face2))
	or (keyboard_check_pressed(global.player2_key_dive))
	or (keyboard_check_pressed(global.player2_key2_dive))
	or (keyboard_check_pressed(global.player2_key_sprint))
	or (keyboard_check_pressed(global.player2_key2_sprint))
	or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player2_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player2_display_x+100, window_get_height()/2+150+20))
	and (mouse_check_button_pressed(mb_left))
	{
		if (player2_accept_selection = true)
		and (menu_delay=0)
		{
			menu_delay=3;
			player2_accept_selection = false;
			global.player2_can_play = false;
			can_navigate= true;
		}
	}
	#endregion /*Player 2 Back / Cancel Selection END*/
	
	#region /*Player 3 Back / Cancel Selection*/
	if (gamepad_button_check_pressed(2,gp_face2))
	or (keyboard_check_pressed(global.player3_key_dive))
	or (keyboard_check_pressed(global.player3_key2_dive))
	or (keyboard_check_pressed(global.player3_key_sprint))
	or (keyboard_check_pressed(global.player3_key2_sprint))
	or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player3_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player3_display_x+100, window_get_height()/2+150+20))
	and (mouse_check_button_pressed(mb_left))
	{
		if (player3_accept_selection = true)
		and (menu_delay=0)
		{
			menu_delay=3;
			player3_accept_selection = false;
			global.player3_can_play = false;
			can_navigate= true;
		}
	}
	#endregion /*Player 3 Back / Cancel Selection END*/
	
	#region /*Player 4 Back / Cancel Selection*/
	if (gamepad_button_check_pressed(3,gp_face2))
	or (keyboard_check_pressed(global.player4_key_dive))
	or (keyboard_check_pressed(global.player4_key2_dive))
	or (keyboard_check_pressed(global.player4_key_sprint))
	or (keyboard_check_pressed(global.player4_key2_sprint))
	or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/2+player4_display_x-100, window_get_height()/2+150-20, window_get_width()/2+player4_display_x+100, window_get_height()/2+150+20))
	and (mouse_check_button_pressed(mb_left))
	{
		if (player4_accept_selection = true)
		and (menu_delay=0)
		{
			menu_delay=3;
			player4_accept_selection = false;
			global.player4_can_play = false;
			can_navigate= true;
		}
	}
	#endregion /*Player 4 Back / Cancel Selection END*/
	
	#region /*If player 1 has selected a character, be able to start game*/
	if (player1_accept_selection = true)
	and (player2_accept_selection != 0)
	and (player3_accept_selection != 0)
	and (player4_accept_selection != 0)
	{
		player_start_game = true;
	}
	else
	if (player1_accept_selection != 0)
	and (player2_accept_selection = true)
	and (player3_accept_selection != 0)
	and (player4_accept_selection != 0)
	{
		player_start_game = true;
	}
	else
	if (player1_accept_selection != 0)
	and (player2_accept_selection != 0)
	and (player3_accept_selection = true)
	and (player4_accept_selection != 0)
	{
		player_start_game = true;
	}
	else
	if (player1_accept_selection != 0)
	and (player2_accept_selection != 0)
	and (player3_accept_selection != 0)
	and (player4_accept_selection = true)
	{
		player_start_game = true;
	}
	else
	{
		player_start_game= false;
	}
	#endregion /*If player 1 has selected a character, be able to start game END*/
	
	if (key_b_pressed)
	and (player1_accept_selection <= -1)
	or (key_a_pressed)
	and (menu = "back_from_character_select")
	{
		if (menu_delay = 0)
		{
			menu_delay = 3;
			image_alpha = 1;
			player_start_game = false;
			can_input_player1_name = false;
			can_input_player2_name = false;
			can_input_player3_name = false;
			can_input_player4_name = false;
			player1_accept_selection = -1;
			player2_accept_selection = -1;
			player3_accept_selection = -1;
			player4_accept_selection = -1;
			global.player1_can_play = false;
			global.player2_can_play = false;
			global.player3_can_play = false;
			global.player4_can_play = false;
			player1_menu = "select_character";
			player2_menu = "select_character";
			player3_menu = "select_character";
			player4_menu = "select_character";
			xx1 = player1_display_x;
			xx2 = player2_display_x;
			xx3 = player3_display_x;
			xx4 = player4_display_x;
			if (global.character_select_in_this_menu = "game")
			{
				menu = "main_game";
			}
			else
			{
				menu = "leveleditor";
			}
			can_navigate = true;
			global.level_editor_level = 1;
			
			#region /*Update Thumbnail*/
			if (file_exists(working_directory+"\Custom Levels\Level"+string(global.level_editor_level)+"/Thumbnail.png"))
			{
				global.thumbnail_sprite=sprite_add(working_directory+"\Custom Levels\Level"+string(global.level_editor_level)+"/Thumbnail.png",0,false,true,window_get_width()/2,0);
			}
			#endregion /*Update Thumbnail END*/
			
		}
	}
	#endregion /*Back / Cancel Selection END*/
	
	}
	#endregion /*Accept and Back END*/

	if (menu_delay>0)
	{
		menu_delay-=1;
	}
	if (menu_delay<0)
	{
		menu_delay=0;
	}


	#region /*Menu navigation with joystick*/
	if (gamepad_axis_value(0,gp_axislv)<0)
	or (gamepad_axis_value(0,gp_axislv)>0)
	or (gamepad_axis_value(0,gp_axislh)<0)
	or (gamepad_axis_value(0,gp_axislh)>0)
	{
		if (menu_joystick1_delay=0)
		{
			menu_joystick1_delay=30;
		}
	}
	if (gamepad_axis_value(1,gp_axislv)<0)
	or (gamepad_axis_value(1,gp_axislv)>0)
	or (gamepad_axis_value(1,gp_axislh)<0)
	or (gamepad_axis_value(1,gp_axislh)>0)
	{
		if (menu_joystick2_delay=0)
		{
			menu_joystick2_delay=30;
		}
	}
	if (gamepad_axis_value(2,gp_axislv)<0)
	or (gamepad_axis_value(2,gp_axislv)>0)
	or (gamepad_axis_value(2,gp_axislh)<0)
	or (gamepad_axis_value(2,gp_axislh)>0)
	{
		if (menu_joystick3_delay=0)
		{
			menu_joystick3_delay=30;
		}
	}
	if (gamepad_axis_value(3,gp_axislv)<0)
	or (gamepad_axis_value(3,gp_axislv)>0)
	or (gamepad_axis_value(3,gp_axislh)<0)
	or (gamepad_axis_value(3,gp_axislh)>0)
	{
		if (menu_joystick4_delay=0)
		{
			menu_joystick4_delay=30;
		}
	}
	if (gamepad_axis_value(0,gp_axislv)=0)
	and (gamepad_axis_value(0,gp_axislh)=0)
	{
		menu_joystick1_delay=0;
	}
	if (gamepad_axis_value(1,gp_axislv)=0)
	and (gamepad_axis_value(1,gp_axislh)=0)
	{
		menu_joystick2_delay=0;
	}
	if (gamepad_axis_value(2,gp_axislv)=0)
	and (gamepad_axis_value(2,gp_axislh)=0)
	{
		menu_joystick3_delay=0;
	}
	if (gamepad_axis_value(3,gp_axislv)=0)
	and (gamepad_axis_value(3,gp_axislh)=0)
	{
		menu_joystick4_delay=0;
	}
	if (menu_joystick1_delay>0)
	{
		menu_joystick1_delay-=1;
	}
	if (menu_joystick2_delay>0)
	{
		menu_joystick2_delay-=1;
	}
	if (menu_joystick3_delay>0)
	{
		menu_joystick3_delay-=1;
	}
	if (menu_joystick4_delay>0)
	{
		menu_joystick4_delay-=1;
	}
	#endregion /*Menu navigation with joystick END*/

	}
	
	#region /*Play the game text*/
	if (player_start_game = true)
	{
		if (can_input_player1_name = false)
		and (can_input_player2_name = false)
		and (can_input_player3_name = false)
		and (can_input_player4_name = false)
		and (asset_get_type("obj_camera")==asset_object)
		and (instance_exists(obj_camera))
		{
			if (obj_camera.iris_xscale>=1)
			and (obj_camera.iris_yscale>=1)
			{
				if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
				0,
				play_the_game_text_y-32,
				window_get_width(),
				play_the_game_text_y+32,))
				and (global.controls_used_for_menu_navigation="mouse")
				{
					draw_rectangle_color(
					0,
					play_the_game_text_y-32-4,
					window_get_width(),
					play_the_game_text_y+32+4,
					c_red,c_yellow,c_yellow,c_red,false);
				}
				draw_rectangle_color(
				0,
				play_the_game_text_y-32,
				window_get_width(),
				play_the_game_text_y+32,
				c_black,c_black,c_black,c_black,false);
			
				draw_text_outlined(window_get_width()/2-40, play_the_game_text_y, "Play the game!", global.default_text_size*2, c_black, c_white, 1);
			
				draw_set_alpha(0.9);
				draw_rectangle_color(window_get_width()/2-168, play_the_game_text_y+32, window_get_width()/2+168, play_the_game_text_y+64, c_black, c_black, c_black, c_black, false);
			
				draw_set_alpha(1);
				draw_set_halign(fa_center);
				draw_set_valign(fa_center);
			
				if (player1_accept_selection = true)
				and (player2_accept_selection != 0)
				and (player3_accept_selection != 0)
				and (player4_accept_selection != 0)
				{
					draw_text_outlined(window_get_width()/2, play_the_game_text_y+45, "Player 1 starts the game", global.default_text_size, c_black, global.player1_color, 1);
					
					#region /*Show Key A on screen*/
					if (gamepad_is_connected(0))
					and (asset_get_type("spr_xbox_buttons") == asset_sprite)
					and (global.controls_used_for_menu_navigation = "controller")
					{
						draw_sprite_ext(spr_xbox_buttons, 0, window_get_width()/2+170, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						if (asset_get_type("spr_keyboard_keys")==asset_sprite)
						{
							if (global.player1_key_jump > noone)
							{
								draw_sprite_ext(spr_keyboard_keys,global.player1_key_jump,window_get_width()/2+170,play_the_game_text_y,0.5,0.5,0,c_white,1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+170,play_the_game_text_y,0.5,0.5,0,c_white,1);
							}
						}
					}
					#endregion /*Show Key A on screen END*/
					
				}
				else
				if (player1_accept_selection != 0)
				and (player2_accept_selection = true)
				and (player3_accept_selection != 0)
				and (player4_accept_selection != 0)
				{
					draw_text_outlined(window_get_width()/2, play_the_game_text_y+45, "Player 2 starts the game", global.default_text_size, c_black, global.player2_color, 1);
					
					#region /*Show Key A on screen*/
					if (gamepad_is_connected(1))
					and (asset_get_type("spr_xbox_buttons") == asset_sprite)
					{
						draw_sprite_ext(spr_xbox_buttons, 0, window_get_width()/2+170, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						if (asset_get_type("spr_keyboard_keys")==asset_sprite)
						{
							if (global.player2_key_jump > noone)
							{
								draw_sprite_ext(spr_keyboard_keys,global.player2_key_jump,window_get_width()/2+170,play_the_game_text_y,0.5,0.5,0,c_white,1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+170,play_the_game_text_y,0.5,0.5,0,c_white,1);
							}
						}
					}
					#endregion /*Show Key A on screen END*/
					
				}
				else
				if (player1_accept_selection != 0)
				and (player2_accept_selection != 0)
				and (player3_accept_selection = true)
				and (player4_accept_selection != 0)
				{
					draw_text_outlined(window_get_width()/2, play_the_game_text_y+45, "Player 3 starts the game", global.default_text_size, c_black, global.player3_color, 1);
					
					#region /*Show Key A on screen*/
					if (gamepad_is_connected(2))
					and (asset_get_type("spr_xbox_buttons") == asset_sprite)
					{
						draw_sprite_ext(spr_xbox_buttons, 0, window_get_width()/2+170, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						if (asset_get_type("spr_keyboard_keys")==asset_sprite)
						{
							if (global.player3_key_jump > noone)
							{
								draw_sprite_ext(spr_keyboard_keys,global.player3_key_jump,window_get_width()/2+170,play_the_game_text_y,0.5,0.5,0,c_white,1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+170,play_the_game_text_y,0.5,0.5,0,c_white,1);
							}
						}
					}
					#endregion /*Show Key A on screen END*/
					
				}
				else
				if (player1_accept_selection != 0)
				and (player2_accept_selection != 0)
				and (player3_accept_selection != 0)
				and (player4_accept_selection = true)
				{
					draw_text_outlined(window_get_width()/2, play_the_game_text_y+45, "Player 4 starts the game", global.default_text_size, c_black, global.player4_color, 1);
					
					#region /*Show Key A on screen*/
					if (gamepad_is_connected(3))
					and (asset_get_type("spr_xbox_buttons") == asset_sprite)
					{
						draw_sprite_ext(spr_xbox_buttons, 0, window_get_width()/2+170, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						if (asset_get_type("spr_keyboard_keys")==asset_sprite)
						{
							if (global.player4_key_jump > noone)
							{
								draw_sprite_ext(spr_keyboard_keys,global.player4_key_jump,window_get_width()/2+170,play_the_game_text_y,0.5,0.5,0,c_white,1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys,0,window_get_width()/2+170,play_the_game_text_y,0.5,0.5,0,c_white,1);
							}
						}
					}
					#endregion /*Show Key A on screen END*/
					
				}
			}
		}
	}
	#endregion /*Play the game text END*/
	
}