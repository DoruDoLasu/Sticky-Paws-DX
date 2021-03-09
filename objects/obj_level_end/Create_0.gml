drag_object = false;
drag_release_timer = 0;
image_speed = 0.25;

if (global.character_select_in_this_menu="game")
and(file_exists("Levels/Level" + string(global.level_editor_level) + "/Data/level_information.ini"))
or(global.character_select_in_this_menu="level_editor")
and(file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Data/level_information.ini"))
{
	if (global.character_select_in_this_menu="game")
	{
		ini_open("Levels/Level" + string(global.level_editor_level) + "/Data/level_information.ini");
	}
	else
	if (global.character_select_in_this_menu="level_editor")
	{
		ini_open(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Data/level_information.ini");
	}
	
	if (ini_key_exists("Info", "level_end_x"))
	{
		x = ini_read_real("Info", "level_end_x", 0);
	}
	if (ini_key_exists("Info", "level_end_y"))
	{
		y = ini_read_real("Info", "level_end_y", 0);
	}
	ini_close();
}