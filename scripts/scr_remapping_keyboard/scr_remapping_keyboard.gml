function scr_remapping_keyboard()
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
	
	if (!keyboard_check_pressed(vk_escape))
	&& (keyboard_check_pressed(vk_anykey))
	{
		last_key = keyboard_lastkey;
		can_remap_key = true;
	}
	else
	if (mouse_check_button_pressed(mb_left))
	{
		last_key = mouse_button_value.mb_left;
		can_remap_key = true;
	}
	else
	if (mouse_check_button_pressed(mb_middle))
	{
		last_key = mouse_button_value.mb_middle;
		can_remap_key = true;
	}
	else
	if (mouse_check_button_pressed(mb_right))
	{
		last_key = mouse_button_value.mb_right;
		can_remap_key = true;
	}
	else
	if (mouse_check_button_pressed(mb_side1))
	{
		last_key = mouse_button_value.mb_side1;
		can_remap_key = true;
	}
	else
	if (mouse_check_button_pressed(mb_side2))
	{
		last_key = mouse_button_value.mb_side2;
		can_remap_key = true;
	}
	else
	if (mouse_wheel_down())
	{
		last_key = mouse_button_value.mwheel_down;
		can_remap_key = true;
	}
	else
	if (mouse_wheel_up())
	{
		last_key = mouse_button_value.mwheel_up;
		can_remap_key = true;
	}
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
	
	#region /* Remapping Keyboard */
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
			global.player_[inp.key][remapping_player + 1][remap_key_number][action.dive] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_key" + string(remap_key_number_string) + "_dive", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_jump")
		{
			global.player_[inp.key][remapping_player + 1][remap_key_number][action.jump] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_key" + string(remap_key_number_string) + "_jump", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_double_jump")
		{
			global.player_[inp.key][remapping_player + 1][remap_key_number][action.double_jump] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_key" + string(remap_key_number_string) + "_double_jump", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_crouch")
		{
			global.player_[inp.key][remapping_player + 1][remap_key_number][action.crouch] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_key" + string(remap_key_number_string) + "_crouch", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_crouch_toggle")
		{
			global.player_[inp.key][remapping_player + 1][remap_key_number][action.crouch_toggle] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_key" + string(remap_key_number_string) + "_crouch_toggle", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_sprint")
		{
			global.player_[inp.key][remapping_player + 1][remap_key_number][action.sprint] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_key" + string(remap_key_number_string) + "_sprint", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_sprint_toggle")
		{
			global.player_[inp.key][remapping_player + 1][remap_key_number][action.sprint_toggle] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_key" + string(remap_key_number_string) + "_sprint_toggle", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_left")
		{
			if (last_key == noone)
			&& (menu_remap_key_number == 0)
			{
				last_key = vk_left;
			}
			global.player_[inp.key][remapping_player + 1][remap_key_number][action.left] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_key" + string(remap_key_number_string) + "_left", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_right")
		{
			if (last_key == noone)
			&& (menu_remap_key_number == 0)
			{
				last_key = vk_right;
			}
			global.player_[inp.key][remapping_player + 1][remap_key_number][action.right] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_key" + string(remap_key_number_string) + "_right", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_down")
		{
			if (last_key == noone)
			&& (menu_remap_key_number == 0)
			{
				last_key = vk_down;
			}
			global.player_[inp.key][remapping_player + 1][remap_key_number][action.down] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_key" + string(remap_key_number_string) + "_down", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_up")
		{
			if (last_key == noone)
			&& (menu_remap_key_number == 0)
			{
				last_key = vk_up;
			}
			global.player_[inp.key][remapping_player + 1][remap_key_number][action.up] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_key" + string(remap_key_number_string) + "_up", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_tongue")
		{
			global.player_[inp.key][remapping_player + 1][remap_key_number][action.tongue] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_key" + string(remap_key_number_string) + "_tongue", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_zoom_in")
		{
			global.player_[inp.key][remapping_player + 1][remap_key_number][action.zoom_in] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_key" + string(remap_key_number_string) + "_zoom_in", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_zoom_out")
		{
			global.player_[inp.key][remapping_player + 1][remap_key_number][action.zoom_out] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_key" + string(remap_key_number_string) + "_zoom_out", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_accept")
		{
			if (last_key == noone)
			&& (menu_remap_key_number == 0)
			{
				last_key = ord("Z");
			}
			if (global.player_[inp.key][remapping_player + 1][remap_key_number][action.back] == last_key)
			{
				global.player_[inp.key][remapping_player + 1][remap_key_number][action.back] = global.player_[inp.key][remapping_player + 1][remap_key_number][action.accept];
				ini_open(working_directory + "config.ini");
				ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_key" + string(remap_key_number_string) + "_back", global.player_[inp.key][remapping_player + 1][remap_key_number][action.accept]);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
			global.player_[inp.key][remapping_player + 1][remap_key_number][action.accept] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_key" + string(remap_key_number_string) + "_accept", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (menu == "remap_key_back")
		{
			if (last_key == noone)
			&& (menu_remap_key_number == 0)
			{
				last_key = ord("X");
			}
			if (global.player_[inp.key][remapping_player + 1][remap_key_number][action.accept] == last_key)
			{
				global.player_[inp.key][remapping_player + 1][remap_key_number][action.accept] = global.player_[inp.key][remapping_player + 1][remap_key_number][action.back];
				ini_open(working_directory + "config.ini");
				ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_key" + string(remap_key_number_string) + "_accept", global.player_[inp.key][remapping_player + 1][remap_key_number][action.back]);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
			global.player_[inp.key][remapping_player + 1][remap_key_number][action.back] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile), "player" + string(remapping_player + 1) + "_key" + string(remap_key_number_string) + "_back", last_key);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		can_remap_key = false;
		input_key = false;
		menu_delay = 10;
	}
	#endregion /* Remapping Keyboard END */
	
}