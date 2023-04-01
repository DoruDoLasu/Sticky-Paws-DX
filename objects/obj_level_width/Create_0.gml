depth = -100;
drag_object = false;
drag_release_timer = 0;
image_speed = 0.25;

if (global.character_select_in_this_menu == "main_game")
and (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini"))
or (global.character_select_in_this_menu == "level_editor")
and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
{
	if (global.character_select_in_this_menu == "main_game")
	{
		ini_open("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini");
	}
	else
	if (global.character_select_in_this_menu == "level_editor")
	{
		ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
	}
	
	if (ini_key_exists("info", "level_width"))
	{
		x = ini_read_real("info", "level_width", 0);
	}
	ini_close();
}