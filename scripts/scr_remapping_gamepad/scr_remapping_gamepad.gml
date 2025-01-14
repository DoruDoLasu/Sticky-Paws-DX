function scr_remapping_gamepad()
{
	if (remapping_player == 0)
	{
		player_profile = global.player1_profile;
	}
	else
	if (remapping_player == 1)
	{
		player_profile = global.player2_profile;
	}
	else
	if (remapping_player == 2)
	{
		player_profile = global.player3_profile;
	}
	else
	if (remapping_player == 3)
	{
		player_profile = global.player4_profile;
	}
	
	#region /* Check for player 1 button presses */
	if (remapping_player == 0)
	&& (gamepad_button_check_pressed(global.player1_slot, gp_face1))
	|| (remapping_player == 1)
	&& (gamepad_button_check_pressed(global.player2_slot, gp_face1))
	|| (remapping_player == 2)
	&& (gamepad_button_check_pressed(global.player3_slot, gp_face1))
	|| (remapping_player == 3)
	&& (gamepad_button_check_pressed(global.player4_slot, gp_face1))
	{
		last_key = gp_face1;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_button_check_pressed(global.player1_slot, gp_face2))
	|| (remapping_player == 1)
	&& (gamepad_button_check_pressed(global.player2_slot, gp_face2))
	|| (remapping_player == 2)
	&& (gamepad_button_check_pressed(global.player3_slot, gp_face2))
	|| (remapping_player == 3)
	&& (gamepad_button_check_pressed(global.player4_slot, gp_face1))
	{
		last_key = gp_face2;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_button_check_pressed(global.player1_slot, gp_face3))
	|| (remapping_player == 1)
	&& (gamepad_button_check_pressed(global.player2_slot, gp_face3))
	|| (remapping_player == 2)
	&& (gamepad_button_check_pressed(global.player3_slot, gp_face3))
	|| (remapping_player == 3)
	&& (gamepad_button_check_pressed(global.player4_slot, gp_face3))
	{
		last_key = gp_face3;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_button_check_pressed(global.player1_slot, gp_face4))
	|| (remapping_player == 1)
	&& (gamepad_button_check_pressed(global.player2_slot, gp_face4))
	|| (remapping_player == 2)
	&& (gamepad_button_check_pressed(global.player3_slot, gp_face4))
	|| (remapping_player == 3)
	&& (gamepad_button_check_pressed(global.player4_slot, gp_face4))
	{
		last_key = gp_face4;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_button_check_pressed(global.player1_slot, gp_shoulderl))
	|| (remapping_player == 1)
	&& (gamepad_button_check_pressed(global.player2_slot, gp_shoulderl))
	|| (remapping_player == 2)
	&& (gamepad_button_check_pressed(global.player3_slot, gp_shoulderl))
	|| (remapping_player == 3)
	&& (gamepad_button_check_pressed(global.player4_slot, gp_shoulderl))
	{
		last_key = gp_shoulderl;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_button_check_pressed(global.player1_slot, gp_shoulderlb))
	|| (remapping_player == 1)
	&& (gamepad_button_check_pressed(global.player2_slot, gp_shoulderlb))
	|| (remapping_player == 2)
	&& (gamepad_button_check_pressed(global.player3_slot, gp_shoulderlb))
	|| (remapping_player == 3)
	&& (gamepad_button_check_pressed(global.player4_slot, gp_shoulderlb))
	{
		last_key = gp_shoulderlb;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_button_check_pressed(global.player1_slot, gp_shoulderr))
	|| (remapping_player == 1)
	&& (gamepad_button_check_pressed(global.player2_slot, gp_shoulderr))
	|| (remapping_player == 2)
	&& (gamepad_button_check_pressed(global.player3_slot, gp_shoulderr))
	|| (remapping_player == 3)
	&& (gamepad_button_check_pressed(global.player4_slot, gp_shoulderr))
	{
		last_key = gp_shoulderr;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_button_check_pressed(global.player1_slot, gp_shoulderrb))
	|| (remapping_player == 1)
	&& (gamepad_button_check_pressed(global.player2_slot, gp_shoulderrb))
	|| (remapping_player == 2)
	&& (gamepad_button_check_pressed(global.player3_slot, gp_shoulderrb))
	|| (remapping_player == 3)
	&& (gamepad_button_check_pressed(global.player4_slot, gp_shoulderrb))
	{
		last_key = gp_shoulderrb;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_button_check_pressed(global.player1_slot, gp_stickl))
	|| (remapping_player == 1)
	&& (gamepad_button_check_pressed(global.player2_slot, gp_stickl))
	|| (remapping_player == 2)
	&& (gamepad_button_check_pressed(global.player3_slot, gp_stickl))
	|| (remapping_player == 3)
	&& (gamepad_button_check_pressed(global.player4_slot, gp_stickl))
	{
		last_key = gp_stickl;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_button_check_pressed(global.player1_slot, gp_stickr))
	|| (remapping_player == 1)
	&& (gamepad_button_check_pressed(global.player2_slot, gp_stickr))
	|| (remapping_player == 2)
	&& (gamepad_button_check_pressed(global.player3_slot, gp_stickr))
	|| (remapping_player == 3)
	&& (gamepad_button_check_pressed(global.player4_slot, gp_stickr))
	{
		last_key = gp_stickr;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_button_check_pressed(global.player1_slot, gp_padu))
	|| (remapping_player == 1)
	&& (gamepad_button_check_pressed(global.player2_slot, gp_padu))
	|| (remapping_player == 2)
	&& (gamepad_button_check_pressed(global.player3_slot, gp_padu))
	|| (remapping_player == 3)
	&& (gamepad_button_check_pressed(global.player4_slot, gp_padu))
	|| (keyboard_check_pressed(vk_up))
	{
		last_key = gp_padu;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_button_check_pressed(global.player1_slot, gp_padd))
	|| (remapping_player == 1)
	&& (gamepad_button_check_pressed(global.player2_slot, gp_padd))
	|| (remapping_player == 2)
	&& (gamepad_button_check_pressed(global.player3_slot, gp_padd))
	|| (remapping_player == 3)
	&& (gamepad_button_check_pressed(global.player4_slot, gp_padd))
	|| (keyboard_check_pressed(vk_down))
	{
		last_key = gp_padd;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_button_check_pressed(global.player1_slot, gp_padl))
	|| (remapping_player == 1)
	&& (gamepad_button_check_pressed(global.player2_slot, gp_padl))
	|| (remapping_player == 2)
	&& (gamepad_button_check_pressed(global.player3_slot, gp_padl))
	|| (remapping_player == 3)
	&& (gamepad_button_check_pressed(global.player4_slot, gp_padl))
	|| (keyboard_check_pressed(vk_left))
	{
		last_key = gp_padl;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_button_check_pressed(global.player1_slot, gp_padr))
	|| (remapping_player == 1)
	&& (gamepad_button_check_pressed(global.player2_slot, gp_padr))
	|| (remapping_player == 2)
	&& (gamepad_button_check_pressed(global.player3_slot, gp_padr))
	|| (remapping_player == 3)
	&& (gamepad_button_check_pressed(global.player4_slot, gp_padr))
	|| (keyboard_check_pressed(vk_right))
	{
		last_key = gp_padr;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
	|| (remapping_player == 1)
	&& (gamepad_axis_value(global.player2_slot, gp_axislv) < 0)
	|| (remapping_player == 2)
	&& (gamepad_axis_value(global.player3_slot, gp_axislv) < 0)
	|| (remapping_player == 3)
	&& (gamepad_axis_value(global.player4_slot, gp_axislv) < 0)
	{
		last_key = joystick_value.joyleft_up;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_axis_value(global.player1_slot, gp_axislv) > 0)
	|| (remapping_player == 1)
	&& (gamepad_axis_value(global.player2_slot, gp_axislv) > 0)
	|| (remapping_player == 2)
	&& (gamepad_axis_value(global.player3_slot, gp_axislv) > 0)
	|| (remapping_player == 3)
	&& (gamepad_axis_value(global.player4_slot, gp_axislv) > 0)
	{
		last_key = joystick_value.joyleft_down;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_axis_value(global.player1_slot, gp_axislh) < 0)
	|| (remapping_player == 1)
	&& (gamepad_axis_value(global.player2_slot, gp_axislh) < 0)
	|| (remapping_player == 2)
	&& (gamepad_axis_value(global.player3_slot, gp_axislh) < 0)
	|| (remapping_player == 3)
	&& (gamepad_axis_value(global.player4_slot, gp_axislh) < 0)
	{
		last_key = joystick_value.joyleft_left;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_axis_value(global.player1_slot, gp_axislh) > 0)
	|| (remapping_player == 1)
	&& (gamepad_axis_value(global.player2_slot, gp_axislh) > 0)
	|| (remapping_player == 2)
	&& (gamepad_axis_value(global.player3_slot, gp_axislh) > 0)
	|| (remapping_player == 3)
	&& (gamepad_axis_value(global.player4_slot, gp_axislh) > 0)
	{
		last_key = joystick_value.joyleft_right;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_axis_value(global.player1_slot, gp_axisrv) < 0)
	|| (remapping_player == 1)
	&& (gamepad_axis_value(global.player2_slot, gp_axisrv) < 0)
	|| (remapping_player == 2)
	&& (gamepad_axis_value(global.player3_slot, gp_axisrv) < 0)
	|| (remapping_player == 3)
	&& (gamepad_axis_value(global.player4_slot, gp_axisrv) < 0)
	{
		last_key = joystick_value.joyright_up;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_axis_value(global.player1_slot, gp_axisrv) > 0)
	|| (remapping_player == 1)
	&& (gamepad_axis_value(global.player2_slot, gp_axisrv) > 0)
	|| (remapping_player == 2)
	&& (gamepad_axis_value(global.player3_slot, gp_axisrv) > 0)
	|| (remapping_player == 3)
	&& (gamepad_axis_value(global.player4_slot, gp_axisrv) > 0)
	{
		last_key = joystick_value.joyright_down;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_axis_value(global.player1_slot, gp_axisrh) < 0)
	|| (remapping_player == 1)
	&& (gamepad_axis_value(global.player2_slot, gp_axisrh) < 0)
	|| (remapping_player == 2)
	&& (gamepad_axis_value(global.player3_slot, gp_axisrh) < 0)
	|| (remapping_player == 3)
	&& (gamepad_axis_value(global.player4_slot, gp_axisrh) < 0)
	{
		last_key = joystick_value.joyright_left;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	&& (gamepad_axis_value(global.player1_slot, gp_axisrh) > 0)
	|| (remapping_player == 1)
	&& (gamepad_axis_value(global.player2_slot, gp_axisrh) > 0)
	|| (remapping_player == 2)
	&& (gamepad_axis_value(global.player3_slot, gp_axisrh) > 0)
	|| (remapping_player == 3)
	&& (gamepad_axis_value(global.player4_slot, gp_axisrh) > 0)
	{
		last_key = joystick_value.joyright_right;
		can_remap_key = true;
	}
	#endregion /* Check for player 1 button presses END */
	
	else
	
	if (keyboard_check_pressed(vk_escape))
	|| (remapping_player == 0)
	&& (gamepad_button_check(global.player1_slot, gp_start))
	|| (remapping_player == 1)
	&& (gamepad_button_check(global.player2_slot, gp_start))
	|| (remapping_player == 2)
	&& (gamepad_button_check(global.player3_slot, gp_start))
	|| (remapping_player == 3)
	&& (gamepad_button_check(global.player4_slot, gp_start))
	{
		last_key = noone;
		can_remap_key = true;
	}
	
	if (mouse_check_button_pressed(mb_right))
	
	|| (remapping_player == 0)
	&& (gamepad_button_check(global.player2_slot, global.player_[inp.gp][2][1][action.back]))
	|| (remapping_player == 0)
	&& (gamepad_button_check(global.player3_slot, global.player_[inp.gp][3][1][action.back]))
	|| (remapping_player == 0)
	&& (gamepad_button_check(global.player4_slot, global.player_[inp.gp][4][1][action.back]))
	
	|| (remapping_player == 1)
	&& (gamepad_button_check(global.player1_slot, global.player_[inp.gp][1][1][action.back]))
	|| (remapping_player == 1)
	&& (gamepad_button_check(global.player3_slot, global.player_[inp.gp][3][1][action.back]))
	|| (remapping_player == 1)
	&& (gamepad_button_check(global.player4_slot, global.player_[inp.gp][4][1][action.back]))
	
	|| (remapping_player == 2)
	&& (gamepad_button_check(global.player1_slot, global.player_[inp.gp][1][1][action.back]))
	|| (remapping_player == 2)
	&& (gamepad_button_check(global.player2_slot, global.player_[inp.gp][2][1][action.back]))
	|| (remapping_player == 2)
	&& (gamepad_button_check(global.player4_slot, global.player_[inp.gp][4][1][action.back]))
	
	|| (remapping_player == 3)
	&& (gamepad_button_check(global.player1_slot, global.player_[inp.gp][1][1][action.back]))
	|| (remapping_player == 3)
	&& (gamepad_button_check(global.player2_slot, global.player_[inp.gp][2][1][action.back]))
	|| (remapping_player == 3)
	&& (gamepad_button_check(global.player3_slot, global.player_[inp.gp][3][1][action.back]))
	{
		can_remap_key = false;
		input_key = false;
		menu_delay = 3;
	}
	
	#region /* Remapping Gamepad */
	if (menu_remap_key_number == 0)
	{
		var remap_key_number_string = "";
		var remap_key_number = 1;
	}
	else
	if (menu_remap_key_number == 2)
	{
		var remap_key_number_string = "2";
		var remap_key_number = 2;
	}
	
	if (can_remap_key)
	{
		/* global.player_[keyboard/gamepad][player][key1/key2][action] */
		if (menu == "remap_key_dive")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.dive] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_dive", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_jump")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.jump] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_jump", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_double_jump")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.double_jump] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_double_jump", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_crouch")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.crouch] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_crouch", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_crouch_toggle")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.crouch_toggle] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_crouch_toggle", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_sprint")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.sprint] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_sprint", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_sprint_toggle")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.sprint_toggle] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_sprint_toggle", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_left")
		{
			if (last_key == noone)
			&& (menu_remap_key_number == 0)
			{
				last_key = gp_padl;
			}
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.left] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_left", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_right")
		{
			if (last_key == noone)
			&& (menu_remap_key_number == 0)
			{
				last_key = gp_padr;
			}
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.right] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_right", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_down")
		{
			if (last_key == noone)
			&& (menu_remap_key_number == 0)
			{
				last_key = gp_padd;
			}
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.down] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_down", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_up")
		{
			if (last_key == noone)
			&& (menu_remap_key_number == 0)
			{
				last_key = gp_padu;
			}
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.up] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_up", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_tongue")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.tongue] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_tongue", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_zoom_in")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.zoom_in] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_zoom_in", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_zoom_out")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.zoom_out] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_zoom_out", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_accept")
		{
			if (last_key == noone)
			&& (menu_remap_key_number == 0)
			{
				if (os_type == os_switch)
				{
					last_key = gp_face2;
				}
				else
				{
					last_key = gp_face1;
				}
			}
			if (global.player_[inp.gp][remapping_player + 1][remap_key_number][action.back] == last_key)
			{
				global.player_[inp.gp][remapping_player + 1][remap_key_number][action.back] = global.player_[inp.gp][remapping_player + 1][remap_key_number][action.accept];
				ini_open(working_directory + "config.ini");
				ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_back", global.player_[inp.gp][remapping_player + 1][remap_key_number][action.accept]);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.accept] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_accept", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_back")
		{
			if (last_key == noone)
			&& (menu_remap_key_number == 0)
			{
				if (os_type == os_switch)
				{
					last_key = gp_face1;
				}
				else
				{
					last_key = gp_face2;
				}
			}
			if (global.player_[inp.gp][remapping_player + 1][remap_key_number][action.accept] == last_key)
			{
				global.player_[inp.gp][remapping_player + 1][remap_key_number][action.accept] = global.player_[inp.gp][remapping_player + 1][remap_key_number][action.back];
				ini_open(working_directory + "config.ini");
				ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_accept", global.player_[inp.gp][remapping_player + 1][remap_key_number][action.back]);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.back] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_back", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		can_remap_key = false;
		input_key = false;
		menu_delay = 3;
	}
	#endregion /* Remapping Gamepad END */
	
}
