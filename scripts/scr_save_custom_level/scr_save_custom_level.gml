function scr_save_custom_level()
{
	instance_activate_all(); /* Make sure all objects are activated before saving */
	
	#region /* Save Custom Level */
	if (global.character_select_in_this_menu == "level_editor")
	{
		
		#region /* Create directory for saving custom levels */
		if (global.select_level_index >= 1)
		and (global.create_level_from_template == false)
		and (!directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))))
		{
			directory_create(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)));
		}
		else
		if (global.level_name != "")
		and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name)))
		{
			directory_create(working_directory + "/custom_levels/" + string(global.level_name));
		}
		#endregion /* Create directory for saving custom levels END */
		
		#region /* Save object placement */
		var file, str;
		if (global.select_level_index >= 1)
		and (global.create_level_from_template == false)
		{
			file = file_text_open_write(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/object_placement_all.txt"); /* Open file for writing */
		}
		else
		if (global.level_name != "")
		{
			file = file_text_open_write(working_directory + "/custom_levels/" + string(global.level_name) + "/data/object_placement_all.txt"); /* Open file for writing */
		}
		str = ""; /* Reset string var */
		
		#region /* Write all objects to file */
		with(obj_leveleditor_placed_object)
		{
			if (easy == false)
			and (normal == false)
			and (hard == false)
			{
				instance_destroy();
			}
			
			str += string(x) + "X" + string(y) + "Y" + string(object) + "O";
			
			//if (easy == false)
			//{
				str += string(easy) + "E";
			//}
			//if (normal == false)
			//{
				str += string(normal) + "N";
			//}
			//if (hard == false)
			//{
				str += string(hard) + "H";
			//}
			
			if (object == level_object_id.id_spring)
			or (object == level_object_id.id_door)
			or (object == level_object_id.id_water_level_change_slow)
			or (object == level_object_id.id_water_level_change_fast)
			or (object == level_object_id.id_water_level_change_faster)
			or (object == level_object_id.id_arrow_sign)
			or (object == level_object_id.id_arrow_sign_small)
			or (object == level_object_id.id_water)
			{
				if (!second_x = 0)
				{
					str += string(second_x) + "Q";
				}
				if (!second_y = 0)
				{
					str += string(second_y) + "W";
				}
			}
			
			/* | = chr("124") */
			/* } = chr("125") */
			str += "|";
		}
		#endregion /* Write all objects to file END */
		
		file_text_write_string(file, str); /* Write string with wall information to file and start a new line */
		file_text_close(file);
		#endregion /* Save object placement END */
		
		#region /* Save Level Information */
		if (global.character_select_in_this_menu == "level_editor") /* Only save this if you're in the level editor, otherwise level folders for main game will be created in AppData */
		{
			if (global.select_level_index >= 1)
			and (global.create_level_from_template == false)
			{
				ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini");
			}
			else
			if (global.level_name != "")
			{
				ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			}
			if (!ini_key_exists("info", "first_created_on_version")) /* Check if there isn't already a version number saved. Only save this information once, so the number never changes */
			{
				ini_write_string("info", "first_created_on_version", "v" + string(scr_get_build_date()));
			}
			ini_write_real("info", "clear_check", false); /* When saving custom level, then the player has to do a clear check all over again, to ensure you can't just do a clear check and edit the level afterwards */
			ini_write_real("info", "make_every_tileset_into_default_tileset", global.make_every_tileset_into_default_tileset);
			if (instance_exists(obj_level_player_1_start))
			{
				ini_write_real("info", "level_player_1_start_x", obj_level_player_1_start.x);
			}
			if (instance_exists(obj_level_player_1_start))
			{
				ini_write_real("info", "level_player_1_start_y", obj_level_player_1_start.y);
			}
			if (instance_exists(obj_level_player_2_start))
			{
				ini_write_real("info", "level_player_2_start_x", obj_level_player_2_start.x);
			}
			if (instance_exists(obj_level_player_2_start))
			{
				ini_write_real("info", "level_player_2_start_y", obj_level_player_2_start.y);
			}
			if (instance_exists(obj_level_player_3_start))
			{
				ini_write_real("info", "level_player_3_start_x", obj_level_player_3_start.x);
			}
			if (instance_exists(obj_level_player_3_start))
			{
				ini_write_real("info", "level_player_3_start_y", obj_level_player_3_start.y);
			}
			if (instance_exists(obj_level_player_4_start))
			{
				ini_write_real("info", "level_player_4_start_x", obj_level_player_4_start.x);
			}
			if (instance_exists(obj_level_player_4_start))
			{
				ini_write_real("info", "level_player_4_start_y", obj_level_player_4_start.y);
			}
			if (instance_exists(obj_level_end))
			{
				ini_write_real("info", "level_end_x", obj_level_end.x);
			}
			if (instance_exists(obj_level_end))
			{
				ini_write_real("info", "level_end_y", obj_level_end.y);
			}
			if (instance_exists(obj_level_height))
			{
				ini_write_real("info", "level_height", obj_level_height.y);
			}
			if (instance_exists(obj_level_width))
			{
				ini_write_real("info", "level_width", obj_level_width.x);
			}
			if (instance_exists(obj_water_level_height))
			{
				ini_write_real("info", "water_level_height", obj_water_level_height.y);
			}
			ini_write_real("info", "view_xview", camera_get_view_x(view_camera[view_current]));
			ini_write_real("info", "view_yview", camera_get_view_y(view_camera[view_current]));
			ini_close();
		}
		#endregion /* Save Level Information END */
	
	}

	#endregion /* Save Custom Level END */
}