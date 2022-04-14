/// @desc scr_initialize_resource_pack_sprite(string(argument0), sprite_variable);
/// @description scr_initialize_resource_pack_sprite(string(argument0), sprite_variable);
/// @arg string(argument0)
/// @arg sprite_variable
function scr_initialize_resource_pack_sprite(argument0, argument1)
{
	found_resource_sprite = false;
	
	#region /*Sprite Add*/
	index = 0;
	repeat(100) /*Must repeat enough times, if sprite_strip is too high for the repeat, then the sprite can't load at all*/
	{
		if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sprites/" + string(argument0) + "_strip" + string(index) + ".png"))
		{
			argument1 = sprite_add("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sprites/" + string(argument0) + "_strip" + string(index) + ".png", index, false, false, 0, 0);
			found_resource_sprite = true;
			break;
		}
		else
		if (file_exists(working_directory + "/custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sprites/" + string(argument0) + "_strip" + string(index) + ".png"))
		{
			argument1 = sprite_add(working_directory + "/custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sprites/" + string(argument0) + "_strip" + string(index) + ".png", index, false, false, 0, 0);
			found_resource_sprite = true;
			break;
		}
		index += 1;
	}
	if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sprites/" + string(argument0) + ".png"))
	{
		argument1 = sprite_add("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sprites/" + string(argument0) + ".png", 1, false, false, 0, 0);
		found_resource_sprite = true;
	}
	else
	if (file_exists(working_directory + "/custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sprites/" + string(argument0) + ".png"))
	{
		argument1 = sprite_add(working_directory + "/custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sprites/" + string(argument0) + ".png", 1, false, false, 0, 0);
		found_resource_sprite = true;
	}
	#endregion /*Sprite Add END*/
	
	#region /*Sprite Add Official Sprite*/
	if (found_resource_sprite = false)
	{
		index = 0;
		repeat(100) /*Must repeat enough times, if sprite_strip is too high for the repeat, then the sprite can't load at all*/
		{
			if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, 0)) + "/sprites/" + string(argument0) + "_strip" + string(index) + ".png"))
			{
				argument1 = sprite_add("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, 0)) + "/sprites/" + string(argument0) + "_strip" + string(index) + ".png", index, false, false, 0, 0);
				break;
			}
			index += 1;
		}
		if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sprites/" + string(argument0) + ".png"))
		{
			argument1 = sprite_add("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sprites/" + string(argument0) + ".png", 1, false, false, 0, 0);
		}
	}
	#endregion /*Sprite Add Official Sprite END*/
	
	#region /*Origin points*/
	if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/data/sprite_origin_point.ini"))
	and (found_resource_sprite = true)
	or (found_resource_sprite = true)
	{
		if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/data/sprite_origin_point.ini"))
		{
			ini_open("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/data/sprite_origin_point.ini");
			can_save_to_character_config = false; /*You can't save values to included files*/
		}
		else
		if (found_resource_sprite = true)
		{
			ini_open(working_directory + "/custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/data/sprite_origin_point.ini");
			can_save_to_character_config = true; /*You can save values to local appdata*/
		}
		
		#region /*x and y origin points*/
		if (ini_key_exists("sprite origin points", "sprite_" + string(argument0) + "_xorig"))
		and (ini_key_exists("sprite origin points", "sprite_" + string(argument0) + "_yorig"))
		{
			sprite_set_offset(argument1,
			ini_read_real("sprite origin points", "sprite_" + string(argument0) + "_xorig", sprite_get_width(argument1) / 2),
			ini_read_real("sprite origin points", "sprite_" + string(argument0) + "_yorig", sprite_get_height(argument1) / 2));
		}
		else
		if (ini_key_exists("sprite origin points", "sprite_" + string(argument0) + "_xorig"))
		and (!ini_key_exists("sprite origin points", "sprite_" + string(argument0) + "_yorig"))
		{
			if (can_save_to_character_config = true)
			{
				ini_write_real("sprite origin points", "sprite_" + string(argument0) + "_yorig", sprite_get_height(argument1) / 2);
			}
			sprite_set_offset(argument1,
			ini_read_real("sprite origin points", "sprite_" + string(argument0) + "_xorig", sprite_get_width(argument1) / 2),
			sprite_get_height(argument1) / 2);
		}
		else
		if (!ini_key_exists("sprite origin points", "sprite_" + string(argument0) + "_xorig"))
		and (ini_key_exists("sprite origin points", "sprite_" + string(argument0) + "_yorig"))
		{
			if (can_save_to_character_config = true)
			{
				ini_write_real("sprite origin points", "sprite_" + string(argument0) + "_xorig", sprite_get_width(argument1) / 2);
			}
			sprite_set_offset(argument1,
			sprite_get_width(argument1) / 2,
			ini_read_real("sprite origin points", "sprite_" + string(argument0) + "_yorig", sprite_get_height(argument1) / 2));
		}
		else
		{
			if (can_save_to_character_config = true)
			{
				ini_write_real("sprite origin points", "sprite_" + string(argument0) + "_xorig", sprite_get_width(argument1) / 2);
				ini_write_real("sprite origin points", "sprite_" + string(argument0) + "_yorig", sprite_get_height(argument1) / 2);
			}
			sprite_set_offset(argument1, sprite_get_width(argument1) / 2, sprite_get_height(argument1) / 2);
		}
		#endregion /*x and y origin points END*/
		
		ini_close();
	}
	#endregion /*Origin points END*/
	
	#region /*Origin points Official*/
	if (found_resource_sprite = false)
	{
		if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, 0)) + "/data/sprite_origin_point.ini"))
		{
			if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, 0)) + "/data/sprite_origin_point.ini"))
			{
				ini_open("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, 0)) + "/data/sprite_origin_point.ini");
				can_save_to_character_config = false; /*You can't save values to included files*/
			}
			
			#region /*x and y origin points*/
			if (ini_key_exists("sprite origin points", "sprite_" + string(argument0) + "_xorig"))
			and (ini_key_exists("sprite origin points", "sprite_" + string(argument0) + "_yorig"))
			{
				sprite_set_offset(argument1,
				ini_read_real("sprite origin points", "sprite_" + string(argument0) + "_xorig", sprite_get_width(argument1) / 2),
				ini_read_real("sprite origin points", "sprite_" + string(argument0) + "_yorig", sprite_get_height(argument1) / 2));
			}
			else
			if (ini_key_exists("sprite origin points", "sprite_" + string(argument0) + "_xorig"))
			and (!ini_key_exists("sprite origin points", "sprite_" + string(argument0) + "_yorig"))
			{
				sprite_set_offset(argument1,
				ini_read_real("sprite origin points", "sprite_" + string(argument0) + "_xorig", sprite_get_width(argument1) / 2),
				sprite_get_height(argument1) / 2);
			}
			else
			if (!ini_key_exists("sprite origin points", "sprite_" + string(argument0) + "_xorig"))
			and (ini_key_exists("sprite origin points", "sprite_" + string(argument0) + "_yorig"))
			{
				sprite_set_offset(argument1,
				sprite_get_width(argument1) / 2,
				ini_read_real("sprite origin points", "sprite_" + string(argument0) + "_yorig", sprite_get_height(argument1) / 2));
			}
			else
			{
				sprite_set_offset(argument1, sprite_get_width(argument1) / 2, sprite_get_height(argument1) / 2);
			}
			#endregion /*x and y origin points END*/
		
			ini_close();
		}
	}
	#endregion /*Origin points Official END*/
	
	return (argument1);
}