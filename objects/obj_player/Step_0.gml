///Platformer Player Part 1

if (current_file != global.file)
or(!file_exists(working_directory + "save_files/file" + string(current_file) + ".ini"))
{
	current_file = global.file;
	room_persistent = false;
	global.quit_level = true;
	global.quit_to_map = true;
}

#region /*Save whole level as screenshot png file*/
if (global.full_level_map_screenshot = true)
and (full_level_map_screenshot_timer <= 0)
{
	can_move = false; /*Make it so you can't move while game is generating a full level map screenshot, so you can't mess with the screenshot*/
	instance_activate_all();
	
	#region /*Delete some objects so it doesn't show up in the screenshot*/
	if (asset_get_type("obj_camera") == asset_object)
	and (instance_exists(obj_camera))
	{
		instance_destroy(obj_camera);
	}
	#endregion /*Delete some objects so it doesn't show up in the screenshot END*/
	
	camera_set_view_border(view_camera[view_current], room_width, room_height); /*View Border*/
	camera_set_view_pos(view_camera[view_current], 0, 0);
	camera_set_view_size(view_camera[view_current], room_width, room_height);
	display_set_gui_size(room_width, room_height);
	surface_resize(application_surface, room_width, room_height);
	window_set_rectangle(0, 0, room_width, room_height);
	full_level_map_screenshot_timer = 1;
}
if (full_level_map_screenshot_timer >= 1)
{
	full_level_map_screenshot_timer += 1;
}
if (full_level_map_screenshot_timer = 15)
{
	var custom_level_map_sprite;
	custom_level_map_sprite = sprite_create_from_surface(application_surface, 0, 0, room_width, room_height, false, false, 0, 0);
	if (global.character_select_in_this_menu = "level_editor")
	and (global.select_level_index <= 0)
	or(global.character_select_in_this_menu = "level_editor")
	and (global.create_level_from_template >= 2)
	{
		sprite_save(custom_level_map_sprite, 0, working_directory + "/custom_levels/" + string(global.level_name) + "/full_level_map.png");
	}
	else
	if (global.character_select_in_this_menu = "level_editor")
	{
		sprite_save(custom_level_map_sprite, 0, working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/full_level_map.png");
	}
	sprite_delete(custom_level_map_sprite);
}
if (full_level_map_screenshot_timer = 20)
{
	camera_set_view_border(view_camera[view_current], 1920, 1080); /*View Border*/
	camera_set_view_pos(view_camera[view_current], x, y);
	camera_set_view_size(view_camera[view_current], 1920, 1080);
	display_set_gui_size(1920, 1080);
	surface_resize(application_surface, 1920, 1080);
	window_set_rectangle(0, 0, 1920, 1080);
	scr_set_screen_size();
	instance_create_depth(x, y, 0, obj_camera);
	global.full_level_map_screenshot = false;
	global.actually_play_edited_level = false;
	global.play_edited_level = false;
	full_level_map_screenshot_timer = 0;
	can_move = true;
	room_restart();
}
#endregion /*Save whole level as screenshot png file END*/

#region /*Choose to play voice clips randomly*/

#region /*Wall jump sound variation*/
if (voice_wall_jump_1> noone)
and (voice_wall_jump_2 = noone)
and (voice_wall_jump_3 = noone)
and (voice_wall_jump_4 = noone)
and (voice_wall_jump_5 = noone)
and (voice_wall_jump_6= noone)
and (voice_wall_jump_7= noone)
and (voice_wall_jump_8= noone)
and (voice_wall_jump_9= noone)
and (voice_wall_jump_10 = noone)
and (voice_wall_jump_11 = noone)
and (voice_wall_jump_12 = noone)
and (voice_wall_jump_13 = noone)
and (voice_wall_jump_14 = noone)
and (voice_wall_jump_15 = noone)
and (voice_wall_jump_16 = noone)
and (voice_wall_jump_17 = noone)
and (voice_wall_jump_18 = noone)
and (voice_wall_jump_19 = noone)
and (voice_wall_jump_20 = noone)
{
	voice_wallkick= voice_wall_jump_1;
}
else
if (voice_wall_jump_1> noone)
and (voice_wall_jump_2> noone)
and (voice_wall_jump_3 = noone)
and (voice_wall_jump_4 = noone)
and (voice_wall_jump_5 = noone)
and (voice_wall_jump_6= noone)
and (voice_wall_jump_7= noone)
and (voice_wall_jump_8= noone)
and (voice_wall_jump_9= noone)
and (voice_wall_jump_10 = noone)
and (voice_wall_jump_11 = noone)
and (voice_wall_jump_12 = noone)
and (voice_wall_jump_13 = noone)
and (voice_wall_jump_14 = noone)
and (voice_wall_jump_15 = noone)
and (voice_wall_jump_16 = noone)
and (voice_wall_jump_17 = noone)
and (voice_wall_jump_18 = noone)
and (voice_wall_jump_19 = noone)
and (voice_wall_jump_20 = noone)
{
	voice_wallkick= choose(voice_wall_jump_1,
						voice_wall_jump_2);
}
else
if (voice_wall_jump_1> noone)
and (voice_wall_jump_2> noone)
and (voice_wall_jump_3> noone)
and (voice_wall_jump_4 = noone)
and (voice_wall_jump_5 = noone)
and (voice_wall_jump_6= noone)
and (voice_wall_jump_7= noone)
and (voice_wall_jump_8= noone)
and (voice_wall_jump_9= noone)
and (voice_wall_jump_10 = noone)
and (voice_wall_jump_11 = noone)
and (voice_wall_jump_12 = noone)
and (voice_wall_jump_13 = noone)
and (voice_wall_jump_14 = noone)
and (voice_wall_jump_15 = noone)
and (voice_wall_jump_16 = noone)
and (voice_wall_jump_17 = noone)
and (voice_wall_jump_18 = noone)
and (voice_wall_jump_19 = noone)
and (voice_wall_jump_20 = noone)
{
	voice_wallkick= choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3);
}
else
if (voice_wall_jump_1> noone)
and (voice_wall_jump_2> noone)
and (voice_wall_jump_3> noone)
and (voice_wall_jump_4> noone)
and (voice_wall_jump_5 = noone)
and (voice_wall_jump_6= noone)
and (voice_wall_jump_7= noone)
and (voice_wall_jump_8= noone)
and (voice_wall_jump_9= noone)
and (voice_wall_jump_10 = noone)
and (voice_wall_jump_11 = noone)
and (voice_wall_jump_12 = noone)
and (voice_wall_jump_13 = noone)
and (voice_wall_jump_14 = noone)
and (voice_wall_jump_15 = noone)
and (voice_wall_jump_16 = noone)
and (voice_wall_jump_17 = noone)
and (voice_wall_jump_18 = noone)
and (voice_wall_jump_19 = noone)
and (voice_wall_jump_20 = noone)
{
	voice_wallkick= choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4);
}
else
if (voice_wall_jump_1> noone)
and (voice_wall_jump_2> noone)
and (voice_wall_jump_3> noone)
and (voice_wall_jump_4> noone)
and (voice_wall_jump_5> noone)
and (voice_wall_jump_6= noone)
and (voice_wall_jump_7= noone)
and (voice_wall_jump_8= noone)
and (voice_wall_jump_9= noone)
and (voice_wall_jump_10 = noone)
and (voice_wall_jump_11 = noone)
and (voice_wall_jump_12 = noone)
and (voice_wall_jump_13 = noone)
and (voice_wall_jump_14 = noone)
and (voice_wall_jump_15 = noone)
and (voice_wall_jump_16 = noone)
and (voice_wall_jump_17 = noone)
and (voice_wall_jump_18 = noone)
and (voice_wall_jump_19 = noone)
and (voice_wall_jump_20 = noone)
{
	voice_wallkick= choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5);
}
else
if (voice_wall_jump_1> noone)
and (voice_wall_jump_2> noone)
and (voice_wall_jump_3> noone)
and (voice_wall_jump_4> noone)
and (voice_wall_jump_5> noone)
and (voice_wall_jump_6> noone)
and (voice_wall_jump_7= noone)
and (voice_wall_jump_8= noone)
and (voice_wall_jump_9= noone)
and (voice_wall_jump_10 = noone)
and (voice_wall_jump_11 = noone)
and (voice_wall_jump_12 = noone)
and (voice_wall_jump_13 = noone)
and (voice_wall_jump_14 = noone)
and (voice_wall_jump_15 = noone)
and (voice_wall_jump_16 = noone)
and (voice_wall_jump_17 = noone)
and (voice_wall_jump_18 = noone)
and (voice_wall_jump_19 = noone)
and (voice_wall_jump_20 = noone)
{
	voice_wallkick= choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5,
						voice_wall_jump_6);
}
else
if (voice_wall_jump_1> noone)
and (voice_wall_jump_2> noone)
and (voice_wall_jump_3> noone)
and (voice_wall_jump_4> noone)
and (voice_wall_jump_5> noone)
and (voice_wall_jump_6> noone)
and (voice_wall_jump_7> noone)
and (voice_wall_jump_8= noone)
and (voice_wall_jump_9= noone)
and (voice_wall_jump_10 = noone)
and (voice_wall_jump_11 = noone)
and (voice_wall_jump_12 = noone)
and (voice_wall_jump_13 = noone)
and (voice_wall_jump_14 = noone)
and (voice_wall_jump_15 = noone)
and (voice_wall_jump_16 = noone)
and (voice_wall_jump_17 = noone)
and (voice_wall_jump_18 = noone)
and (voice_wall_jump_19 = noone)
and (voice_wall_jump_20 = noone)
{
	voice_wallkick= choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5,
						voice_wall_jump_6,
						voice_wall_jump_7);
}
else
if (voice_wall_jump_1> noone)
and (voice_wall_jump_2> noone)
and (voice_wall_jump_3> noone)
and (voice_wall_jump_4> noone)
and (voice_wall_jump_5> noone)
and (voice_wall_jump_6> noone)
and (voice_wall_jump_7> noone)
and (voice_wall_jump_8> noone)
and (voice_wall_jump_9= noone)
and (voice_wall_jump_10 = noone)
and (voice_wall_jump_11 = noone)
and (voice_wall_jump_12 = noone)
and (voice_wall_jump_13 = noone)
and (voice_wall_jump_14 = noone)
and (voice_wall_jump_15 = noone)
and (voice_wall_jump_16 = noone)
and (voice_wall_jump_17 = noone)
and (voice_wall_jump_18 = noone)
and (voice_wall_jump_19 = noone)
and (voice_wall_jump_20 = noone)
{
	voice_wallkick= choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5,
						voice_wall_jump_6,
						voice_wall_jump_7,
						voice_wall_jump_8);
}
else
if (voice_wall_jump_1> noone)
and (voice_wall_jump_2> noone)
and (voice_wall_jump_3> noone)
and (voice_wall_jump_4> noone)
and (voice_wall_jump_5> noone)
and (voice_wall_jump_6> noone)
and (voice_wall_jump_7> noone)
and (voice_wall_jump_8> noone)
and (voice_wall_jump_9> noone)
and (voice_wall_jump_10 = noone)
and (voice_wall_jump_11 = noone)
and (voice_wall_jump_12 = noone)
and (voice_wall_jump_13 = noone)
and (voice_wall_jump_14 = noone)
and (voice_wall_jump_15 = noone)
and (voice_wall_jump_16 = noone)
and (voice_wall_jump_17 = noone)
and (voice_wall_jump_18 = noone)
and (voice_wall_jump_19 = noone)
and (voice_wall_jump_20 = noone)
{
	voice_wallkick= choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5,
						voice_wall_jump_6,
						voice_wall_jump_7,
						voice_wall_jump_8,
						voice_wall_jump_9);
}
else
if (voice_wall_jump_1> noone)
and (voice_wall_jump_2> noone)
and (voice_wall_jump_3> noone)
and (voice_wall_jump_4> noone)
and (voice_wall_jump_5> noone)
and (voice_wall_jump_6> noone)
and (voice_wall_jump_7> noone)
and (voice_wall_jump_8> noone)
and (voice_wall_jump_9> noone)
and (voice_wall_jump_10 > noone)
and (voice_wall_jump_11 = noone)
and (voice_wall_jump_12 = noone)
and (voice_wall_jump_13 = noone)
and (voice_wall_jump_14 = noone)
and (voice_wall_jump_15 = noone)
and (voice_wall_jump_16 = noone)
and (voice_wall_jump_17 = noone)
and (voice_wall_jump_18 = noone)
and (voice_wall_jump_19 = noone)
and (voice_wall_jump_20 = noone)
{
	voice_wallkick= choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5,
						voice_wall_jump_6,
						voice_wall_jump_7,
						voice_wall_jump_8,
						voice_wall_jump_9,
						voice_wall_jump_10);
}
else
if (voice_wall_jump_1> noone)
and (voice_wall_jump_2> noone)
and (voice_wall_jump_3> noone)
and (voice_wall_jump_4> noone)
and (voice_wall_jump_5> noone)
and (voice_wall_jump_6> noone)
and (voice_wall_jump_7> noone)
and (voice_wall_jump_8> noone)
and (voice_wall_jump_9> noone)
and (voice_wall_jump_10 > noone)
and (voice_wall_jump_11 > noone)
and (voice_wall_jump_12 = noone)
and (voice_wall_jump_13 = noone)
and (voice_wall_jump_14 = noone)
and (voice_wall_jump_15 = noone)
and (voice_wall_jump_16 = noone)
and (voice_wall_jump_17 = noone)
and (voice_wall_jump_18 = noone)
and (voice_wall_jump_19 = noone)
and (voice_wall_jump_20 = noone)
{
	voice_wallkick= choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5,
						voice_wall_jump_6,
						voice_wall_jump_7,
						voice_wall_jump_8,
						voice_wall_jump_9,
						voice_wall_jump_10,
						voice_wall_jump_11);
}
else
if (voice_wall_jump_1> noone)
and (voice_wall_jump_2> noone)
and (voice_wall_jump_3> noone)
and (voice_wall_jump_4> noone)
and (voice_wall_jump_5> noone)
and (voice_wall_jump_6> noone)
and (voice_wall_jump_7> noone)
and (voice_wall_jump_8> noone)
and (voice_wall_jump_9> noone)
and (voice_wall_jump_10 > noone)
and (voice_wall_jump_11 > noone)
and (voice_wall_jump_12 > noone)
and (voice_wall_jump_13 = noone)
and (voice_wall_jump_14 = noone)
and (voice_wall_jump_15 = noone)
and (voice_wall_jump_16 = noone)
and (voice_wall_jump_17 = noone)
and (voice_wall_jump_18 = noone)
and (voice_wall_jump_19 = noone)
and (voice_wall_jump_20 = noone)
{
	voice_wallkick= choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5,
						voice_wall_jump_6,
						voice_wall_jump_7,
						voice_wall_jump_8,
						voice_wall_jump_9,
						voice_wall_jump_10,
						voice_wall_jump_11,
						voice_wall_jump_12);
}
else
if (voice_wall_jump_1> noone)
and (voice_wall_jump_2> noone)
and (voice_wall_jump_3> noone)
and (voice_wall_jump_4> noone)
and (voice_wall_jump_5> noone)
and (voice_wall_jump_6> noone)
and (voice_wall_jump_7> noone)
and (voice_wall_jump_8> noone)
and (voice_wall_jump_9> noone)
and (voice_wall_jump_10 > noone)
and (voice_wall_jump_11 > noone)
and (voice_wall_jump_12 > noone)
and (voice_wall_jump_13 > noone)
and (voice_wall_jump_14 = noone)
and (voice_wall_jump_15 = noone)
and (voice_wall_jump_16 = noone)
and (voice_wall_jump_17 = noone)
and (voice_wall_jump_18 = noone)
and (voice_wall_jump_19 = noone)
and (voice_wall_jump_20 = noone)
{
	voice_wallkick= choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5,
						voice_wall_jump_6,
						voice_wall_jump_7,
						voice_wall_jump_8,
						voice_wall_jump_9,
						voice_wall_jump_10,
						voice_wall_jump_11,
						voice_wall_jump_12,
						voice_wall_jump_13);
}
else
if (voice_wall_jump_1> noone)
and (voice_wall_jump_2> noone)
and (voice_wall_jump_3> noone)
and (voice_wall_jump_4> noone)
and (voice_wall_jump_5> noone)
and (voice_wall_jump_6> noone)
and (voice_wall_jump_7> noone)
and (voice_wall_jump_8> noone)
and (voice_wall_jump_9> noone)
and (voice_wall_jump_10 > noone)
and (voice_wall_jump_11 > noone)
and (voice_wall_jump_12 > noone)
and (voice_wall_jump_13 > noone)
and (voice_wall_jump_14 > noone)
and (voice_wall_jump_15 = noone)
and (voice_wall_jump_16 = noone)
and (voice_wall_jump_17 = noone)
and (voice_wall_jump_18 = noone)
and (voice_wall_jump_19 = noone)
and (voice_wall_jump_20 = noone)
{
	voice_wallkick= choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5,
						voice_wall_jump_6,
						voice_wall_jump_7,
						voice_wall_jump_8,
						voice_wall_jump_9,
						voice_wall_jump_10,
						voice_wall_jump_11,
						voice_wall_jump_12,
						voice_wall_jump_13,
						voice_wall_jump_14);
}
else
if (voice_wall_jump_1> noone)
and (voice_wall_jump_2> noone)
and (voice_wall_jump_3> noone)
and (voice_wall_jump_4> noone)
and (voice_wall_jump_5> noone)
and (voice_wall_jump_6> noone)
and (voice_wall_jump_7> noone)
and (voice_wall_jump_8> noone)
and (voice_wall_jump_9> noone)
and (voice_wall_jump_10 > noone)
and (voice_wall_jump_11 > noone)
and (voice_wall_jump_12 > noone)
and (voice_wall_jump_13 > noone)
and (voice_wall_jump_14 > noone)
and (voice_wall_jump_15 > noone)
and (voice_wall_jump_16 = noone)
and (voice_wall_jump_17 = noone)
and (voice_wall_jump_18 = noone)
and (voice_wall_jump_19 = noone)
and (voice_wall_jump_20 = noone)
{
	voice_wallkick= choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5,
						voice_wall_jump_6,
						voice_wall_jump_7,
						voice_wall_jump_8,
						voice_wall_jump_9,
						voice_wall_jump_10,
						voice_wall_jump_11,
						voice_wall_jump_12,
						voice_wall_jump_13,
						voice_wall_jump_14,
						voice_wall_jump_15);
}
else
if (voice_wall_jump_1> noone)
and (voice_wall_jump_2> noone)
and (voice_wall_jump_3> noone)
and (voice_wall_jump_4> noone)
and (voice_wall_jump_5> noone)
and (voice_wall_jump_6> noone)
and (voice_wall_jump_7> noone)
and (voice_wall_jump_8> noone)
and (voice_wall_jump_9> noone)
and (voice_wall_jump_10 > noone)
and (voice_wall_jump_11 > noone)
and (voice_wall_jump_12 > noone)
and (voice_wall_jump_13 > noone)
and (voice_wall_jump_14 > noone)
and (voice_wall_jump_15 > noone)
and (voice_wall_jump_16 > noone)
and (voice_wall_jump_17 = noone)
and (voice_wall_jump_18 = noone)
and (voice_wall_jump_19 = noone)
and (voice_wall_jump_20 = noone)
{
	voice_wallkick= choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5,
						voice_wall_jump_6,
						voice_wall_jump_7,
						voice_wall_jump_8,
						voice_wall_jump_9,
						voice_wall_jump_10,
						voice_wall_jump_11,
						voice_wall_jump_12,
						voice_wall_jump_13,
						voice_wall_jump_14,
						voice_wall_jump_15,
						voice_wall_jump_16);
}
else
if (voice_wall_jump_1> noone)
and (voice_wall_jump_2> noone)
and (voice_wall_jump_3> noone)
and (voice_wall_jump_4> noone)
and (voice_wall_jump_5> noone)
and (voice_wall_jump_6> noone)
and (voice_wall_jump_7> noone)
and (voice_wall_jump_8> noone)
and (voice_wall_jump_9> noone)
and (voice_wall_jump_10 > noone)
and (voice_wall_jump_11 > noone)
and (voice_wall_jump_12 > noone)
and (voice_wall_jump_13 > noone)
and (voice_wall_jump_14 > noone)
and (voice_wall_jump_15 > noone)
and (voice_wall_jump_16 > noone)
and (voice_wall_jump_17 > noone)
and (voice_wall_jump_18 = noone)
and (voice_wall_jump_19 = noone)
and (voice_wall_jump_20 = noone)
{
	voice_wallkick= choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5,
						voice_wall_jump_6,
						voice_wall_jump_7,
						voice_wall_jump_8,
						voice_wall_jump_9,
						voice_wall_jump_10,
						voice_wall_jump_11,
						voice_wall_jump_12,
						voice_wall_jump_13,
						voice_wall_jump_14,
						voice_wall_jump_15,
						voice_wall_jump_16,
						voice_wall_jump_17);
}
else
if (voice_wall_jump_1> noone)
and (voice_wall_jump_2> noone)
and (voice_wall_jump_3> noone)
and (voice_wall_jump_4> noone)
and (voice_wall_jump_5> noone)
and (voice_wall_jump_6> noone)
and (voice_wall_jump_7> noone)
and (voice_wall_jump_8> noone)
and (voice_wall_jump_9> noone)
and (voice_wall_jump_10 > noone)
and (voice_wall_jump_11 > noone)
and (voice_wall_jump_12 > noone)
and (voice_wall_jump_13 > noone)
and (voice_wall_jump_14 > noone)
and (voice_wall_jump_15 > noone)
and (voice_wall_jump_16 > noone)
and (voice_wall_jump_17 > noone)
and (voice_wall_jump_18 > noone)
and (voice_wall_jump_19 = noone)
and (voice_wall_jump_20 = noone)
{
	voice_wallkick= choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5,
						voice_wall_jump_6,
						voice_wall_jump_7,
						voice_wall_jump_8,
						voice_wall_jump_9,
						voice_wall_jump_10,
						voice_wall_jump_11,
						voice_wall_jump_12,
						voice_wall_jump_13,
						voice_wall_jump_14,
						voice_wall_jump_15,
						voice_wall_jump_16,
						voice_wall_jump_17,
						voice_wall_jump_18);
}
else
if (voice_wall_jump_1> noone)
and (voice_wall_jump_2> noone)
and (voice_wall_jump_3> noone)
and (voice_wall_jump_4> noone)
and (voice_wall_jump_5> noone)
and (voice_wall_jump_6> noone)
and (voice_wall_jump_7> noone)
and (voice_wall_jump_8> noone)
and (voice_wall_jump_9> noone)
and (voice_wall_jump_10 > noone)
and (voice_wall_jump_11 > noone)
and (voice_wall_jump_12 > noone)
and (voice_wall_jump_13 > noone)
and (voice_wall_jump_14 > noone)
and (voice_wall_jump_15 > noone)
and (voice_wall_jump_16 > noone)
and (voice_wall_jump_17 > noone)
and (voice_wall_jump_18 > noone)
and (voice_wall_jump_19 > noone)
and (voice_wall_jump_20 = noone)
{
	voice_wallkick= choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5,
						voice_wall_jump_6,
						voice_wall_jump_7,
						voice_wall_jump_8,
						voice_wall_jump_9,
						voice_wall_jump_10,
						voice_wall_jump_11,
						voice_wall_jump_12,
						voice_wall_jump_13,
						voice_wall_jump_14,
						voice_wall_jump_15,
						voice_wall_jump_16,
						voice_wall_jump_17,
						voice_wall_jump_18,
						voice_wall_jump_19);
}
else
if (voice_wall_jump_1> noone)
and (voice_wall_jump_2> noone)
and (voice_wall_jump_3> noone)
and (voice_wall_jump_4> noone)
and (voice_wall_jump_5> noone)
and (voice_wall_jump_6> noone)
and (voice_wall_jump_7> noone)
and (voice_wall_jump_8> noone)
and (voice_wall_jump_9> noone)
and (voice_wall_jump_10 > noone)
and (voice_wall_jump_11 > noone)
and (voice_wall_jump_12 > noone)
and (voice_wall_jump_13 > noone)
and (voice_wall_jump_14 > noone)
and (voice_wall_jump_15 > noone)
and (voice_wall_jump_16 > noone)
and (voice_wall_jump_17 > noone)
and (voice_wall_jump_18 > noone)
and (voice_wall_jump_19 > noone)
and (voice_wall_jump_20 > noone)
{
	voice_wallkick= choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5,
						voice_wall_jump_6,
						voice_wall_jump_7,
						voice_wall_jump_8,
						voice_wall_jump_9,
						voice_wall_jump_10,
						voice_wall_jump_11,
						voice_wall_jump_12,
						voice_wall_jump_13,
						voice_wall_jump_14,
						voice_wall_jump_15,
						voice_wall_jump_16,
						voice_wall_jump_17,
						voice_wall_jump_18,
						voice_wall_jump_19,
						voice_wall_jump_20);
}
#endregion /*Wall jump sound variation END*/

#region /*Start running sound variation*/
if (voice_start_running_1> noone)
and (voice_start_running_2 = noone)
and (voice_start_running_3 = noone)
and (voice_start_running_4 = noone)
and (voice_start_running_5 = noone)
and (voice_start_running_6= noone)
and (voice_start_running_7= noone)
and (voice_start_running_8= noone)
and (voice_start_running_9= noone)
and (voice_start_running_10 = noone)
{
	voice_startdash = voice_start_running_1;
}
else
if (voice_start_running_1> noone)
and (voice_start_running_2> noone)
and (voice_start_running_3 = noone)
and (voice_start_running_4 = noone)
and (voice_start_running_5 = noone)
and (voice_start_running_6= noone)
and (voice_start_running_7= noone)
and (voice_start_running_8= noone)
and (voice_start_running_9= noone)
and (voice_start_running_10 = noone)
{
	voice_startdash = choose(voice_start_running_1,
						voice_start_running_2);
}
else
if (voice_start_running_1> noone)
and (voice_start_running_2> noone)
and (voice_start_running_3> noone)
and (voice_start_running_4 = noone)
and (voice_start_running_5 = noone)
and (voice_start_running_6= noone)
and (voice_start_running_7= noone)
and (voice_start_running_8= noone)
and (voice_start_running_9= noone)
and (voice_start_running_10 = noone)
{
	voice_startdash = choose(voice_start_running_1,
						voice_start_running_2,
						voice_start_running_3);
}
else
if (voice_start_running_1> noone)
and (voice_start_running_2> noone)
and (voice_start_running_3> noone)
and (voice_start_running_4> noone)
and (voice_start_running_5 = noone)
and (voice_start_running_6= noone)
and (voice_start_running_7= noone)
and (voice_start_running_8= noone)
and (voice_start_running_9= noone)
and (voice_start_running_10 = noone)
{
	voice_startdash = choose(voice_start_running_1,
						voice_start_running_2,
						voice_start_running_3,
						voice_start_running_4);
}
else
if (voice_start_running_1> noone)
and (voice_start_running_2> noone)
and (voice_start_running_3> noone)
and (voice_start_running_4> noone)
and (voice_start_running_5> noone)
and (voice_start_running_6= noone)
and (voice_start_running_7= noone)
and (voice_start_running_8= noone)
and (voice_start_running_9= noone)
and (voice_start_running_10 = noone)
{
	voice_startdash = choose(voice_start_running_1,
						voice_start_running_2,
						voice_start_running_3,
						voice_start_running_4,
						voice_start_running_5);
}
else
if (voice_start_running_1> noone)
and (voice_start_running_2> noone)
and (voice_start_running_3> noone)
and (voice_start_running_4> noone)
and (voice_start_running_5> noone)
and (voice_start_running_6> noone)
and (voice_start_running_7= noone)
and (voice_start_running_8= noone)
and (voice_start_running_9= noone)
and (voice_start_running_10 = noone)
{
	voice_startdash = choose(voice_start_running_1,
						voice_start_running_2,
						voice_start_running_3,
						voice_start_running_4,
						voice_start_running_5,
						voice_start_running_6);
}
else
if (voice_start_running_1> noone)
and (voice_start_running_2> noone)
and (voice_start_running_3> noone)
and (voice_start_running_4> noone)
and (voice_start_running_5> noone)
and (voice_start_running_6> noone)
and (voice_start_running_7> noone)
and (voice_start_running_8= noone)
and (voice_start_running_9= noone)
and (voice_start_running_10 = noone)
{
	voice_startdash = choose(voice_start_running_1,
						voice_start_running_2,
						voice_start_running_3,
						voice_start_running_4,
						voice_start_running_5,
						voice_start_running_6,
						voice_start_running_7);
}
else
if (voice_start_running_1> noone)
and (voice_start_running_2> noone)
and (voice_start_running_3> noone)
and (voice_start_running_4> noone)
and (voice_start_running_5> noone)
and (voice_start_running_6> noone)
and (voice_start_running_7> noone)
and (voice_start_running_8> noone)
and (voice_start_running_9= noone)
and (voice_start_running_10 = noone)
{
	voice_startdash = choose(voice_start_running_1,
						voice_start_running_2,
						voice_start_running_3,
						voice_start_running_4,
						voice_start_running_5,
						voice_start_running_6,
						voice_start_running_7,
						voice_start_running_8);
}
else
if (voice_start_running_1> noone)
and (voice_start_running_2> noone)
and (voice_start_running_3> noone)
and (voice_start_running_4> noone)
and (voice_start_running_5> noone)
and (voice_start_running_6> noone)
and (voice_start_running_7> noone)
and (voice_start_running_8> noone)
and (voice_start_running_9> noone)
and (voice_start_running_10 = noone)
{
	voice_startdash = choose(voice_start_running_1,
						voice_start_running_2,
						voice_start_running_3,
						voice_start_running_4,
						voice_start_running_5,
						voice_start_running_6,
						voice_start_running_7,
						voice_start_running_8,
						voice_start_running_9);
}
else
if (voice_start_running_1> noone)
and (voice_start_running_2> noone)
and (voice_start_running_3> noone)
and (voice_start_running_4> noone)
and (voice_start_running_5> noone)
and (voice_start_running_6> noone)
and (voice_start_running_7> noone)
and (voice_start_running_8> noone)
and (voice_start_running_9> noone)
and (voice_start_running_10 > noone)
{
	voice_startdash = choose(voice_start_running_1,
						voice_start_running_2,
						voice_start_running_3,
						voice_start_running_4,
						voice_start_running_5,
						voice_start_running_6,
						voice_start_running_7,
						voice_start_running_8,
						voice_start_running_9,
						voice_start_running_10);
}
#endregion /*Start running sound variation END*/

#region /*Rope catch sound variation*/
if (voice_rope_catch_1> noone)
and (voice_rope_catch_2 = noone)
and (voice_rope_catch_3 = noone)
and (voice_rope_catch_4 = noone)
and (voice_rope_catch_5 = noone)
and (voice_rope_catch_6= noone)
and (voice_rope_catch_7= noone)
and (voice_rope_catch_8= noone)
and (voice_rope_catch_9= noone)
and (voice_rope_catch_10 = noone)
{
	voice_rope_catch = voice_rope_catch_1;
}
else
if (voice_rope_catch_1> noone)
and (voice_rope_catch_2> noone)
and (voice_rope_catch_3 = noone)
and (voice_rope_catch_4 = noone)
and (voice_rope_catch_5 = noone)
and (voice_rope_catch_6= noone)
and (voice_rope_catch_7= noone)
and (voice_rope_catch_8= noone)
and (voice_rope_catch_9= noone)
and (voice_rope_catch_10 = noone)
{
	voice_rope_catch = choose(voice_rope_catch_1,
						voice_rope_catch_2);
}
else
if (voice_rope_catch_1> noone)
and (voice_rope_catch_2> noone)
and (voice_rope_catch_3> noone)
and (voice_rope_catch_4 = noone)
and (voice_rope_catch_5 = noone)
and (voice_rope_catch_6= noone)
and (voice_rope_catch_7= noone)
and (voice_rope_catch_8= noone)
and (voice_rope_catch_9= noone)
and (voice_rope_catch_10 = noone)
{
	voice_rope_catch = choose(voice_rope_catch_1,
						voice_rope_catch_2,
						voice_rope_catch_3);
}
else
if (voice_rope_catch_1> noone)
and (voice_rope_catch_2> noone)
and (voice_rope_catch_3> noone)
and (voice_rope_catch_4> noone)
and (voice_rope_catch_5 = noone)
and (voice_rope_catch_6= noone)
and (voice_rope_catch_7= noone)
and (voice_rope_catch_8= noone)
and (voice_rope_catch_9= noone)
and (voice_rope_catch_10 = noone)
{
	voice_rope_catch = choose(voice_rope_catch_1,
						voice_rope_catch_2,
						voice_rope_catch_3,
						voice_rope_catch_4);
}
else
if (voice_rope_catch_1> noone)
and (voice_rope_catch_2> noone)
and (voice_rope_catch_3> noone)
and (voice_rope_catch_4> noone)
and (voice_rope_catch_5> noone)
and (voice_rope_catch_6= noone)
and (voice_rope_catch_7= noone)
and (voice_rope_catch_8= noone)
and (voice_rope_catch_9= noone)
and (voice_rope_catch_10 = noone)
{
	voice_rope_catch = choose(voice_rope_catch_1,
						voice_rope_catch_2,
						voice_rope_catch_3,
						voice_rope_catch_4,
						voice_rope_catch_5);
}
else
if (voice_rope_catch_1> noone)
and (voice_rope_catch_2> noone)
and (voice_rope_catch_3> noone)
and (voice_rope_catch_4> noone)
and (voice_rope_catch_5> noone)
and (voice_rope_catch_6> noone)
and (voice_rope_catch_7= noone)
and (voice_rope_catch_8= noone)
and (voice_rope_catch_9= noone)
and (voice_rope_catch_10 = noone)
{
	voice_rope_catch = choose(voice_rope_catch_1,
						voice_rope_catch_2,
						voice_rope_catch_3,
						voice_rope_catch_4,
						voice_rope_catch_5,
						voice_rope_catch_6);
}
else
if (voice_rope_catch_1> noone)
and (voice_rope_catch_2> noone)
and (voice_rope_catch_3> noone)
and (voice_rope_catch_4> noone)
and (voice_rope_catch_5> noone)
and (voice_rope_catch_6> noone)
and (voice_rope_catch_7> noone)
and (voice_rope_catch_8= noone)
and (voice_rope_catch_9= noone)
and (voice_rope_catch_10 = noone)
{
	voice_rope_catch = choose(voice_rope_catch_1,
						voice_rope_catch_2,
						voice_rope_catch_3,
						voice_rope_catch_4,
						voice_rope_catch_5,
						voice_rope_catch_6,
						voice_rope_catch_7);
}
else
if (voice_rope_catch_1> noone)
and (voice_rope_catch_2> noone)
and (voice_rope_catch_3> noone)
and (voice_rope_catch_4> noone)
and (voice_rope_catch_5> noone)
and (voice_rope_catch_6> noone)
and (voice_rope_catch_7> noone)
and (voice_rope_catch_8> noone)
and (voice_rope_catch_9= noone)
and (voice_rope_catch_10 = noone)
{
	voice_rope_catch = choose(voice_rope_catch_1,
						voice_rope_catch_2,
						voice_rope_catch_3,
						voice_rope_catch_4,
						voice_rope_catch_5,
						voice_rope_catch_6,
						voice_rope_catch_7,
						voice_rope_catch_8);
}
else
if (voice_rope_catch_1> noone)
and (voice_rope_catch_2> noone)
and (voice_rope_catch_3> noone)
and (voice_rope_catch_4> noone)
and (voice_rope_catch_5> noone)
and (voice_rope_catch_6> noone)
and (voice_rope_catch_7> noone)
and (voice_rope_catch_8> noone)
and (voice_rope_catch_9> noone)
and (voice_rope_catch_10 = noone)
{
	voice_rope_catch = choose(voice_rope_catch_1,
						voice_rope_catch_2,
						voice_rope_catch_3,
						voice_rope_catch_4,
						voice_rope_catch_5,
						voice_rope_catch_6,
						voice_rope_catch_7,
						voice_rope_catch_8,
						voice_rope_catch_9);
}
else
if (voice_rope_catch_1> noone)
and (voice_rope_catch_2> noone)
and (voice_rope_catch_3> noone)
and (voice_rope_catch_4> noone)
and (voice_rope_catch_5> noone)
and (voice_rope_catch_6> noone)
and (voice_rope_catch_7> noone)
and (voice_rope_catch_8> noone)
and (voice_rope_catch_9> noone)
and (voice_rope_catch_10 > noone)
{
	voice_rope_catch = choose(voice_rope_catch_1,
						voice_rope_catch_2,
						voice_rope_catch_3,
						voice_rope_catch_4,
						voice_rope_catch_5,
						voice_rope_catch_6,
						voice_rope_catch_7,
						voice_rope_catch_8,
						voice_rope_catch_9,
						voice_rope_catch_10);
}
#endregion /*Rope catch sound variation END*/

#region /*Jump spring sound variation*/
if (voice_jump_spring_1> noone)
and (voice_jump_spring_2 = noone)
and (voice_jump_spring_3 = noone)
and (voice_jump_spring_4 = noone)
and (voice_jump_spring_5 = noone)
and (voice_jump_spring_6= noone)
and (voice_jump_spring_7= noone)
and (voice_jump_spring_8= noone)
and (voice_jump_spring_9= noone)
and (voice_jump_spring_10 = noone)
{
	voice_jump_spring = voice_jump_spring_1;
}
else
if (voice_jump_spring_1> noone)
and (voice_jump_spring_2> noone)
and (voice_jump_spring_3 = noone)
and (voice_jump_spring_4 = noone)
and (voice_jump_spring_5 = noone)
and (voice_jump_spring_6= noone)
and (voice_jump_spring_7= noone)
and (voice_jump_spring_8= noone)
and (voice_jump_spring_9= noone)
and (voice_jump_spring_10 = noone)
{
	voice_jump_spring = choose(voice_jump_spring_1,
						voice_jump_spring_2);
}
else
if (voice_jump_spring_1> noone)
and (voice_jump_spring_2> noone)
and (voice_jump_spring_3> noone)
and (voice_jump_spring_4 = noone)
and (voice_jump_spring_5 = noone)
and (voice_jump_spring_6= noone)
and (voice_jump_spring_7= noone)
and (voice_jump_spring_8= noone)
and (voice_jump_spring_9= noone)
and (voice_jump_spring_10 = noone)
{
	voice_jump_spring = choose(voice_jump_spring_1,
						voice_jump_spring_2,
						voice_jump_spring_3);
}
else
if (voice_jump_spring_1> noone)
and (voice_jump_spring_2> noone)
and (voice_jump_spring_3> noone)
and (voice_jump_spring_4> noone)
and (voice_jump_spring_5 = noone)
and (voice_jump_spring_6= noone)
and (voice_jump_spring_7= noone)
and (voice_jump_spring_8= noone)
and (voice_jump_spring_9= noone)
and (voice_jump_spring_10 = noone)
{
	voice_jump_spring = choose(voice_jump_spring_1,
						voice_jump_spring_2,
						voice_jump_spring_3,
						voice_jump_spring_4);
}
else
if (voice_jump_spring_1> noone)
and (voice_jump_spring_2> noone)
and (voice_jump_spring_3> noone)
and (voice_jump_spring_4> noone)
and (voice_jump_spring_5> noone)
and (voice_jump_spring_6= noone)
and (voice_jump_spring_7= noone)
and (voice_jump_spring_8= noone)
and (voice_jump_spring_9= noone)
and (voice_jump_spring_10 = noone)
{
	voice_jump_spring = choose(voice_jump_spring_1,
						voice_jump_spring_2,
						voice_jump_spring_3,
						voice_jump_spring_4,
						voice_jump_spring_5);
}
else
if (voice_jump_spring_1> noone)
and (voice_jump_spring_2> noone)
and (voice_jump_spring_3> noone)
and (voice_jump_spring_4> noone)
and (voice_jump_spring_5> noone)
and (voice_jump_spring_6> noone)
and (voice_jump_spring_7= noone)
and (voice_jump_spring_8= noone)
and (voice_jump_spring_9= noone)
and (voice_jump_spring_10 = noone)
{
	voice_jump_spring = choose(voice_jump_spring_1,
						voice_jump_spring_2,
						voice_jump_spring_3,
						voice_jump_spring_4,
						voice_jump_spring_5,
						voice_jump_spring_6);
}
else
if (voice_jump_spring_1> noone)
and (voice_jump_spring_2> noone)
and (voice_jump_spring_3> noone)
and (voice_jump_spring_4> noone)
and (voice_jump_spring_5> noone)
and (voice_jump_spring_6> noone)
and (voice_jump_spring_7> noone)
and (voice_jump_spring_8= noone)
and (voice_jump_spring_9= noone)
and (voice_jump_spring_10 = noone)
{
	voice_jump_spring = choose(voice_jump_spring_1,
						voice_jump_spring_2,
						voice_jump_spring_3,
						voice_jump_spring_4,
						voice_jump_spring_5,
						voice_jump_spring_6,
						voice_jump_spring_7);
}
else
if (voice_jump_spring_1> noone)
and (voice_jump_spring_2> noone)
and (voice_jump_spring_3> noone)
and (voice_jump_spring_4> noone)
and (voice_jump_spring_5> noone)
and (voice_jump_spring_6> noone)
and (voice_jump_spring_7> noone)
and (voice_jump_spring_8> noone)
and (voice_jump_spring_9= noone)
and (voice_jump_spring_10 = noone)
{
	voice_jump_spring = choose(voice_jump_spring_1,
						voice_jump_spring_2,
						voice_jump_spring_3,
						voice_jump_spring_4,
						voice_jump_spring_5,
						voice_jump_spring_6,
						voice_jump_spring_7,
						voice_jump_spring_8);
}
else
if (voice_jump_spring_1> noone)
and (voice_jump_spring_2> noone)
and (voice_jump_spring_3> noone)
and (voice_jump_spring_4> noone)
and (voice_jump_spring_5> noone)
and (voice_jump_spring_6> noone)
and (voice_jump_spring_7> noone)
and (voice_jump_spring_8> noone)
and (voice_jump_spring_9> noone)
and (voice_jump_spring_10 = noone)
{
	voice_jump_spring = choose(voice_jump_spring_1,
						voice_jump_spring_2,
						voice_jump_spring_3,
						voice_jump_spring_4,
						voice_jump_spring_5,
						voice_jump_spring_6,
						voice_jump_spring_7,
						voice_jump_spring_8,
						voice_jump_spring_9);
}
else
if (voice_jump_spring_1> noone)
and (voice_jump_spring_2> noone)
and (voice_jump_spring_3> noone)
and (voice_jump_spring_4> noone)
and (voice_jump_spring_5> noone)
and (voice_jump_spring_6> noone)
and (voice_jump_spring_7> noone)
and (voice_jump_spring_8> noone)
and (voice_jump_spring_9> noone)
and (voice_jump_spring_10 > noone)
{
	voice_jump_spring = choose(voice_jump_spring_1,
						voice_jump_spring_2,
						voice_jump_spring_3,
						voice_jump_spring_4,
						voice_jump_spring_5,
						voice_jump_spring_6,
						voice_jump_spring_7,
						voice_jump_spring_8,
						voice_jump_spring_9,
						voice_jump_spring_10);
}
#endregion /*Jump spring sound variation END*/

#region /*Jump rope sound variation*/
if (voice_jump_rope_1> noone)
and (voice_jump_rope_2 = noone)
and (voice_jump_rope_3 = noone)
and (voice_jump_rope_4 = noone)
and (voice_jump_rope_5 = noone)
and (voice_jump_rope_6= noone)
and (voice_jump_rope_7= noone)
and (voice_jump_rope_8= noone)
and (voice_jump_rope_9= noone)
and (voice_jump_rope_10 = noone)
{
	voice_jump_rope = voice_jump_rope_1;
}
else
if (voice_jump_rope_1> noone)
and (voice_jump_rope_2> noone)
and (voice_jump_rope_3 = noone)
and (voice_jump_rope_4 = noone)
and (voice_jump_rope_5 = noone)
and (voice_jump_rope_6= noone)
and (voice_jump_rope_7= noone)
and (voice_jump_rope_8= noone)
and (voice_jump_rope_9= noone)
and (voice_jump_rope_10 = noone)
{
	voice_jump_rope = choose(voice_jump_rope_1,
						voice_jump_rope_2);
}
else
if (voice_jump_rope_1> noone)
and (voice_jump_rope_2> noone)
and (voice_jump_rope_3> noone)
and (voice_jump_rope_4 = noone)
and (voice_jump_rope_5 = noone)
and (voice_jump_rope_6= noone)
and (voice_jump_rope_7= noone)
and (voice_jump_rope_8= noone)
and (voice_jump_rope_9= noone)
and (voice_jump_rope_10 = noone)
{
	voice_jump_rope = choose(voice_jump_rope_1,
						voice_jump_rope_2,
						voice_jump_rope_3);
}
else
if (voice_jump_rope_1> noone)
and (voice_jump_rope_2> noone)
and (voice_jump_rope_3> noone)
and (voice_jump_rope_4> noone)
and (voice_jump_rope_5 = noone)
and (voice_jump_rope_6= noone)
and (voice_jump_rope_7= noone)
and (voice_jump_rope_8= noone)
and (voice_jump_rope_9= noone)
and (voice_jump_rope_10 = noone)
{
	voice_jump_rope = choose(voice_jump_rope_1,
						voice_jump_rope_2,
						voice_jump_rope_3,
						voice_jump_rope_4);
}
else
if (voice_jump_rope_1> noone)
and (voice_jump_rope_2> noone)
and (voice_jump_rope_3> noone)
and (voice_jump_rope_4> noone)
and (voice_jump_rope_5> noone)
and (voice_jump_rope_6= noone)
and (voice_jump_rope_7= noone)
and (voice_jump_rope_8= noone)
and (voice_jump_rope_9= noone)
and (voice_jump_rope_10 = noone)
{
	voice_jump_rope = choose(voice_jump_rope_1,
						voice_jump_rope_2,
						voice_jump_rope_3,
						voice_jump_rope_4,
						voice_jump_rope_5);
}
else
if (voice_jump_rope_1> noone)
and (voice_jump_rope_2> noone)
and (voice_jump_rope_3> noone)
and (voice_jump_rope_4> noone)
and (voice_jump_rope_5> noone)
and (voice_jump_rope_6> noone)
and (voice_jump_rope_7= noone)
and (voice_jump_rope_8= noone)
and (voice_jump_rope_9= noone)
and (voice_jump_rope_10 = noone)
{
	voice_jump_rope = choose(voice_jump_rope_1,
						voice_jump_rope_2,
						voice_jump_rope_3,
						voice_jump_rope_4,
						voice_jump_rope_5,
						voice_jump_rope_6);
}
else
if (voice_jump_rope_1> noone)
and (voice_jump_rope_2> noone)
and (voice_jump_rope_3> noone)
and (voice_jump_rope_4> noone)
and (voice_jump_rope_5> noone)
and (voice_jump_rope_6> noone)
and (voice_jump_rope_7> noone)
and (voice_jump_rope_8= noone)
and (voice_jump_rope_9= noone)
and (voice_jump_rope_10 = noone)
{
	voice_jump_rope = choose(voice_jump_rope_1,
						voice_jump_rope_2,
						voice_jump_rope_3,
						voice_jump_rope_4,
						voice_jump_rope_5,
						voice_jump_rope_6,
						voice_jump_rope_7);
}
else
if (voice_jump_rope_1> noone)
and (voice_jump_rope_2> noone)
and (voice_jump_rope_3> noone)
and (voice_jump_rope_4> noone)
and (voice_jump_rope_5> noone)
and (voice_jump_rope_6> noone)
and (voice_jump_rope_7> noone)
and (voice_jump_rope_8> noone)
and (voice_jump_rope_9= noone)
and (voice_jump_rope_10 = noone)
{
	voice_jump_rope = choose(voice_jump_rope_1,
						voice_jump_rope_2,
						voice_jump_rope_3,
						voice_jump_rope_4,
						voice_jump_rope_5,
						voice_jump_rope_6,
						voice_jump_rope_7,
						voice_jump_rope_8);
}
else
if (voice_jump_rope_1> noone)
and (voice_jump_rope_2> noone)
and (voice_jump_rope_3> noone)
and (voice_jump_rope_4> noone)
and (voice_jump_rope_5> noone)
and (voice_jump_rope_6> noone)
and (voice_jump_rope_7> noone)
and (voice_jump_rope_8> noone)
and (voice_jump_rope_9> noone)
and (voice_jump_rope_10 = noone)
{
	voice_jump_rope = choose(voice_jump_rope_1,
						voice_jump_rope_2,
						voice_jump_rope_3,
						voice_jump_rope_4,
						voice_jump_rope_5,
						voice_jump_rope_6,
						voice_jump_rope_7,
						voice_jump_rope_8,
						voice_jump_rope_9);
}
else
if (voice_jump_rope_1> noone)
and (voice_jump_rope_2> noone)
and (voice_jump_rope_3> noone)
and (voice_jump_rope_4> noone)
and (voice_jump_rope_5> noone)
and (voice_jump_rope_6> noone)
and (voice_jump_rope_7> noone)
and (voice_jump_rope_8> noone)
and (voice_jump_rope_9> noone)
and (voice_jump_rope_10 > noone)
{
	voice_jump_rope = choose(voice_jump_rope_1,
						voice_jump_rope_2,
						voice_jump_rope_3,
						voice_jump_rope_4,
						voice_jump_rope_5,
						voice_jump_rope_6,
						voice_jump_rope_7,
						voice_jump_rope_8,
						voice_jump_rope_9,
						voice_jump_rope_10);
}
#endregion /*Jump rope sound variation END*/

#region /*Jump sound variation*/
if (voice_jump_1> noone)
and (voice_jump_2 = noone)
and (voice_jump_3 = noone)
and (voice_jump_4 = noone)
and (voice_jump_5 = noone)
and (voice_jump_6= noone)
and (voice_jump_7= noone)
and (voice_jump_8= noone)
and (voice_jump_9= noone)
and (voice_jump_10 = noone)
{
	voice_jump = voice_jump_1;
}
else
if (voice_jump_1> noone)
and (voice_jump_2> noone)
and (voice_jump_3 = noone)
and (voice_jump_4 = noone)
and (voice_jump_5 = noone)
and (voice_jump_6= noone)
and (voice_jump_7= noone)
and (voice_jump_8= noone)
and (voice_jump_9= noone)
and (voice_jump_10 = noone)
{
	voice_jump = choose(voice_jump_1,
						voice_jump_2);
}
else
if (voice_jump_1> noone)
and (voice_jump_2> noone)
and (voice_jump_3> noone)
and (voice_jump_4 = noone)
and (voice_jump_5 = noone)
and (voice_jump_6= noone)
and (voice_jump_7= noone)
and (voice_jump_8= noone)
and (voice_jump_9= noone)
and (voice_jump_10 = noone)
{
	voice_jump = choose(voice_jump_1,
						voice_jump_2,
						voice_jump_3);
}
else
if (voice_jump_1> noone)
and (voice_jump_2> noone)
and (voice_jump_3> noone)
and (voice_jump_4> noone)
and (voice_jump_5 = noone)
and (voice_jump_6= noone)
and (voice_jump_7= noone)
and (voice_jump_8= noone)
and (voice_jump_9= noone)
and (voice_jump_10 = noone)
{
	voice_jump = choose(voice_jump_1,
						voice_jump_2,
						voice_jump_3,
						voice_jump_4);
}
else
if (voice_jump_1> noone)
and (voice_jump_2> noone)
and (voice_jump_3> noone)
and (voice_jump_4> noone)
and (voice_jump_5> noone)
and (voice_jump_6= noone)
and (voice_jump_7= noone)
and (voice_jump_8= noone)
and (voice_jump_9= noone)
and (voice_jump_10 = noone)
{
	voice_jump = choose(voice_jump_1,
						voice_jump_2,
						voice_jump_3,
						voice_jump_4,
						voice_jump_5);
}
else
if (voice_jump_1> noone)
and (voice_jump_2> noone)
and (voice_jump_3> noone)
and (voice_jump_4> noone)
and (voice_jump_5> noone)
and (voice_jump_6> noone)
and (voice_jump_7= noone)
and (voice_jump_8= noone)
and (voice_jump_9= noone)
and (voice_jump_10 = noone)
{
	voice_jump = choose(voice_jump_1,
						voice_jump_2,
						voice_jump_3,
						voice_jump_4,
						voice_jump_5,
						voice_jump_6);
}
else
if (voice_jump_1> noone)
and (voice_jump_2> noone)
and (voice_jump_3> noone)
and (voice_jump_4> noone)
and (voice_jump_5> noone)
and (voice_jump_6> noone)
and (voice_jump_7> noone)
and (voice_jump_8= noone)
and (voice_jump_9= noone)
and (voice_jump_10 = noone)
{
	voice_jump = choose(voice_jump_1,
						voice_jump_2,
						voice_jump_3,
						voice_jump_4,
						voice_jump_5,
						voice_jump_6,
						voice_jump_7);
}
else
if (voice_jump_1> noone)
and (voice_jump_2> noone)
and (voice_jump_3> noone)
and (voice_jump_4> noone)
and (voice_jump_5> noone)
and (voice_jump_6> noone)
and (voice_jump_7> noone)
and (voice_jump_8> noone)
and (voice_jump_9= noone)
and (voice_jump_10 = noone)
{
	voice_jump = choose(voice_jump_1,
						voice_jump_2,
						voice_jump_3,
						voice_jump_4,
						voice_jump_5,
						voice_jump_6,
						voice_jump_7,
						voice_jump_8);
}
else
if (voice_jump_1> noone)
and (voice_jump_2> noone)
and (voice_jump_3> noone)
and (voice_jump_4> noone)
and (voice_jump_5> noone)
and (voice_jump_6> noone)
and (voice_jump_7> noone)
and (voice_jump_8> noone)
and (voice_jump_9> noone)
and (voice_jump_10 = noone)
{
	voice_jump = choose(voice_jump_1,
						voice_jump_2,
						voice_jump_3,
						voice_jump_4,
						voice_jump_5,
						voice_jump_6,
						voice_jump_7,
						voice_jump_8,
						voice_jump_9);
}
else
if (voice_jump_1> noone)
and (voice_jump_2> noone)
and (voice_jump_3> noone)
and (voice_jump_4> noone)
and (voice_jump_5> noone)
and (voice_jump_6> noone)
and (voice_jump_7> noone)
and (voice_jump_8> noone)
and (voice_jump_9> noone)
and (voice_jump_10 > noone)
{
	voice_jump = choose(voice_jump_1,
						voice_jump_2,
						voice_jump_3,
						voice_jump_4,
						voice_jump_5,
						voice_jump_6,
						voice_jump_7,
						voice_jump_8,
						voice_jump_9,
						voice_jump_10);
}
#endregion /*Jump sound variation END*/

#region /*Jump 3rd sound variation*/
if (voice_jump_3rd_1> noone)
and (voice_jump_3rd_2 = noone)
and (voice_jump_3rd_3 = noone)
and (voice_jump_3rd_4 = noone)
and (voice_jump_3rd_5 = noone)
and (voice_jump_3rd_6= noone)
and (voice_jump_3rd_7= noone)
and (voice_jump_3rd_8= noone)
and (voice_jump_3rd_9= noone)
and (voice_jump_3rd_10 = noone)
{
	voice_jump3rd = voice_jump_3rd_1;
}
else
if (voice_jump_3rd_1> noone)
and (voice_jump_3rd_2> noone)
and (voice_jump_3rd_3 = noone)
and (voice_jump_3rd_4 = noone)
and (voice_jump_3rd_5 = noone)
and (voice_jump_3rd_6= noone)
and (voice_jump_3rd_7= noone)
and (voice_jump_3rd_8= noone)
and (voice_jump_3rd_9= noone)
and (voice_jump_3rd_10 = noone)
{
	voice_jump3rd = choose(voice_jump_3rd_1,
						voice_jump_3rd_2);
}
else
if (voice_jump_3rd_1> noone)
and (voice_jump_3rd_2> noone)
and (voice_jump_3rd_3> noone)
and (voice_jump_3rd_4 = noone)
and (voice_jump_3rd_5 = noone)
and (voice_jump_3rd_6= noone)
and (voice_jump_3rd_7= noone)
and (voice_jump_3rd_8= noone)
and (voice_jump_3rd_9= noone)
and (voice_jump_3rd_10 = noone)
{
	voice_jump3rd = choose(voice_jump_3rd_1,
						voice_jump_3rd_2,
						voice_jump_3rd_3);
}
else
if (voice_jump_3rd_1> noone)
and (voice_jump_3rd_2> noone)
and (voice_jump_3rd_3> noone)
and (voice_jump_3rd_4> noone)
and (voice_jump_3rd_5 = noone)
and (voice_jump_3rd_6= noone)
and (voice_jump_3rd_7= noone)
and (voice_jump_3rd_8= noone)
and (voice_jump_3rd_9= noone)
and (voice_jump_3rd_10 = noone)
{
	voice_jump3rd = choose(voice_jump_3rd_1,
						voice_jump_3rd_2,
						voice_jump_3rd_3,
						voice_jump_3rd_4);
}
else
if (voice_jump_3rd_1> noone)
and (voice_jump_3rd_2> noone)
and (voice_jump_3rd_3> noone)
and (voice_jump_3rd_4> noone)
and (voice_jump_3rd_5> noone)
and (voice_jump_3rd_6= noone)
and (voice_jump_3rd_7= noone)
and (voice_jump_3rd_8= noone)
and (voice_jump_3rd_9= noone)
and (voice_jump_3rd_10 = noone)
{
	voice_jump3rd = choose(voice_jump_3rd_1,
						voice_jump_3rd_2,
						voice_jump_3rd_3,
						voice_jump_3rd_4,
						voice_jump_3rd_5);
}
else
if (voice_jump_3rd_1> noone)
and (voice_jump_3rd_2> noone)
and (voice_jump_3rd_3> noone)
and (voice_jump_3rd_4> noone)
and (voice_jump_3rd_5> noone)
and (voice_jump_3rd_6> noone)
and (voice_jump_3rd_7= noone)
and (voice_jump_3rd_8= noone)
and (voice_jump_3rd_9= noone)
and (voice_jump_3rd_10 = noone)
{
	voice_jump3rd = choose(voice_jump_3rd_1,
						voice_jump_3rd_2,
						voice_jump_3rd_3,
						voice_jump_3rd_4,
						voice_jump_3rd_5,
						voice_jump_3rd_6);
}
else
if (voice_jump_3rd_1> noone)
and (voice_jump_3rd_2> noone)
and (voice_jump_3rd_3> noone)
and (voice_jump_3rd_4> noone)
and (voice_jump_3rd_5> noone)
and (voice_jump_3rd_6> noone)
and (voice_jump_3rd_7> noone)
and (voice_jump_3rd_8= noone)
and (voice_jump_3rd_9= noone)
and (voice_jump_3rd_10 = noone)
{
	voice_jump3rd = choose(voice_jump_3rd_1,
						voice_jump_3rd_2,
						voice_jump_3rd_3,
						voice_jump_3rd_4,
						voice_jump_3rd_5,
						voice_jump_3rd_6,
						voice_jump_3rd_7);
}
else
if (voice_jump_3rd_1> noone)
and (voice_jump_3rd_2> noone)
and (voice_jump_3rd_3> noone)
and (voice_jump_3rd_4> noone)
and (voice_jump_3rd_5> noone)
and (voice_jump_3rd_6> noone)
and (voice_jump_3rd_7> noone)
and (voice_jump_3rd_8> noone)
and (voice_jump_3rd_9= noone)
and (voice_jump_3rd_10 = noone)
{
	voice_jump3rd = choose(voice_jump_3rd_1,
						voice_jump_3rd_2,
						voice_jump_3rd_3,
						voice_jump_3rd_4,
						voice_jump_3rd_5,
						voice_jump_3rd_6,
						voice_jump_3rd_7,
						voice_jump_3rd_8);
}
else
if (voice_jump_3rd_1> noone)
and (voice_jump_3rd_2> noone)
and (voice_jump_3rd_3> noone)
and (voice_jump_3rd_4> noone)
and (voice_jump_3rd_5> noone)
and (voice_jump_3rd_6> noone)
and (voice_jump_3rd_7> noone)
and (voice_jump_3rd_8> noone)
and (voice_jump_3rd_9> noone)
and (voice_jump_3rd_10 = noone)
{
	voice_jump3rd = choose(voice_jump_3rd_1,
						voice_jump_3rd_2,
						voice_jump_3rd_3,
						voice_jump_3rd_4,
						voice_jump_3rd_5,
						voice_jump_3rd_6,
						voice_jump_3rd_7,
						voice_jump_3rd_8,
						voice_jump_3rd_9);
}
else
if (voice_jump_3rd_1> noone)
and (voice_jump_3rd_2> noone)
and (voice_jump_3rd_3> noone)
and (voice_jump_3rd_4> noone)
and (voice_jump_3rd_5> noone)
and (voice_jump_3rd_6> noone)
and (voice_jump_3rd_7> noone)
and (voice_jump_3rd_8> noone)
and (voice_jump_3rd_9> noone)
and (voice_jump_3rd_10 > noone)
{
	voice_jump3rd = choose(voice_jump_3rd_1,
						voice_jump_3rd_2,
						voice_jump_3rd_3,
						voice_jump_3rd_4,
						voice_jump_3rd_5,
						voice_jump_3rd_6,
						voice_jump_3rd_7,
						voice_jump_3rd_8,
						voice_jump_3rd_9,
						voice_jump_3rd_10);
}
#endregion /*Jump 3rd sound variation END*/

#region /*Jump 2nd sound variation*/
if (voice_jump_2nd_1> noone)
and (voice_jump_2nd_2 = noone)
and (voice_jump_2nd_3 = noone)
and (voice_jump_2nd_4 = noone)
and (voice_jump_2nd_5 = noone)
and (voice_jump_2nd_6= noone)
and (voice_jump_2nd_7= noone)
and (voice_jump_2nd_8= noone)
and (voice_jump_2nd_9= noone)
and (voice_jump_2nd_10 = noone)
{
	voice_jump2nd = voice_jump_2nd_1;
}
else
if (voice_jump_2nd_1> noone)
and (voice_jump_2nd_2> noone)
and (voice_jump_2nd_3 = noone)
and (voice_jump_2nd_4 = noone)
and (voice_jump_2nd_5 = noone)
and (voice_jump_2nd_6= noone)
and (voice_jump_2nd_7= noone)
and (voice_jump_2nd_8= noone)
and (voice_jump_2nd_9= noone)
and (voice_jump_2nd_10 = noone)
{
	voice_jump2nd = choose(voice_jump_2nd_1,
						voice_jump_2nd_2);
}
else
if (voice_jump_2nd_1> noone)
and (voice_jump_2nd_2> noone)
and (voice_jump_2nd_3> noone)
and (voice_jump_2nd_4 = noone)
and (voice_jump_2nd_5 = noone)
and (voice_jump_2nd_6= noone)
and (voice_jump_2nd_7= noone)
and (voice_jump_2nd_8= noone)
and (voice_jump_2nd_9= noone)
and (voice_jump_2nd_10 = noone)
{
	voice_jump2nd = choose(voice_jump_2nd_1,
						voice_jump_2nd_2,
						voice_jump_2nd_3);
}
else
if (voice_jump_2nd_1> noone)
and (voice_jump_2nd_2> noone)
and (voice_jump_2nd_3> noone)
and (voice_jump_2nd_4> noone)
and (voice_jump_2nd_5 = noone)
and (voice_jump_2nd_6= noone)
and (voice_jump_2nd_7= noone)
and (voice_jump_2nd_8= noone)
and (voice_jump_2nd_9= noone)
and (voice_jump_2nd_10 = noone)
{
	voice_jump2nd = choose(voice_jump_2nd_1,
						voice_jump_2nd_2,
						voice_jump_2nd_3,
						voice_jump_2nd_4);
}
else
if (voice_jump_2nd_1> noone)
and (voice_jump_2nd_2> noone)
and (voice_jump_2nd_3> noone)
and (voice_jump_2nd_4> noone)
and (voice_jump_2nd_5> noone)
and (voice_jump_2nd_6= noone)
and (voice_jump_2nd_7= noone)
and (voice_jump_2nd_8= noone)
and (voice_jump_2nd_9= noone)
and (voice_jump_2nd_10 = noone)
{
	voice_jump2nd = choose(voice_jump_2nd_1,
						voice_jump_2nd_2,
						voice_jump_2nd_3,
						voice_jump_2nd_4,
						voice_jump_2nd_5);
}
else
if (voice_jump_2nd_1> noone)
and (voice_jump_2nd_2> noone)
and (voice_jump_2nd_3> noone)
and (voice_jump_2nd_4> noone)
and (voice_jump_2nd_5> noone)
and (voice_jump_2nd_6> noone)
and (voice_jump_2nd_7= noone)
and (voice_jump_2nd_8= noone)
and (voice_jump_2nd_9= noone)
and (voice_jump_2nd_10 = noone)
{
	voice_jump2nd = choose(voice_jump_2nd_1,
						voice_jump_2nd_2,
						voice_jump_2nd_3,
						voice_jump_2nd_4,
						voice_jump_2nd_5,
						voice_jump_2nd_6);
}
else
if (voice_jump_2nd_1> noone)
and (voice_jump_2nd_2> noone)
and (voice_jump_2nd_3> noone)
and (voice_jump_2nd_4> noone)
and (voice_jump_2nd_5> noone)
and (voice_jump_2nd_6> noone)
and (voice_jump_2nd_7> noone)
and (voice_jump_2nd_8= noone)
and (voice_jump_2nd_9= noone)
and (voice_jump_2nd_10 = noone)
{
	voice_jump2nd = choose(voice_jump_2nd_1,
						voice_jump_2nd_2,
						voice_jump_2nd_3,
						voice_jump_2nd_4,
						voice_jump_2nd_5,
						voice_jump_2nd_6,
						voice_jump_2nd_7);
}
else
if (voice_jump_2nd_1> noone)
and (voice_jump_2nd_2> noone)
and (voice_jump_2nd_3> noone)
and (voice_jump_2nd_4> noone)
and (voice_jump_2nd_5> noone)
and (voice_jump_2nd_6> noone)
and (voice_jump_2nd_7> noone)
and (voice_jump_2nd_8> noone)
and (voice_jump_2nd_9= noone)
and (voice_jump_2nd_10 = noone)
{
	voice_jump2nd = choose(voice_jump_2nd_1,
						voice_jump_2nd_2,
						voice_jump_2nd_3,
						voice_jump_2nd_4,
						voice_jump_2nd_5,
						voice_jump_2nd_6,
						voice_jump_2nd_7,
						voice_jump_2nd_8);
}
else
if (voice_jump_2nd_1> noone)
and (voice_jump_2nd_2> noone)
and (voice_jump_2nd_3> noone)
and (voice_jump_2nd_4> noone)
and (voice_jump_2nd_5> noone)
and (voice_jump_2nd_6> noone)
and (voice_jump_2nd_7> noone)
and (voice_jump_2nd_8> noone)
and (voice_jump_2nd_9> noone)
and (voice_jump_2nd_10 = noone)
{
	voice_jump2nd = choose(voice_jump_2nd_1,
						voice_jump_2nd_2,
						voice_jump_2nd_3,
						voice_jump_2nd_4,
						voice_jump_2nd_5,
						voice_jump_2nd_6,
						voice_jump_2nd_7,
						voice_jump_2nd_8,
						voice_jump_2nd_9);
}
else
if (voice_jump_2nd_1> noone)
and (voice_jump_2nd_2> noone)
and (voice_jump_2nd_3> noone)
and (voice_jump_2nd_4> noone)
and (voice_jump_2nd_5> noone)
and (voice_jump_2nd_6> noone)
and (voice_jump_2nd_7> noone)
and (voice_jump_2nd_8> noone)
and (voice_jump_2nd_9> noone)
and (voice_jump_2nd_10 > noone)
{
	voice_jump2nd = choose(voice_jump_2nd_1,
						voice_jump_2nd_2,
						voice_jump_2nd_3,
						voice_jump_2nd_4,
						voice_jump_2nd_5,
						voice_jump_2nd_6,
						voice_jump_2nd_7,
						voice_jump_2nd_8,
						voice_jump_2nd_9,
						voice_jump_2nd_10);
}
#endregion /*Jump 2nd sound variation END*/

#region /*Get invincibility sound variation*/
if (voice_get_invincibility_1> noone)
and (voice_get_invincibility_2 = noone)
and (voice_get_invincibility_3 = noone)
and (voice_get_invincibility_4 = noone)
and (voice_get_invincibility_5 = noone)
and (voice_get_invincibility_6= noone)
and (voice_get_invincibility_7= noone)
and (voice_get_invincibility_8= noone)
and (voice_get_invincibility_9= noone)
and (voice_get_invincibility_10 = noone)
{
	voice_get_star = voice_get_invincibility_1;
}
else
if (voice_get_invincibility_1> noone)
and (voice_get_invincibility_2> noone)
and (voice_get_invincibility_3 = noone)
and (voice_get_invincibility_4 = noone)
and (voice_get_invincibility_5 = noone)
and (voice_get_invincibility_6= noone)
and (voice_get_invincibility_7= noone)
and (voice_get_invincibility_8= noone)
and (voice_get_invincibility_9= noone)
and (voice_get_invincibility_10 = noone)
{
	voice_get_star = choose(voice_get_invincibility_1,
						voice_get_invincibility_2);
}
else
if (voice_get_invincibility_1> noone)
and (voice_get_invincibility_2> noone)
and (voice_get_invincibility_3> noone)
and (voice_get_invincibility_4 = noone)
and (voice_get_invincibility_5 = noone)
and (voice_get_invincibility_6= noone)
and (voice_get_invincibility_7= noone)
and (voice_get_invincibility_8= noone)
and (voice_get_invincibility_9= noone)
and (voice_get_invincibility_10 = noone)
{
	voice_get_star = choose(voice_get_invincibility_1,
						voice_get_invincibility_2,
						voice_get_invincibility_3);
}
else
if (voice_get_invincibility_1> noone)
and (voice_get_invincibility_2> noone)
and (voice_get_invincibility_3> noone)
and (voice_get_invincibility_4> noone)
and (voice_get_invincibility_5 = noone)
and (voice_get_invincibility_6= noone)
and (voice_get_invincibility_7= noone)
and (voice_get_invincibility_8= noone)
and (voice_get_invincibility_9= noone)
and (voice_get_invincibility_10 = noone)
{
	voice_get_star = choose(voice_get_invincibility_1,
						voice_get_invincibility_2,
						voice_get_invincibility_3,
						voice_get_invincibility_4);
}
else
if (voice_get_invincibility_1> noone)
and (voice_get_invincibility_2> noone)
and (voice_get_invincibility_3> noone)
and (voice_get_invincibility_4> noone)
and (voice_get_invincibility_5> noone)
and (voice_get_invincibility_6= noone)
and (voice_get_invincibility_7= noone)
and (voice_get_invincibility_8= noone)
and (voice_get_invincibility_9= noone)
and (voice_get_invincibility_10 = noone)
{
	voice_get_star = choose(voice_get_invincibility_1,
						voice_get_invincibility_2,
						voice_get_invincibility_3,
						voice_get_invincibility_4,
						voice_get_invincibility_5);
}
else
if (voice_get_invincibility_1> noone)
and (voice_get_invincibility_2> noone)
and (voice_get_invincibility_3> noone)
and (voice_get_invincibility_4> noone)
and (voice_get_invincibility_5> noone)
and (voice_get_invincibility_6> noone)
and (voice_get_invincibility_7= noone)
and (voice_get_invincibility_8= noone)
and (voice_get_invincibility_9= noone)
and (voice_get_invincibility_10 = noone)
{
	voice_get_star = choose(voice_get_invincibility_1,
						voice_get_invincibility_2,
						voice_get_invincibility_3,
						voice_get_invincibility_4,
						voice_get_invincibility_5,
						voice_get_invincibility_6);
}
else
if (voice_get_invincibility_1> noone)
and (voice_get_invincibility_2> noone)
and (voice_get_invincibility_3> noone)
and (voice_get_invincibility_4> noone)
and (voice_get_invincibility_5> noone)
and (voice_get_invincibility_6> noone)
and (voice_get_invincibility_7> noone)
and (voice_get_invincibility_8= noone)
and (voice_get_invincibility_9= noone)
and (voice_get_invincibility_10 = noone)
{
	voice_get_star = choose(voice_get_invincibility_1,
						voice_get_invincibility_2,
						voice_get_invincibility_3,
						voice_get_invincibility_4,
						voice_get_invincibility_5,
						voice_get_invincibility_6,
						voice_get_invincibility_7);
}
else
if (voice_get_invincibility_1> noone)
and (voice_get_invincibility_2> noone)
and (voice_get_invincibility_3> noone)
and (voice_get_invincibility_4> noone)
and (voice_get_invincibility_5> noone)
and (voice_get_invincibility_6> noone)
and (voice_get_invincibility_7> noone)
and (voice_get_invincibility_8> noone)
and (voice_get_invincibility_9= noone)
and (voice_get_invincibility_10 = noone)
{
	voice_get_star = choose(voice_get_invincibility_1,
						voice_get_invincibility_2,
						voice_get_invincibility_3,
						voice_get_invincibility_4,
						voice_get_invincibility_5,
						voice_get_invincibility_6,
						voice_get_invincibility_7,
						voice_get_invincibility_8);
}
else
if (voice_get_invincibility_1> noone)
and (voice_get_invincibility_2> noone)
and (voice_get_invincibility_3> noone)
and (voice_get_invincibility_4> noone)
and (voice_get_invincibility_5> noone)
and (voice_get_invincibility_6> noone)
and (voice_get_invincibility_7> noone)
and (voice_get_invincibility_8> noone)
and (voice_get_invincibility_9> noone)
and (voice_get_invincibility_10 = noone)
{
	voice_get_star = choose(voice_get_invincibility_1,
						voice_get_invincibility_2,
						voice_get_invincibility_3,
						voice_get_invincibility_4,
						voice_get_invincibility_5,
						voice_get_invincibility_6,
						voice_get_invincibility_7,
						voice_get_invincibility_8,
						voice_get_invincibility_9);
}
else
if (voice_get_invincibility_1> noone)
and (voice_get_invincibility_2> noone)
and (voice_get_invincibility_3> noone)
and (voice_get_invincibility_4> noone)
and (voice_get_invincibility_5> noone)
and (voice_get_invincibility_6> noone)
and (voice_get_invincibility_7> noone)
and (voice_get_invincibility_8> noone)
and (voice_get_invincibility_9> noone)
and (voice_get_invincibility_10 > noone)
{
	voice_get_star = choose(voice_get_invincibility_1,
						voice_get_invincibility_2,
						voice_get_invincibility_3,
						voice_get_invincibility_4,
						voice_get_invincibility_5,
						voice_get_invincibility_6,
						voice_get_invincibility_7,
						voice_get_invincibility_8,
						voice_get_invincibility_9,
						voice_get_invincibility_10);
}
#endregion /*Get invincibility sound variation END*/

#region /*Enter goal sound variation*/
if (voice_enter_goal_1> noone)
and (voice_enter_goal_2 = noone)
and (voice_enter_goal_3 = noone)
and (voice_enter_goal_4 = noone)
and (voice_enter_goal_5 = noone)
and (voice_enter_goal_6= noone)
and (voice_enter_goal_7= noone)
and (voice_enter_goal_8= noone)
and (voice_enter_goal_9= noone)
and (voice_enter_goal_10 = noone)
{
	voice_enter_goal = voice_enter_goal_1;
}
else
if (voice_enter_goal_1> noone)
and (voice_enter_goal_2> noone)
and (voice_enter_goal_3 = noone)
and (voice_enter_goal_4 = noone)
and (voice_enter_goal_5 = noone)
and (voice_enter_goal_6= noone)
and (voice_enter_goal_7= noone)
and (voice_enter_goal_8= noone)
and (voice_enter_goal_9= noone)
and (voice_enter_goal_10 = noone)
{
	voice_enter_goal = choose(voice_enter_goal_1,
						voice_enter_goal_2);
}
else
if (voice_enter_goal_1> noone)
and (voice_enter_goal_2> noone)
and (voice_enter_goal_3> noone)
and (voice_enter_goal_4 = noone)
and (voice_enter_goal_5 = noone)
and (voice_enter_goal_6= noone)
and (voice_enter_goal_7= noone)
and (voice_enter_goal_8= noone)
and (voice_enter_goal_9= noone)
and (voice_enter_goal_10 = noone)
{
	voice_enter_goal = choose(voice_enter_goal_1,
						voice_enter_goal_2,
						voice_enter_goal_3);
}
else
if (voice_enter_goal_1> noone)
and (voice_enter_goal_2> noone)
and (voice_enter_goal_3> noone)
and (voice_enter_goal_4> noone)
and (voice_enter_goal_5 = noone)
and (voice_enter_goal_6= noone)
and (voice_enter_goal_7= noone)
and (voice_enter_goal_8= noone)
and (voice_enter_goal_9= noone)
and (voice_enter_goal_10 = noone)
{
	voice_enter_goal = choose(voice_enter_goal_1,
						voice_enter_goal_2,
						voice_enter_goal_3,
						voice_enter_goal_4);
}
else
if (voice_enter_goal_1> noone)
and (voice_enter_goal_2> noone)
and (voice_enter_goal_3> noone)
and (voice_enter_goal_4> noone)
and (voice_enter_goal_5> noone)
and (voice_enter_goal_6= noone)
and (voice_enter_goal_7= noone)
and (voice_enter_goal_8= noone)
and (voice_enter_goal_9= noone)
and (voice_enter_goal_10 = noone)
{
	voice_enter_goal = choose(voice_enter_goal_1,
						voice_enter_goal_2,
						voice_enter_goal_3,
						voice_enter_goal_4,
						voice_enter_goal_5);
}
else
if (voice_enter_goal_1> noone)
and (voice_enter_goal_2> noone)
and (voice_enter_goal_3> noone)
and (voice_enter_goal_4> noone)
and (voice_enter_goal_5> noone)
and (voice_enter_goal_6> noone)
and (voice_enter_goal_7= noone)
and (voice_enter_goal_8= noone)
and (voice_enter_goal_9= noone)
and (voice_enter_goal_10 = noone)
{
	voice_enter_goal = choose(voice_enter_goal_1,
						voice_enter_goal_2,
						voice_enter_goal_3,
						voice_enter_goal_4,
						voice_enter_goal_5,
						voice_enter_goal_6);
}
else
if (voice_enter_goal_1> noone)
and (voice_enter_goal_2> noone)
and (voice_enter_goal_3> noone)
and (voice_enter_goal_4> noone)
and (voice_enter_goal_5> noone)
and (voice_enter_goal_6> noone)
and (voice_enter_goal_7> noone)
and (voice_enter_goal_8= noone)
and (voice_enter_goal_9= noone)
and (voice_enter_goal_10 = noone)
{
	voice_enter_goal = choose(voice_enter_goal_1,
						voice_enter_goal_2,
						voice_enter_goal_3,
						voice_enter_goal_4,
						voice_enter_goal_5,
						voice_enter_goal_6,
						voice_enter_goal_7);
}
else
if (voice_enter_goal_1> noone)
and (voice_enter_goal_2> noone)
and (voice_enter_goal_3> noone)
and (voice_enter_goal_4> noone)
and (voice_enter_goal_5> noone)
and (voice_enter_goal_6> noone)
and (voice_enter_goal_7> noone)
and (voice_enter_goal_8> noone)
and (voice_enter_goal_9= noone)
and (voice_enter_goal_10 = noone)
{
	voice_enter_goal = choose(voice_enter_goal_1,
						voice_enter_goal_2,
						voice_enter_goal_3,
						voice_enter_goal_4,
						voice_enter_goal_5,
						voice_enter_goal_6,
						voice_enter_goal_7,
						voice_enter_goal_8);
}
else
if (voice_enter_goal_1> noone)
and (voice_enter_goal_2> noone)
and (voice_enter_goal_3> noone)
and (voice_enter_goal_4> noone)
and (voice_enter_goal_5> noone)
and (voice_enter_goal_6> noone)
and (voice_enter_goal_7> noone)
and (voice_enter_goal_8> noone)
and (voice_enter_goal_9> noone)
and (voice_enter_goal_10 = noone)
{
	voice_enter_goal = choose(voice_enter_goal_1,
						voice_enter_goal_2,
						voice_enter_goal_3,
						voice_enter_goal_4,
						voice_enter_goal_5,
						voice_enter_goal_6,
						voice_enter_goal_7,
						voice_enter_goal_8,
						voice_enter_goal_9);
}
else
if (voice_enter_goal_1> noone)
and (voice_enter_goal_2> noone)
and (voice_enter_goal_3> noone)
and (voice_enter_goal_4> noone)
and (voice_enter_goal_5> noone)
and (voice_enter_goal_6> noone)
and (voice_enter_goal_7> noone)
and (voice_enter_goal_8> noone)
and (voice_enter_goal_9> noone)
and (voice_enter_goal_10 > noone)
{
	voice_enter_goal = choose(voice_enter_goal_1,
						voice_enter_goal_2,
						voice_enter_goal_3,
						voice_enter_goal_4,
						voice_enter_goal_5,
						voice_enter_goal_6,
						voice_enter_goal_7,
						voice_enter_goal_8,
						voice_enter_goal_9,
						voice_enter_goal_10);
}
#endregion /*Enter goal sound variation END*/

#region /*Dive sound variation*/
if (voice_dive_1> noone)
and (voice_dive_2 = noone)
and (voice_dive_3 = noone)
and (voice_dive_4 = noone)
and (voice_dive_5 = noone)
and (voice_dive_6= noone)
and (voice_dive_7= noone)
and (voice_dive_8= noone)
and (voice_dive_9= noone)
and (voice_dive_10 = noone)
and (voice_dive_11 = noone)
and (voice_dive_12 = noone)
and (voice_dive_13 = noone)
and (voice_dive_14 = noone)
and (voice_dive_15 = noone)
and (voice_dive_16 = noone)
and (voice_dive_17 = noone)
and (voice_dive_18 = noone)
and (voice_dive_19 = noone)
and (voice_dive_20 = noone)
{
	voice_dive = voice_dive_1;
}
else
if (voice_dive_1> noone)
and (voice_dive_2> noone)
and (voice_dive_3 = noone)
and (voice_dive_4 = noone)
and (voice_dive_5 = noone)
and (voice_dive_6= noone)
and (voice_dive_7= noone)
and (voice_dive_8= noone)
and (voice_dive_9= noone)
and (voice_dive_10 = noone)
and (voice_dive_11 = noone)
and (voice_dive_12 = noone)
and (voice_dive_13 = noone)
and (voice_dive_14 = noone)
and (voice_dive_15 = noone)
and (voice_dive_16 = noone)
and (voice_dive_17 = noone)
and (voice_dive_18 = noone)
and (voice_dive_19 = noone)
and (voice_dive_20 = noone)
{
	voice_dive = choose(voice_dive_1,
						voice_dive_2);
}
else
if (voice_dive_1> noone)
and (voice_dive_2> noone)
and (voice_dive_3> noone)
and (voice_dive_4 = noone)
and (voice_dive_5 = noone)
and (voice_dive_6= noone)
and (voice_dive_7= noone)
and (voice_dive_8= noone)
and (voice_dive_9= noone)
and (voice_dive_10 = noone)
and (voice_dive_11 = noone)
and (voice_dive_12 = noone)
and (voice_dive_13 = noone)
and (voice_dive_14 = noone)
and (voice_dive_15 = noone)
and (voice_dive_16 = noone)
and (voice_dive_17 = noone)
and (voice_dive_18 = noone)
and (voice_dive_19 = noone)
and (voice_dive_20 = noone)
{
	voice_dive = choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3);
}
else
if (voice_dive_1> noone)
and (voice_dive_2> noone)
and (voice_dive_3> noone)
and (voice_dive_4> noone)
and (voice_dive_5 = noone)
and (voice_dive_6= noone)
and (voice_dive_7= noone)
and (voice_dive_8= noone)
and (voice_dive_9= noone)
and (voice_dive_10 = noone)
and (voice_dive_11 = noone)
and (voice_dive_12 = noone)
and (voice_dive_13 = noone)
and (voice_dive_14 = noone)
and (voice_dive_15 = noone)
and (voice_dive_16 = noone)
and (voice_dive_17 = noone)
and (voice_dive_18 = noone)
and (voice_dive_19 = noone)
and (voice_dive_20 = noone)
{
	voice_dive = choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4);
}
else
if (voice_dive_1> noone)
and (voice_dive_2> noone)
and (voice_dive_3> noone)
and (voice_dive_4> noone)
and (voice_dive_5> noone)
and (voice_dive_6= noone)
and (voice_dive_7= noone)
and (voice_dive_8= noone)
and (voice_dive_9= noone)
and (voice_dive_10 = noone)
and (voice_dive_11 = noone)
and (voice_dive_12 = noone)
and (voice_dive_13 = noone)
and (voice_dive_14 = noone)
and (voice_dive_15 = noone)
and (voice_dive_16 = noone)
and (voice_dive_17 = noone)
and (voice_dive_18 = noone)
and (voice_dive_19 = noone)
and (voice_dive_20 = noone)
{
	voice_dive = choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5);
}
else
if (voice_dive_1> noone)
and (voice_dive_2> noone)
and (voice_dive_3> noone)
and (voice_dive_4> noone)
and (voice_dive_5> noone)
and (voice_dive_6> noone)
and (voice_dive_7= noone)
and (voice_dive_8= noone)
and (voice_dive_9= noone)
and (voice_dive_10 = noone)
and (voice_dive_11 = noone)
and (voice_dive_12 = noone)
and (voice_dive_13 = noone)
and (voice_dive_14 = noone)
and (voice_dive_15 = noone)
and (voice_dive_16 = noone)
and (voice_dive_17 = noone)
and (voice_dive_18 = noone)
and (voice_dive_19 = noone)
and (voice_dive_20 = noone)
{
	voice_dive = choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5,
						voice_dive_6);
}
else
if (voice_dive_1> noone)
and (voice_dive_2> noone)
and (voice_dive_3> noone)
and (voice_dive_4> noone)
and (voice_dive_5> noone)
and (voice_dive_6> noone)
and (voice_dive_7> noone)
and (voice_dive_8= noone)
and (voice_dive_9= noone)
and (voice_dive_10 = noone)
and (voice_dive_11 = noone)
and (voice_dive_12 = noone)
and (voice_dive_13 = noone)
and (voice_dive_14 = noone)
and (voice_dive_15 = noone)
and (voice_dive_16 = noone)
and (voice_dive_17 = noone)
and (voice_dive_18 = noone)
and (voice_dive_19 = noone)
and (voice_dive_20 = noone)
{
	voice_dive = choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5,
						voice_dive_6,
						voice_dive_7);
}
else
if (voice_dive_1> noone)
and (voice_dive_2> noone)
and (voice_dive_3> noone)
and (voice_dive_4> noone)
and (voice_dive_5> noone)
and (voice_dive_6> noone)
and (voice_dive_7> noone)
and (voice_dive_8> noone)
and (voice_dive_9= noone)
and (voice_dive_10 = noone)
and (voice_dive_11 = noone)
and (voice_dive_12 = noone)
and (voice_dive_13 = noone)
and (voice_dive_14 = noone)
and (voice_dive_15 = noone)
and (voice_dive_16 = noone)
and (voice_dive_17 = noone)
and (voice_dive_18 = noone)
and (voice_dive_19 = noone)
and (voice_dive_20 = noone)
{
	voice_dive = choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5,
						voice_dive_6,
						voice_dive_7,
						voice_dive_8);
}
else
if (voice_dive_1> noone)
and (voice_dive_2> noone)
and (voice_dive_3> noone)
and (voice_dive_4> noone)
and (voice_dive_5> noone)
and (voice_dive_6> noone)
and (voice_dive_7> noone)
and (voice_dive_8> noone)
and (voice_dive_9> noone)
and (voice_dive_10 = noone)
and (voice_dive_11 = noone)
and (voice_dive_12 = noone)
and (voice_dive_13 = noone)
and (voice_dive_14 = noone)
and (voice_dive_15 = noone)
and (voice_dive_16 = noone)
and (voice_dive_17 = noone)
and (voice_dive_18 = noone)
and (voice_dive_19 = noone)
and (voice_dive_20 = noone)
{
	voice_dive = choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5,
						voice_dive_6,
						voice_dive_7,
						voice_dive_8,
						voice_dive_9);
}
else
if (voice_dive_1> noone)
and (voice_dive_2> noone)
and (voice_dive_3> noone)
and (voice_dive_4> noone)
and (voice_dive_5> noone)
and (voice_dive_6> noone)
and (voice_dive_7> noone)
and (voice_dive_8> noone)
and (voice_dive_9> noone)
and (voice_dive_10 > noone)
and (voice_dive_11 = noone)
and (voice_dive_12 = noone)
and (voice_dive_13 = noone)
and (voice_dive_14 = noone)
and (voice_dive_15 = noone)
and (voice_dive_16 = noone)
and (voice_dive_17 = noone)
and (voice_dive_18 = noone)
and (voice_dive_19 = noone)
and (voice_dive_20 = noone)
{
	voice_dive = choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5,
						voice_dive_6,
						voice_dive_7,
						voice_dive_8,
						voice_dive_9,
						voice_dive_10);
}
else
if (voice_dive_1> noone)
and (voice_dive_2> noone)
and (voice_dive_3> noone)
and (voice_dive_4> noone)
and (voice_dive_5> noone)
and (voice_dive_6> noone)
and (voice_dive_7> noone)
and (voice_dive_8> noone)
and (voice_dive_9> noone)
and (voice_dive_10 > noone)
and (voice_dive_11 > noone)
and (voice_dive_12 = noone)
and (voice_dive_13 = noone)
and (voice_dive_14 = noone)
and (voice_dive_15 = noone)
and (voice_dive_16 = noone)
and (voice_dive_17 = noone)
and (voice_dive_18 = noone)
and (voice_dive_19 = noone)
and (voice_dive_20 = noone)
{
	voice_dive = choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5,
						voice_dive_6,
						voice_dive_7,
						voice_dive_8,
						voice_dive_9,
						voice_dive_10,
						voice_dive_11);
}
else
if (voice_dive_1> noone)
and (voice_dive_2> noone)
and (voice_dive_3> noone)
and (voice_dive_4> noone)
and (voice_dive_5> noone)
and (voice_dive_6> noone)
and (voice_dive_7> noone)
and (voice_dive_8> noone)
and (voice_dive_9> noone)
and (voice_dive_10 > noone)
and (voice_dive_11 > noone)
and (voice_dive_12 > noone)
and (voice_dive_13 = noone)
and (voice_dive_14 = noone)
and (voice_dive_15 = noone)
and (voice_dive_16 = noone)
and (voice_dive_17 = noone)
and (voice_dive_18 = noone)
and (voice_dive_19 = noone)
and (voice_dive_20 = noone)
{
	voice_dive = choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5,
						voice_dive_6,
						voice_dive_7,
						voice_dive_8,
						voice_dive_9,
						voice_dive_10,
						voice_dive_11,
						voice_dive_12);
}
else
if (voice_dive_1> noone)
and (voice_dive_2> noone)
and (voice_dive_3> noone)
and (voice_dive_4> noone)
and (voice_dive_5> noone)
and (voice_dive_6> noone)
and (voice_dive_7> noone)
and (voice_dive_8> noone)
and (voice_dive_9> noone)
and (voice_dive_10 > noone)
and (voice_dive_11 > noone)
and (voice_dive_12 > noone)
and (voice_dive_13 > noone)
and (voice_dive_14 = noone)
and (voice_dive_15 = noone)
and (voice_dive_16 = noone)
and (voice_dive_17 = noone)
and (voice_dive_18 = noone)
and (voice_dive_19 = noone)
and (voice_dive_20 = noone)
{
	voice_dive = choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5,
						voice_dive_6,
						voice_dive_7,
						voice_dive_8,
						voice_dive_9,
						voice_dive_10,
						voice_dive_11,
						voice_dive_12,
						voice_dive_13);
}
else
if (voice_dive_1> noone)
and (voice_dive_2> noone)
and (voice_dive_3> noone)
and (voice_dive_4> noone)
and (voice_dive_5> noone)
and (voice_dive_6> noone)
and (voice_dive_7> noone)
and (voice_dive_8> noone)
and (voice_dive_9> noone)
and (voice_dive_10 > noone)
and (voice_dive_11 > noone)
and (voice_dive_12 > noone)
and (voice_dive_13 > noone)
and (voice_dive_14 > noone)
and (voice_dive_15 = noone)
and (voice_dive_16 = noone)
and (voice_dive_17 = noone)
and (voice_dive_18 = noone)
and (voice_dive_19 = noone)
and (voice_dive_20 = noone)
{
	voice_dive = choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5,
						voice_dive_6,
						voice_dive_7,
						voice_dive_8,
						voice_dive_9,
						voice_dive_10,
						voice_dive_11,
						voice_dive_12,
						voice_dive_13,
						voice_dive_14);
}
else
if (voice_dive_1> noone)
and (voice_dive_2> noone)
and (voice_dive_3> noone)
and (voice_dive_4> noone)
and (voice_dive_5> noone)
and (voice_dive_6> noone)
and (voice_dive_7> noone)
and (voice_dive_8> noone)
and (voice_dive_9> noone)
and (voice_dive_10 > noone)
and (voice_dive_11 > noone)
and (voice_dive_12 > noone)
and (voice_dive_13 > noone)
and (voice_dive_14 > noone)
and (voice_dive_15 > noone)
and (voice_dive_16 = noone)
and (voice_dive_17 = noone)
and (voice_dive_18 = noone)
and (voice_dive_19 = noone)
and (voice_dive_20 = noone)
{
	voice_dive = choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5,
						voice_dive_6,
						voice_dive_7,
						voice_dive_8,
						voice_dive_9,
						voice_dive_10,
						voice_dive_11,
						voice_dive_12,
						voice_dive_13,
						voice_dive_14,
						voice_dive_15);
}
else
if (voice_dive_1> noone)
and (voice_dive_2> noone)
and (voice_dive_3> noone)
and (voice_dive_4> noone)
and (voice_dive_5> noone)
and (voice_dive_6> noone)
and (voice_dive_7> noone)
and (voice_dive_8> noone)
and (voice_dive_9> noone)
and (voice_dive_10 > noone)
and (voice_dive_11 > noone)
and (voice_dive_12 > noone)
and (voice_dive_13 > noone)
and (voice_dive_14 > noone)
and (voice_dive_15 > noone)
and (voice_dive_16 > noone)
and (voice_dive_17 = noone)
and (voice_dive_18 = noone)
and (voice_dive_19 = noone)
and (voice_dive_20 = noone)
{
	voice_dive = choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5,
						voice_dive_6,
						voice_dive_7,
						voice_dive_8,
						voice_dive_9,
						voice_dive_10,
						voice_dive_11,
						voice_dive_12,
						voice_dive_13,
						voice_dive_14,
						voice_dive_15,
						voice_dive_16);
}
else
if (voice_dive_1> noone)
and (voice_dive_2> noone)
and (voice_dive_3> noone)
and (voice_dive_4> noone)
and (voice_dive_5> noone)
and (voice_dive_6> noone)
and (voice_dive_7> noone)
and (voice_dive_8> noone)
and (voice_dive_9> noone)
and (voice_dive_10 > noone)
and (voice_dive_11 > noone)
and (voice_dive_12 > noone)
and (voice_dive_13 > noone)
and (voice_dive_14 > noone)
and (voice_dive_15 > noone)
and (voice_dive_16 > noone)
and (voice_dive_17 > noone)
and (voice_dive_18 = noone)
and (voice_dive_19 = noone)
and (voice_dive_20 = noone)
{
	voice_dive = choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5,
						voice_dive_6,
						voice_dive_7,
						voice_dive_8,
						voice_dive_9,
						voice_dive_10,
						voice_dive_11,
						voice_dive_12,
						voice_dive_13,
						voice_dive_14,
						voice_dive_15,
						voice_dive_16,
						voice_dive_17);
}
else
if (voice_dive_1> noone)
and (voice_dive_2> noone)
and (voice_dive_3> noone)
and (voice_dive_4> noone)
and (voice_dive_5> noone)
and (voice_dive_6> noone)
and (voice_dive_7> noone)
and (voice_dive_8> noone)
and (voice_dive_9> noone)
and (voice_dive_10 > noone)
and (voice_dive_11 > noone)
and (voice_dive_12 > noone)
and (voice_dive_13 > noone)
and (voice_dive_14 > noone)
and (voice_dive_15 > noone)
and (voice_dive_16 > noone)
and (voice_dive_17 > noone)
and (voice_dive_18 > noone)
and (voice_dive_19 = noone)
and (voice_dive_20 = noone)
{
	voice_dive = choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5,
						voice_dive_6,
						voice_dive_7,
						voice_dive_8,
						voice_dive_9,
						voice_dive_10,
						voice_dive_11,
						voice_dive_12,
						voice_dive_13,
						voice_dive_14,
						voice_dive_15,
						voice_dive_16,
						voice_dive_17,
						voice_dive_18);
}
else
if (voice_dive_1> noone)
and (voice_dive_2> noone)
and (voice_dive_3> noone)
and (voice_dive_4> noone)
and (voice_dive_5> noone)
and (voice_dive_6> noone)
and (voice_dive_7> noone)
and (voice_dive_8> noone)
and (voice_dive_9> noone)
and (voice_dive_10 > noone)
and (voice_dive_11 > noone)
and (voice_dive_12 > noone)
and (voice_dive_13 > noone)
and (voice_dive_14 > noone)
and (voice_dive_15 > noone)
and (voice_dive_16 > noone)
and (voice_dive_17 > noone)
and (voice_dive_18 > noone)
and (voice_dive_19 > noone)
and (voice_dive_20 = noone)
{
	voice_dive = choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5,
						voice_dive_6,
						voice_dive_7,
						voice_dive_8,
						voice_dive_9,
						voice_dive_10,
						voice_dive_11,
						voice_dive_12,
						voice_dive_13,
						voice_dive_14,
						voice_dive_15,
						voice_dive_16,
						voice_dive_17,
						voice_dive_18,
						voice_dive_19);
}
else
if (voice_dive_1> noone)
and (voice_dive_2> noone)
and (voice_dive_3> noone)
and (voice_dive_4> noone)
and (voice_dive_5> noone)
and (voice_dive_6> noone)
and (voice_dive_7> noone)
and (voice_dive_8> noone)
and (voice_dive_9> noone)
and (voice_dive_10 > noone)
and (voice_dive_11 > noone)
and (voice_dive_12 > noone)
and (voice_dive_13 > noone)
and (voice_dive_14 > noone)
and (voice_dive_15 > noone)
and (voice_dive_16 > noone)
and (voice_dive_17 > noone)
and (voice_dive_18 > noone)
and (voice_dive_19 > noone)
and (voice_dive_20 > noone)
{
	voice_dive = choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5,
						voice_dive_6,
						voice_dive_7,
						voice_dive_8,
						voice_dive_9,
						voice_dive_10,
						voice_dive_11,
						voice_dive_12,
						voice_dive_13,
						voice_dive_14,
						voice_dive_15,
						voice_dive_16,
						voice_dive_17,
						voice_dive_18,
						voice_dive_19,
						voice_dive_20);
}
#endregion /*Dive sound variation END*/

#region /*Damage sound variation*/
if (voice_damage_1> noone)
and (voice_damage_2 = noone)
and (voice_damage_3 = noone)
and (voice_damage_4 = noone)
and (voice_damage_5 = noone)
and (voice_damage_6= noone)
and (voice_damage_7= noone)
and (voice_damage_8= noone)
and (voice_damage_9= noone)
and (voice_damage_10 = noone)
{
	voice_damage = voice_damage_1;
}
else
if (voice_damage_1> noone)
and (voice_damage_2> noone)
and (voice_damage_3 = noone)
and (voice_damage_4 = noone)
and (voice_damage_5 = noone)
and (voice_damage_6= noone)
and (voice_damage_7= noone)
and (voice_damage_8= noone)
and (voice_damage_9= noone)
and (voice_damage_10 = noone)
{
	voice_damage = choose(voice_damage_1,
						voice_damage_2);
}
else
if (voice_damage_1> noone)
and (voice_damage_2> noone)
and (voice_damage_3> noone)
and (voice_damage_4 = noone)
and (voice_damage_5 = noone)
and (voice_damage_6= noone)
and (voice_damage_7= noone)
and (voice_damage_8= noone)
and (voice_damage_9= noone)
and (voice_damage_10 = noone)
{
	voice_damage = choose(voice_damage_1,
						voice_damage_2,
						voice_damage_3);
}
else
if (voice_damage_1> noone)
and (voice_damage_2> noone)
and (voice_damage_3> noone)
and (voice_damage_4> noone)
and (voice_damage_5 = noone)
and (voice_damage_6= noone)
and (voice_damage_7= noone)
and (voice_damage_8= noone)
and (voice_damage_9= noone)
and (voice_damage_10 = noone)
{
	voice_damage = choose(voice_damage_1,
						voice_damage_2,
						voice_damage_3,
						voice_damage_4);
}
else
if (voice_damage_1> noone)
and (voice_damage_2> noone)
and (voice_damage_3> noone)
and (voice_damage_4> noone)
and (voice_damage_5> noone)
and (voice_damage_6= noone)
and (voice_damage_7= noone)
and (voice_damage_8= noone)
and (voice_damage_9= noone)
and (voice_damage_10 = noone)
{
	voice_damage = choose(voice_damage_1,
						voice_damage_2,
						voice_damage_3,
						voice_damage_4,
						voice_damage_5);
}
else
if (voice_damage_1> noone)
and (voice_damage_2> noone)
and (voice_damage_3> noone)
and (voice_damage_4> noone)
and (voice_damage_5> noone)
and (voice_damage_6> noone)
and (voice_damage_7= noone)
and (voice_damage_8= noone)
and (voice_damage_9= noone)
and (voice_damage_10 = noone)
{
	voice_damage = choose(voice_damage_1,
						voice_damage_2,
						voice_damage_3,
						voice_damage_4,
						voice_damage_5,
						voice_damage_6);
}
else
if (voice_damage_1> noone)
and (voice_damage_2> noone)
and (voice_damage_3> noone)
and (voice_damage_4> noone)
and (voice_damage_5> noone)
and (voice_damage_6> noone)
and (voice_damage_7> noone)
and (voice_damage_8= noone)
and (voice_damage_9= noone)
and (voice_damage_10 = noone)
{
	voice_damage = choose(voice_damage_1,
						voice_damage_2,
						voice_damage_3,
						voice_damage_4,
						voice_damage_5,
						voice_damage_6,
						voice_damage_7);
}
else
if (voice_damage_1> noone)
and (voice_damage_2> noone)
and (voice_damage_3> noone)
and (voice_damage_4> noone)
and (voice_damage_5> noone)
and (voice_damage_6> noone)
and (voice_damage_7> noone)
and (voice_damage_8> noone)
and (voice_damage_9= noone)
and (voice_damage_10 = noone)
{
	voice_damage = choose(voice_damage_1,
						voice_damage_2,
						voice_damage_3,
						voice_damage_4,
						voice_damage_5,
						voice_damage_6,
						voice_damage_7,
						voice_damage_8);
}
else
if (voice_damage_1> noone)
and (voice_damage_2> noone)
and (voice_damage_3> noone)
and (voice_damage_4> noone)
and (voice_damage_5> noone)
and (voice_damage_6> noone)
and (voice_damage_7> noone)
and (voice_damage_8> noone)
and (voice_damage_9> noone)
and (voice_damage_10 = noone)
{
	voice_damage = choose(voice_damage_1,
						voice_damage_2,
						voice_damage_3,
						voice_damage_4,
						voice_damage_5,
						voice_damage_6,
						voice_damage_7,
						voice_damage_8,
						voice_damage_9);
}
else
if (voice_damage_1> noone)
and (voice_damage_2> noone)
and (voice_damage_3> noone)
and (voice_damage_4> noone)
and (voice_damage_5> noone)
and (voice_damage_6> noone)
and (voice_damage_7> noone)
and (voice_damage_8> noone)
and (voice_damage_9> noone)
and (voice_damage_10 > noone)
{
	voice_damage = choose(voice_damage_1,
						voice_damage_2,
						voice_damage_3,
						voice_damage_4,
						voice_damage_5,
						voice_damage_6,
						voice_damage_7,
						voice_damage_8,
						voice_damage_9,
						voice_damage_10);
}
#endregion /*Damage sound variation END*/

#region /*Burned running sound variation*/
if (voice_burned_running_1> noone)
and (voice_burned_running_2 = noone)
and (voice_burned_running_3 = noone)
and (voice_burned_running_4 = noone)
and (voice_burned_running_5 = noone)
and (voice_burned_running_6= noone)
and (voice_burned_running_7= noone)
and (voice_burned_running_8= noone)
and (voice_burned_running_9= noone)
and (voice_burned_running_10 = noone)
{
	voice_burned_running = voice_burned_running_1;
}
else
if (voice_burned_running_1> noone)
and (voice_burned_running_2> noone)
and (voice_burned_running_3 = noone)
and (voice_burned_running_4 = noone)
and (voice_burned_running_5 = noone)
and (voice_burned_running_6= noone)
and (voice_burned_running_7= noone)
and (voice_burned_running_8= noone)
and (voice_burned_running_9= noone)
and (voice_burned_running_10 = noone)
{
	voice_burned_running = choose(voice_burned_running_1,
						voice_burned_running_2);
}
else
if (voice_burned_running_1> noone)
and (voice_burned_running_2> noone)
and (voice_burned_running_3> noone)
and (voice_burned_running_4 = noone)
and (voice_burned_running_5 = noone)
and (voice_burned_running_6= noone)
and (voice_burned_running_7= noone)
and (voice_burned_running_8= noone)
and (voice_burned_running_9= noone)
and (voice_burned_running_10 = noone)
{
	voice_burned_running = choose(voice_burned_running_1,
						voice_burned_running_2,
						voice_burned_running_3);
}
else
if (voice_burned_running_1> noone)
and (voice_burned_running_2> noone)
and (voice_burned_running_3> noone)
and (voice_burned_running_4> noone)
and (voice_burned_running_5 = noone)
and (voice_burned_running_6= noone)
and (voice_burned_running_7= noone)
and (voice_burned_running_8= noone)
and (voice_burned_running_9= noone)
and (voice_burned_running_10 = noone)
{
	voice_burned_running = choose(voice_burned_running_1,
						voice_burned_running_2,
						voice_burned_running_3,
						voice_burned_running_4);
}
else
if (voice_burned_running_1> noone)
and (voice_burned_running_2> noone)
and (voice_burned_running_3> noone)
and (voice_burned_running_4> noone)
and (voice_burned_running_5> noone)
and (voice_burned_running_6= noone)
and (voice_burned_running_7= noone)
and (voice_burned_running_8= noone)
and (voice_burned_running_9= noone)
and (voice_burned_running_10 = noone)
{
	voice_burned_running = choose(voice_burned_running_1,
						voice_burned_running_2,
						voice_burned_running_3,
						voice_burned_running_4,
						voice_burned_running_5);
}
else
if (voice_burned_running_1> noone)
and (voice_burned_running_2> noone)
and (voice_burned_running_3> noone)
and (voice_burned_running_4> noone)
and (voice_burned_running_5> noone)
and (voice_burned_running_6> noone)
and (voice_burned_running_7= noone)
and (voice_burned_running_8= noone)
and (voice_burned_running_9= noone)
and (voice_burned_running_10 = noone)
{
	voice_burned_running = choose(voice_burned_running_1,
						voice_burned_running_2,
						voice_burned_running_3,
						voice_burned_running_4,
						voice_burned_running_5,
						voice_burned_running_6);
}
else
if (voice_burned_running_1> noone)
and (voice_burned_running_2> noone)
and (voice_burned_running_3> noone)
and (voice_burned_running_4> noone)
and (voice_burned_running_5> noone)
and (voice_burned_running_6> noone)
and (voice_burned_running_7> noone)
and (voice_burned_running_8= noone)
and (voice_burned_running_9= noone)
and (voice_burned_running_10 = noone)
{
	voice_burned_running = choose(voice_burned_running_1,
						voice_burned_running_2,
						voice_burned_running_3,
						voice_burned_running_4,
						voice_burned_running_5,
						voice_burned_running_6,
						voice_burned_running_7);
}
else
if (voice_burned_running_1> noone)
and (voice_burned_running_2> noone)
and (voice_burned_running_3> noone)
and (voice_burned_running_4> noone)
and (voice_burned_running_5> noone)
and (voice_burned_running_6> noone)
and (voice_burned_running_7> noone)
and (voice_burned_running_8> noone)
and (voice_burned_running_9= noone)
and (voice_burned_running_10 = noone)
{
	voice_burned_running = choose(voice_burned_running_1,
						voice_burned_running_2,
						voice_burned_running_3,
						voice_burned_running_4,
						voice_burned_running_5,
						voice_burned_running_6,
						voice_burned_running_7,
						voice_burned_running_8);
}
else
if (voice_burned_running_1> noone)
and (voice_burned_running_2> noone)
and (voice_burned_running_3> noone)
and (voice_burned_running_4> noone)
and (voice_burned_running_5> noone)
and (voice_burned_running_6> noone)
and (voice_burned_running_7> noone)
and (voice_burned_running_8> noone)
and (voice_burned_running_9> noone)
and (voice_burned_running_10 = noone)
{
	voice_burned_running = choose(voice_burned_running_1,
						voice_burned_running_2,
						voice_burned_running_3,
						voice_burned_running_4,
						voice_burned_running_5,
						voice_burned_running_6,
						voice_burned_running_7,
						voice_burned_running_8,
						voice_burned_running_9);
}
else
if (voice_burned_running_1> noone)
and (voice_burned_running_2> noone)
and (voice_burned_running_3> noone)
and (voice_burned_running_4> noone)
and (voice_burned_running_5> noone)
and (voice_burned_running_6> noone)
and (voice_burned_running_7> noone)
and (voice_burned_running_8> noone)
and (voice_burned_running_9> noone)
and (voice_burned_running_10 > noone)
{
	voice_burned_running = choose(voice_burned_running_1,
						voice_burned_running_2,
						voice_burned_running_3,
						voice_burned_running_4,
						voice_burned_running_5,
						voice_burned_running_6,
						voice_burned_running_7,
						voice_burned_running_8,
						voice_burned_running_9,
						voice_burned_running_10);
}
#endregion /*Burned running sound variation END*/

#region /*Burned sound variation*/
if (voice_burned_1> noone)
and (voice_burned_2 = noone)
and (voice_burned_3 = noone)
and (voice_burned_4 = noone)
and (voice_burned_5 = noone)
and (voice_burned_6= noone)
and (voice_burned_7= noone)
and (voice_burned_8= noone)
and (voice_burned_9= noone)
and (voice_burned_10 = noone)
{
	voice_burned = voice_burned_1;
}
else
if (voice_burned_1> noone)
and (voice_burned_2> noone)
and (voice_burned_3 = noone)
and (voice_burned_4 = noone)
and (voice_burned_5 = noone)
and (voice_burned_6= noone)
and (voice_burned_7= noone)
and (voice_burned_8= noone)
and (voice_burned_9= noone)
and (voice_burned_10 = noone)
{
	voice_burned = choose(voice_burned_1,
						voice_burned_2);
}
else
if (voice_burned_1> noone)
and (voice_burned_2> noone)
and (voice_burned_3> noone)
and (voice_burned_4 = noone)
and (voice_burned_5 = noone)
and (voice_burned_6= noone)
and (voice_burned_7= noone)
and (voice_burned_8= noone)
and (voice_burned_9= noone)
and (voice_burned_10 = noone)
{
	voice_burned = choose(voice_burned_1,
						voice_burned_2,
						voice_burned_3);
}
else
if (voice_burned_1> noone)
and (voice_burned_2> noone)
and (voice_burned_3> noone)
and (voice_burned_4> noone)
and (voice_burned_5 = noone)
and (voice_burned_6= noone)
and (voice_burned_7= noone)
and (voice_burned_8= noone)
and (voice_burned_9= noone)
and (voice_burned_10 = noone)
{
	voice_burned = choose(voice_burned_1,
						voice_burned_2,
						voice_burned_3,
						voice_burned_4);
}
else
if (voice_burned_1> noone)
and (voice_burned_2> noone)
and (voice_burned_3> noone)
and (voice_burned_4> noone)
and (voice_burned_5> noone)
and (voice_burned_6= noone)
and (voice_burned_7= noone)
and (voice_burned_8= noone)
and (voice_burned_9= noone)
and (voice_burned_10 = noone)
{
	voice_burned = choose(voice_burned_1,
						voice_burned_2,
						voice_burned_3,
						voice_burned_4,
						voice_burned_5);
}
else
if (voice_burned_1> noone)
and (voice_burned_2> noone)
and (voice_burned_3> noone)
and (voice_burned_4> noone)
and (voice_burned_5> noone)
and (voice_burned_6> noone)
and (voice_burned_7= noone)
and (voice_burned_8= noone)
and (voice_burned_9= noone)
and (voice_burned_10 = noone)
{
	voice_burned = choose(voice_burned_1,
						voice_burned_2,
						voice_burned_3,
						voice_burned_4,
						voice_burned_5,
						voice_burned_6);
}
else
if (voice_burned_1> noone)
and (voice_burned_2> noone)
and (voice_burned_3> noone)
and (voice_burned_4> noone)
and (voice_burned_5> noone)
and (voice_burned_6> noone)
and (voice_burned_7> noone)
and (voice_burned_8= noone)
and (voice_burned_9= noone)
and (voice_burned_10 = noone)
{
	voice_burned = choose(voice_burned_1,
						voice_burned_2,
						voice_burned_3,
						voice_burned_4,
						voice_burned_5,
						voice_burned_6,
						voice_burned_7);
}
else
if (voice_burned_1> noone)
and (voice_burned_2> noone)
and (voice_burned_3> noone)
and (voice_burned_4> noone)
and (voice_burned_5> noone)
and (voice_burned_6> noone)
and (voice_burned_7> noone)
and (voice_burned_8> noone)
and (voice_burned_9= noone)
and (voice_burned_10 = noone)
{
	voice_burned = choose(voice_burned_1,
						voice_burned_2,
						voice_burned_3,
						voice_burned_4,
						voice_burned_5,
						voice_burned_6,
						voice_burned_7,
						voice_burned_8);
}
else
if (voice_burned_1> noone)
and (voice_burned_2> noone)
and (voice_burned_3> noone)
and (voice_burned_4> noone)
and (voice_burned_5> noone)
and (voice_burned_6> noone)
and (voice_burned_7> noone)
and (voice_burned_8> noone)
and (voice_burned_9> noone)
and (voice_burned_10 = noone)
{
	voice_burned = choose(voice_burned_1,
						voice_burned_2,
						voice_burned_3,
						voice_burned_4,
						voice_burned_5,
						voice_burned_6,
						voice_burned_7,
						voice_burned_8,
						voice_burned_9);
}
else
if (voice_burned_1> noone)
and (voice_burned_2> noone)
and (voice_burned_3> noone)
and (voice_burned_4> noone)
and (voice_burned_5> noone)
and (voice_burned_6> noone)
and (voice_burned_7> noone)
and (voice_burned_8> noone)
and (voice_burned_9> noone)
and (voice_burned_10 > noone)
{
	voice_burned = choose(voice_burned_1,
						voice_burned_2,
						voice_burned_3,
						voice_burned_4,
						voice_burned_5,
						voice_burned_6,
						voice_burned_7,
						voice_burned_8,
						voice_burned_9,
						voice_burned_10);
}
#endregion /*Burned sound variation END*/

#region /*Scream sound variation*/
if (voice_scream_1> noone)
and (voice_scream_2 = noone)
and (voice_scream_3 = noone)
and (voice_scream_4 = noone)
and (voice_scream_5 = noone)
and (voice_scream_6= noone)
and (voice_scream_7= noone)
and (voice_scream_8= noone)
and (voice_scream_9= noone)
and (voice_scream_10 = noone)
{
	voice_scream = voice_scream_1;
}
else
if (voice_scream_1> noone)
and (voice_scream_2> noone)
and (voice_scream_3 = noone)
and (voice_scream_4 = noone)
and (voice_scream_5 = noone)
and (voice_scream_6= noone)
and (voice_scream_7= noone)
and (voice_scream_8= noone)
and (voice_scream_9= noone)
and (voice_scream_10 = noone)
{
	voice_scream = choose(voice_scream_1,
						voice_scream_2);
}
else
if (voice_scream_1> noone)
and (voice_scream_2> noone)
and (voice_scream_3> noone)
and (voice_scream_4 = noone)
and (voice_scream_5 = noone)
and (voice_scream_6= noone)
and (voice_scream_7= noone)
and (voice_scream_8= noone)
and (voice_scream_9= noone)
and (voice_scream_10 = noone)
{
	voice_scream = choose(voice_scream_1,
						voice_scream_2,
						voice_scream_3);
}
else
if (voice_scream_1> noone)
and (voice_scream_2> noone)
and (voice_scream_3> noone)
and (voice_scream_4> noone)
and (voice_scream_5 = noone)
and (voice_scream_6= noone)
and (voice_scream_7= noone)
and (voice_scream_8= noone)
and (voice_scream_9= noone)
and (voice_scream_10 = noone)
{
	voice_scream = choose(voice_scream_1,
						voice_scream_2,
						voice_scream_3,
						voice_scream_4);
}
else
if (voice_scream_1> noone)
and (voice_scream_2> noone)
and (voice_scream_3> noone)
and (voice_scream_4> noone)
and (voice_scream_5> noone)
and (voice_scream_6= noone)
and (voice_scream_7= noone)
and (voice_scream_8= noone)
and (voice_scream_9= noone)
and (voice_scream_10 = noone)
{
	voice_scream = choose(voice_scream_1,
						voice_scream_2,
						voice_scream_3,
						voice_scream_4,
						voice_scream_5);
}
else
if (voice_scream_1> noone)
and (voice_scream_2> noone)
and (voice_scream_3> noone)
and (voice_scream_4> noone)
and (voice_scream_5> noone)
and (voice_scream_6> noone)
and (voice_scream_7= noone)
and (voice_scream_8= noone)
and (voice_scream_9= noone)
and (voice_scream_10 = noone)
{
	voice_scream = choose(voice_scream_1,
						voice_scream_2,
						voice_scream_3,
						voice_scream_4,
						voice_scream_5,
						voice_scream_6);
}
else
if (voice_scream_1> noone)
and (voice_scream_2> noone)
and (voice_scream_3> noone)
and (voice_scream_4> noone)
and (voice_scream_5> noone)
and (voice_scream_6> noone)
and (voice_scream_7> noone)
and (voice_scream_8= noone)
and (voice_scream_9= noone)
and (voice_scream_10 = noone)
{
	voice_scream = choose(voice_scream_1,
						voice_scream_2,
						voice_scream_3,
						voice_scream_4,
						voice_scream_5,
						voice_scream_6,
						voice_scream_7);
}
else
if (voice_scream_1> noone)
and (voice_scream_2> noone)
and (voice_scream_3> noone)
and (voice_scream_4> noone)
and (voice_scream_5> noone)
and (voice_scream_6> noone)
and (voice_scream_7> noone)
and (voice_scream_8> noone)
and (voice_scream_9= noone)
and (voice_scream_10 = noone)
{
	voice_scream = choose(voice_scream_1,
						voice_scream_2,
						voice_scream_3,
						voice_scream_4,
						voice_scream_5,
						voice_scream_6,
						voice_scream_7,
						voice_scream_8);
}
else
if (voice_scream_1> noone)
and (voice_scream_2> noone)
and (voice_scream_3> noone)
and (voice_scream_4> noone)
and (voice_scream_5> noone)
and (voice_scream_6> noone)
and (voice_scream_7> noone)
and (voice_scream_8> noone)
and (voice_scream_9> noone)
and (voice_scream_10 = noone)
{
	voice_scream = choose(voice_scream_1,
						voice_scream_2,
						voice_scream_3,
						voice_scream_4,
						voice_scream_5,
						voice_scream_6,
						voice_scream_7,
						voice_scream_8,
						voice_scream_9);
}
else
if (voice_scream_1> noone)
and (voice_scream_2> noone)
and (voice_scream_3> noone)
and (voice_scream_4> noone)
and (voice_scream_5> noone)
and (voice_scream_6> noone)
and (voice_scream_7> noone)
and (voice_scream_8> noone)
and (voice_scream_9> noone)
and (voice_scream_10 > noone)
{
	voice_scream = choose(voice_scream_1,
						voice_scream_2,
						voice_scream_3,
						voice_scream_4,
						voice_scream_5,
						voice_scream_6,
						voice_scream_7,
						voice_scream_8,
						voice_scream_9,
						voice_scream_10);
}
#endregion /*Scream sound variation END*/

#endregion /*Choose to play voice clips randomly END*/

room_speed = global.max_fps; /*Room Speed*/

scr_start_intro_animations();

#region /*Restart Level*/
if (global.restart_level = true)
{
	global.restart_level = false;
	global.quit_level = false;
	audio_stop_all();
	room_persistent = false;
	
	#region /*Reset timer back to zero*/
	global.timeattack_realmillisecond = 0;
	global.timeattack_millisecond = 0;
	global.timeattack_second = 0;
	global.timeattack_minute = 0;	
	#endregion /*Reset timer back to zero END*/
	
	score = 0;
	
	room_restart();
}
#endregion /*Restart Level END*/

#region /*Quit Level*/
if (global.quit_level = true)
{
	global.quit_level = false;
	audio_stop_all();
	room_persistent = false;
	
	#region /*Reset timer back to zero*/
	global.timeattack_realmillisecond = 0;
	global.timeattack_millisecond = 0;
	global.timeattack_second = 0;
	global.timeattack_minute = 0;	
	#endregion /*Reset timer back to zero END*/
	
	score = 0;
	
	global.level_clear_rate = noone;
	if (asset_get_type("scr_savelevel") == asset_script)
	{
		scr_savelevel();
	}
	if (global.quit_to_map = true)
	and (asset_get_type("room_world_map") == asset_room)
	{
		global.quit_to_map = false;
		if (!instance_exists(obj_camera.player1))
		{
			global.player1_can_play = false;
		}
		if (!instance_exists(obj_camera.player2))
		{
			global.player2_can_play = false;
		}
		if (!instance_exists(obj_camera.player3))
		{
			global.player3_can_play = false;
		}
		if (!instance_exists(obj_camera.player4))
		{
			global.player4_can_play = false;
		}
		room_goto(room_world_map);
	}
	else
	if (global.quit_to_title = true)
	and (asset_get_type("room_title") == asset_room)
	{
		global.quit_to_title = false;
		if (!instance_exists(obj_camera.player1))
		{
			global.player1_can_play = false;
		}
		if (!instance_exists(obj_camera.player2))
		{
			global.player2_can_play = false;
		}
		if (!instance_exists(obj_camera.player3))
		{
			global.player3_can_play = false;
		}
		if (!instance_exists(obj_camera.player4))
		{
			global.player4_can_play = false;
		}
		room_goto(room_title);
	}
	else
	{
		game_restart();
	}
}
#endregion /*Quit Level END*/

#region /*Invincible Music*/
if (invincible >= true)
and (assist_invincible = false)
and (asset_get_type("snd_music_invincible") == asset_sound)
and (audio_is_playing(snd_music_invincible))
{
	audio_sound_gain(global.music, 0, 0);
	audio_sound_gain(global.music_underwater, 0, 0);
}
else
{
	if (!audio_is_playing(snd_music_invincible))
	{
		invincible = false;
	}
	
	audio_stop_sound(snd_music_invincible);
	
	if (!audio_is_playing(global.music))
	{
		if (asset_get_type("snd_hurry_up") == asset_sound)
		and (!audio_is_playing(snd_hurry_up))
		{
			audio_play_sound(global.music, 0, true);
			audio_sound_gain(global.music, 0, 0);
		}
		else
		{
			audio_play_sound(global.music, 0, true);
			audio_sound_gain(global.music, 0, 0);
		}
	}
	if (!audio_is_playing(global.music_underwater))
	{
		if (asset_get_type("snd_hurry_up") == asset_sound)
		and (!audio_is_playing(snd_hurry_up))
		{
			audio_play_sound(global.music_underwater, 0, true);
			audio_sound_gain(global.music_underwater, 0, 0);
		}
		else
		{
			audio_play_sound(global.music_underwater, 0, true);
			audio_sound_gain(global.music_underwater, 0, 0);
		}
	}
}
#endregion /*Invincible Music END*/

#region /*Play Ambience*/
if (!audio_is_playing(global.ambience))
{
	audio_play_sound(global.ambience, 0, true);
	audio_sound_gain(global.ambience, global.ambient_volume * global.main_volume, 0);
}
#endregion /*Play Ambience END*/

#region /*Play Underwater Ambience*/
if (!audio_is_playing(global.ambience_underwater))
{
	audio_play_sound(global.ambience_underwater, 0, true);
	audio_sound_gain(global.ambience_underwater, 0, 0);
}
#endregion /*Play Underwater Ambience END*/

#region /*Music Pitch*/
if (global.time_countdown < 100)
and (global.enable_time_countdown = true)
and (allow_timeup = true)
{
	audio_sound_pitch(global.music, music_pitch + 0.3);
	audio_sound_pitch(global.music_underwater, music_pitch + 0.3);
	if (crouch = true)
	or(ground_pound = true)
	and (place_meeting(x, y + sprite_height, obj_wall))
	{
		music_pitch = lerp(music_pitch, 0.95, 0.001);
	}
	else
	{
		music_pitch = lerp(music_pitch, 1, 0.01);
	}
}
else
{
	audio_sound_pitch(global.music, music_pitch);
	audio_sound_pitch(global.music_underwater, music_pitch);
	if (crouch = true)
	or(ground_pound = true)
	and (place_meeting(x, y + sprite_height, obj_wall))
	{
		music_pitch = lerp(music_pitch, 0.95, 0.001);
	}
	else
	{
		music_pitch = lerp(music_pitch, 1, 0.01);
	}
}
#endregion /*Music Pitch END*/

#region /*Make sure the heart stays on the character if you spawn from a checkpoint*/
if (asset_get_type("obj_checkpoint") == asset_object)
and (asset_get_type("obj_camera") == asset_object)
{
	if (instance_exists(obj_checkpoint))
	and (place_meeting(x, y, obj_checkpoint))
	and (instance_exists(obj_camera))
	and (place_meeting(x, y, obj_camera))
	{
		if (obj_camera.iris_xscale < 0.3)
		or(obj_camera.iris_yscale < 0.3)
		{
			
			xx_heart = x;
			yy_heart = y;
		}
	}
}
#endregion /*Make sure the heart stays on the character if you spawn from a checkpoint END*/

#region /*Winning the level and transitioning to the next area*/
if (asset_get_type("obj_checkpoint") == asset_object)
and (asset_get_type("obj_camera") == asset_object)
and (!place_meeting(x, y, obj_checkpoint))
and (instance_exists(obj_camera))
and (obj_camera.iris_xscale < 3)
{
	
	#region /*Don't go outside view boundary*/
	if (goal = true)
	and (global.time_countdown_bonus <= 0)
	{
		global.level_clear_rate = "clear"; /*Set the level_clear_rate to clear as soon as you get the goal*/
		if (instance_exists(obj_camera))
		and (obj_camera.iris_xscale <= 0.01)
		and (global.level_clear_rate = "clear")
		{
			if (obj_camera.iris_yscale <= 0.001)
			{
				audio_stop_all();
				global.x_checkpoint = 0;
				global.y_checkpoint = 0;
				global.checkpoint_millisecond = 0;
				global.checkpoint_second = 0;
				global.checkpoint_minute = 0;
				global.checkpoint_realmillisecond = 0;
				global.lives_until_assist = 0;
				if (asset_get_type("scr_savelevel") == asset_script)
				{
					scr_savelevel(); /*Important that you save all level information here, before going back to map screen, but after setting level_clear_rate to clear*/
				}
				if (global.actually_play_edited_level = false)
				and (global.play_edited_level = true)
				and (global.character_select_in_this_menu = "level_editor")
				{
					global.actually_play_edited_level = false;
					global.play_edited_level = false;
					room_restart();
				}
				else
				if (global.actually_play_edited_level = true)
				and (global.play_edited_level = true)
				and (global.character_select_in_this_menu = "level_editor")
				and (asset_get_type("room_title") == asset_room)
				{						
					global.actually_play_edited_level = false;
					global.play_edited_level = false;
					if (!instance_exists(obj_camera.player1))
					{
						global.player1_can_play = false;
					}
					if (!instance_exists(obj_camera.player2))
					{
						global.player2_can_play = false;
					}
					if (!instance_exists(obj_camera.player3))
					{
						global.player3_can_play = false;
					}
					if (!instance_exists(obj_camera.player4))
					{
						global.player4_can_play = false;
					}
					room_goto(room_title);
				}
				else
				if (obj_camera.after_goal_go_to_this_level >= 0)
				and (asset_get_type("room_leveleditor") == asset_room)
				{
					global.select_level_index = obj_camera.after_goal_go_to_this_level;
					scr_update_all_backgrounds();
					if (!instance_exists(obj_camera.player1))
					{
						global.player1_can_play = false;
					}
					if (!instance_exists(obj_camera.player2))
					{
						global.player2_can_play = false;
					}
					if (!instance_exists(obj_camera.player3))
					{
						global.player3_can_play = false;
					}
					if (!instance_exists(obj_camera.player4))
					{
						global.player4_can_play = false;
					}
					room_goto(room_leveleditor);
				}
				else
				if (asset_get_type("room_world_map") == asset_room)
				{
					if (!instance_exists(obj_camera.player1))
					{
						global.player1_can_play = false;
					}
					if (!instance_exists(obj_camera.player2))
					{
						global.player2_can_play = false;
					}
					if (!instance_exists(obj_camera.player3))
					{
						global.player3_can_play = false;
					}
					if (!instance_exists(obj_camera.player4))
					{
						global.player4_can_play = false;
					}
					room_goto(room_world_map);
				}
			}
			else
			{
				if (x > room_width + sprite_width / 2)
				{
					x = room_width + sprite_width / 2;
					hspeed = 0;
					vspeed = 0;
				}
			}
		}
	}
	#endregion /*Don't go outside view boundary END*/
	
	else
	{
		
		#region /*Don't go outside view*/
		if (x < camera_get_view_x(view_camera[view_current]))
		and (instance_number(obj_player) >= 2)
		and (intro_animation = "")
		{
			x = camera_get_view_x(view_camera[view_current]);
		}
		if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		and (instance_number(obj_player) >= 2)
		and (intro_animation = "")
		{
			x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]);
		}
		#endregion /*Don't go outside view END*/
		
		#region /*Don't go outside room*/
		if (intro_animation = "")
		{
			if (x < 0)
			{
				x = 0;
			}
			if (x > room_width)
			{
				x = room_width;
			}
			if (y < - 64)
			{
				y = -64;
			}
		}
		#endregion /*Don't go outside room END*/
		
	}
}
else
{
	
	#region /*Don't go outside view*/
	if (x < camera_get_view_x(view_camera[view_current]))
	and (instance_number(obj_player) >= 2)
	and (intro_animation = "")
	{
		x = camera_get_view_x(view_camera[view_current]);
	}
	if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
	and (instance_number(obj_player) >= 2)
	and (intro_animation = "")
	{
		x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]);
	}
	#endregion /*Don't go outside view END*/
	
	#region /*Don't go outside room*/
	if (intro_animation = "")
	{
		if (x < 0)
		{
			x = 0;
		}
		if (x > room_width)
		{
			x = room_width;
		}
		if (y < - 64)
		{
			y = -64;
		}
	}
	#endregion /*Don't go outside room END*/
	
}
#endregion /*Winning the level and transitioning to the next area END*/

#region /*Don't let the player outside the view too much when winning*/
if (goal = true)
{
	if (x < camera_get_view_x(view_camera[view_current]) - 32)
	{
		x = camera_get_view_x(view_camera[view_current]) - 32;
		if (hspeed < 0)
		{
			hspeed = 0;
		}
	}
	if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 32)
	{
		x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 32;
		if (hspeed > 0)
		{
			hspeed = 0;
		}
	}
	if (y <- 64)
	{
		y = - 64;
	}
	if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 32)
	{
		y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 32;
		if (vspeed > 0)
		{
			vspeed = 0;
		}
		gravity = 0;
	}
}
#endregion /*Don't let the player outside the view too much when winning END*/

if (hspeed!= 0)
{
	hspeed_dir = sign(hspeed);
}

#region /*Fullscreen Toggle if camera object doesn't exist. Default: F11*/
if (asset_get_type("obj_camera") == asset_object)
and (!instance_exists(obj_camera))
and (keyboard_check_pressed(global.fullscreen_key))
{
	if (window_get_fullscreen())
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
	ini_open("config.ini");
	ini_write_real("config", "fullscreen_mode", window_get_fullscreen());
	ini_close();
}
#endregion /*Fullscreen Toggle if camera object doesn't exist. Default: F11 END*/

#region /*Set values from the Input Settings*/

#region /*Up Key Is Jump Key*/
if (player = 1)
{
	up_key_is_jump_key = global.player1_up_key_is_jump_key;
}
else
if (player = 2)
{
	up_key_is_jump_key = global.player2_up_key_is_jump_key;
}
else
if (player = 3)
{
	up_key_is_jump_key = global.player3_up_key_is_jump_key;
}
else
if (player = 4)
{
	up_key_is_jump_key = global.player4_up_key_is_jump_key;
}
#endregion /*Up Key Is Jump Key END*/

#region /*Double-tap direction to run*/
if (player = 1)
{
	double_tap_to_run = global.player1_double_tap_to_run;
}
else
if (player = 2)
{
	double_tap_to_run = global.player2_double_tap_to_run;
}
else
if (player = 3)
{
	double_tap_to_run = global.player3_double_tap_to_run;
}
else
if (player = 4)
{
	double_tap_to_run = global.player4_double_tap_to_run;
}
#endregion /*Double-tap direction to run END*/

#region /*Cancel dive by pressing the jump or dive key*/
if (player = 1)
{
	cancel_dive_by_pressing_jump_or_dive_button = global.player1_cancel_dive_by_pressing_jump_or_dive_button;
}
else
if (player = 2)
{
	cancel_dive_by_pressing_jump_or_dive_button = global.player2_cancel_dive_by_pressing_jump_or_dive_button;
}
else
if (player = 3)
{
	cancel_dive_by_pressing_jump_or_dive_button = global.player3_cancel_dive_by_pressing_jump_or_dive_button;
}
else
if (player = 4)
{
	cancel_dive_by_pressing_jump_or_dive_button = global.player4_cancel_dive_by_pressing_jump_or_dive_button;
}
#endregion /*Cancel dive by pressing the jump or dive key END*/

#region /*Cancel dive by pressing the opposite direction*/
if (player = 1)
{
	cancel_dive_by_pressing_opposite_direction = global.player1_cancel_dive_by_pressing_opposite_direction;
}
else
if (player = 2)
{
	cancel_dive_by_pressing_opposite_direction = global.player2_cancel_dive_by_pressing_opposite_direction;
}
else
if (player = 3)
{
	cancel_dive_by_pressing_opposite_direction = global.player3_cancel_dive_by_pressing_opposite_direction;
}
else
if (player = 4)
{
	cancel_dive_by_pressing_opposite_direction = global.player4_cancel_dive_by_pressing_opposite_direction;
}
#endregion /*Cancel dive by pressing the opposite direction END*/

#region /*Down + Jump to Ground Pound*/
if (player = 1)
{
	down_and_jump_to_groundpound = global.player1_down_and_jump_to_groundpound;
}
else
if (player = 2)
{
	down_and_jump_to_groundpound = global.player2_down_and_jump_to_groundpound;
}
else
if (player = 3)
{
	down_and_jump_to_groundpound = global.player3_down_and_jump_to_groundpound;
}
else
if (player = 4)
{
	down_and_jump_to_groundpound = global.player4_down_and_jump_to_groundpound;
}
#endregion /*Down + Jump to Ground Pound END*/

#region /*Hold Direction Wall jump*/
if (player = 1)
{
	wall_jump_setting = global.player1_wall_jump_setting;
}
else
if (player = 2)
{
	wall_jump_setting = global.player2_wall_jump_setting;
}
else
if (player = 3)
{
	wall_jump_setting = global.player3_wall_jump_setting;
}
else
if (player = 4)
{
	wall_jump_setting = global.player4_wall_jump_setting;
}
#endregion /*Hold Direction Wall jump END*/

#region /*Drop down form Horizontal Rope*/
if (player = 1)
{
	drop_from_rope = global.player1_drop_from_rope;
}
else
if (player = 2)
{
	drop_from_rope = global.player2_drop_from_rope;
}
else
if (player = 3)
{
	drop_from_rope = global.player3_drop_from_rope;
}
else
if (player = 4)
{
	drop_from_rope = global.player4_drop_from_rope;
}
#endregion /*Drop down form Horizontal Rope END*/

#endregion /*Set values from the Input Settings END*/

#region /*Assist Invincible*/
if (assist_invincible = true)
{
	if (hp <= 0)
	{
		hp = 1;
	}
	invincible = true;
	audio_stop_sound(snd_music_invincible);
	if (key_jump_hold)
	{
		if (asset_get_type("obj_wall") == asset_object)
		and (!place_meeting(x, y + 1, obj_wall))
		and (asset_get_type("obj_semisolid_platform") == asset_object)
		and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
		and (dive = false)
		and (ground_pound = false)
		and (crouch = false)
		and (vspeed > 1)
		{
			vspeed = +1;
			crouch = false;
			can_ground_pound = false;
		}
	}
}
#endregion /*Assist Invincible END*/

#region /*If Assist delault hp is invincible, stay invincible*/
if (global.assist_enable = true)
and (global.assist_invincible = true)
and (hp < max_hp)
{
	hp = max_hp;
}
#endregion /*If Assist delault hp is invincible, stay invincible END*/

#region /*Customisable Controls Array*/

#region /*Player 1 Controls*/
if (player <= 1)
{
	var this_player_key_crouch_toggle = global.player1_key_crouch_toggle;
	var this_player_key2_crouch_toggle = global.player1_key2_crouch_toggle;
	var this_player_gamepad_button_crouch_toggle = global.player1_gamepad_button_crouch_toggle;
	var this_player_gamepad_button2_crouch_toggle = global.player1_gamepad_button2_crouch_toggle;
	var this_player_key_tongue = global.player1_key_tongue;
	var this_player_key2_tongue = global.player1_key2_tongue;
	var this_player_gamepad_button_tongue = global.player1_gamepad_button_tongue;
	var this_player_gamepad_button2_tongue = global.player1_gamepad_button2_tongue;
	var this_player_key_dive = global.player1_key_dive;
	var this_player_key2_dive = global.player1_key2_dive;
	var this_player_gamepad_button_dive = global.player1_gamepad_button_dive;
	var this_player_gamepad_button2_dive = global.player1_gamepad_button2_dive;
	var this_player_key_jump = global.player1_key_jump;
	var this_player_key2_jump = global.player1_key2_jump;
	var this_player_gamepad_button_jump = global.player1_gamepad_button_jump;
	var this_player_gamepad_button2_jump = global.player1_gamepad_button2_jump;
	var this_player_key_up = global.player1_key_up;
	var this_player_key2_up = global.player1_key2_up;
	var this_player_gamepad_button_up = global.player1_gamepad_button_up;
	var this_player_gamepad_button2_up = global.player1_gamepad_button2_up;
	var this_player_key_down = global.player1_key_down;
	var this_player_key2_down = global.player1_key2_down;
	var this_player_gamepad_button_down = global.player1_gamepad_button_down;
	var this_player_gamepad_button2_down = global.player1_gamepad_button2_down;
	var this_player_key_left = global.player1_key_left;
	var this_player_key2_left = global.player1_key2_left;
	var this_player_gamepad_button_left = global.player1_gamepad_button_left;
	var this_player_gamepad_button2_left = global.player1_gamepad_button2_left;
	var this_player_key_right = global.player1_key_right;
	var this_player_key2_right = global.player1_key2_right;
	var this_player_gamepad_button_right = global.player1_gamepad_button_right;
	var this_player_gamepad_button2_right = global.player1_gamepad_button2_right;
	var this_player_key_crouch = global.player1_key_crouch;
	var this_player_key2_crouch = global.player1_key2_crouch;
	var this_player_gamepad_button_crouch = global.player1_gamepad_button_crouch;
	var this_player_gamepad_button2_crouch = global.player1_gamepad_button2_crouch;
	var this_player_key_sprint = global.player1_key_sprint;
	var this_player_key2_sprint = global.player1_key2_sprint;
	var this_player_gamepad_button_sprint = global.player1_gamepad_button_sprint;
	var this_player_gamepad_button2_sprint = global.player1_gamepad_button2_sprint;
}
#endregion /*Player 1 Controls END*/

#region /*Player 2 Controls*/
if (player = 2)
{
	var this_player_key_crouch_toggle = global.player2_key_crouch_toggle;
	var this_player_key2_crouch_toggle = global.player2_key2_crouch_toggle;
	var this_player_gamepad_button_crouch_toggle = global.player2_gamepad_button_crouch_toggle;
	var this_player_gamepad_button2_crouch_toggle = global.player2_gamepad_button2_crouch_toggle;
	var this_player_key_tongue = global.player2_key_tongue;
	var this_player_key2_tongue = global.player2_key2_tongue;
	var this_player_gamepad_button_tongue = global.player2_gamepad_button_tongue;
	var this_player_gamepad_button2_tongue = global.player2_gamepad_button2_tongue;
	var this_player_key_dive = global.player2_key_dive;
	var this_player_key2_dive = global.player2_key2_dive;
	var this_player_gamepad_button_dive = global.player2_gamepad_button_dive;
	var this_player_gamepad_button2_dive = global.player2_gamepad_button2_dive;
	var this_player_key_jump = global.player2_key_jump;
	var this_player_key2_jump = global.player2_key2_jump;
	var this_player_gamepad_button_jump = global.player2_gamepad_button_jump;
	var this_player_gamepad_button2_jump = global.player2_gamepad_button2_jump;
	var this_player_key_up = global.player2_key_up;
	var this_player_key2_up = global.player2_key2_up;
	var this_player_gamepad_button_up = global.player2_gamepad_button_up;
	var this_player_gamepad_button2_up = global.player2_gamepad_button2_up;
	var this_player_key_down = global.player2_key_down;
	var this_player_key2_down = global.player2_key2_down;
	var this_player_gamepad_button_down = global.player2_gamepad_button_down;
	var this_player_gamepad_button2_down = global.player2_gamepad_button2_down;
	var this_player_key_left = global.player2_key_left;
	var this_player_key2_left = global.player2_key2_left;
	var this_player_gamepad_button_left = global.player2_gamepad_button_left;
	var this_player_gamepad_button2_left = global.player2_gamepad_button2_left;
	var this_player_key_right = global.player2_key_right;
	var this_player_key2_right = global.player2_key2_right;
	var this_player_gamepad_button_right = global.player2_gamepad_button_right;
	var this_player_gamepad_button2_right = global.player2_gamepad_button2_right;
	var this_player_key_crouch = global.player2_key_crouch;
	var this_player_key2_crouch = global.player2_key2_crouch;
	var this_player_gamepad_button_crouch = global.player2_gamepad_button_crouch;
	var this_player_gamepad_button2_crouch = global.player2_gamepad_button2_crouch;
	var this_player_key_sprint = global.player2_key_sprint;
	var this_player_key2_sprint = global.player2_key2_sprint;
	var this_player_gamepad_button_sprint = global.player2_gamepad_button_sprint;
	var this_player_gamepad_button2_sprint = global.player2_gamepad_button2_sprint;
}
#endregion /*Player 2 Controls END*/

#region /*Player 3 Controls*/
if (player = 3)
{
	var this_player_key_crouch_toggle = global.player3_key_crouch_toggle;
	var this_player_key2_crouch_toggle = global.player3_key2_crouch_toggle;
	var this_player_gamepad_button_crouch_toggle = global.player3_gamepad_button_crouch_toggle;
	var this_player_gamepad_button2_crouch_toggle = global.player3_gamepad_button2_crouch_toggle;
	var this_player_key_tongue = global.player3_key_tongue;
	var this_player_key2_tongue = global.player3_key2_tongue;
	var this_player_gamepad_button_tongue = global.player3_gamepad_button_tongue;
	var this_player_gamepad_button2_tongue = global.player3_gamepad_button2_tongue;
	var this_player_key_dive = global.player3_key_dive;
	var this_player_key2_dive = global.player3_key2_dive;
	var this_player_gamepad_button_dive = global.player3_gamepad_button_dive;
	var this_player_gamepad_button2_dive = global.player3_gamepad_button2_dive;
	var this_player_key_jump = global.player3_key_jump;
	var this_player_key2_jump = global.player3_key2_jump;
	var this_player_gamepad_button_jump = global.player3_gamepad_button_jump;
	var this_player_gamepad_button2_jump = global.player3_gamepad_button2_jump;
	var this_player_key_up = global.player3_key_up;
	var this_player_key2_up = global.player3_key2_up;
	var this_player_gamepad_button_up = global.player3_gamepad_button_up;
	var this_player_gamepad_button2_up = global.player3_gamepad_button2_up;
	var this_player_key_down = global.player3_key_down;
	var this_player_key2_down = global.player3_key2_down;
	var this_player_gamepad_button_down = global.player3_gamepad_button_down;
	var this_player_gamepad_button2_down = global.player3_gamepad_button2_down;
	var this_player_key_left = global.player3_key_left;
	var this_player_key2_left = global.player3_key2_left;
	var this_player_gamepad_button_left = global.player3_gamepad_button_left;
	var this_player_gamepad_button2_left = global.player3_gamepad_button2_left;
	var this_player_key_right = global.player3_key_right;
	var this_player_key2_right = global.player3_key2_right;
	var this_player_gamepad_button_right = global.player3_gamepad_button_right;
	var this_player_gamepad_button2_right = global.player3_gamepad_button2_right;
	var this_player_key_crouch = global.player3_key_crouch;
	var this_player_key2_crouch = global.player3_key2_crouch;
	var this_player_gamepad_button_crouch = global.player3_gamepad_button_crouch;
	var this_player_gamepad_button2_crouch = global.player3_gamepad_button2_crouch;
	var this_player_key_sprint = global.player3_key_sprint;
	var this_player_key2_sprint = global.player3_key2_sprint;
	var this_player_gamepad_button_sprint = global.player3_gamepad_button_sprint;
	var this_player_gamepad_button2_sprint = global.player3_gamepad_button2_sprint;
}
#endregion /*Player 3 Controls END*/

#region /*Player 4 Controls*/
if (player >= 4)
{
	var this_player_key_crouch_toggle = global.player4_key_crouch_toggle;
	var this_player_key2_crouch_toggle = global.player4_key2_crouch_toggle;
	var this_player_gamepad_button_crouch_toggle = global.player4_gamepad_button_crouch_toggle;
	var this_player_gamepad_button2_crouch_toggle = global.player4_gamepad_button2_crouch_toggle;
	var this_player_key_tongue = global.player4_key_tongue;
	var this_player_key2_tongue = global.player4_key2_tongue;
	var this_player_gamepad_button_tongue = global.player4_gamepad_button_tongue;
	var this_player_gamepad_button2_tongue = global.player4_gamepad_button2_tongue;
	var this_player_key_dive = global.player4_key_dive;
	var this_player_key2_dive = global.player4_key2_dive;
	var this_player_gamepad_button_dive = global.player4_gamepad_button_dive;
	var this_player_gamepad_button2_dive = global.player4_gamepad_button2_dive;
	var this_player_key_jump = global.player4_key_jump;
	var this_player_key2_jump = global.player4_key2_jump;
	var this_player_gamepad_button_jump = global.player4_gamepad_button_jump;
	var this_player_gamepad_button2_jump = global.player4_gamepad_button2_jump;
	var this_player_key_up = global.player4_key_up;
	var this_player_key2_up = global.player4_key2_up;
	var this_player_gamepad_button_up = global.player4_gamepad_button_up;
	var this_player_gamepad_button2_up = global.player4_gamepad_button2_up;
	var this_player_key_down = global.player4_key_down;
	var this_player_key2_down = global.player4_key2_down;
	var this_player_gamepad_button_down = global.player4_gamepad_button_down;
	var this_player_gamepad_button2_down = global.player4_gamepad_button2_down;
	var this_player_key_left = global.player4_key_left;
	var this_player_key2_left = global.player4_key2_left;
	var this_player_gamepad_button_left = global.player4_gamepad_button_left;
	var this_player_gamepad_button2_left = global.player4_gamepad_button2_left;
	var this_player_key_right = global.player4_key_right;
	var this_player_key2_right = global.player4_key2_right;
	var this_player_gamepad_button_right = global.player4_gamepad_button_right;
	var this_player_gamepad_button2_right = global.player4_gamepad_button2_right;
	var this_player_key_crouch = global.player4_key_crouch;
	var this_player_key2_crouch = global.player4_key2_crouch;
	var this_player_gamepad_button_crouch = global.player4_gamepad_button_crouch;
	var this_player_gamepad_button2_crouch = global.player4_gamepad_button2_crouch;
	var this_player_key_sprint = global.player4_key_sprint;
	var this_player_key2_sprint = global.player4_key2_sprint;
	var this_player_gamepad_button_sprint = global.player4_gamepad_button_sprint;
	var this_player_gamepad_button2_sprint = global.player4_gamepad_button2_sprint;
}
#endregion /*Player 4 Controls END*/

#region /*Crouch Toggling*/
if (keyboard_check_pressed(this_player_key_crouch_toggle))
or (keyboard_check_pressed(this_player_key2_crouch_toggle))
or (gamepad_button_check_pressed(player - 1, this_player_gamepad_button_crouch_toggle))
or (gamepad_button_check_pressed(player - 1, this_player_gamepad_button2_crouch_toggle))
{
	if (player <= 1)
	{
		if (global.player1_crouch_toggle = false)
		{
			global.player1_crouch_toggle = true;
		}
		else
		{
			global.player1_crouch_toggle = false;
		}
	}
	else
	if (player = 2)
	{
		if (global.player2_crouch_toggle = false)
		{
			global.player2_crouch_toggle = true;
		}
		else
		{
			global.player2_crouch_toggle = false;
		}
	}
	else
	if (player = 3)
	{
		if (global.player3_crouch_toggle = false)
		{
			global.player3_crouch_toggle = true;
		}
		else
		{
			global.player3_crouch_toggle = false;
		}
	}
	else
	if (player = 4)
	{
		if (global.player4_crouch_toggle = false)
		{
			global.player4_crouch_toggle = true;
		}
		else
		{
			global.player4_crouch_toggle = false;
		}
	}
}
#endregion /*Crouch Toggling END*/

gamepad_set_axis_deadzone(player - 1, 0.50);

#region /*Key Tongue Hold*/
key_tongue =
(keyboard_check(this_player_key_tongue))
or (keyboard_check(this_player_key2_tongue))

or (gamepad_button_check(player - 1, this_player_gamepad_button_tongue))
or (gamepad_button_check(player - 1, this_player_gamepad_button2_tongue));
#endregion /*Key Tongue Hold END*/

#region /*Key Tongue Pressed*/
key_tongue_pressed =
(keyboard_check_pressed(this_player_key_tongue))
or (keyboard_check_pressed(this_player_key2_tongue))

or (gamepad_button_check_pressed(player - 1, this_player_gamepad_button_tongue))
or (gamepad_button_check_pressed(player - 1, this_player_gamepad_button2_tongue));
#endregion /*Key Tongue Pressed END*/

#region /*Key Tongue Released*/
key_tongue_released =
(keyboard_check_released(this_player_key_tongue))
or (keyboard_check_released(this_player_key2_tongue))

or (gamepad_button_check_released(player - 1, this_player_gamepad_button_tongue))
or (gamepad_button_check_released(player - 1, this_player_gamepad_button2_tongue));
#endregion /*Key Tongue Released END*/

#region /*Key Dive Pressed*/
key_dive_pressed =
(keyboard_check_pressed(this_player_key_dive))
or(keyboard_check_pressed(this_player_key2_dive))

or(gamepad_button_check_pressed(player - 1, this_player_gamepad_button_dive))
or(gamepad_button_check_pressed(player - 1, this_player_gamepad_button2_dive));
#endregion /*Key Dive Pressed END*/

#region /*Key Dive Hold*/
key_dive_hold =
(keyboard_check(this_player_key_dive))
or(keyboard_check(this_player_key2_dive))

or(gamepad_button_check(player - 1, this_player_gamepad_button_dive))
or(gamepad_button_check(player - 1, this_player_gamepad_button2_dive));
#endregion /*Key Dive Hold END*/

#region /*Key Jump Pressed*/
key_jump =
(keyboard_check_pressed(this_player_key_jump))
or(keyboard_check_pressed(this_player_key2_jump))
or(up_key_is_jump_key = true)
and (keyboard_check_pressed(this_player_key_up))
and!(keyboard_check_pressed(this_player_key_down))
and!(keyboard_check_pressed(this_player_key2_down))
or(up_key_is_jump_key = true)
and (keyboard_check_pressed(this_player_key2_up))
and!(keyboard_check_pressed(this_player_key_down))
and!(keyboard_check_pressed(this_player_key2_down))

or(gamepad_button_check_pressed(player - 1, this_player_gamepad_button_jump))
or(gamepad_button_check_pressed(player - 1, this_player_gamepad_button2_jump))
or(up_key_is_jump_key = true)
and (gamepad_button_check_pressed(player - 1, this_player_gamepad_button_up))
and!(gamepad_button_check_pressed(player - 1, this_player_gamepad_button_down))
and!(gamepad_button_check_pressed(player - 1, this_player_gamepad_button2_down))
or(up_key_is_jump_key = true)
and (gamepad_button_check_pressed(player - 1, this_player_gamepad_button2_up))
and!(gamepad_button_check_pressed(player - 1, this_player_gamepad_button_down))
and!(gamepad_button_check_pressed(player - 1, this_player_gamepad_button2_down))
or (active_jump = true);
#endregion /*Key Jump Pressed END*/

#region /*Key Jump Hold*/
key_jump_hold =
(keyboard_check(this_player_key_jump))
or(keyboard_check(this_player_key2_jump))
or(up_key_is_jump_key = true)
and (keyboard_check(this_player_key_up))
and (!keyboard_check(this_player_key_down))
and (!keyboard_check(this_player_key2_down))
or(up_key_is_jump_key = true)
and (keyboard_check(this_player_key2_up))
and (!keyboard_check(this_player_key_down))
and (!keyboard_check(this_player_key2_down))

or(gamepad_button_check(player - 1, this_player_gamepad_button_jump))
or(gamepad_button_check(player - 1, this_player_gamepad_button2_jump))
or(up_key_is_jump_key = true)
and (gamepad_button_check(player - 1, this_player_gamepad_button_up))
and (!gamepad_button_check(player - 1, this_player_gamepad_button_down))
and (!gamepad_button_check(player - 1, this_player_gamepad_button2_down))
or(up_key_is_jump_key = true)
and (gamepad_button_check(player - 1, this_player_gamepad_button2_up))
and (!gamepad_button_check(player - 1, this_player_gamepad_button_down))
and (!gamepad_button_check(player - 1, this_player_gamepad_button2_down))
or (active_jump = true);
#endregion /*Key Jump Hold END*/

#region /*Key Jump Released*/
key_jump_released =
(keyboard_check_released(this_player_key_jump))
or(keyboard_check_released(this_player_key2_jump))
or(up_key_is_jump_key = true)
and (keyboard_check_released(this_player_key_up))
or(up_key_is_jump_key = true)
and (keyboard_check_released(this_player_key2_up))

or(gamepad_button_check_released(player - 1, this_player_gamepad_button_jump))
or(gamepad_button_check_released(player - 1, this_player_gamepad_button2_jump))
or(up_key_is_jump_key = true)
and (gamepad_button_check_released(player - 1, this_player_gamepad_button_up))
or(up_key_is_jump_key = true)
and (gamepad_button_check_released(player - 1, this_player_gamepad_button2_up))
#endregion /*Key Jump Released END*/

#region /*Key Crouch Hold*/
key_crouch_hold =
(keyboard_check(this_player_key_crouch))
or(keyboard_check(this_player_key2_crouch))

or(gamepad_button_check(player - 1, this_player_gamepad_button_crouch))
or(gamepad_button_check(player - 1, this_player_gamepad_button2_crouch))
or(gamepad_axis_value(player - 1, gp_axislv) > 0)
or (player <= 1)
and (global.player1_crouch_toggle = true)
or (player = 2)
and (global.player2_crouch_toggle = true)
or (player = 3)
and (global.player3_crouch_toggle = true)
or (player >= 4)
and (global.player4_crouch_toggle = true);
#endregion /*Key Crouch Hold END*/

#region /*Key Crouch Pressed*/
key_crouch_pressed =
(keyboard_check_pressed(this_player_key_crouch))
or(keyboard_check_pressed(this_player_key2_crouch))

or(gamepad_button_check_pressed(player - 1, this_player_gamepad_button_crouch))
or(gamepad_button_check_pressed(player - 1, this_player_gamepad_button2_crouch))
or(gamepad_axis_value(player - 1, gp_axislv) > 0);
#endregion /*Key Crouch Pressed END*/

#region /*Key Sprint Hold*/
key_sprint =
(keyboard_check(this_player_key_sprint))
or(keyboard_check(this_player_key2_sprint))

or(gamepad_button_check(player - 1, this_player_gamepad_button_sprint))
or(gamepad_button_check(player - 1, this_player_gamepad_button2_sprint))
or (player <= 1)
and (global.player1_sprint_toggle = true)
or (player = 2)
and (global.player2_sprint_toggle = true)
or (player = 3)
and (global.player3_sprint_toggle = true)
or (player >= 4)
and (global.player4_sprint_toggle = true);
#endregion /*Key Sprint Hold END*/

#region /*Key Sprint Pressed*/
key_sprint_pressed =
(keyboard_check_pressed(this_player_key_sprint))
or(keyboard_check_pressed(this_player_key2_sprint))

or(gamepad_button_check_pressed(player - 1, this_player_gamepad_button_sprint))
or(gamepad_button_check_pressed(player - 1, this_player_gamepad_button2_sprint));
#endregion /*Key Sprint Pressed END*/

#region /*Key Sprint Released*/
key_sprint_released =
(keyboard_check_released(this_player_key_sprint))
or(keyboard_check_released(this_player_key2_sprint))

or(gamepad_button_check_released(player - 1, this_player_gamepad_button_sprint))
or(gamepad_button_check_released(player - 1, this_player_gamepad_button2_sprint));
#endregion /*Key Sprint Released END*/

#region /*Key Left Hold*/
key_left =
(keyboard_check(this_player_key_left))
and (!keyboard_check(this_player_key_right))
and (!keyboard_check(this_player_key2_right))
or(keyboard_check(this_player_key2_left))
and (!keyboard_check(this_player_key_right))
and (!keyboard_check(this_player_key2_right))

or(gamepad_button_check(player - 1, this_player_gamepad_button_left))
and (!gamepad_button_check(player - 1, this_player_gamepad_button_right))
and (!gamepad_button_check(player - 1, this_player_gamepad_button2_right))
or(gamepad_button_check(player - 1, this_player_gamepad_button2_left))
and (!gamepad_button_check(player - 1, this_player_gamepad_button_right))
and (!gamepad_button_check(player - 1, this_player_gamepad_button2_right))
or(gamepad_axis_value(player - 1, gp_axislh) < 0)
or (active_left = true);
#endregion /*Key Left Hold END*/

#region /*Key Right Hold*/
key_right =
(keyboard_check(this_player_key_right))
and (!keyboard_check(this_player_key_left))
and (!keyboard_check(this_player_key2_left))
or(keyboard_check(this_player_key2_right))
and (!keyboard_check(this_player_key_left))
and (!keyboard_check(this_player_key2_left))

or(gamepad_button_check(player - 1, this_player_gamepad_button_right))
and (!gamepad_button_check(player - 1, this_player_gamepad_button_left))
and (!gamepad_button_check(player - 1, this_player_gamepad_button2_left))
or(gamepad_button_check(player - 1, this_player_gamepad_button2_right))
and (!gamepad_button_check(player - 1, this_player_gamepad_button_left))
and (!gamepad_button_check(player - 1, this_player_gamepad_button2_left))
or(gamepad_axis_value(player - 1, gp_axislh) > 0)
or (active_right = true);
#endregion /*Key Right Hold END*/

#region /*Key Down Hold*/
key_down =
(keyboard_check(this_player_key_down))
and (!keyboard_check(this_player_key_up))
and (!keyboard_check(this_player_key2_up))
or(keyboard_check(this_player_key2_down))
and (!keyboard_check(this_player_key_up))
and (!keyboard_check(this_player_key2_up))

or(gamepad_button_check(player - 1, this_player_gamepad_button_down))
and (!gamepad_button_check(player - 1, this_player_gamepad_button_up))
and (!gamepad_button_check(player - 1, this_player_gamepad_button2_up))
or(gamepad_button_check(player - 1, this_player_gamepad_button2_down))
and (!gamepad_button_check(player - 1, this_player_gamepad_button_up))
and (!gamepad_button_check(player - 1, this_player_gamepad_button2_up))
or(gamepad_axis_value(player - 1, gp_axislv) > 0)
or (active_down = true);
#endregion /*Key Down Hold END*/

#region /*Key Up Hold*/
key_up =
(keyboard_check(this_player_key_up))
and (!keyboard_check(this_player_key_down))
and (!keyboard_check(this_player_key2_down))
or(keyboard_check(this_player_key2_up))
and (!keyboard_check(this_player_key_down))
and (!keyboard_check(this_player_key2_down))

or(gamepad_button_check(player - 1, this_player_gamepad_button_up))
and (!gamepad_button_check(player - 1, this_player_gamepad_button_down))
and (!gamepad_button_check(player - 1, this_player_gamepad_button2_down))
or(gamepad_button_check(player - 1, this_player_gamepad_button2_up))
and (!gamepad_button_check(player - 1, this_player_gamepad_button_down))
and (!gamepad_button_check(player - 1, this_player_gamepad_button2_down))
or(gamepad_axis_value(player - 1, gp_axislv) < 0)
or (active_up = true);
#endregion /*Key Up Hold END*/

#region /*Key Up Pressed*/
key_up_pressed =
(keyboard_check_pressed(this_player_key_up))
and (!keyboard_check_pressed(this_player_key_down))
and (!keyboard_check_pressed(this_player_key2_down))
or(keyboard_check_pressed(this_player_key2_up))
and (!keyboard_check_pressed(this_player_key_down))
and (!keyboard_check_pressed(this_player_key2_down))

or(gamepad_button_check_pressed(player - 1, this_player_gamepad_button_up))
and (!gamepad_button_check_pressed(player - 1, this_player_gamepad_button_down))
and (!gamepad_button_check_pressed(player - 1, this_player_gamepad_button2_down))
or(gamepad_button_check_pressed(player - 1, this_player_gamepad_button2_up))
and (!gamepad_button_check_pressed(player - 1, this_player_gamepad_button_down))
and (!gamepad_button_check_pressed(player - 1, this_player_gamepad_button2_down))
or(gamepad_axis_value(player - 1, gp_axislv) < 0);
#endregion /*Key Up Hold END*/

#region /*Key Spin Hold*/
key_spin =
(gamepad_button_check(player - 1, gp_shoulderl))
or(gamepad_button_check(player - 1, gp_shoulderlb))
or(gamepad_button_check(player - 1, gp_shoulderr))
or(gamepad_button_check(player - 1, gp_shoulderrb));
#endregion /*Key Spin Hold*/

#region /*Key Spin Pressed*/
key_spin_pressed =
(gamepad_button_check_pressed(player - 1, gp_shoulderl))
or(gamepad_button_check_pressed(player - 1, gp_shoulderlb))
or(gamepad_button_check_pressed(player - 1, gp_shoulderr))
or(gamepad_button_check_pressed(player - 1, gp_shoulderrb));
#endregion /*Key Spin Pressed END*/

#region /*Key Always Do Full Jump*/
key_always_do_full_jump = false;
#endregion /*Key Always Do Full Jump END*/

#endregion /*Customisable Controls Array END*/

/*Sets up what the buttons do*/

#region /*If controller gets disconnected during gameplay, pause the game*/
if (player = 1)
and (gamepad_is_connected(0))
or(player = 2)
and (gamepad_is_connected(1))
or(player = 3)
and (gamepad_is_connected(2))
or(player = 4)
and (gamepad_is_connected(3))
{
	controller_connected = true;
}
#endregion /*If controller gets disconnected during gameplay, pause the game END*/

#region /*If player is allowed to move*/
if (can_move = true)
{
	
	#region /*Pause*/	
	if (keyboard_check_pressed(vk_escape))
	or (keyboard_check(vk_tab))
	and (keyboard_check(vk_lshift))
	or (gamepad_button_check_pressed(player - 1, gp_start))
	or (gamepad_button_check_pressed(player - 1, gp_select))
	or (!gamepad_is_connected(player - 1))
	and (controller_connected = true)
	or (global.actually_play_edited_level = true)
	and (!window_has_focus())
	and (global.automatically_pause_when_window_is_unfocused = true)
	{
		
		#region /*Show all HUD elements*/
		global.hud_show_lives = true;
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_lives_timer = global.hud_hide_time * 60;
			}
		}
		global.hud_show_deaths = true;
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_deaths_timer = global.hud_hide_time * 60;
			}
		}
		global.hud_show_basic_collectibles = true;
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
			}
		}
		global.hud_show_big_collectibles = true;
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_big_collectibles_timer = global.hud_hide_time * 60;
			}
		}
		global.hud_show_score = true;
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_score_timer = global.hud_hide_time * 60;
			}
		}
		#endregion /*Show all HUD elements END*/
		
		controller_connected = false;
		if (global.play_edited_level = true)
		and (global.actually_play_edited_level = false)
		and (global.character_select_in_this_menu = "level_editor")
		{
			global.play_edited_level = false;
			global.actually_play_edited_level = false;
			score = 0;
			
			#region /*Save Level Information when in level editor*/
			if (global.select_level_index >= 1)
			and (global.create_level_from_template = false)
			and (global.character_select_in_this_menu = "level_editor")
			{
				ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini");
				ini_write_real("info", "view_xview", camera_get_view_x(view_camera[view_current]));
				ini_write_real("info", "view_yview", camera_get_view_y(view_camera[view_current]));
				ini_close();
			}
			else
			if (global.character_select_in_this_menu = "level_editor")
			and (global.level_name != "")
			{
				ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
				ini_write_real("info", "view_xview", camera_get_view_x(view_camera[view_current]));
				ini_write_real("info", "view_yview", camera_get_view_y(view_camera[view_current]));
				ini_close();
			}
			#endregion /*Save Level Information when in level editor END*/
			
			room_restart();
		}
		else
		{
			
			#region /*What player should control the pause menu*/
			if (gamepad_button_check_pressed(player - 1, gp_start))
			or (gamepad_button_check_pressed(player - 1, gp_select))
			{
				global.pause_player = player - 1;
			}
			else
			if (global.player1_can_play = true)
			{
				global.pause_player = 0;
			}
			else
			if (global.player2_can_play = true)
			{
				global.pause_player = 1;
			}
			else
			if (global.player3_can_play = true)
			{
				global.pause_player = 2;
			}
			else
			if (global.player4_can_play = true)
			{
				global.pause_player = 3;
			}
			#endregion /*What player should control the pause menu END*/
			
			if (global.goal_active = false)
			{
				if (asset_get_type("room_pause") == asset_room)
				{
					global.pause_screenshot = sprite_create_from_surface(application_surface, 0, 0,surface_get_width(application_surface),surface_get_height(application_surface), 0, 1, 0, 0);
					room_persistent = true;
					global.pause_room = room;
					audio_pause_all();
					room_goto(room_pause);
				}
				else
				{
					audio_pause_all();
					if (asset_get_type("obj_pause") == asset_object)
					and (!instance_exists(obj_pause))
					{
						global.pause = true;
						pause_hspeed = hspeed;
						pause_vspeed = vspeed;
						instance_create_depth(x, y, 0, obj_pause); /*This pause objects creates, that handles the pause screen*/
					}
				}
			}
		}
	}
	else
	{
		room_persistent = false;
	}
	#endregion /*Pause END*/

#region /*Save to variable when on ground*/
if (asset_get_type("obj_wall") == asset_object)
and (place_meeting(x, y + 1, obj_wall)/*If there is wall underneath*/)
or(asset_get_type("obj_semisolid_platform") == asset_object)
and (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform)/*If there is semisolid platform underneath*/)
or(asset_get_type("obj_semisolid_platform") == asset_object)
and (position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform)/*If there is semisolid platform underneath*/)
or(asset_get_type("obj_semisolid_platform") == asset_object)
and (position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform)/*If there is semisolid platform underneath*/)
{
	on_ground = true;
}
else
{
	on_ground = false;
}
#endregion /*Save to variable when on ground*/

#region /*Go Left*/
if (key_left)
and (!key_right)
and (can_move = true)
and (global.pause = false)
{
	if (wall_jump = 0)
	and (stick_to_wall = false)
	and (ledge_grab = false)
	and (climb = false)
	and (horizontal_rope_climb = false)
	and (takendamage <= takendamage_freezetime)
	{
		if (dive = false)
		{
			if (image_xscale = +1)
			{
				image_xscale = -1;
				
				#region /*Turnaround Effect*/
				if (on_ground = false)
				{
					effect_turnaround_subimg = 0;
				}
				#endregion /*Turnaround Effect END*/
				
			}
		}
		if (x > camera_get_view_x(view_camera[view_current]) + 8)
		{
			if (!place_meeting(x - 1, y, obj_wall))
			{
				if (asset_get_type("obj_ice_block") == asset_object)
				and (place_meeting(x, y + 1, obj_ice_block))
				{
					hspeed -= acceleration_on_ice;
				}
				else
				{
					if (on_ground = true)
					{
						hspeed -= acceleration_on_ground;
					}
					else
					{
						hspeed -= acceleration_in_air;
					}
				}
			}
			else
			{
				if (!place_meeting(x - 2, y, obj_wall))
				and (!place_meeting(x, y - 2, obj_wall))
				{
					if (on_ground = true)
					{
						hspeed -= acceleration_on_ground;
					}
					else
					{
						hspeed -= acceleration_in_air;
					}
					vspeed -= 1;
					x -= 1;
					y -= 1;
				}
			}
		}
	}
}
#endregion /*Go Left END*/

#region /*Go Right*/
if (key_right)
and (!key_left)
and (can_move = true)
and (global.pause = false)
{
	if (wall_jump = 0)
	and (stick_to_wall = false)
	and (ledge_grab = false)
	and (climb = false)
	and (horizontal_rope_climb = false)
	and (takendamage <= takendamage_freezetime)
	{
		if (dive = false)
		{
			if (image_xscale = -1)
			{
				image_xscale = +1;
				
				#region /*Turnaround Effect*/
				if (on_ground = false)
				{
					effect_turnaround_subimg = 0;
				}
				#endregion /*Turnaround Effect END*/
				
			}
		}
		if (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 8)
		{
			if (!place_meeting(x + 1, y, obj_wall))
			{
				if (asset_get_type("obj_ice_block") == asset_object)
				and (place_meeting(x, y + 1, obj_ice_block))
				{
					hspeed += acceleration_on_ice;
				}
				else
				{
					if (on_ground = true)
					{
						hspeed += acceleration_on_ground;
					}
					else
					{
						hspeed += acceleration_in_air;
					}
				}
			}
			else
			{
				if (!place_meeting(x + 2, y, obj_wall))
				and (!place_meeting(x, y - 2, obj_wall))
				{
					if (on_ground = true)
					{
						hspeed += acceleration_on_ground;
					}
					else
					{
						hspeed += acceleration_in_air;
					}
					vspeed -= 1;
					x += 1;
					y -= 1;
				}
			}
		}
	}
}
#endregion /*Go Right END*/

}
#endregion /*If player is allowed to move END*/

#region /*If player has finished the level, make the player run off to the right off screen, and disable player control*/
if (goal = true)
and (global.time_countdown_bonus <= 0)
{
	if (!place_meeting(x + 1, y, obj_wall))
	{
		hspeed += 0.3;
	}
	can_move = false;
	if (hspeed > 0)
	{
		image_xscale = +1;
	}
}
#endregion /*If player has finished the level, make the player run off to the right off screen, and disable player control END*/

#region /*Sprint*/
if (goal = true)
and (global.time_countdown_bonus <= 0)
{
	speed_max = lerp(speed_max, speed_max_run, 0.1);
}
else
{
	if (crouch = true)
	and (on_ground = true)
	{
		if (allow_crawl = true)
		{
			speed_max = lerp(speed_max, speed_max_walk / 2, 0.05);
		}
		else
		{
			speed_max = lerp(speed_max, 0, 0.05);
			hspeed = 0;
		}
	}
	else
	if (key_sprint)
	and (allow_run = true)
	or(double_tap_left = 3)
	and (allow_run = true)
	or(double_tap_right = 3)
	and (allow_run = true)
	{
		if (key_left)
		and (ground_pound = false)
		or(key_right)
		and (ground_pound = false)
		{
			if (invincible >= true)
			and (assist_invincible = false)
			{
				speed_max = lerp(speed_max, 10, 0.1);
			}
			else
			{
				if (speed_max < speed_max_run)
				{
					speed_max = lerp(speed_max, speed_max_run, 0.1);
				}
			}
		}
	}
	else
	{
		if (on_ground = true)
		{
			if (invincible >= true)
			and (assist_invincible = false)
			{
				speed_max = lerp(speed_max, 6, 0.05);
			}
			else
			{
				speed_max = lerp(speed_max, speed_max_walk, 0.05);
			}
		}
	}
}
#endregion /*Sprint END*/

#region /*Double-tap direction to run*/
if (double_tap_to_run = true)
{
	if (!key_sprint)
	{
		
		#region /*Double tap left direction to run*/
		if (key_left)
		{
			if (double_tap_left = false)
			{
				double_tap_left = true;
				double_tap_right = false;
				double_tap_run_timer = 15;
			}
			else
			if (double_tap_left = 2)
			{
				double_tap_left = 3;
				double_tap_run_timer = 15;
			}
			else
			{
				double_tap_run_timer = 15;
			}
		}
		#endregion /*Double tap left direction to run END*/
		
		#region /*Double tap right direction to run*/
		else
		if (key_right)
		{
			if (double_tap_right = false)
			{
				double_tap_right = true;
				double_tap_left = false;
				double_tap_run_timer = 15;
			}
			else
			if (double_tap_right = 2)
			{
				double_tap_right = 3;
				double_tap_run_timer = 15;
			}
			else
			{
				double_tap_run_timer = 15;
			}
		}
		#endregion /*Double tap right direction to run END*/
		
		else
		if (!key_left)
		and (!key_right)
		{
			if (double_tap_left = true)
			and (double_tap_run_timer <= 28)
			{
				double_tap_left = 2;
			}
			else
			if (double_tap_right = true)
			and (double_tap_run_timer <= 28)
			{
				double_tap_right = 2;
			}
			double_tap_run_timer -= 1;
		}
	}
	else
	{
		double_tap_left = false;
		double_tap_right = false;
		double_tap_run_timer = 0;
	}
}
if (double_tap_run_timer <= 0)
{
	double_tap_run_timer = 0;
	double_tap_left = false;
	double_tap_right = false;
}
#endregion /*Double-tap direction to run END*/

#region /*Set the friction*/
if (on_ground = true)
{
	if (speed > 0)
	{
		if (asset_get_type("obj_ice_block") == asset_object)
		and (place_meeting(x, y + 1, obj_ice_block))
		{
			if (key_left)
			or(key_right)
			or(goal = true)
			{
				friction = 0.01;
			}
			else
			{
				friction = 0.02;
			}
		}
		else
		{
			if (key_left)
			or(key_right)
			or(goal = true)
			{
				friction = 0.1;
			}
			else
			{
				friction = 0.2;
			}
		}
	}
}
else
{
	friction = 0;
}
#endregion /*Set the friction END*/

#region /*Jumping*/
if (key_jump)
and (number_of_jumps >= 1)
or(key_jump)
and (number_of_jumps <= -1)
{
	buffer_jump = 10;
}

if (buffer_jump > 0)
{
	buffer_jump -= 1;
}

if (buffer_jump > 0)
and (can_move = true)
and (global.pause = false)
and (key_jump_hold)
{
	
	#region /*Drop down below semisolid platform*/
	if (key_crouch_hold)
	and (ground_pound = false)
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (asset_get_type("obj_wall") == asset_object)
	and (!place_meeting(x, y + 1, obj_wall))
	or(key_down)
	and (ground_pound = false)
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (asset_get_type("obj_wall") == asset_object)
	and (!place_meeting(x, y + 1, obj_wall))
	{
		can_ground_pound = false;
		can_mid_air_jump = 10;
		vspeed = 0;
		y += 7;
	}
	#endregion /*Drop down below semisolid platform END*/
	
	else
	if (ground_pound = 0)
	{
		if (asset_get_type("obj_wall") == asset_object)
		and (place_meeting(x, y + 1, obj_wall))
		and (crouch = false)
		
		or(asset_get_type("obj_semisolid_platform") == asset_object)
		and (place_meeting(x, y + 1, obj_semisolid_platform))
		and (crouch = false)
		and (vspeed = 0)
		
		or(asset_get_type("obj_wall") == asset_object)
		and (place_meeting(x, y + 1, obj_wall))
		and!(place_meeting(x, y - 1, obj_wall))
		and (crouch = true)
		and (vspeed = 0)
		
		or(asset_get_type("obj_semisolid_platform") == asset_object)
		and (place_meeting(x, y + 1, obj_semisolid_platform))
		and!(place_meeting(x, y - 1, obj_semisolid_platform))
		and (crouch = true)
		and (vspeed = 0)
		{
			if (abs(hspeed) > (speed_max_run -1))
			and (jump = 2)
			{
				jump = 3; /*If running, and doing 2nd jump, do triple jump*/
			}
			else
			if (jump <= 1)
			{
				jump = clamp(jump + 1, 0, 3); /*Increase jump if doing 1st jump*/
			}
			else
			{
				jump = 1; /*If done triple jump and jump again, or done 2nd jump with not enough speed, go back to 1st jump*/
			}
			midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
			buffer_jump = 0; /*Reset jump buffer timer back to 0 when jumping*/
			dive = false;
			triplejumpdelay = 12;
			if (abs(hspeed) > (speed_max_walk - 1))
			or(key_up)
			{
				if (abs(hspeed) > (speed_max_run - 1))
				and (jump >= 3)
				{
					if (!place_meeting(x, y - 8, obj_wall))
					{
						vspeed = -triple_jump_height;
					}
					else
					{
						vspeed = -1;
					}
					if (image_xscale > 0)
					{
						angle = +720;
					}
					else
					{
						angle = -720;
					}
				}
				else
				{
					if (!place_meeting(x, y - 8, obj_wall))
					{
						vspeed = -higher_jump_height;
					}
					else
					{
						vspeed = -1;
					}
				}
			}
			else
			if (!place_meeting(x, y- 8, obj_wall))
			{
				if (!place_meeting(x, y - 8, obj_wall))
				{
					vspeed = -normal_jump_height;
				}
				else
				{
					vspeed = -1;
				}
			}
			
			#region /*Smoke effect under player when jumping*/
			if (position_meeting(x - 16, bbox_bottom + 1, obj_wall))
			or(asset_get_type("obj_semisolid_platform") == asset_object)
			and (position_meeting(x - 16, bbox_bottom + 1, obj_semisolid_platform))
			{
				effect_create_above(ef_smoke, x - 16, bbox_bottom, 0, c_white);
			}
			if (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
			or(asset_get_type("obj_semisolid_platform") == asset_object)
			and (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
			{
				effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
			}
			if (position_meeting(x + 16, bbox_bottom + 1, obj_wall))
			or(asset_get_type("obj_semisolid_platform") == asset_object)
			and (position_meeting(x + 16, bbox_bottom + 1, obj_semisolid_platform))
			{
				effect_create_above(ef_smoke, x + 16, bbox_bottom, 0, c_white);
			}
			#endregion /*Smoke effect under player when jumping END*/
			
			image_index = 0;
			
			#region /*Jump sound sfx*/
			if (jump >= 3)
			and (hold_item_in_hands = "")
			and (abs(hspeed) > (speed_max_run -1))
			and (asset_get_type("snd_3rdjump") == asset_sound)
			{
				audio_play_sound(snd_3rdjump, 0, 0);
				audio_sound_gain(snd_3rdjump, global.sound_volume * global.main_volume, 0);
			}
			else
			if (asset_get_type("snd_jump") == asset_sound)
			{
				audio_play_sound(snd_jump, 0, 0);
				audio_sound_gain(snd_jump, global.sound_volume * global.main_volume, 0);
			}
			if (jump >= 3)
			and (abs(hspeed) > (speed_max_run - 1))
			{
				audio_stop_sound(voice);
				voice = audio_play_sound(voice_jump3rd, 0, 0);
				audio_sound_gain(voice_jump3rd, global.voices_volume * global.main_volume, 0);
				audio_sound_pitch(voice_jump3rd, default_voice_pitch);
			}
			else
			if (jump = 2)
			{
				audio_stop_sound(voice);
				voice = audio_play_sound(voice_jump2nd, 0, 0);
				audio_sound_gain(voice_jump2nd, global.voices_volume * global.main_volume, 0);
				audio_sound_pitch(voice_jump2nd, default_voice_pitch);
			}
			else
			{
				audio_stop_sound(voice);
				voice = audio_play_sound(voice_jump, 0, 0);
				audio_sound_gain(voice_jump, global.voices_volume * global.main_volume, 0);
				audio_sound_pitch(voice_jump, default_voice_pitch);
			}
			#endregion /*Jump sound effect END*/
			draw_xscale = 0.75;
			draw_yscale = 1.25;
		}
	}
}
#endregion /*Jumping END*/

#region /*Triple Jump*/
if (on_ground = true)
{
	if (triplejumpdelay > 0)
	{
		triplejumpdelay -= 1;
	}
	if (triplejumpdelay < 1)
	and (vspeed >= 0)
	{
		jump = 0;
	}
	
	#region /*Stop horizontal speed if you land after triple jump without holding direction*/
	if (jump >= 3)
	and (vspeed >= 0)
	and(allow_stop_after_landing_triple_jump)
	{
		jump = 0;
		if (!key_left)
		and (!key_right)
		{
			hspeed = 0;
		}
	}
	#endregion /*Stop horizontal speed if you land after triple jump without holding direction END*/
	
}
#endregion /*Triple Jump END*/

#region /*Mid-Air / Double Jumping*/
if (can_mid_air_jump > 0)
{
	can_mid_air_jump -= 1;
}

if (key_jump)
and (can_move = true)
and (global.pause = false)
and (global.equipped_upgrade_double_jump = true)
and (ground_pound = false)
and (climb = false)
and (horizontal_rope_climb = false)
and (stick_to_wall = false)
and (asset_get_type("obj_wall") == asset_object)
and (!place_meeting(x, y + 1, obj_wall))
and (asset_get_type("obj_semisolid_platform") == asset_object)
and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
and (in_water = false)
and (can_mid_air_jump = 0)
{
	if (spring = true)
	and (vspeed > - 20)
	or(spring = false)
	{
		if (number_of_jumps >= 2)
		and (midair_jumps_left > 0)
		or (number_of_jumps <= -1)
		{
			buffer_jump = 0;
			dive = false;
			if (!place_meeting(x, y-double_jump_height, obj_wall))
			{
				vspeed = -double_jump_height;
			}
			else
			if (!place_meeting(x, y - 4, obj_wall))
			{
				vspeed = -4;
			}
			else
			{
				vspeed = 0;
			}
			if (voice_jump > noone)
			{
				audio_stop_sound(voice);
			}
			voice = audio_play_sound(voice_jump, 0, 0);
			audio_sound_gain(voice_jump, global.voices_volume * global.main_volume, 0);
			audio_sound_pitch(voice_jump, default_voice_pitch);
			effect_create_above(ef_smoke, x - 16,bbox_bottom, 0, c_white);
			effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
			effect_create_above(ef_smoke, x + 16,bbox_bottom, 0, c_white);
			image_index = 0;
		
			if (number_of_jumps > - 1)
			and (midair_jumps_left != number_of_jumps)
			{
				midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
				if (number_of_jumps >= 3)
				and (midair_jumps_left < number_of_jumps)
				{
					with(instance_create_depth(x, bbox_bottom, 0, obj_scoreup))
					{
						scoreup = instance_nearest(x, y, obj_player).midair_jumps_left; /*If the player can do 3 jumps, show that*/
						not_score = true;
						show_remaining_jumps = true;
					}
				}
			}
			else
			{
				midair_jumps_left = clamp(midair_jumps_left - 2, 0, number_of_jumps);
				if (number_of_jumps >= 3)
				and (midair_jumps_left < number_of_jumps)
				{
					with(instance_create_depth(x, bbox_bottom, 0, obj_scoreup))
					{
						scoreup = instance_nearest(x, y, obj_player).midair_jumps_left; /*If the player can do 3 jumps, show that*/
						not_score = true;
						show_remaining_jumps = true;
					}
				}
			}
		
			#region /*Mid-air flip animation*/
			if (midair_jumps_left >= midair_jump_flip_animation)
			or(number_of_jumps = 2)
			and (midair_jump_flip_animation >= 2)
			{
				if (image_xscale > 0)
				{
					angle = +360;
				}
				else
				{
					angle = - 360;
				}
			}
			#endregion /*Mid-air flip animation END*/
		
		}
	}
}
#endregion /*Mid-Air / Double Jumping END*/

#region /*Recharge mid-air / double jump when landing on ground*/
if (on_ground = true)
{
	if (vspeed >= 0)
	{
		midair_jumps_left = number_of_jumps;
	}
}
#endregion /*Recharge mid-air / double jump when landing on ground END*/

#region /*Do a small jump when releasing the jump button*/
if (key_jump_released)
and (!key_always_do_full_jump)
and (spring = false)
{
	if (vspeed < 0) /*When still traveling up*/
	{
		vspeed /= 2; /*Divide the vertical speed by half*/
	}
}
#endregion /*Do a small jump when releasing the jump button END*/

#region /*Fall faster*/
if (vspeed > 0)
{
	vspeed += 0.4;
}
#endregion /*Fall faster END*/

#region /*Set the gravity*/
gravity_direction = 270; /*Direction of the gravity*/
if (asset_get_type("obj_wall") == asset_object)
and (!place_meeting(x, y + 1, obj_wall))
and (asset_get_type("obj_semisolid_platform") == asset_object)
and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
and (climb = false)
and (horizontal_rope_climb = false)
{
	gravity = 0.5; /*The gravity*/
}
else
{
	gravity = 0;
}
#endregion /*Set the gravity END*/

#region /*Limits the horizontal speed*/
if (abs(hspeed) > speed_max)
{
	hspeed -= 0.4 * sign(hspeed);
}
#endregion /*Limits the horizontal speed END*/

#region /*Limits the vertical speed*/
if (place_meeting(x, y + 32, obj_semisolid_platform))
or(place_meeting(x, y + 16, obj_semisolid_platform))
or(place_meeting(x, y + 8, obj_semisolid_platform))
or(place_meeting(x, y + 1, obj_semisolid_platform))
{
	if (vspeed > 8)
	{
		vspeed = +8;
	}
}
else
{
	if (ground_pound = true)
	{
		if (vspeed > 30)
		{
			vspeed = +30;
		}
	}
	else
	if (key_jump_hold)
	{
		if (vspeed > 17)
		{
			vspeed = +17;
		}
	}
	else
	{
		if (vspeed > 20)
		{
			vspeed = +20;
		}
	}
}
#endregion /*Limits the vertical speed END*/

#region /*Bottomless Pit*/
if (bbox_top > room_height)
and (goal = false)
{
	die = true;
}
#endregion /*Bottomless Pit END*/

#region /*Stuck inside a wall*/
if (position_meeting(x, y, obj_wall))
{
	stuck_in_wall_counter += 1;
	if (stuck_in_wall_counter >= 2)
	{
		die = true;
	}
}
else
{
	if (stuck_in_wall_counter > 0)
	{
		stuck_in_wall_counter -= 1;
	}
}
#endregion /*Stuck inside a wall END*/

#region /*________________________________MORE MOVES________________________________*/

#region /*Tongue*/
if (can_move = true)
and (global.pause = false)
{
	if (asset_get_type("obj_tongue") == asset_object)
	{
		if (!instance_exists(obj_tongue))
		{
			can_tongue = true;
		}
	}
	if (allow_tongue = true)
	{
		if (can_tongue = true)
		and (climb = false)
		and (horizontal_rope_climb = false)
		{
			if (asset_get_type("obj_tongue") == asset_object)
			{
				
				#region /*Key Tongue Pressed*/
				if (key_tongue_pressed)
				or(mouse_check_button_pressed(mb_left))
				or(gamepad_axis_value(player - 1, gp_axisrh) < -0.5)
				or(gamepad_axis_value(player - 1, gp_axisrh) > + 0.5)
				or(gamepad_axis_value(player - 1, gp_axisrv) < -0.5)
				or(gamepad_axis_value(player - 1, gp_axisrv) > + 0.5)
				{
					can_tongue = false;
					tongue_obj = instance_create_depth(x, y, 0, obj_tongue);
					if (mouse_check_button_pressed(mb_left))
					{
						with(tongue_obj)
						{
							motion_set(point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y), 16);
						}
					}
					else
					if (gamepad_axis_value(player - 1, gp_axisrh) != 0)
					or(gamepad_axis_value(player - 1, gp_axisrv) != 0)
					{
						with(tongue_obj)
						{
							motion_set(point_direction(0, 0, gamepad_axis_value(instance_nearest(x, y, obj_player).player - 1, gp_axisrh), gamepad_axis_value(instance_nearest(x, y, obj_player).player - 1, gp_axisrv)), 16);
						}
					}
					else
					if (gamepad_axis_value(player - 1, gp_axislh) != 0)
					or(gamepad_axis_value(player - 1, gp_axislv) != 0)
					{
						
						#region /*Key Sprint Pressed*/
						if (key_sprint_pressed)
						{
							with(tongue_obj)
							{
								motion_set(point_direction(0, 0, gamepad_axis_value(instance_nearest(x, y, obj_player).player - 1, gp_axislh), gamepad_axis_value(instance_nearest(x, y, obj_player).player - 1, gp_axislv)), 16);
							}
						}
						#endregion /*Key Sprint Pressed END*/
						
					}
					else
					
					#region /*Key Up*/
					if (key_up)
					{
						
						#region /*Key Left*/
						if (key_left)
						and (!place_meeting(x - 1, y, obj_wall))
						{
							with(tongue_obj)
							{
								motion_set(135, 16);
							}
						}
						#endregion /*Key Left END*/
						
						else
						
						#region /*Key Right*/
						if (key_right)
						and (!place_meeting(x + 1, y, obj_wall))
						{
							with(tongue_obj)
							{
								motion_set(45, 16);
							}
						}
						#endregion /*Key Right END*/
						
						else
						{
							with(tongue_obj)
							{
								motion_set(90, 16);
							}
						}
					}
					#endregion /*Key Up END*/
					
					else
					
					#region /*Key Left*/
					if (key_left)
					and (!place_meeting(x - 1, y, obj_wall))
					{
						
						#region /*Key Up*/
						if (key_up)
						{
							with(tongue_obj)
							{
								motion_set(135, 16);
							}
						}
						#endregion /*Key Up END*/
						
						else
						
						#region /*Key Down*/
						if (key_down)
						{
							with(tongue_obj)
							{
								motion_set(225, 16);
							}
						}
						#endregion /*Key Down END*/
						
						else
						{
							with(tongue_obj)
							{
								motion_set(180, 16);
							}
						}
					}
					#endregion /*Key Left END*/
					
					else
					
					#region /*Key Right*/
					if (key_right)
					and (!place_meeting(x + 1, y, obj_wall))
					{
						
						#region /*Key Up*/
						if (key_up)
						{
							with(tongue_obj)
							{
								motion_set(85, 16);
							}
						}
						#endregion /*Key Up END*/
						
						else
						
						#region /*Key Down*/
						if (key_down)
						{
							with(tongue_obj)
							{
								motion_set(315, 16);
							}
						}
						#endregion /*Key Down END*/
						
						else
						{
							with(tongue_obj)
							{
								motion_set(0, 16);
							}
						}
					}
					#endregion /*Key Right END*/
					
					else
					
					#region /*Key Down*/
					if (key_down)
					and (!place_meeting(x, y + 1, obj_wall))
					{
						
						#region /*Key Left*/
						if (key_left)
						and (!place_meeting(x - 1, y, obj_wall))
						{
							with(tongue_obj)
							{
								motion_set(225, 16);
							}
						}
						#endregion /*Key Left END*/
						
						else
						
						#region /*Key Right*/
						if (key_right)
						and (!place_meeting(x + 1, y, obj_wall))
						{
							with(tongue_obj)
							{
								motion_set(315, 16);
							}
						}
						#endregion /*Key Right END*/
						
						else
						{
							with(tongue_obj)
							{
								motion_set(270, 16);
							}
						}
					}
					#endregion /*Key Down END*/
					
					else
					if (image_xscale < 0)
					and (!place_meeting(x - 1, y, obj_wall))
					{
						with(tongue_obj)
						{
							motion_set(180, 16);
						}
					}
					else
					if (image_xscale > 0)
					and (!place_meeting(x + 1, y, obj_wall))
					{
						with(tongue_obj)
						{
							motion_set(0, 16);
						}
					}
				}
				#endregion /*Key Tongue Pressed END*/
				
			}
		}
	}

	#region /*Rope Swing*/
	if (rope_swing = true)
	{
		can_ground_pound = false;
		ground_pound = false;
		gravity = 0; /*No gravity when rope swinging*/
		if (asset_get_type("obj_tongue") == asset_object)
		and (instance_exists(obj_tongue))
		{
			grapple_x = instance_nearest(x, y, obj_tongue).x;
			grapple_y = instance_nearest(x, y, obj_tongue).y;
			rope_angle = point_direction(grapple_x, grapple_y, x, y);
			rope_length = point_distance(grapple_x, grapple_y, x, y);
			var rope_angle_acceleration = -0.4 * dcos(rope_angle);
			
			#region /*Key Right*/
			if (key_right)
			and (obj_tongue.y > y)
			and (obj_tongue.x > x - 1)
			and (obj_tongue.x < x + 1)
			and (!place_meeting(x + 4, y, obj_wall))
			{
				rope_angle_acceleration -= 0.08;
			}
			#endregion /*Key Right END*/
			
			else
			
			#region /*Key Left*/
			if (key_left)
			and (obj_tongue.y > y)
			and (obj_tongue.x > x - 1)
			and (obj_tongue.x < x + 1)
			and (!place_meeting(x - 4, y, obj_wall))
			{
				rope_angle_acceleration += 0.08;
			}
			#endregion /*Key Left END*/
			
			else
			
			#region /*Key Left*/
			if (key_left)
			and (!place_meeting(x - 4, y, obj_wall))
			{
				rope_angle_acceleration -= 0.08;
			}
			#endregion /*Key Left END*/
			
			else
			
			#region /*Key Right*/
			if (key_right)
			and (!place_meeting(x + 4, y, obj_wall))
			{
				rope_angle_acceleration += 0.08;
			}
			#endregion /*Key Right END*/
			
			#region /*Key Up or Down*/
			if (key_up)
			and (obj_tongue.y < y)
			or(key_down)
			and (obj_tongue.y > y)
			{
				if (rope_length > 5)
				and (!place_meeting(x, y - 4, obj_wall))
				{
					rope_length -= 2;
				}
			}
			#endregion /*Key Up or Down*/
			
			else
			
			#region /*Key Down or Up*/
			if (key_down)
			and (obj_tongue.y < y)
			or(key_up)
			and (obj_tongue.y > y)
			{
				if (rope_length < 320)
				and (!place_meeting(x, y + 4, obj_wall))
				{
					rope_length += 2;
				}
			}
			#endregion /*Key Down or Up END*/
			
			if (rope_length > 320)
			{
				rope_length -= 1;
			}
			rope_length = max(rope_length, 0);
			rope_angle_velocity += rope_angle_acceleration;
			rope_angle += rope_angle_velocity;
			rope_angle_velocity *= 0.99;
			rope_x = grapple_x + lengthdir_x(rope_length, rope_angle);
			rope_y = grapple_y + lengthdir_y(rope_length, rope_angle);
			hspeed = rope_x - x;
			vspeed = rope_y - y;
		}

		if (instance_number(instance_nearest(x, y, obj_tongue)) < 1)
		{
			with(instance_nearest(x, y, obj_tongue))
			{
				move_towards_point(instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, 32);
			}
			rope_swing = false;
		}
		else
		
		#region /*Key Jump*/
		if (key_jump)
		{
			with(instance_nearest(x, y, obj_tongue))
			{
				timer = 25;
				move_towards_point(instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, 32);
			}
			vspeed = -normal_jump_height + vspeed;
			rope_angle_velocity = 0;
			grapple_x = x;
			grapple_y = y;
			rope_angle = point_direction(grapple_x, grapple_y, x, y);
			rope_length = point_distance(grapple_x, grapple_y, x, y);
			rope_swing = false;
		}
		#endregion /*Key Jump END*/
		
	}
	#endregion /*Rope Swing END*/
	
}
else
{
	rope_swing = false;
	if (instance_exists(obj_tongue))
	{
		with(obj_tongue)
		{
			instance_destroy();
		}
	}
}
#endregion /*Tongue END*/

#region /*Roll when landing*/
if (allow_roll = true)
{
	if (place_meeting(x, y + 1, obj_wall))
	or(asset_get_type("obj_semisolid_platform") == asset_object)
	and (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	or(asset_get_type("obj_semisolid_platform") == asset_object)
	and (position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	or(asset_get_type("obj_semisolid_platform") == asset_object)
	and (position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	{
		if (abs(hspeed) < 1)
		{
			hspeed = 0;
		}
		if (y > last_standing_y + 4)
		{
			if (hspeed > 0)
			{
				angle = +360;
				roll = true;
			}
			else
			if (hspeed < 0)
			{
				angle = - 360;
				roll = true;
			}
		}
	}
}
#endregion /*Roll when landing END*/

#region /*Go with Platform*/
if (place_meeting(x, y + 4, obj_wall))
{
	if (instance_nearest(x, bbox_bottom, obj_wall).vspeed > 0)
	{
		y = instance_nearest(x, bbox_bottom, obj_wall).bbox_top - 37;
	}
	hspeed += instance_nearest(x, bbox_bottom, obj_wall).hspeed;
}
#endregion /*Go with Platform END*/

#region /*Chain Reaction Reset*/
if (on_ground = true)
{
	if (invincible <= false)
	{
		chain_reaction = 0;
	}
}
if (assist_invincible = true)
{
	chain_reaction = 0;
}
#endregion /*Chain Reaction Reset END*/

#region /*Wall Jump and Wall Climb*/
if (allow_wall_jump = true)
and (can_wall_jump = true)
and (can_move = true)
and (global.pause = false)
and (takendamage <= takendamage_freezetime)
and (wall_jump_setting >= 1)
and (hold_item_in_hands = "")

or (can_move = true)
and (global.pause = false)
and (takendamage <= takendamage_freezetime)
and (place_meeting(x, y, obj_wall_jump_panel))
and (hold_item_in_hands = "")

or (can_move = true)
and (global.pause = false)
and (takendamage <= takendamage_freezetime)
and (place_meeting(x, y, obj_wall_climb_panel))
and (hold_item_in_hands = "")
{
	if (asset_get_type("obj_wall") == asset_object)
	and (!place_meeting(x, y + 1, obj_wall))
	and (!place_meeting(x, y + 32, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	{
		if (climb = false)
		and (horizontal_rope_climb = false)
		and (vspeed >= 0)
		{
			if (key_left)
			and (!key_right)
			and (wall_jump_setting = 2)
			and (place_meeting(x - 1, y, obj_wall))
			or(!key_right)
			and (dive = false)
			and (wall_jump_setting = 1)
			and (place_meeting(x - 1, y, obj_wall))
			and (image_xscale < 0)
			or(dive = true)
			and (wall_jump_setting = 1)
			and (place_meeting(x - 1, y, obj_wall))
			and (image_xscale < 0)
			or (key_left)
			and (!key_right)
			and (wall_jump_setting <= 0)
			and (place_meeting(x - 1, y, obj_wall))
			and (place_meeting(x, y, obj_wall_climb_panel))
			or (key_left)
			and (!key_right)
			and (wall_jump_setting <= 0)
			and (place_meeting(x - 1, y, obj_wall))
			and (place_meeting(x, y, obj_wall_jump_panel))
			{
				if (crouch = false)
				and (ground_pound = false)
				and (ledge_grab = false)
				and (burnt = false)
				{
					angle = 0;
					image_xscale = -1;
					jump = 0;
					dive = false;
					dive_on_ground = false;
					stomp_spin = false;
					stick_to_wall = true;
					midair_jumps_left = number_of_jumps;
					chain_reaction = 0;
					wall_jump = 0;
					ground_pound = false;
					spring = false;
					triplejumpdelay = 0;
				}
			}
			else
			if (key_right)
			and (!key_left)
			and (wall_jump_setting = 2)
			and (place_meeting(x + 1, y, obj_wall))
			or(!key_left)
			and (dive = false)
			and (wall_jump_setting = 1)
			and (place_meeting(x + 1, y, obj_wall))
			and (image_xscale > 0)
			or(dive = true)
			and (wall_jump_setting = 1)
			and (place_meeting(x + 1, y, obj_wall))
			and (image_xscale > 0)
			or (key_right)
			and (!key_left)
			and (wall_jump_setting <= 0)
			and (place_meeting(x + 1, y, obj_wall))
			and (place_meeting(x, y, obj_wall_climb_panel))
			or (key_right)
			and (!key_left)
			and (wall_jump_setting <= 0)
			and (place_meeting(x + 1, y, obj_wall))
			and (place_meeting(x, y, obj_wall_jump_panel))
			{
				if (crouch = false)
				and (ground_pound = false)
				and (ledge_grab = false)
				and (burnt = false)
				{
					angle = 0;
					image_xscale = +1;
					jump = 0;
					dive = false;
					dive_on_ground = false;
					stomp_spin = false;
					stick_to_wall = true;
					midair_jumps_left = number_of_jumps;
					chain_reaction = 0;
					wall_jump = 0;
					ground_pound = false;
					spring = false;
					triplejumpdelay = 0;
				}
			}
		}
	}
	if (stick_to_wall = true)
	{
		
		#region /*Pressing opposite direction to drop off from wall*/
		if (key_left)
		and (!key_right)
		and (image_xscale = +1)
		or(key_right)
		and (!key_left)
		and (image_xscale = -1)
		{
			dive = false;
			pressing_opposite_direction_to_drop_off_from_wall += 1;
		}
		else
		if (pressing_opposite_direction_to_drop_off_from_wall > 0)
		{
			pressing_opposite_direction_to_drop_off_from_wall -= 1;
		}
		#endregion /*Pressing opposite direction to drop off from wall END*/
		
		#region /*If there is ground under you while trying to go down, then stop wall climbing*/
		if (on_ground = true)
		{
			stick_to_wall = false;
		}
		#endregion /*If there is ground under you while trying to go down, then stop wall climbing END*/
		
		if (crouch = false)
		and (ground_pound = false)
		and (ledge_grab = false)
		{
			if (vspeed > 0)
			and (position_meeting(x + 18 * image_xscale, bbox_top, obj_wall))
			{
				effect_create_above(ef_smoke, x + 17 * image_xscale, bbox_top, 0, c_white);
				if (asset_get_type("snd_skiddingvertical") == asset_sound)
				{
					if (!audio_is_playing(snd_skiddingvertical))
					{
						audio_play_sound(snd_skiddingvertical, 0, 0);
						audio_sound_gain(snd_skiddingvertical, global.sound_volume * global.main_volume, 0);
					}
				}
				angle = 0;
			}
			else
			{
				if (asset_get_type("snd_skiddingvertical") == asset_sound)
				{
					if (audio_is_playing(snd_skiddingvertical))
					{
						audio_stop_sound(snd_skiddingvertical);
					}
				}
			}
			if (vspeed >= 4)
			{
				vspeed = 4;
			}
			
			#region /*If there is no wall beside when climbing, then stop climbing*/
			if (!place_meeting(x - 1, y, obj_wall))
			and (image_xscale < 0)
			or(!place_meeting(x + 1, y, obj_wall))
			and (image_xscale > 0)
			{
				stick_to_wall = false;
				if (asset_get_type("snd_skiddingvertical") == asset_sound)
				and (audio_is_playing(snd_skiddingvertical))
				{
					audio_stop_sound(snd_skiddingvertical);
				}
			}
			#endregion /*If there is no wall beside when climbing, then stop climbing END*/
			
		}
		
		#region /*Wall Climb*/
		if (allow_wall_climb = true)
		or (place_meeting(x, y, obj_wall_climb_panel))
		{
			dive = false;
			last_standing_y = y;
			if (key_down)
			and (!key_up)
			and (takendamage <= takendamage_freezetime)
			{
				if (asset_get_type("snd_move_ivy") == asset_sound)
				and (!audio_is_playing(snd_move_ivy))
				{
					audio_play_sound(snd_move_ivy, 0, 0);
					audio_sound_gain(snd_move_ivy, global.sound_volume * global.main_volume, 0);
				}
				can_ground_pound = false;
				ledge_grab_jump = false;
				vspeed = +4;
			}
			else
			if (key_up)
			and (!key_down)
			
			or(image_xscale < 0)
			and (key_left)
			and (!key_right)
			
			or(image_xscale > 0)
			and (key_right)
			and (!key_left)
			{
				if (bbox_bottom> 0)
				and (takendamage <= takendamage_freezetime)
				{
					if (!place_meeting(x, y - 16, obj_wall))
					{
						if (asset_get_type("snd_move_ivy") == asset_sound)
						and (!audio_is_playing(snd_move_ivy))
						{
							audio_play_sound(snd_move_ivy, 0, 0);
							audio_sound_gain(snd_move_ivy, global.sound_volume * global.main_volume, 0);
						}
						can_ground_pound = true;
						can_dive = true;
						ledge_grab_jump = true;
						vspeed = -4;
					}
					else
					{
						
						#region /*Stop climbing up if there is a wall above you*/
						if (asset_get_type("snd_bump") == asset_sound)
						and (!audio_is_playing(snd_bump))
						{
							audio_play_sound(snd_bump, 0, 0);
							audio_sound_gain(snd_bump, global.sound_volume * global.main_volume, 0);
						}
						#endregion /*Stop climbing up if there is a wall above you END*/
					
					}
				}
				else
				{
					
					#region /*Stop climbing up if you're above the level and there is nothing above you*/
					if (asset_get_type("snd_bump") == asset_sound)
					and (!audio_is_playing(snd_bump))
					{
						audio_play_sound(snd_bump, 0, 0);
						audio_sound_gain(snd_bump, global.sound_volume * global.main_volume, 0);
					}
					#endregion /*Stop climbing up if you're above the level and there is nothing above you END*/
					
				}
			}
			else
			if (vspeed >= 0)
			{
				can_ground_pound = true;
				can_dive = true;
				ledge_grab_jump = false;
				vspeed = 0;
				gravity = 0;
			}
		}
		#endregion /*Wall Climb END*/

		#region /*When pressing the jump button and besides the wall, do the wall jump*/
		if (key_jump)
		and (place_meeting(x + 1, y, obj_wall))
		and (!place_meeting(x, y + 1, obj_wall))
		and (asset_get_type("obj_semisolid_platform") == asset_object)
		and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
		
		or(key_jump)
		and (place_meeting(x - 1, y, obj_wall))
		and (!place_meeting(x, y + 1, obj_wall))
		and (asset_get_type("obj_semisolid_platform") == asset_object)
		and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
		
		or(allow_dive = true)
		and (key_dive_pressed) /*Press dive to jump from wall using a dive*/
		and (key_left)
		and (!key_right)
		and (place_meeting(x + 1, y, obj_wall))
		
		or(allow_dive = true)
		and (key_dive_pressed) /*Press dive to jump from wall using a dive*/
		and (key_right)
		and (!key_left)
		and (place_meeting(x - 1, y, obj_wall))
		{
			if (crouch = false)
			and (ground_pound = false)
			and (ledge_grab = false)
			and (horizontal_rope_climb = false)
			{
				spring = false;
				audio_stop_sound(voice);
				voice = audio_play_sound(voice_wallkick, 0, 0);
				audio_sound_gain(voice_wallkick, global.voices_volume * global.main_volume, 0);
				audio_sound_pitch(voice_wallkick, default_voice_pitch);
				if (asset_get_type("snd_wallkick") == asset_sound)
				{
					audio_play_sound(snd_wallkick, 0, 0);
					audio_sound_gain(snd_wallkick, global.sound_volume * global.main_volume, 0);
				}
				angle = 0;
				last_standing_y = y;
				image_index = 0;
				if (place_meeting(x + 1, y, obj_wall))
				{
					image_xscale = -1;
					if (!place_meeting(x - 6, y, obj_wall))
					{
						hspeed = - 6;
					}
				}
				else
				if (place_meeting(x - 1, y, obj_wall))
				{
					image_xscale = +1;
					if (!place_meeting(x + 6, y, obj_wall))
					{
						hspeed = + 6;
					}
				}
				jump = 1;
				triplejumpdelay = 50;
				wall_jump = wall_jump_time;
				crouch = false;
				stick_to_wall = false;
				ledge_grab_jump = false;
				speed_max = 8;
				vspeed = -normal_jump_height;
				midair_jumps_left = number_of_jumps - 1;
				image_index = 0;
				effect_create_above(ef_smoke, x, bbox_bottom- 8, 0, c_white);
				effect_create_above(ef_smoke, x, bbox_top +8, 0, c_white);
				if (asset_get_type("obj_wall_jumpspark") == asset_object)
				{
					instance_create_depth(x, y, 0, obj_wall_jumpspark);
				}
			}
		}
		#endregion /*When pressing the jump button and besides the wall, do the wall jump END*/

	}
	else
	{
		pressing_opposite_direction_to_drop_off_from_wall = 0;
	}
	if (wall_jump > 0)
	{
		wall_jump -= 1;
		if (vspeed >= 0)
		{
			stick_to_wall = false;
		}
		if (vspeed < 0)
		{
		
			#region /*Change direction when diving*/
			if (key_dive_pressed)
			and (allow_dive = true)
			and (key_left)
			and (!key_right)
			{
				image_xscale = -1;
			}
			else
			if (key_dive_pressed)
			and (allow_dive = true)
			and (key_right)
			and (!key_left)
			{
				image_xscale = +1;
			}
			#endregion /*Change direction when diving END*/
		
			crouch = false;
		}
	}

	#region /*When pressing the jump button, a direction and besides the wall, do the wall jump even if you still haven't started the wall jump liding down state*/
	if (key_down)
	and (!key_left)
	and (!key_right)
	and (key_sprint_pressed)
	and (stick_to_wall = true)
	or(key_down)
	and (!key_left)
	and (!key_right)
	and (key_dive_pressed)
	and (stick_to_wall = true)
	or(pressing_opposite_direction_to_drop_off_from_wall >= 10)
	{
		if (place_meeting(x - 1, y, obj_wall))
		{
			x += 1;
		}
		if (place_meeting(x + 1, y, obj_wall))
		{
			x -= 1;
		}
		pressing_opposite_direction_to_drop_off_from_wall = 0;
		climb = false;
		horizontal_rope_climb = false;
		dive = false;
		drop_off_wall_climb = 10; /*Drop down from wall climbing*/
		hspeed = 0;
		vspeed = +1;
		midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
		stick_to_wall = false;
		crouch = false;
	}
	else
	if (key_jump)
	and (key_right)
	and (!key_left)
	and (wall_jump_setting >= 1)
	and (place_meeting(x + 1, y, obj_wall))
	and (!place_meeting(x, y + 16, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	
	or(key_jump)
	and (key_left)
	and (!key_right)
	and (wall_jump_setting >= 1)
	and (place_meeting(x - 1, y, obj_wall))
	and (!place_meeting(x, y + 16, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	
	or(key_jump)
	and (wall_jump_setting = 1)
	and (place_meeting(x + 1, y, obj_wall))
	and (!place_meeting(x, y + 16, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	
	or(key_jump)
	and (wall_jump_setting = 1)
	and (place_meeting(x - 1, y, obj_wall))
	and (!place_meeting(x, y + 16, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	
	or(key_jump)
	and (key_right)
	and (!key_left)
	and (wall_jump_setting <= 0)
	and (place_meeting(x, y, obj_wall_climb_panel))
	and (place_meeting(x + 1, y, obj_wall))
	and (!place_meeting(x, y + 16, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	
	or(key_jump)
	and (key_left)
	and (!key_right)
	and (wall_jump_setting <= 0)
	and (place_meeting(x, y, obj_wall_climb_panel))
	and (place_meeting(x - 1, y, obj_wall))
	and (!place_meeting(x, y + 16, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	
	or(key_jump)
	and (key_right)
	and (!key_left)
	and (wall_jump_setting <= 0)
	and (place_meeting(x, y, obj_wall_jump_panel))
	and (place_meeting(x + 1, y, obj_wall))
	and (!place_meeting(x, y + 16, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	
	or(key_jump)
	and (key_left)
	and (!key_right)
	and (wall_jump_setting <= 0)
	and (place_meeting(x, y, obj_wall_jump_panel))
	and (place_meeting(x - 1, y, obj_wall))
	and (!place_meeting(x, y + 16, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	{
		if (crouch = false)
		and (ground_pound = false)
		and (ledge_grab = false)
		and (horizontal_rope_climb = false)
		{
			spring = false;
			audio_stop_sound(voice);
			voice = audio_play_sound(choose(voice_wallkick,voice_jump), 0, 0);
			audio_sound_gain(voice_wallkick, global.voices_volume * global.main_volume, 0);
			audio_sound_pitch(voice_wallkick, default_voice_pitch);
			audio_sound_gain(voice_jump, global.voices_volume * global.main_volume, 0);
			audio_sound_pitch(voice_jump, default_voice_pitch);
			if (asset_get_type("snd_wallkick") == asset_sound)
			{
				audio_play_sound(snd_wallkick, 0, 0);
				audio_sound_gain(snd_wallkick, global.sound_volume * global.main_volume, 0);
			}
			angle = 0;
			last_standing_y = y;
			image_index = 0;
			if (place_meeting(x + 1, y, obj_wall))
			{
				image_xscale = -1;
				if (!place_meeting(x - 6, y, obj_wall))
				{
					hspeed = - 6;
				}
			}
			else
			if (place_meeting(x - 1, y, obj_wall))
			{
				image_xscale = +1;
				if (!place_meeting(x + 6, y, obj_wall))
				{
					hspeed = + 6;
				}
			}
			jump = 1;
			triplejumpdelay = 50;
			wall_jump = wall_jump_time;
			crouch = false;
			stick_to_wall = false;
			ledge_grab_jump = false;
			speed_max = 8;
			glide = false;
			can_glide = 3;
			vspeed = -normal_jump_height;
			image_index = 0;
			effect_create_above(ef_smoke, x, bbox_bottom- 8, 0, c_white);
			effect_create_above(ef_smoke, x, bbox_top +8, 0, c_white);
			if (asset_get_type("obj_wall_jumpspark") == asset_object)
			{
				instance_create_depth(x, y, 0, obj_wall_jumpspark);
			}
		}
	}
	#endregion /*When pressing the jump button, a direction and besides the wall, do the wall jump even if you still haven't started the wall jump liding down state*/
	
}
else
stick_to_wall = false;
if (stick_to_wall = false)
{
	if (asset_get_type("snd_skiddingvertical") == asset_sound)
	and (audio_is_playing(snd_skiddingvertical))
	{
		audio_stop_sound(snd_skiddingvertical);
	}
}
if (drop_off_wall_climb > 0)
{
	drop_off_wall_climb -= 1;
}
#endregion /*Wall Jump and Wall Climb END*/

#region /*Ground Pound*/
if (allow_ground_pound = true)
and (can_move = true)
and (global.pause = false)
and (can_ground_pound = true)
and (takendamage <= takendamage_freezetime)
{
	if (dive = false)
	and (burnt = false)
	and (crouch = false)
	and (climb = false)
	and (horizontal_rope_climb = false)
	{
		if (key_crouch_pressed)
		and (joystick_can_ground_pound = true)
		or (down_and_jump_to_groundpound = true)
		and (key_down)
		and (key_jump)
		{
			if (asset_get_type("obj_wall") == asset_object)
			and (!place_meeting(x, y + 8, obj_wall))
			and (asset_get_type("obj_semisolid_platform") == asset_object)
			and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
			and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
			and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
			{
				if (ground_pound != true)
				{
					ground_pound_cooldown = 1;
					spring_twist_sprite = false;
					can_climb_horizontal_rope_cooldown = sprite_get_height(mask_index) / 6;
					ground_pound = true;
					stick_to_wall = false;
					move_towards_spring_endpoint = false;
					wall_jump = 0;
					if (image_xscale > 0)
					{
						angle = +360;
					}
					else
					{
						angle = - 360;
					}
					image_index = 0;
					if (asset_get_type("snd_rolling") == asset_sound)
					{
						audio_play_sound(snd_rolling, 0, 0);
						audio_sound_gain(snd_rolling, global.sound_volume * global.main_volume, 0);
					}
					hspeed = 0;
					speed_max = 1;
					if (image_index > image_number - 1)
					{
						image_speed = 0;
						vspeed = +16;
					}
					else
					{
						image_speed = 0.5;
						vspeed = -4;
					}
				}
			}
		}
		if (ground_pound = true)
		{
			if (ground_pound_cooldown > 0)
			and (!key_crouch_hold)
			{
				ground_pound_cooldown -= 0.5;
			}
			if (key_crouch_pressed)
			and (ground_pound_cooldown = 0)
			{
				image_index = image_number - 1;
				image_speed = 0;
				vspeed = +16;
			}
			if (vspeed > 8)
			{
				vspeed = +24;
			}
	
			#region /*If hitting a corner of a wall, move the player either left or right*/
			if (on_ground = true)
			{
		
				#region /*Move left to avoid a left corner*/
				if (!position_meeting(bbox_left - 1,bbox_bottom + 1, obj_wall))
				and (position_meeting(bbox_right + 1,bbox_bottom + 1, obj_wall))
				{
					x -= 1;
				}
				#endregion /*Move left to avoid a left corner END*/
		
				else
		
				#region /*Move right to avoid a right corner*/
				if (position_meeting(bbox_left - 1,bbox_bottom + 1, obj_wall))
				and (!position_meeting(bbox_right + 1,bbox_bottom + 1, obj_wall))
				{
					y += 1;
				}
				#endregion /*Move right to avoid a right corner END*/
		
			}
			#endregion /*If hitting a corner of a wall, move the player either left or right END*/

			#region /*If touching the ground when doing a ground pound*/
			if (position_meeting(bbox_left + 1,bbox_bottom + 1, obj_wall))
			or(position_meeting(x, bbox_bottom + 1, obj_wall))
			or(position_meeting(bbox_right - 1,bbox_bottom + 1, obj_wall))
			or(position_meeting(bbox_left + 1,bbox_bottom + 1, obj_semisolid_platform))
			or(position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
			or(position_meeting(bbox_right - 1,bbox_bottom + 1, obj_semisolid_platform))
			{
				instance_create_depth(x, bbox_bottom, 0, obj_blockbreak);
				scr_gamepad_vibration(player, 0.5, 10);
				effect_create_above(ef_smoke, x, bbox_bottom, 2, c_white);
				image_index = 0;
				ground_pound = 2;
				speed_max = 4;
				if (asset_get_type("obj_camera") == asset_object)
				{
					with(instance_nearest(x, y, obj_camera))
					{
						shake = 10;
					}
				}
				if (asset_get_type("snd_hipattack") == asset_sound)
				{
					audio_play_sound(snd_hipattack, 0, 0);
					audio_sound_gain(snd_hipattack, global.sound_volume * global.main_volume, 0);
				}
			}
			#endregion /*If touching the ground when doing a ground pound END*/
	
			else
			if (key_up)
			and (vspeed >4)
			or(key_dive_pressed)
			and (vspeed >4)
			or(vspeed <-4)
			{
				image_index = 0;
				ground_pound = false;
				speed_max = 4;
				spring_animation = 2;
			}
		}
		else
		if (ground_pound = 2)
		{
			if (on_ground = true)
			{
				speed_max = 0;
				hspeed = 0;
				if (allow_ground_pound_jump = true)
				and (key_jump_hold)
				{
					can_ground_pound = true;
					effect_create_above(ef_smoke, x, bbox_bottom, 1, c_white);
					ground_pound = 3;
					image_index = 0;
					midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
					speed_max = 4;
					vspeed = -higher_jump_height;
					if (image_xscale > 0)
					{
						angle = - 360;
					}
					else
					{
						angle = +360;
					}
				}
			}
			if (image_index > image_number - 1)
			{
				speed_max = 4;
				ground_pound = false;
			}
		}
		else
		if (ground_pound = 3)
		{
			if (key_sprint)
			{
				speed_max = 8;
			}
			else
			{
				speed_max = 4;
			}
			if (image_index > image_number - 1)
			or(vspeed > 0)
			{
				ground_pound = false;
			}
		}
	}
}
if (can_ground_pound = false)
and (!key_down)
{
	can_ground_pound = true;
}

#region /*joystick_can_ground_pound makes sure that when ground pounding using the joystick doesn't make the cahracter ground pound on every frame*/

#region /*You must have this code before the next code otherwise the joystick_can_ground_pound is always set to true*/
if (joystick_can_ground_pound = false)
and (gamepad_axis_value(0, gp_axislv) <= 0)
and (player <= 1)
or(joystick_can_ground_pound = false)
and (gamepad_axis_value(1, gp_axislv) <= 0)
and (player <= 2)
or(joystick_can_ground_pound = false)
and (gamepad_axis_value(2, gp_axislv) <= 0)
and (player <= 3)
or(joystick_can_ground_pound = false)
and (gamepad_axis_value(3, gp_axislv) <= 0)
and (player <= 4)
{
	joystick_can_ground_pound = true;
}
#endregion /*You must have this code before the next code otherwise the joystick_can_ground_pound is always set to true END*/

#region /*You must have this code after the previous code otherwise the joystick_can_ground_pound is always set to true*/
if (joystick_can_ground_pound = true)
and (gamepad_axis_value(0, gp_axislv) > 0)
and (player <= 1)
or(joystick_can_ground_pound = true)
and (gamepad_axis_value(1, gp_axislv) > 0)
and (player <= 2)
or(joystick_can_ground_pound = true)
and (gamepad_axis_value(2, gp_axislv) > 0)
and (player <= 3)
or(joystick_can_ground_pound = true)
and (gamepad_axis_value(3, gp_axislv) > 0)
and (player <= 4)
{
	joystick_can_ground_pound = false;
}
#endregion /*You must have this code after the previous code otherwise the joystick_can_ground_pound is always set to true END*/

#endregion /*joystick_can_ground_pound makes sure that when ground pounding using the joystick doesn't make the cahracter ground pound on every frame END*/

#endregion /*Ground Pound END*/

#region /*Dive*/
if (allow_dive = true)
and (can_move = true)
and (hold_item_in_hands = "")
and (global.pause = false)
{
	if (can_dive = true)
	and (drop_off_wall_climb = 0)
	and (in_water = false)
	{
		if (dive = false)
		and (burnt = false)
		and (stick_to_wall = false)
		and (climb = false)
		and (horizontal_rope_climb = false)
		and (takendamage <= takendamage_freezetime)
		{
			if (key_dive_pressed)
			{
				if (rope_swing = true)
				{
					if (instance_exists(obj_tongue))
					{
						with(instance_nearest(x, y, obj_tongue))
						{
							timer = 25;
							move_towards_point(instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, 32);
						}
					}
					vspeed = -normal_jump_height + vspeed;
					rope_angle_velocity = 0;
					grapple_x = x;
					grapple_y = y;
					rope_angle = point_direction(grapple_x, grapple_y, x, y);
					rope_length = point_distance(grapple_x, grapple_y, x, y);
					rope_swing = false;
				}
				if (speed_max <8)
				{
					speed_max = 8;
				}
				if (!place_meeting(x, y- 8, obj_wall))
				{
					vspeed = -6;
				}
				else
				{
					vspeed = 0;
				}
					
				#region /*Choose direction to dive*/
				if (key_left)
				and (!key_right)
				or(image_xscale < 0)
				{
					if (hspeed >- 10)
					{
						if (asset_get_type("obj_wall") == asset_object)
						and (!place_meeting(x - 4, y, obj_wall))
						{
							hspeed = - 10;
						}
					}
					image_xscale = -1;
				}
				else
				if (key_right)
				and (!key_left)
				or(image_xscale > 0)
				{
					if (hspeed <+ 10)
					{
						if (asset_get_type("obj_wall") == asset_object)
						and (!place_meeting(x + 4, y, obj_wall))
						{
							hspeed = +10;
						}
					}
					image_xscale = +1;
				}
				#endregion /*Choose direction to dive*/
					
				ground_pound = false;
				can_ground_pound = false;
				if (asset_get_type("snd_dive") == asset_sound)
				{
					audio_play_sound(snd_dive, 0, 0);
					audio_sound_gain(snd_dive, global.sound_volume * global.main_volume, 0);
				}
				audio_stop_sound(voice);
				voice = audio_play_sound(voice_dive, 0, 0);
				audio_sound_gain(voice_dive, global.voices_volume * global.main_volume, 0);
				audio_sound_pitch(voice_dive, default_voice_pitch);
				dive = true;
				jump = 0;
				spring = false;
				move_towards_spring_endpoint = false;
				if (asset_get_type("obj_wall") == asset_object)
				and (!place_meeting(x, y + 1, obj_wall))
				and (asset_get_type("obj_semisolid_platform") == asset_object)
				and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
				and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
				and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
				{
					crouch = false;
				}
				image_index = 0;
				angle = 0;
				wall_jump = 0;
				glide = false;
				can_glide = 20;
			}
		}
		else
		if (dive = true)
		{
			if (key_left)
			and (asset_get_type("obj_wall") == asset_object)
			and (place_meeting(x + 1, y, obj_wall))
			or(key_right)
			and (asset_get_type("obj_wall") == asset_object)
			and (place_meeting(x - 1, y, obj_wall))
			{
				hspeed = 0;
			}
			
			#region /*Propel the player forward in the direction the player is facing*/
			if (image_xscale < 0)
			{
				if (hspeed >-4)
				{
					if (asset_get_type("obj_wall") == asset_object)
					and (!place_meeting(x - 4, y, obj_wall))
					{
						hspeed = -4;
					}
					else
					if (asset_get_type("obj_wall") == asset_object)
					and (!place_meeting(x - 1, y, obj_wall))
					{
						hspeed = - 1;
					}
				}
			}
			else
			if (image_xscale > 0)
			{
				if (hspeed <+ 4)
				{
					if (asset_get_type("obj_wall") == asset_object)
					and (!place_meeting(x + 4, y, obj_wall))
					{
						hspeed = +4;
					}
					else
					if (asset_get_type("obj_wall") == asset_object)
					and (!place_meeting(x + 1, y, obj_wall))
					{
						hspeed = +1;
					}
				}
			}
			#endregion /*Propel the player forward in the direction the player is facing END*/
			
			#region /*If player lands on ground when diving, stop diving*/
			if (on_ground = true)
			{
				if (vspeed >= 0)
				{
					dive = false;
					dive_on_ground = 10;
					can_attack_after_dive_on_ground = can_attack_after_dive_on_ground_max_value;
					ground_pound = false;
					can_ground_pound = false;
				}
			}
			#endregion /*If player lands on ground when diving, stop diving END*/

			#region /*If player lands in water when diving, stop diving*/
			if (in_water = true)
			{
				dive = false;
				can_dive = true;
				crouch = false;
			}
			#endregion /*If player lands in water when diving, stop diving END*/
			
			#region /*Cancel dive (only when you have enabled dive canceling in settings)*/
			if (cancel_dive_by_pressing_jump_or_dive_button = true)
			{
				if (key_jump)
				or(key_dive_pressed)
				{
					dive = false;
					can_dive = false;
				}
			}
			if (cancel_dive_by_pressing_opposite_direction = true)
			{
				if (hspeed < 0)
				and (key_right)
				or(hspeed > 0)
				and (key_left)
				{
					dive = false;
					can_dive = false;
				}
			}
			#endregion /*Cancel dive (only when you have enabled dive canceling in settings) END*/
			
		}
	}
}
#endregion /*Dive END*/

scr_throw_items_in_hands();

#region /*Can Tongue After Dive On Ground*/
if (on_ground = true)
{
	if (can_attack_after_dive_on_ground > 0)
	{
		can_attack_after_dive_on_ground -= 1;
		if (key_jump)
		{
			can_attack_after_dive_on_ground = false;
		}
	}
}
#endregion /*Can Tongue After Dive On Ground END*/

#region /*Dive ground boost*/
if (allow_dive_ground_boost = true)
and (dive_on_ground > 0)
and (on_ground = true)
{
	dive_on_ground -= 1;
	if (key_jump)
	{
		dive_on_ground = false;
		effect_create_above(ef_smoke, x, bbox_bottom, 1, c_white);
		if (speed_max < 10)
		{
			speed_max = 10;
		}
		if (image_xscale < 0)
		{
			if (hspeed <-7)
			{
				if (hspeed >- 10)
				{
					if (!place_meeting(x - 1, y, obj_wall))
					and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
					and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
					and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
					{
						hspeed = - 10;
					}
				}
				angle = - 320;
			}
		}
		else
		if (image_xscale > 0)
		{
			if (hspeed >+7)
			{
				if (hspeed <+ 10)
				{
					if (!place_meeting(x + 1, y, obj_wall))
					and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
					and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
					and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
					{
						hspeed = +10;
					}
				}
				angle = +320;
			}
		}
	}
}
#endregion /*Dive ground boost END*/

#region /*Ledge Grab*/
if (allow_ledge_grab = true)
{
	if (in_water = true)
	or(x < camera_get_view_x(view_camera[view_current]) + 25)
	or(x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 25)
	{
		can_ledge_grab = false;
	}
	else
	{
		can_ledge_grab = true;
	}
	if (can_ledge_grab = true)
	{
		if (hspeed!= 0)
		{
			hspeed_dir = sign(hspeed);
		}
		if (ground_pound < 1)
		and (burnt < 1)
		{
			if (!position_meeting(x + 37*hspeed_dir,bbox_top - 16, obj_wall))
			and (position_meeting(x + 37*hspeed_dir,bbox_top +8, obj_wall))
			and (yprevious - 16< y)
			and (vspeed > 0)
			and (!place_meeting(x, y+ sprite_height/3, obj_wall))
			and (!key_down)
			{
				if (asset_get_type("snd_grabledge") == asset_sound)
				{
					audio_play_sound(snd_grabledge, 0, 0);
					audio_sound_gain(snd_grabledge, global.sound_volume * global.main_volume, 0);
				}
				gravity = 0;
				hspeed = 0;
				vspeed = 0;
				
				#region /*Move against the ledge*/
				while(!place_meeting(x +hspeed_dir, y, obj_wall))
				{
					x +=hspeed_dir;
				}
				#endregion /*Move against the ledge*/
				
				#region /*Make sure we are the right height*/
				while(position_meeting(x + (17*hspeed_dir), y- 5, obj_wall))
				{
					y -= 1;
				}
				#endregion /*Make sure we are the right height END*/
				
				ledge_grab_jump = false;
				ledge_grab+= 1;
				stick_to_wall = false;
				wall_jump = 0;
				jump = 0;
			}
		}
		if (ledge_grab> 0)
		{
			ledge_grab+= 1;
		}
		if (ledge_grab>false)
		{
			gravity = 0;
			hspeed = 0;
			if (place_meeting(x - 1, y, obj_wall))
			{
				image_xscale = -1;
			}
			else
			if (place_meeting(x + 1, y, obj_wall))
			{
				image_xscale = +1;
			}
			vspeed = 0;
			if (sprite_ledge_grab > noone)
			{
				sprite_index = sprite_ledge_grab;
			}
			else
			{
				sprite_index = sprite_wall_slide;
			}
			if (key_left)
			and (image_xscale = -1)
			or(key_right)
			and (image_xscale = +1)
			{
				if (ledge_grab> 10)
				{
					if (image_xscale > 0)
					{
						angle = +360;
					}
					else
					{
						angle = - 360;
					}
					if (asset_get_type("snd_pullup") == asset_sound)
					{
						audio_play_sound(snd_pullup, 0, 0);
						audio_sound_gain(snd_pullup, global.sound_volume * global.main_volume, 0);
					}
					vspeed = - 8;
					ledge_grab = false;
					ledge_grab_jump = true;
					stick_to_wall = false;
					wall_jump = 0;
				}
			}
			else
			if (key_jump)
			or(key_up)
			{
				if (image_xscale > 0)
				{
					angle = +360;
				}
				else
				{
					angle = - 360;
				}
				if (asset_get_type("snd_pullupfast") == asset_sound)
				{
					audio_play_sound(snd_pullupfast, 0, 0);
					audio_sound_gain(snd_pullupfast, global.sound_volume * global.main_volume, 0);
				}
				vspeed = -normal_jump_height;
				ledge_grab = false;
				ledge_grab_jump = true;
				stick_to_wall = false;
				wall_jump = 0;
			}
			if (key_left)
			and (image_xscale = +1)
			or(key_right)
			and (image_xscale = -1)
			or(key_down)
			{
				if (ledge_grab> 10)
				{
					hspeed = + 0.1*-hspeed_dir;
					ledge_grab = false;
					ledge_grab_jump = true;
					stick_to_wall = false;
					wall_jump = 0;
				}
			}
		}
		if (on_ground = true)
		{
			ledge_grab_jump = false;
		}
	}
}
#endregion /*Ledge Grab END*/

#region /*ledge_grab_jump / Get up over ledge*/
if (ledge_grab_jump = true)
and (stick_to_wall = false)
{
	if (image_xscale = -1)
	and (!place_meeting(x, y - 4, obj_wall))
	{
		hspeed-= 0.1;
	}
	else
	if (image_xscale = +1)
	and (!place_meeting(x, y + 4, obj_wall))
	{
		hspeed += 0.1;
	}
	if (on_ground = true)
	{
		if (vspeed >= 0)
		{
			ledge_grab_jump = false;
		}
	}
}
#endregion /*ledge_grab_jump / Get up over ledge END*/

#region /*Put sprite angle at right angle*/
if (angle <- 360)
{
	angle += 16;
}
else
if (angle >+ 360)
{
	angle -= 16;
}
else
if (ground_pound = true)
{
	angle = lerp(angle, 0, 0.2);
}
else
{
	if (asset_get_type("obj_wall") == asset_object)
	and (!place_meeting(x, y + 1, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	and (vspeed > 0)
	{
		if (key_left)
		and (!key_right)
		{
			angle = lerp(angle, 0 + 10, 0.1);
		}
		else
		if (key_right)
		and (!key_left)
		{
			angle = lerp(angle, 0 - 10, 0.1);
		}
		else
		{
			angle = lerp(angle, 0, 0.1);
		}
	}
	else
	{
		angle = lerp(angle, 0, 0.1);
	}
}
#endregion /*Put sprite angle at right angle*/

if (in_water = true)
{
	if (global.music_underwater > 0)
	{
		audio_sound_gain(global.music, 0, 0);
		audio_sound_gain(global.music_underwater, global.music_volume * global.main_volume, 0);
	}
	else
	if (global.music > 0)
	{
		audio_sound_gain(global.music, global.music_volume * global.main_volume, 0);
		audio_sound_gain(global.music_underwater, 0, 0);
	}
	if (global.ambience_underwater > 0)
	{
		audio_sound_gain(global.ambience, 0, 0);
		audio_sound_gain(global.ambience_underwater, global.ambient_volume * global.main_volume, 0);
	}
	else
	if (global.ambience > 0)
	{
		audio_sound_gain(global.ambience, global.ambient_volume * global.main_volume, 0);
		audio_sound_gain(global.ambience_underwater, 0, 0);
	}
}
else
{
	if (global.music > 0)
	{
		audio_sound_gain(global.music, global.music_volume * global.main_volume, 0);
		audio_sound_gain(global.music_underwater, 0, 0);
	}
	if (global.ambience > 0)
	{
		audio_sound_gain(global.ambience, global.ambient_volume * global.main_volume, 0);
		audio_sound_gain(global.ambience_underwater, 0, 0);
	}
}

#region /*Swimming In Water*/
if (asset_get_type("obj_water") == asset_object)
{
	if (position_meeting(x, y, obj_water))
	or(asset_get_type("obj_water_level") == asset_object)
	and (instance_exists(obj_water_level))
	and (y > obj_water_level.y)
	and (obj_water_level.y < room_height)
	{
		dive = false;
		if (in_water = false)
		{
			in_water = true;
		}
		jump = 0;
		midair_jumps_left = number_of_jumps;
		speed_max = 4;
		allow_roll = false;
		can_ground_pound = false;
		ground_pound = false;
		can_wall_jump = false;
		stick_to_wall = false;
		can_dive = true; /*Can dive when you jump out of water still*/
		wall_jump = false;
		spring = false;
		
		if (asset_get_type("obj_wall") == asset_object)
		and (!place_meeting(x, y + 1, obj_wall))
		and (asset_get_type("obj_semisolid_platform") == asset_object)
		and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
		{
			if (key_up)
			and (!key_down)
			or(key_jump_hold)
			and (!key_down)
			{
				if (vspeed > 1)
				{
					vspeed = 1;
				}
			}
			else
			if (key_down)
			and (!key_up)
			{
				if (vspeed > 5)
				{
					vspeed = 5;
				}
			}
			else
			{
				if (vspeed > 2)
				{
					vspeed = 2;
				}
			}
		}
		
		#region /*Set the gravity underwater*/
		gravity_direction = 270; /*Direction of the gravity*/
		if (asset_get_type("obj_wall") == asset_object)
		and (!place_meeting(x, y + 1, obj_wall))
		and (asset_get_type("obj_semisolid_platform") == asset_object)
		and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
		{
			gravity = 0.1; /*Set gravity*/
		}
		else
		{
			gravity = 0;
			vspeed = 0;
		}
		#endregion /*Set the gravity underwater END*/

		if (key_jump)
		{
			
			#region /*Swim up*/
			{
				if (key_up)
				and (!key_down)
				{
					vspeed = -6;
				}
				else
				if (key_down)
				and (!key_up)
				and (crouch = false)
				{
					vspeed = -2;
				}
				else
				{
					vspeed = -4;
				}
				if (asset_get_type("snd_swim") == asset_sound)
				{
					audio_play_sound(snd_swim, 0, 0);
					audio_sound_gain(snd_swim, global.sound_volume * global.main_volume, 0);
				}
				if (asset_get_type("obj_bubble") == asset_object)
				{
					obj = instance_create_depth(x, y, 0, obj_bubble);
					with(obj)
					{
						direction =random(360);
						speed =random(2);
					}
				}
			}
			#endregion /*Swim up END*/
			
		}
		if (asset_get_type("obj_bubble") == asset_object)
		{
			if (floor(random(30 - 1))= 0)
			{
				obj = instance_create_depth(x, y, 0, obj_bubble);
				with(obj)
				{
					direction =random(360);
					speed =random(2);
				}
			}
		}
		if (on_ground = true)
		{
			if (hspeed <- 2)
			{
				hspeed = - 2;
			}
			if (hspeed >+ 2)
			{
				hspeed = +2;
			}
		}
		
		#region /*Slow down if not pressing anything*/
		if (!key_left)
		{
			if (hspeed < 0)
			{
				hspeed += 0.1;
			}
		}
		if (!key_right)
		{
			if (hspeed > 0)
			{
				hspeed-= 0.1;
			}
		}
		#endregion /*Slow down if not pressing anything END*/
		
	}
	else
	{
		in_water = false;
		allow_roll = false;
		can_ground_pound = true;
		can_wall_jump = true;
	}
}
#endregion /*Swimming In Water END*/

#region /*Drowning*/
if (allow_drowning = true)
and (can_move = true)
and (goal = false)
and (global.assist_enable = true)
and (global.assist_breathe_underwater = false)
or (allow_drowning = true)
and (can_move = true)
and (goal = false)
and (global.assist_enable = false)
{
	drawn_frames_until_drowning = lerp(drawn_frames_until_drowning, frames_until_drowning, 0.1);
	if (in_water = true)
	{
		frames_until_drowning = clamp(frames_until_drowning- 1, -60, seconds_until_drowning* 60);
		if (frames_until_drowning <= -60)
		and (goal = false)
		if (takendamage <= 0)
		and (assist_invincible = false)
		{
			if (have_heart_balloon = true)
			{
				have_heart_balloon = false;
				
				#region /*Save heart balloon to be false*/
				if (player = 1)
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player_1_have_heart_balloon", false);
					ini_close();
				}
				if (player = 2)
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player_2_have_heart_balloon", false);
					ini_close();
				}
				if (player = 3)
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player_3_have_heart_balloon", false);
					ini_close();
				}
				if (player = 4)
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player_4_have_heart_balloon", false);
					ini_close();
				}
				#endregion /*Save heart balloon to be false END*/
				
			}
			else
			{
				hp -= 1;
			}
			takendamage = 100;
			scr_gamepad_vibration(player, 1, 10);
		}
	}
	else
	{
		frames_until_drowning = seconds_until_drowning* 60 + 1; /*Reset air meter to full*/
	}
}
else
{
	frames_until_drowning = seconds_until_drowning* 60 + 1; /*Reset air meter to full*/
	drawn_frames_until_drowning = frames_until_drowning;
}
#endregion /*Drowning END*/

#region /*Water Splash Effect*/
if (in_water != old_in_water)
{
	
	#region /*Jump out of water*/
	if (key_jump_hold)
	and (in_water = false)
	and (vspeed > -normal_jump_height)
	{
		vspeed = -normal_jump_height;
		
		#region /*Jump sound effect*/
		if (asset_get_type("snd_jump") == asset_sound)
		{
			audio_play_sound(snd_jump, 0, 0);
			audio_sound_gain(snd_jump, global.sound_volume * global.main_volume, 0);
		}
		if (asset_get_type("snd_swim") == asset_sound)
		{
			audio_play_sound(snd_swim, 0, 0);
			audio_sound_gain(snd_swim, global.sound_volume * global.main_volume, 0);
		}
		#endregion /*Jump sound effect END*/
		
	}
	#endregion /*Jump out of water END*/
	
	old_in_water = in_water;
	
	if (asset_get_type("obj_water") == asset_object)
	and (asset_get_type("obj_water_splash") == asset_object)
	{
		instance_create_depth(x, y, 0, obj_water_splash);
		if (asset_get_type("obj_water_splash_particle") == asset_object)
		{
			repeat(10)
			{
				obj = instance_create_depth(x, bbox_top, 0, obj_water_splash_particle);
				with(obj)
				{
					direction = random_range(0, 180);
					speed = random_range(2, 10);
				}
			}
		}
	}
}
#endregion /*Water Splash Effect END*/

#region /*Speedup to Dashspeed*/
if (abs(hspeed) >7)
and (invincible >= true)
and (power_meter_running_sound = true)
{
	speedunit += 2;
	if (speedunit> 100)
	{
		speedunit = 100;
		if (asset_get_type("snd_power_meter_running") == asset_sound)
		{
			if (!audio_is_playing(snd_power_meter_running))
			{
				audio_stop_sound(voice);
				voice = audio_play_sound(snd_power_meter_running, 0, 0);
				audio_sound_gain(snd_power_meter_running, global.sound_volume * global.main_volume, 0);
			}
		}
		if (on_ground = true)
		{
			speeddash = true;
		}
	}
}
else
{
	speedunit -= 1;
	if (speedunit < 0)
	{
		speedunit = 0;
	}
	speeddash = false;
}
#endregion /*Speedup to Dashspeed END*/

#region /*Interaction with other players*/
if (asset_get_type("obj_player") == asset_object)
and (in_water = false)
{
			
	#region /*Jump on other players heads*/
	if (position_meeting(x, bbox_bottom + 1, obj_player))
	and (!place_meeting(x, y - 1, obj_wall))
	and (vspeed > 0)
	and (ground_pound = false)
	and (stick_to_wall = false)
	{
		ground_pound = false;
		dive = false;
		midair_jumps_left = number_of_jumps;
		draw_xscale = 0.75;
		draw_yscale = 1.5;
		if (key_jump_hold)
		{
			vspeed = -higher_jump_height;
		}
		else
		{
			vspeed = - 8;
		}
		with(instance_nearest(x, bbox_bottom, obj_player))
		{
			draw_xscale = 1.5;
			draw_yscale = 0.75;
		}
	}
	#endregion /*Jump on other players heads END*/
	
}
#endregion /*Interaction with other players END*/

#region /*Health Handeling*/
if (takendamage > 0)
{
	takendamage -= 0.5;
}

#region /*Make the player die if you have 0 HP*/
if (hp <= 0)
{
	die = true;
}
#endregion /*Make the player die if you have 0 HP END*/

#region /*Don't gain more HP than your max HP*/
if (hp > max_hp)
{
	if (allow_overflow_hp = true)
	{
		overflow_hp += 1;
		if (overflow_hp >= max_overflow_hp)
		{
			max_hp += 1;
			overflow_hp = 0;
		}
	}
	hp = max_hp;
}
#endregion /*Don't gain more HP than your max HP END*/

#endregion /*Health Handeling END*/

#region /*Burnt*/
if (asset_get_type("obj_lava") == asset_object)
{
	if (place_meeting(x, y, obj_lava))
	{
		if (allow_survive_lava = true)
		and (hp > 0)
		{
			burnt = true;
			dive = false;
			ground_pound = false;
			stick_to_wall = false;
			crouch = false;
			speed_max = 8;
			takendamage = 100;
			if (invincible < 1)
			{
				audio_stop_sound(voice);
				voice = audio_play_sound(voice_burned, 0, 0);
				audio_sound_gain(voice_burned, global.voices_volume * global.main_volume, 0);
				audio_sound_pitch(voice_burned, default_voice_pitch);
				hp -= 1;
			}
			if (invincible > 0)
			{
				audio_stop_sound(voice);
				voice = audio_play_sound(voice_burned, 0, 0);
				audio_sound_gain(voice_burned, global.voices_volume * global.main_volume, 0);
				audio_sound_pitch(voice_burned, default_voice_pitch);
			}
			if (vspeed > 0)
			{
				vspeed = -15;
			}
		}
		else
		{
			die = true;
		}
	}
}
if (burnt = true)
{
	effect_create_above(ef_smoke, x, bbox_bottom, 0, c_black);
	if (on_ground = true)
	{
		audio_play_sound(voice_burned_running, 0, 0);
		audio_sound_gain(voice_burned_running, global.voices_volume * global.main_volume, 0);
		audio_sound_pitch(voice_burned_running, default_voice_pitch);
		burnt = 2;
		dive = false;
		ground_pound = false;
		crouch = false;
		speed_max = 8;
		vspeed = -7.5;
	}
}
else
if (burnt = 2)
{
	effect_create_above(ef_smoke, x, bbox_bottom, 0, c_black);
	if (on_ground = true)
	{
		burnt = false;
	}
}
#endregion /*Burnt END*/

#region /*Remove player if there is no controls mapped for this player*/
if (player = 1)
and (!gamepad_is_connected(0))
{
	if (global.player1_key_dive = noone)
	and (global.player1_key_jump = noone)
	and (global.player1_key_crouch = noone)
	and (global.player1_key_crouch_toggle = noone)
	and (global.player1_key_sprint = noone)
	and (global.player1_key_sprint_toggle = noone)
	and (global.player1_key_left = noone)
	and (global.player1_key_right = noone)
	and (global.player1_key_down = noone)
	and (global.player1_key_up = noone)
	and (global.player1_key_tongue = noone)
	and (global.player1_key2_dive = noone)
	and (global.player1_key2_jump = noone)
	and (global.player1_key2_crouch = noone)
	and (global.player1_key2_crouch_toggle = noone)
	and (global.player1_key2_sprint = noone)
	and (global.player1_key2_sprint_toggle = noone)
	and (global.player1_key2_left = noone)
	and (global.player1_key2_right = noone)
	and (global.player1_key2_down = noone)
	and (global.player1_key2_up = noone)
	and (global.player1_key2_tongue = noone)
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.player1 = 0;
		}
		global.player1_can_play = false;
		instance_destroy();
	}
}
else
if (player = 2)
and (!gamepad_is_connected(1))
{
	if (global.player2_key_dive = noone)
	and (global.player2_key_jump = noone)
	and (global.player2_key_crouch = noone)
	and (global.player2_key_crouch_toggle = noone)
	and (global.player2_key_sprint = noone)
	and (global.player2_key_sprint_toggle = noone)
	and (global.player2_key_left = noone)
	and (global.player2_key_right = noone)
	and (global.player2_key_down = noone)
	and (global.player2_key_up = noone)
	and (global.player2_key_tongue = noone)
	and (global.player2_key2_dive = noone)
	and (global.player2_key2_jump = noone)
	and (global.player2_key2_crouch = noone)
	and (global.player2_key2_crouch_toggle = noone)
	and (global.player2_key2_sprint = noone)
	and (global.player2_key2_sprint_toggle = noone)
	and (global.player2_key2_left = noone)
	and (global.player2_key2_right = noone)
	and (global.player2_key2_down = noone)
	and (global.player2_key2_up = noone)
	and (global.player2_key2_tongue = noone)
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.player2 = 0;
		}
		global.player2_can_play = false;
		instance_destroy();
	}
}
else
if (player = 3)
and (!gamepad_is_connected(2))
{
	if (global.player3_key_dive = noone)
	and (global.player3_key_jump = noone)
	and (global.player3_key_crouch = noone)
	and (global.player3_key_crouch_toggle = noone)
	and (global.player3_key_sprint = noone)
	and (global.player3_key_sprint_toggle = noone)
	and (global.player3_key_left = noone)
	and (global.player3_key_right = noone)
	and (global.player3_key_down = noone)
	and (global.player3_key_up = noone)
	and (global.player3_key_tongue = noone)
	and (global.player3_key2_dive = noone)
	and (global.player3_key2_jump = noone)
	and (global.player3_key2_crouch = noone)
	and (global.player3_key2_crouch_toggle = noone)
	and (global.player3_key2_sprint = noone)
	and (global.player3_key2_sprint_toggle = noone)
	and (global.player3_key2_left = noone)
	and (global.player3_key2_right = noone)
	and (global.player3_key2_down = noone)
	and (global.player3_key2_up = noone)
	and (global.player3_key2_tongue = noone)
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.player3 = 0;
		}
		global.player3_can_play = false;
		instance_destroy();
	}
}
else
if (player = 4)
and (!gamepad_is_connected(3))
{
	if (global.player4_key_dive = noone)
	and (global.player4_key_jump = noone)
	and (global.player4_key_crouch = noone)
	and (global.player4_key_crouch_toggle = noone)
	and (global.player4_key_sprint = noone)
	and (global.player4_key_sprint_toggle = noone)
	and (global.player4_key_left = noone)
	and (global.player4_key_right = noone)
	and (global.player4_key_down = noone)
	and (global.player4_key_up = noone)
	and (global.player4_key_tongue = noone)
	and (global.player4_key2_dive = noone)
	and (global.player4_key2_jump = noone)
	and (global.player4_key2_crouch = noone)
	and (global.player4_key2_crouch_toggle = noone)
	and (global.player4_key2_sprint = noone)
	and (global.player4_key2_sprint_toggle = noone)
	and (global.player4_key2_left = noone)
	and (global.player4_key2_right = noone)
	and (global.player4_key2_down = noone)
	and (global.player4_key2_up = noone)
	and (global.player4_key2_tongue = noone)
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.player4 = 0;
		}
		global.player4_can_play = false;
		instance_destroy();
	}
}
else
if (player = 1)
and (gamepad_is_connected(0))
{
	if (global.player1_gamepad_button_dive = noone)
	and (global.player1_gamepad_button_jump = noone)
	and (global.player1_gamepad_button_crouch = noone)
	and (global.player1_gamepad_button_crouch_toggle = noone)
	and (global.player1_gamepad_button_sprint = noone)
	and (global.player1_gamepad_button_sprint_toggle = noone)
	and (global.player1_gamepad_button_left = noone)
	and (global.player1_gamepad_button_right = noone)
	and (global.player1_gamepad_button_down = noone)
	and (global.player1_gamepad_button_up = noone)
	and (global.player1_gamepad_button_tongue = noone)
	and (global.player1_gamepad_button2_dive = noone)
	and (global.player1_gamepad_button2_jump = noone)
	and (global.player1_gamepad_button2_crouch = noone)
	and (global.player1_gamepad_button2_crouch_toggle = noone)
	and (global.player1_gamepad_button2_sprint = noone)
	and (global.player1_gamepad_button2_sprint_toggle = noone)
	and (global.player1_gamepad_button2_left = noone)
	and (global.player1_gamepad_button2_right = noone)
	and (global.player1_gamepad_button2_down = noone)
	and (global.player1_gamepad_button2_up = noone)
	and (global.player1_gamepad_button2_tongue = noone)
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.player1 = 0;
		}
		global.player1_can_play = false;
		instance_destroy();
	}
}
else
if (player = 2)
and (gamepad_is_connected(1))
{
	if (global.player2_gamepad_button_dive = noone)
	and (global.player2_gamepad_button_jump = noone)
	and (global.player2_gamepad_button_crouch = noone)
	and (global.player2_gamepad_button_crouch_toggle = noone)
	and (global.player2_gamepad_button_sprint = noone)
	and (global.player2_gamepad_button_sprint_toggle = noone)
	and (global.player2_gamepad_button_left = noone)
	and (global.player2_gamepad_button_right = noone)
	and (global.player2_gamepad_button_down = noone)
	and (global.player2_gamepad_button_up = noone)
	and (global.player2_gamepad_button_tongue = noone)
	and (global.player2_gamepad_button2_dive = noone)
	and (global.player2_gamepad_button2_jump = noone)
	and (global.player2_gamepad_button2_crouch = noone)
	and (global.player2_gamepad_button2_crouch_toggle = noone)
	and (global.player2_gamepad_button2_sprint = noone)
	and (global.player2_gamepad_button2_sprint_toggle = noone)
	and (global.player2_gamepad_button2_left = noone)
	and (global.player2_gamepad_button2_right = noone)
	and (global.player2_gamepad_button2_down = noone)
	and (global.player2_gamepad_button2_up = noone)
	and (global.player2_gamepad_button2_tongue = noone)
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.player2 = 0;
		}
		global.player2_can_play = false;
		instance_destroy();
	}
}
else
if (player = 3)
and (gamepad_is_connected(2))
{
	if (global.player3_gamepad_button_dive = noone)
	and (global.player3_gamepad_button_jump = noone)
	and (global.player3_gamepad_button_crouch = noone)
	and (global.player3_gamepad_button_crouch_toggle = noone)
	and (global.player3_gamepad_button_sprint = noone)
	and (global.player3_gamepad_button_sprint_toggle = noone)
	and (global.player3_gamepad_button_left = noone)
	and (global.player3_gamepad_button_right = noone)
	and (global.player3_gamepad_button_down = noone)
	and (global.player3_gamepad_button_up = noone)
	and (global.player3_gamepad_button_tongue = noone)
	and (global.player3_gamepad_button2_dive = noone)
	and (global.player3_gamepad_button2_jump = noone)
	and (global.player3_gamepad_button2_crouch = noone)
	and (global.player3_gamepad_button2_crouch_toggle = noone)
	and (global.player3_gamepad_button2_sprint = noone)
	and (global.player3_gamepad_button2_sprint_toggle = noone)
	and (global.player3_gamepad_button2_left = noone)
	and (global.player3_gamepad_button2_right = noone)
	and (global.player3_gamepad_button2_down = noone)
	and (global.player3_gamepad_button2_up = noone)
	and (global.player3_gamepad_button2_tongue = noone)
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.player3 = 0;
		}
		global.player3_can_play = false;
		instance_destroy();
	}
}
else
if (player = 4)
and (gamepad_is_connected(3))
{
	if (global.player4_gamepad_button_dive = noone)
	and (global.player4_gamepad_button_jump = noone)
	and (global.player4_gamepad_button_crouch = noone)
	and (global.player4_gamepad_button_crouch_toggle = noone)
	and (global.player4_gamepad_button_sprint = noone)
	and (global.player4_gamepad_button_sprint_toggle = noone)
	and (global.player4_gamepad_button_left = noone)
	and (global.player4_gamepad_button_right = noone)
	and (global.player4_gamepad_button_down = noone)
	and (global.player4_gamepad_button_up = noone)
	and (global.player4_gamepad_button_tongue = noone)
	and (global.player4_gamepad_button2_dive = noone)
	and (global.player4_gamepad_button2_jump = noone)
	and (global.player4_gamepad_button2_crouch = noone)
	and (global.player4_gamepad_button2_crouch_toggle = noone)
	and (global.player4_gamepad_button2_sprint = noone)
	and (global.player4_gamepad_button2_sprint_toggle = noone)
	and (global.player4_gamepad_button2_left = noone)
	and (global.player4_gamepad_button2_right = noone)
	and (global.player4_gamepad_button2_down = noone)
	and (global.player4_gamepad_button2_up = noone)
	and (global.player4_gamepad_button2_tongue = noone)
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.player4 = 0;
		}
		global.player4_can_play = false;
		instance_destroy();
	}
}
#endregion /*Remove player if there is no controls mapped for this player END*/

#region /*Die*/
if (die = true)
and (goal = false)
{
	scr_gamepad_vibration(player, 1, 30);
	
	#region /*Update Checkpoint Time*/
	global.checkpoint_millisecond = global.timeattack_millisecond;
	global.checkpoint_second = global.timeattack_second;
	global.checkpoint_minute = global.timeattack_minute;
	global.checkpoint_realmillisecond = global.timeattack_realmillisecond;
	#endregion /*Update Checkpoint Time END*/
	
	#region /*Update Level Editor Checkpoint Time*/
	if (asset_get_type("room_leveleditor") == asset_room)
	and (room =room_leveleditor)
	and (global.actually_play_edited_level = true)
	and (global.character_select_in_this_menu = "level_editor")
	{
		ini_open(working_directory + "/save_files/custom_level_save.ini");
		ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_millisecond", global.timeattack_millisecond);
		ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_second", global.timeattack_second);
		ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_minute", global.timeattack_minute);
		ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_realmillisecond", global.timeattack_realmillisecond);
		ini_close();
	}
	#endregion /*Update Level Editor Checkpoint Time END*/
	
	if (asset_get_type("obj_player") == asset_object)
	and (global.pause = false)
	{
		if (instance_number(obj_player) <= 1)
		{
			audio_stop_sound(global.music);
			audio_stop_sound(global.music_underwater);
			music = noone;
			music_underwater = noone;
			if (asset_get_type("snd_music_invincible") == asset_sound)
			{
				audio_stop_sound(snd_music_invincible);
			}
			if (asset_get_type("snd_skidding") == asset_sound)
			{
				audio_stop_sound(snd_skidding);
			}
			if (asset_get_type("snd_skidding_ice") == asset_sound)
			{
				audio_stop_sound(snd_skidding_ice);
			}
			if (asset_get_type("snd_skiddingvertical") == asset_sound)
			{
				audio_stop_sound(snd_skiddingvertical);
			}
		}
		speed = 0;
		takendamage = 0;
		invincible = false;
		if (asset_get_type("snd_die") == asset_sound)
		{
			audio_play_sound(snd_die, 0, 0);
			audio_sound_gain(snd_die, global.sound_volume * global.main_volume, 0);
		}
		if (asset_get_type("obj_player_die") == asset_object)
		{
			
			#region /*Player 1 Die*/
			if (player = 1)
			{
				obj = instance_create_depth(x, y, 0, obj_player_die);
				with(obj)
				{
					player = 1;
					if (instance_nearest(x, y, obj_player).sprite_die > noone)
					{
						sprite_index = instance_nearest(x, y, obj_player).sprite_die;
					}
					else
					if (instance_nearest(x, y, obj_player).sprite_stand > noone)
					{
						sprite_index = instance_nearest(x, y, obj_player).sprite_stand;
					}
					else
					if (instance_nearest(x, y, obj_player).sprite_walk > noone)
					{
						sprite_index = instance_nearest(x, y, obj_player).sprite_walk;
					}
					if (instance_nearest(x, y, obj_player).sprite_game_over_character_portrait > noone)
					{
						sprite_game_over_character_portrait = instance_nearest(x, y, obj_player).sprite_game_over_character_portrait;
					}
					voice_damage = instance_nearest(x, y, obj_player).voice_damage;
					default_voice_pitch = instance_nearest(x, y, obj_player).default_voice_pitch;
					default_xscale = instance_nearest(x, y, obj_player).default_xscale;
					default_yscale = instance_nearest(x, y, obj_player).default_yscale;
				}
			}
			#endregion /*Player 1 Die END*/
			
			else
			
			#region /*Player 2 Die*/
			if (player = 2)
			{
				obj = instance_create_depth(x, y, 0, obj_player_die);
				with(obj)
				{
					player = 2;
					if (instance_nearest(x, y, obj_player).sprite_die > noone)
					{
						sprite_index = instance_nearest(x, y, obj_player).sprite_die;
					}
					else
					if (instance_nearest(x, y, obj_player).sprite_stand > noone)
					{
						sprite_index = instance_nearest(x, y, obj_player).sprite_stand;
					}
					else
					if (instance_nearest(x, y, obj_player).sprite_walk > noone)
					{
						sprite_index = instance_nearest(x, y, obj_player).sprite_walk;
					}
					if (instance_nearest(x, y, obj_player).sprite_game_over_character_portrait > noone)
					{
						sprite_game_over_character_portrait = instance_nearest(x, y, obj_player).sprite_game_over_character_portrait;
					}
					voice_damage = instance_nearest(x, y, obj_player).voice_damage;
					default_voice_pitch = instance_nearest(x, y, obj_player).default_voice_pitch;
					default_xscale = instance_nearest(x, y, obj_player).default_xscale;
					default_yscale = instance_nearest(x, y, obj_player).default_yscale;
				}
			}
			#endregion /*Player 2 Die END*/
			
			else
			
			#region /*Player 3 Die*/
			if (player = 3)
			{
				obj = instance_create_depth(x, y, 0, obj_player_die);
				with(obj)
				{
					player = 3;
					if (instance_nearest(x, y, obj_player).sprite_die > noone)
					{
						sprite_index = instance_nearest(x, y, obj_player).sprite_die;
					}
					else
					if (instance_nearest(x, y, obj_player).sprite_stand > noone)
					{
						sprite_index = instance_nearest(x, y, obj_player).sprite_stand;
					}
					else
					if (instance_nearest(x, y, obj_player).sprite_walk > noone)
					{
						sprite_index = instance_nearest(x, y, obj_player).sprite_walk;
					}
					if (instance_nearest(x, y, obj_player).sprite_game_over_character_portrait > noone)
					{
						sprite_game_over_character_portrait = instance_nearest(x, y, obj_player).sprite_game_over_character_portrait;
					}
					voice_damage = instance_nearest(x, y, obj_player).voice_damage;
					default_voice_pitch = instance_nearest(x, y, obj_player).default_voice_pitch;
					default_xscale = instance_nearest(x, y, obj_player).default_xscale;
					default_yscale = instance_nearest(x, y, obj_player).default_yscale;
				}
			}
			#endregion /*Player 3 Die END*/
			
			else
			
			#region /*Player 4 Die*/
			if (player = 4)
			{
				obj = instance_create_depth(x, y, 0, obj_player_die);
				with(obj)
				{
					player = 4;
					if (instance_nearest(x, y, obj_player).sprite_die > noone)
					{
						sprite_index = instance_nearest(x, y, obj_player).sprite_die;
					}
					else
					if (instance_nearest(x, y, obj_player).sprite_stand > noone)
					{
						sprite_index = instance_nearest(x, y, obj_player).sprite_stand;
					}
					else
					if (instance_nearest(x, y, obj_player).sprite_walk > noone)
					{
						sprite_index = instance_nearest(x, y, obj_player).sprite_walk;
					}
					if (instance_nearest(x, y, obj_player).sprite_game_over_character_portrait > noone)
					{
						sprite_game_over_character_portrait = instance_nearest(x, y, obj_player).sprite_game_over_character_portrait;
					}
					voice_damage = instance_nearest(x, y, obj_player).voice_damage;
					default_voice_pitch = instance_nearest(x, y, obj_player).default_voice_pitch;
					default_xscale = instance_nearest(x, y, obj_player).default_xscale;
					default_yscale = instance_nearest(x, y, obj_player).default_yscale;
				}
			}
			#endregion /*Player 4 Die END*/
			
		}
		else
		
		#region /*Restart Game*/
		{
			game_restart();
		}
		#endregion /*Restart Game END*/
		
		instance_destroy();
	}
}
#endregion /*Die END*/

#region /*If you touch spikes, take damage*/
if (asset_get_type("obj_spikes") == asset_object)
and (instance_exists(obj_spikes))
{
	if (place_meeting(x - 1, y, obj_spikes))
	or(place_meeting(x + 1, y, obj_spikes))
	or(place_meeting(x, y - 1, obj_spikes))
	or(place_meeting(x, y + 1, obj_spikes))
	{
		if (takendamage < 1)
		and (assist_invincible = false)
		and (invincible <= false)
		{
			if (have_heart_balloon = true)
			{
				have_heart_balloon = false;
				
				#region /*Save heart balloon to be false*/
				if (player = 1)
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player_1_have_heart_balloon", false);
					ini_close();
				}
				if (player = 2)
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player_2_have_heart_balloon", false);
					ini_close();
				}
				if (player = 3)
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player_3_have_heart_balloon", false);
					ini_close();
				}
				if (player = 4)
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player_4_have_heart_balloon", false);
					ini_close();
				}
				#endregion /*Save heart balloon to be false END*/
				
			}
			else
			{
				hp -= 1;
			}
			takendamage = 100;
		}
	}
}
#endregion /*If you touch spikes, take damage END*/

#region /*Invincibility*/
if (asset_get_type("obj_invincibility_powerup") == asset_object)
and (place_meeting(x, y, obj_invincibility_powerup))
and (instance_nearest(x, y, obj_invincibility_powerup).bounceup = false)
{
	chain_reaction = 0;
	invincible = true;
	audio_sound_gain(global.music, 0, 100);
	audio_sound_gain(global.music_underwater, 0, 100);
	if (asset_get_type("snd_music_invincible") == asset_sound)
	and (!audio_is_playing(snd_music_invincible))
	{
		audio_play_sound(snd_music_invincible, 0, 0);
		audio_sound_gain(snd_music_invincible, global.music_volume * global.main_volume, 0);
	}
	audio_stop_sound(voice);
	voice = audio_play_sound(voice_get_star, 0, 0);
	audio_sound_gain(voice_get_star, global.voices_volume * global.main_volume, 0);
	audio_sound_pitch(voice_get_star, default_voice_pitch);
	score += 1000;
	global.hud_show_score = true;
	if (asset_get_type("obj_camera") == asset_object)
	and (instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			hud_show_score_timer = global.hud_hide_time * 60;
		}
	}
	if (asset_get_type("obj_scoreup") == asset_object)
	{
		obj = instance_create_depth(x, y, 0, obj_scoreup);
		with(obj)
		{
			scoreup = 1000;
		}
	}
	with(instance_nearest(x, y, obj_invincibility_powerup))
	{
		instance_destroy();
	}
}
#endregion /*Invincibility END*/

#region /*Time*/
if (goal = false)
{
	if (global.time_countdown = 0)
	and (global.enable_time_countdown = true)
	and (allow_timeup = true)
	and (global.player_has_entered_goal = false)
	{
		die = true;
	}
	if (global.time_countdown = 99)
	and (global.enable_time_countdown = true)
	{
		if (asset_get_type("snd_hurry_up") == asset_sound)
		{
			if (!audio_is_playing(snd_hurry_up))
			{
				audio_play_sound(snd_hurry_up, 0, 0);
				audio_sound_gain(snd_hurry_up, global.sound_volume * global.main_volume, 0);
			}
			if (audio_is_playing(snd_hurry_up))
			{
				audio_stop_sound(global.music);
				audio_stop_sound(global.music_underwater);
			}
		}
	}
}
else
{
	if (global.time_countdown_bonus > 0)
	{
		global.hud_show_score = true;
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_score_timer = global.hud_hide_time * 60;
			}
		}
		if (global.time_countdown_bonus > 3)
		{
			global.time_countdown_bonus -= 3;
			score += 150;
		}
		else
		{
			global.time_countdown_bonus -= 1;
			score += 50;
		}
		if (asset_get_type("snd_beep") == asset_sound)
		{
			if (!audio_is_playing(snd_beep))
			{
				audio_play_sound(snd_beep, 0, true);
				audio_sound_gain(snd_beep, global.sound_volume * global.main_volume, 0);
			}
		}
	}
	if (global.time_countdown_bonus = 0)
	{
		if (asset_get_type("snd_beep") == asset_sound)
		{
			if (audio_is_playing(snd_beep))
			{
				audio_stop_sound(snd_beep);
			}
		}
	}
	if (asset_get_type("obj_enemy") == asset_object)
	{
		with(obj_enemy)
		{
			instance_destroy();
		}
	}
}
#endregion /*Time END*/

#region /*Goal*/
if (asset_get_type("obj_goal") == asset_object)
and (instance_exists(obj_goal))
{
	if (distance_to_object(obj_goal) < 1920)
	{
		
		#region /*Touching goal*/
		if (x > instance_nearest(x, y, obj_goal).bbox_right)
		and (x < instance_nearest(x, y, obj_goal).bbox_right + 16)
		and (y < instance_nearest(x, y, obj_goal).bbox_bottom)
		and (goal = false)
		and (!collision_line(x, y, instance_nearest(x, y, obj_goal).x, instance_nearest(x, y, obj_goal).y, obj_wall, false, true))
		and (!collision_line(x + 1, y + 1, instance_nearest(x, y, obj_goal).x + 1, instance_nearest(x, y, obj_goal).y + 1, obj_wall, false, true))
		or (place_meeting(x, y, obj_goal))
		and (goal = false)
		{
			just_hit_goal = true;
			obj_goal.goal = true;
		}
		#endregion /*Touching goal END*/
		
		else
		
		#region /*Can't walk back when touched goal*/
		if (x < instance_nearest(x, y, obj_goal).bbox_left + 4)
		and (goal = true)
		{
			x = instance_nearest(x, y, obj_goal).bbox_left + 4;
		}
		#endregion /*Can't walk back when touched goal END*/
		
		if (just_hit_goal = true)
		and (goal = false)
		{
			if (!instance_exists(obj_camera.player1))
			{
				global.player1_can_play = false;
			}
			if (!instance_exists(obj_camera.player2))
			{
				global.player2_can_play = false;
			}
			if (!instance_exists(obj_camera.player3))
			{
				global.player3_can_play = false;
			}
			if (!instance_exists(obj_camera.player4))
			{
				global.player4_can_play = false;
			}
			global.goal_active = true;
			global.player_has_entered_goal = true;
			global.quit_level = false;
			global.quit_to_map = false;
			global.quit_to_title = false;
			global.restart_level = false;
			instance_nearest(x, y, obj_goal).image_index = 1;
			invincible = false;
			
			if (instance_nearest(x, y, obj_goal).trigger_ending = true)
			{
				global.trigger_ending = true;
			}
			
			#region /*Stop Music*/
			audio_stop_sound(global.music);
			audio_stop_sound(global.music_underwater);
			global.music = noone;
			global.music_underwater = noone;
			music = noone;
			music_underwater = noone;
			#endregion /*Stop Music END*/
			
			#region /*Save Checkpoint*/
			if (asset_get_type("room_leveleditor") == asset_room)
			and (room = room_leveleditor)
			and (global.character_select_in_this_menu = "main_game")
			{
				global.x_checkpoint = 0;
				global.y_checkpoint = 0;
				global.checkpoint_millisecond = 0;
				global.checkpoint_second = 0;
				global.checkpoint_minute = 0;
				global.checkpoint_realmillisecond = 0;
				
				var uppercase_level_name;
				uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
				uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
				var level_name = string(uppercase_level_name);
				
				ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
				ini_write_real(level_name, "x_checkpoint", 0);
				ini_write_real(level_name, "y_checkpoint", 0);
				ini_write_real(level_name, "checkpoint_millisecond", 0);
				ini_write_real(level_name, "checkpoint_second", 0);
				ini_write_real(level_name, "checkpoint_minute", 0);
				ini_write_real(level_name, "checkpoint_realmillisecond", 0);
				ini_write_real(level_name, "checkpoint_direction", +1);
				ini_close();
			}
			else
			if (asset_get_type("room_leveleditor") == asset_room)
			and (room = room_leveleditor)
			and (global.character_select_in_this_menu = "level_editor")
			{
				global.x_checkpoint = 0;
				global.y_checkpoint = 0;
				global.checkpoint_millisecond = 0;
				global.checkpoint_second = 0;
				global.checkpoint_minute = 0;
				global.checkpoint_realmillisecond = 0;
				
				var uppercase_level_name;
				uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 1));
				uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))) - 1);
				var level_name = string(uppercase_level_name);
				
				ini_open(working_directory + "/save_files/custom_level_save.ini");
				ini_write_real(level_name, "x_checkpoint", 0);
				ini_write_real(level_name, "y_checkpoint", 0);
				ini_write_real(level_name, "checkpoint_millisecond", 0);
				ini_write_real(level_name, "checkpoint_second", 0);
				ini_write_real(level_name, "checkpoint_minute", 0);
				ini_write_real(level_name, "checkpoint_realmillisecond", 0);
				ini_write_real(level_name, "checkpoint_direction", +1);
				ini_close();
			}
			#endregion /*Save Checkpoint END*/
			
			#region /*Enter goal voice*/
			audio_stop_sound(voice);
			voice = audio_play_sound(voice_enter_goal, 0, 0);
			audio_sound_gain(voice_enter_goal, global.voices_volume * global.main_volume, 0);
			audio_sound_pitch(voice_enter_goal, default_voice_pitch);
			#endregion /*Enter goal voice END*/
			
			#region /*Level Clear Melody*/
			if (level_clear_melody > noone)
			{
				if (!audio_is_playing(level_clear_melody))
				{
					audio_play_sound(level_clear_melody, 0, 0);
					audio_sound_gain(level_clear_melody, global.music_volume * global.main_volume, 0);
				}
			}
			#endregion /*Level Clear Melody END*/
			
			goal = true; /*Set goal to true on last*/
			
		}
	}
}
if (goal = true)
and (global.time_countdown_bonus <= 0)
{
	allow_ground_pound = false;
	ground_pound = false;
	allow_dive = false;
	dive = false;
}
#endregion /*Goal END*/

#region /*Homing Attack*/
if (allow_homing_attack = true)
{
	
	#region /*Homing Enemy*/
	if (asset_get_type("obj_wall") == asset_object)
	and (!place_meeting(x, y + 1, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	and (stick_to_wall = false)
	and (climb = false)
	and (horizontal_rope_climb = false)
	and (key_jump)
	and (asset_get_type("obj_enemy") == asset_object)
	and (instance_exists(obj_enemy))
	and (!collision_line(x, y, instance_nearest(x, y, obj_enemy).x, instance_nearest(x, y, obj_enemy).y, obj_wall, false, true))
	and (!collision_line(x + 1, y + 1, instance_nearest(x, y, obj_enemy).x + 1, instance_nearest(x, y, obj_enemy).y + 1, obj_wall, false, true))
	and (distance_to_object(obj_enemy) < homing_attack_distance)
	and (instance_nearest(x, y, obj_enemy).bbox_bottom > y)
	and (instance_nearest(x, y, obj_enemy).die = false)
	and (homing_attack_x = 0)
	and (homing_attack_y = 0)
	{
		homing_attack_x = instance_nearest(x, y, obj_enemy).x;
		homing_attack_y = instance_nearest(x, y, obj_enemy).bbox_top + y - bbox_bottom + 19;
		dive = false;
		ground_pound = false;
		if (speed_max <= 4)
		{
			speed_max = 4;
		}
	}
	#endregion /*Homing Enemy END*/
	
	else
	
	#region /*Homing Spring*/
	if (asset_get_type("obj_wall") == asset_object)
	and (!place_meeting(x, y + 1, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	and (stick_to_wall = false)
	and (climb = false)
	and (horizontal_rope_climb = false)
	and (key_jump)
	and (asset_get_type("obj_spring") == asset_object)
	and (instance_exists(obj_spring))
	and (!collision_line(x, y, instance_nearest(x, y, obj_spring).x, instance_nearest(x, y, obj_spring).y, obj_wall, false, true))
	and (!collision_line(x + 1, y + 1, instance_nearest(x, y, obj_spring).x + 1, instance_nearest(x, y, obj_spring).y + 1, obj_wall, false, true))
	and (distance_to_object(obj_spring) < homing_attack_distance)
	and (instance_nearest(x, y, obj_spring).bbox_bottom > y)
	and (instance_nearest(x, y, obj_spring).can_bounce = 0)
	and (homing_attack_x = 0)
	and (homing_attack_y = 0)
	{
		homing_attack_x = instance_nearest(x, y, obj_spring).x;
		homing_attack_y = instance_nearest(x, y, obj_spring).y;
		dive = false;
		ground_pound = false;
		if (speed_max <= 4)
		{
			speed_max = 4;
		}
	}
	#endregion /*Homing Spring END*/
	
	if (homing_attack_x > 0)
	{
		move_towards_point(homing_attack_x, homing_attack_y, 30);
	}
	if (place_meeting(x, y, obj_enemy))
	{
		if (homing_attack_x > 0)
		or(homing_attack_y > 0)
		{
			hspeed = 0;
			vspeed = -triple_jump_height;
			homing_attack_x = 0;
			homing_attack_y = 0;
		}
	}
}
#endregion /*Homing Attack END*/

if (vspeed > 0)
{
	stomp_spin = false;
}

#region /*Spring*/
if (asset_get_type("obj_spring") == asset_object)
and (instance_exists(obj_spring))
and (place_meeting(x, y, obj_spring))
and (instance_nearest(x, y, obj_spring).can_bounce = 0)
{
	scr_gamepad_vibration(player, 0.4, 10);
	
	#region /*Play jumping on spring voice clip*/
	audio_stop_sound(voice);
	voice = audio_play_sound(voice_jump_spring, 0, 0);
	audio_sound_gain(voice_jump_spring, global.voices_volume * global.main_volume, 0);
	audio_sound_pitch(voice_jump_spring, default_voice_pitch);
	#endregion /*Play jumping on spring voice clip END*/
	
	if (ground_pound >= true)
	{
		effect_create_above(ef_smoke, x, bbox_bottom, 2, c_white);
		image_index = 0;
		ground_pound = false;
		speed_max = 4;
		if (asset_get_type("obj_camera") == asset_object)
		{
			with(instance_nearest(x, y, obj_camera))
			{
				shake = 10;
			}
		}
		if (asset_get_type("snd_hipattack") == asset_sound)
		{
			audio_play_sound(snd_hipattack, 0, 0);
			audio_sound_gain(snd_hipattack, global.sound_volume * global.main_volume, 0);
		}
	}
	spring_animation = 0;
	jump_transition_to_fall_animation = 0;
	spring_twist_sprite = true;
	move_towards_point(instance_nearest(x, y, obj_spring).second_x, instance_nearest(x, y, obj_spring).second_y, instance_nearest(x, y, obj_spring).bounce_height);
	if (hspeed < 0)
	{
		image_xscale = -1;
	}
	else
	if (hspeed > 0)
	{
		image_xscale = +1;
	}
	can_climb_horizontal_rope_cooldown = sprite_get_height(mask_index) / 10;
	midair_jumps_left = number_of_jumps;
	can_ground_pound = false;
	can_dive = true; /*Can dive when you jump out of a spring still*/
	chain_reaction = 0;
	dive = false;
	draw_xscale = 0.5;
	draw_yscale = 1.5;
	horizontal_rope_climb = false;
	ledge_grab_jump = false;
	speed_max = 4;
	spring = true;
	move_towards_spring_endpoint = true;
	if (asset_get_type("obj_spring") == asset_object)
	and (instance_exists(obj_spring))
	{
		spring_endpoint_x = instance_nearest(x, y, obj_spring).second_x;
		spring_endpoint_y = instance_nearest(x, y, obj_spring).second_y;
	}
	stick_to_wall = false;
	homing_attack_x = 0;
	homing_attack_y = 0;
	instance_nearest(x, y, obj_spring).can_bounce = 10;
	instance_nearest(x, y, obj_spring).image_index = 1;
	instance_nearest(x, y, obj_spring).image_speed = 1;
}

if (move_towards_spring_endpoint = true)
{
	move_towards_point(spring_endpoint_x, spring_endpoint_y, 20);
	
	if (asset_get_type("obj_spring") == asset_object)
	and (instance_exists(obj_spring))
	and (point_distance(
	spring_endpoint_x,
	spring_endpoint_y,
	instance_nearest(spring_endpoint_x, spring_endpoint_y, obj_spring).x,
	instance_nearest(spring_endpoint_x, spring_endpoint_y, obj_spring).y) < 32)
	{
		move_towards_spring_endpoint = true;
	}
	else
	if (point_distance(x, y, spring_endpoint_x, spring_endpoint_y) < 340)
	{
		move_towards_spring_endpoint = false;
		spring_endpoint_x = 0;
		spring_endpoint_y = 0;
	}
	if (asset_get_type("obj_wall") == asset_object)
	and (instance_exists(obj_wall))
	{
		if (place_meeting(x - 4, y, obj_wall))
		and (hspeed < 0)
		or(place_meeting(x + 4, y, obj_wall))
		and (hspeed > 0)
		or(place_meeting(x, y - 4, obj_wall))
		and (vspeed < 0)
		or(place_meeting(x, y + 4, obj_wall))
		and (vspeed > 0)
		{
			move_towards_spring_endpoint = false;
			spring_endpoint_x = 0;
			spring_endpoint_y = 0;
		}
	}
}

if (spring = true)
{
	if (spring_animation = 0)
	{
		if (image_index > image_number - 1)
		{
			image_index = 0;
			if (vspeed >=-4)
			if (vspeed >= 0)
			{
				if (sprite_spring_transition > noone)
				or (sprite_jump_transition_to_fall > noone)
				{
					spring_animation = 1;
				}
				else
				{
					spring_animation = 2;
				}
			}
		}
		if (sprite_spring_up > noone){sprite_index = sprite_spring_up;}else
		if (sprite_spring_down > noone){sprite_index = sprite_spring_down;}else
		if (sprite_double_jump > noone){sprite_index = sprite_double_jump;}else
		if (sprite_jump > noone){sprite_index = sprite_jump; image_index = image_number - 1;}else
		if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
		if (sprite_stand > noone){sprite_index = sprite_stand;}else
		if (sprite_walk > noone){sprite_index = sprite_walk;}
	}
	else
	if (spring_animation = 1)
	{
		if (image_index > image_number - 1)
		{
			image_index = 0;
			spring_animation = 2;
		}
		if (sprite_spring_transition > noone){sprite_index = sprite_spring_transition;}else
		if (sprite_jump_transition_to_fall > noone){sprite_index = sprite_jump_transition_to_fall;}else
		{spring_animation = 2;}
	}
	else
	if (spring_animation = 2)
	{
		if (sprite_spring_down > noone){sprite_index = sprite_spring_down;}else
		if (sprite_spring_up > noone){sprite_index = sprite_spring_up;}else
		if (key_jump_hold) and (sprite_fall_slower > noone){sprite_index = sprite_fall_slower;}else
		if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
		if (sprite_jump_transition_to_fall > noone){sprite_index = sprite_jump_transition_to_fall; if (image_index > image_number - 1){image_index = image_number - 1;}}else
		if (sprite_double_jump > noone){sprite_index = sprite_double_jump;}else
		if (sprite_jump > noone){sprite_index = sprite_jump; image_index = image_number - 1;}else
		if (sprite_stand > noone){sprite_index = sprite_stand;}else
		if (sprite_walk > noone){sprite_index = sprite_walk;}
		if (vspeed < 0)
		{
			spring_animation = 0;
		}
	}
	
	#region /*Make the cahracter face wherever you're going*/
	if (spring_twist_sprite = true)
	{
		angle = direction - 90;
		if (speed < 6)
		or(direction >= 90 - 10)
		and (direction <= 90 + 10)
		{
			spring_twist_sprite = false;
		}
	}
	#endregion /*Make the cahracter face wherever you're going END*/
	
	star_image_index += 1;
	if (star_image_index = 5)
	{
		effect_create_above(ef_star, x + random_range(-32, +32), y + random_range(-32, +32), 0, c_white);
		star_image_index = 0;
	}
	image_speed = 0.5;
}
#endregion /*Spring END*/

#endregion /*________________________________MORE MOVES________________________________*/

///Platformer Player Part 2
#region /*________________________________Handling the sprites and sounds in the step event________________________________*/
draw_xscale = lerp(draw_xscale, 1, 0.2); /*Make horizontal stretching slowly reset back to 1*/
draw_yscale = lerp(draw_yscale, 1, 0.2); /*Make vertical stretching slowly reset back to 1*/

if (sprite_index = sprite_jump)
or (sprite_index = sprite_stand)
or (sprite_index = sprite_run)
or (sprite_index = sprite_run2)
or (sprite_index = sprite_run3)
or (sprite_index = sprite_run4)
{
	jump_transition_to_fall_animation = 0;
}

#region /*A bump sound effect if a player walks into a wall to let them know that they they hit a wall*/

#region /*Left*/
if (key_left)
and (!key_right)
and (place_meeting(x - 1, y, obj_wall))
and (climb = false)
and (stick_to_wall = false)
{
	if (on_ground = true)
	{
		if (asset_get_type("snd_bump") == asset_sound)
		{
			if (!audio_is_playing(snd_bump))
			{
				audio_play_sound(snd_bump, 0, 0);
				audio_sound_gain(snd_bump, global.sound_volume * global.main_volume, 0);
			}
		}
	}
}
#endregion /*Left END*/

#region /*Right*/
if (key_right)
and (!key_left)
and (place_meeting(x + 1, y, obj_wall))
and (climb = false)
and (stick_to_wall = false)
{
	if (on_ground = true)
	{
		if (asset_get_type("snd_bump") == asset_sound)
		{
			if (!audio_is_playing(snd_bump))
			{
				audio_play_sound(snd_bump, 0, 0);
				audio_sound_gain(snd_bump, global.sound_volume * global.main_volume, 0);
			}
		}
	}
}
#endregion /*Right END*/

#endregion /*A bump sound effect if a player walks into a wall to let them know that they they hit a wall END*/

if (asset_get_type("obj_vine") == asset_object)
and (!place_meeting(x, y, obj_vine))
{
	climb = false;
}
if (asset_get_type("obj_horizontal_rope") == asset_object)
and (!place_meeting(x, y, obj_horizontal_rope))
{
	horizontal_rope_climb = false;
}

#region /*Climb Horizontal Rope*/
if (can_climb_horizontal_rope_cooldown > 0)
{
	can_climb_horizontal_rope_cooldown -= 1;
}

if (asset_get_type("obj_horizontal_rope") == asset_object)
and (place_meeting(x, y, obj_horizontal_rope))
and (instance_nearest(x, y, obj_horizontal_rope).active = true)
and (asset_get_type("obj_wall") == asset_object)
and (!place_meeting(x, y + 1, obj_wall))
and (asset_get_type("obj_semisolid_platform") == asset_object)
and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
and (in_water = false)
and (hold_item_in_hands = "")
{
	if (horizontal_rope_climb = false)
	and (can_climb_horizontal_rope_cooldown <= 0)
	{
		midair_jumps_left = number_of_jumps;
		horizontal_rope_climb = true;
		jump_transition_to_fall_animation = 0;
		climb = false;
		jump = 0;
		
		#region /*Make a sound effect that you have started cimbing*/
		if (asset_get_type("snd_catch_ivy") == asset_sound)
		{
			audio_play_sound(snd_catch_ivy, 0, 0);
			audio_sound_gain(snd_catch_ivy, global.sound_volume * global.main_volume, 0);
		}
		audio_stop_sound(voice);
		voice = audio_play_sound(voice_rope_catch, 0, 0);
		audio_sound_gain(voice_rope_catch, global.voices_volume * global.main_volume, 0);
		audio_sound_pitch(voice_rope_catch, default_voice_pitch);
		#endregion /*Make a sound effect that you have started cimbing END*/
		
	}
	if (horizontal_rope_climb = true)
	{
		if (!place_meeting(x - 32, y, obj_horizontal_rope))
		and (hspeed < 0)
		or (!place_meeting(x + 32, y, obj_horizontal_rope))
		and (hspeed > 0)
		{
			hspeed = 0;
		}
		angle = 0;
		midair_jumps_left = number_of_jumps;
		can_ground_pound = false;
		can_dive = true;
		chain_reaction = 0;
		dive = false;
		gravity = 0;
		ground_pound = false;
		last_standing_x = x;
		last_standing_y = y;
		ledge_grab_jump = false;
		speed_max = 4;
		spring = false;
		stick_to_wall = false;
		crouch = false;
		vspeed = 0;
		if (key_left)
		or(key_right)
		{
			friction = 0.2;
		}
		else
		{
			friction = 0.5;
		}
		y = instance_nearest(x, y, obj_horizontal_rope).y + climb_under_y_offset;
		
		#region /*Spinning on horizontal rope*/
		if (key_up)
		and (!key_down)
		and (!place_meeting(x, y - 16, obj_wall))
		and (!place_meeting(x, y - 32, obj_wall))
		and (!place_meeting(x, y - 48, obj_wall))
		and (!place_meeting(x, y - 64, obj_wall))
		and (simple_controls = false)
		{
			friction = 0.5; /*Make the character stop horizontal movement sooner when spinning on horizontal rope*/
				
			#region /*Start spinning on rope*/
			if (place_meeting(x - 1, y, obj_wall))
			or(place_meeting(x - 4, y - 16, obj_wall))
			or(place_meeting(x - 4, y - 32, obj_wall))
			or(place_meeting(x - 4, y - 48, obj_wall))
			or(place_meeting(x - 4, y - 64, obj_wall))
			{
				x += 1;
				hspeed = 0;
			}
			else
			if (place_meeting(x + 1, y, obj_wall))
			or(place_meeting(x + 4, y - 16, obj_wall))
			or(place_meeting(x + 4, y - 32, obj_wall))
			or(place_meeting(x + 4, y - 48, obj_wall))
			or(place_meeting(x + 4, y - 64, obj_wall))
			{
				x -= 1;
				hspeed = 0;
			}
			if (image_index <= 5)
			and (image_speed > 0.3)
			{
				if (asset_get_type("obj_blockbreak") == asset_object)
				{
					instance_create_depth(x, y, 0, obj_blockbreak);
					instance_create_depth(x, y + 32, 0, obj_blockbreak);
					instance_create_depth(x, y + 64, 0, obj_blockbreak);
				}
			}
			else
			if (image_index >= 5)
			and (image_speed > 0.3)
			{
				if (asset_get_type("obj_blockbreak") == asset_object)
				{
					instance_create_depth(x, y, 0, obj_blockbreak);
					instance_create_depth(x, y - 32, 0, obj_blockbreak);
					instance_create_depth(x, y - 64, 0, obj_blockbreak);
				}
			}
			if (image_speed < 1)
			{
				if (sprite_climb_under_spin > noone){sprite_index = sprite_climb_under_spin;}else
				if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
				if (sprite_stand > noone){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
			else
			{
				if (sprite_climb_under_spin_fast> noone){sprite_index = sprite_climb_under_spin_fast;}else
				if (sprite_climb_under_spin > noone){sprite_index = sprite_climb_under_spin;}else
				if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
				if (sprite_stand > noone){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
			if (image_index >= image_number - 1)
			and (image_number > 1)
			{
				scr_gamepad_vibration(player, 0.2, 10);
				if (asset_get_type("snd_swing") == asset_sound)
				{
					audio_play_sound(snd_swing, 0, 0);
					audio_sound_gain(snd_swing, global.sound_volume * global.main_volume, 0);
				}
				image_index = 0;
			}
			image_speed += 0.02;
			if (image_speed > 1)
			{
				image_speed = 1;
			}
			#endregion /*Start spinning on rope END*/
				
			#region /*Jump from rope spin*/
			if (key_jump)
			or(up_key_is_jump_key = true)
			and (!key_up)
			{
				if (asset_get_type("snd_jump") == asset_sound)
				{
					audio_play_sound(snd_jump, 0, 0);
					audio_sound_gain(snd_jump, global.sound_volume * global.main_volume, 0);
				}
				scr_gamepad_vibration(player, 0.4, 10);
				can_climb_horizontal_rope_cooldown = sprite_get_height(mask_index) / 35;
				midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
				y-= 64;
				climb = false;
				horizontal_rope_climb = false;
				spring_animation = 0;
				spring = true;
				
				#region /*Do a charged upward jump depending on how fast you spin*/
				if (image_speed >= 1)
				{
					vspeed = -triple_jump_height* 1.25;
					audio_stop_sound(voice);
					voice = audio_play_sound(voice_jump_rope, 0, 0);
					audio_sound_gain(voice_jump_rope, global.voices_volume * global.main_volume, 0);
					audio_sound_pitch(voice_jump_rope, default_voice_pitch);
				}
				else
				if (image_speed >= 0.9)
				{
					vspeed = -triple_jump_height* 1.125;
				}
				else
				if (image_speed >= 0.7)
				{
					vspeed = -triple_jump_height;
				}
				else
				{
					vspeed = -normal_jump_height; /*Do the normal upward jump, when you haven't spinned fast enough*/
				}
				#endregion /*Do a charged upward jump depending on how fast you spin END*/
				
			}
			#endregion /*Jump from rope spin END*/
				
		}
		#endregion /*Spinning on horizontal rope END*/
		
		else
		
		#region /*Jump upward normally from rope spin if drop down from rope doesn't use jump*/
		if (drop_from_rope = 0) /*Drop down from rope: Release Jump*/
		and (key_jump)
		or(drop_from_rope = 2) /*Drop down from rope: Only Down*/
		and (key_jump)
		or(drop_from_rope = 4) /*Drop down from rope: Down + Jump*/
		and (key_jump)
		and (!key_down)
		{
			if (!place_meeting(x, y - 16, obj_wall))
			and (!place_meeting(x, y - 32, obj_wall))
			and (!place_meeting(x, y - 48, obj_wall))
			and (!place_meeting(x, y - 64, obj_wall))
			{
				if (asset_get_type("snd_jump") == asset_sound)
				{
					audio_play_sound(snd_jump, 0, 0);
					audio_sound_gain(snd_jump, global.sound_volume * global.main_volume, 0);
				}
				can_climb_horizontal_rope_cooldown = sprite_get_height(mask_index) / 35;
				midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
				y-= 64;
				climb = false;
				horizontal_rope_climb = false;
				spring_animation = 0;
				spring = true;
				vspeed = -normal_jump_height; /*Do the normal upward jump, no chargeup*/
			}
		}
		#endregion /*Jump upward normally from rope spin if drop down from rope doesn't use jump END*/
		
		else
		
		#region /*Drop down from rope*/
		if (drop_from_rope = 0) /*Drop down from rope: Release Jump*/
		and (!key_jump_hold)
		or(drop_from_rope = 1) /*Drop down from rope: Down or Jump*/
		and (key_down)
		or(drop_from_rope = 1) /*Drop down from rope: Down or Jump*/
		and (key_jump)
		or(drop_from_rope = 2) /*Drop down from rope: Only Down*/
		and (key_down)
		or(drop_from_rope = 3) /*Drop down from rope: Only Jump*/
		and (key_jump)
		or(drop_from_rope = 4) /*Drop down from rope: Down + Jump*/
		and (key_down)
		and (key_jump)
		{
			if (!key_up)
			{
				if (place_meeting(x - 1, y, obj_wall))
				{
					x += 1;
				}
				else
				if (place_meeting(x + 1, y, obj_wall))
				{
					x -= 1;
				}
				can_climb_horizontal_rope_cooldown = sprite_get_height(mask_index) / 9; /*Cooldown timer before you can start climbing again. The deviding number should be high enough so you grab a rope below you but not grabbing the same rope you were just on*/
				can_ground_pound = false;
				climb = false;
				horizontal_rope_climb = false;
				stomp_spin = false;
				midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
			}
		}
		#endregion /*Drop down from rope END*/
		
		else
		
		#region /*Climb left on horizontal rope*/
		if (key_left)
		and (!key_right)
		and (!place_meeting(x - 1, y, obj_wall))
		and (!place_meeting(x - 10, y, obj_spikes))
		and (takendamage <= takendamage_freezetime)
		{
			image_xscale = -1;
			if (place_meeting(x - 32, y, obj_horizontal_rope))
			{
				if (sprite_climb_under > noone){sprite_index = sprite_climb_under;}else
				if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
				if (sprite_stand > noone){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
				if (key_sprint)
				or(double_tap_left = 3)
				{
					hspeed -= 0.5;
					speed_max = speed_max_run;
					image_speed = speed / 10 + 0.1;
				}
				else
				{
					hspeed -= 0.5;
					speed_max = speed_max_walk;
					image_speed = speed / 10 + 0.1;
				}
				if (asset_get_type("snd_move_ivy") == asset_sound)
				and (!audio_is_playing(snd_move_ivy))
				{
					audio_play_sound(snd_move_ivy, 0, 0);
					audio_sound_gain(snd_move_ivy, global.sound_volume * global.main_volume, 0);
				}
			}
			else
			{
				hspeed = 0;
			}
		}
		#endregion /*Climb left on horizontal rope END*/
		
		else
		
		#region /*Climb right on horizontal rope*/
		if (key_right)
		and (!key_left)
		and (!place_meeting(x + 1, y, obj_wall))
		and (!place_meeting(x + 10, y, obj_spikes))
		and (takendamage <= takendamage_freezetime)
		{
			image_xscale = +1;
			if (place_meeting(x + 32, y, obj_horizontal_rope))
			{
				if (sprite_climb_under > noone){sprite_index = sprite_climb_under;}else
				if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
				if (sprite_stand > noone){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
				if (key_sprint)
				or(double_tap_right = 3)
				{
					hspeed += 0.5;
					speed_max = speed_max_run;
					image_speed = speed / 10 + 0.1;
				}
				else
				{
					hspeed += 0.5;
					speed_max = speed_max_walk;
					image_speed = speed / 10 + 0.1;
				}
				if (asset_get_type("snd_move_ivy") == asset_sound)
				and (!audio_is_playing(snd_move_ivy))
				{
					audio_play_sound(snd_move_ivy, 0, 0);
					audio_sound_gain(snd_move_ivy, global.sound_volume * global.main_volume, 0);
				}
			}
			else
			{
				hspeed = 0;
			}
		}
		#endregion /*Climb right on horizontal rope END*/
		
		else
		
		#region /*Look up when on horizontal rope*/
		if (key_up)
		{
			if (speed > 0)
			{
				if (sprite_climb_under > noone){sprite_index = sprite_climb_under;}else
				if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
				if (sprite_stand > noone){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
			else
			{
				if (sprite_climb_under_look_up > noone){sprite_index = sprite_climb_under_look_up;}else
				if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
				if (sprite_stand > noone){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
			image_speed = 0.5;
		}
		#endregion /*Look up when on horizontal rope END*/

		else
		{
			if (speed > 0)
			{
				if (sprite_climb_under > noone){sprite_index = sprite_climb_under;}else
				if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
				if (sprite_stand > noone){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
			else
			if (sprite_climb_under_still > noone)
			{
				sprite_index = sprite_climb_under_still;
			}
			else
			{
				if (sprite_stand > noone){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
		}
		if (instance_nearest(x, y, obj_horizontal_rope).active = false)
		{
			can_climb_horizontal_rope_cooldown = sprite_get_height(mask_index) / 10;
			can_ground_pound = false;
			climb = false;
			horizontal_rope_climb = false;
			stomp_spin = false;
		}
		
		#region /*Bump into wall on left side when climbing horizontal rope*/
		if (place_meeting(x - 1, y, obj_wall))
		or (place_meeting(x - 10, y, obj_spikes))
		or(!place_meeting(x - 1, y, obj_horizontal_rope))
		{
			if (hspeed < 0)
			{
				hspeed = 0;
			}
			if (key_left)
			and (!key_right)
			and (takendamage <= takendamage_freezetime)
			{
				image_xscale = -1;
				if (asset_get_type("snd_bump") == asset_sound)
				and (!audio_is_playing(snd_bump))
				{
					audio_play_sound(snd_bump, 0, 0);
					audio_sound_gain(snd_bump, global.sound_volume * global.main_volume, 0);
				}
			}
		}
		#endregion /*Bump into wall on left side when climbing horizontal rope END*/
		
		else
		
		#region /*Bump into wall on right side when climbing horizontal rope*/
		if (place_meeting(x + 1, y, obj_wall))
		or (place_meeting(x + 10, y, obj_spikes))
		or(!place_meeting(x + 1, y, obj_horizontal_rope))
		{
			if (hspeed > 0)
			{
				hspeed = 0;
			}
			if (key_right)
			and (!key_left)
			and (takendamage <= takendamage_freezetime)
			{
				image_xscale = +1;
				if (asset_get_type("snd_bump") == asset_sound)
				and (!audio_is_playing(snd_bump))
				{
					audio_play_sound(snd_bump, 0, 0);
					audio_sound_gain(snd_bump, global.sound_volume * global.main_volume, 0);
				}
			}
		}
		#endregion /*Bump into wall on right side when climbing horizontal rope END*/
		
	}
}
#endregion /*Climb Horizontal Rope END*/

else

#region /*Climb Vine / Ladder*/
if (asset_get_type("obj_vine") == asset_object)
and (place_meeting(x, y, obj_vine))
{
	if (key_up)
	and (vspeed >= 0)
	and (hold_item_in_hands = "")
	or(key_up_pressed)
	and (hold_item_in_hands = "")
	{
		if (climb = false)
		{
			climb = true;
			horizontal_rope_climb = false;
			jump = 0;
			stick_to_wall = false;
			
			#region /*Make a sound effect that you have started cimbing*/
			if (asset_get_type("snd_catch_ivy") == asset_sound)
			{
				audio_play_sound(snd_catch_ivy, 0, 0);
				audio_sound_gain(snd_catch_ivy, global.sound_volume * global.main_volume, 0);
			}
			audio_stop_sound(voice);
			voice = audio_play_sound(voice_rope_catch, 0, 0);
			audio_sound_gain(voice_rope_catch, global.voices_volume * global.main_volume, 0);
			audio_sound_pitch(voice_rope_catch, default_voice_pitch);
			#endregion /*Make a sound effect and voice clip that you have started cimbing END*/
			
		}
	}
	if (climb = true)
	{
		gravity = 0;
		hspeed = 0;
		vspeed = 0;
		last_standing_x = x;
		last_standing_y = y;
		speed_max = 4;
		ledge_grab_jump = false;
		ground_pound = false;
		dive = false;
		can_ground_pound = false;
		can_dive = true;
		stomp_spin = false;
		midair_jumps_left = number_of_jumps;
		spring = false;
		chain_reaction = 0;
		if (key_up)
		and (!key_down)
		and (place_meeting(x, bbox_top - 1, obj_vine))
		and (takendamage <= takendamage_freezetime)
		{
			if (x < instance_nearest(x, y, obj_vine).x)
			{
				x += 4;
			}
			if (x > instance_nearest(x, y, obj_vine).x)
			{
				x -= 4;
			}
			if (!position_meeting(x, bbox_top - 1, obj_wall))
			{
				if (sprite_vine_climb> noone){sprite_index = sprite_vine_climb;}else
				if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
				if (sprite_stand > noone){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
				if (key_sprint)
				{
					y-= 4;
					image_speed = 0.4;
				}
				else
				{
					y-= 2;
					image_speed = 0.2;
				}
				if (asset_get_type("snd_move_ivy") == asset_sound)
				{
					if (!audio_is_playing(snd_move_ivy))
					{
						audio_play_sound(snd_move_ivy, 0, 0);
						audio_sound_gain(snd_move_ivy, global.sound_volume * global.main_volume, 0);
					}
				}
			}
			else
			{
				if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
				if (sprite_stand > noone){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
		}
		else
		if (key_down)
		and (!key_up)
		and (takendamage <= takendamage_freezetime)
		{
			if (x < instance_nearest(x, y, obj_vine).x)
			{
				x += 4;
			}
			if (x > instance_nearest(x, y, obj_vine).x)
			{
				x -= 4;
			}
			if (sprite_vine_climb> noone){sprite_index = sprite_vine_climb;}else
			if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
			if (key_sprint)
			{
				y += 5;
				image_speed = 0.4;
			}
			else
			{
				y += 3;
				image_speed = 0.2;
			}
			if (asset_get_type("snd_move_ivy") == asset_sound)
			{
				if (!audio_is_playing(snd_move_ivy))
				{
					audio_play_sound(snd_move_ivy, 0, 0);
					audio_sound_gain(snd_move_ivy, global.sound_volume * global.main_volume, 0);
				}
			}
			if (on_ground = true)
			{
				climb = false;
			}
		}
		else
		if (key_left)
		and (!key_right)
		and (!key_up)
		and (!key_down)
		and (!position_meeting(bbox_left - 1, y, obj_wall))
		and (takendamage <= takendamage_freezetime)
		{
			image_xscale = -1;
			if (sprite_vine_climb> noone){sprite_index = sprite_vine_climb;}else
			if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
			if (key_sprint)
			{
				x -= 4;
				image_speed = 0.4;
			}
			else
			{
				x -= 2;
				image_speed = 0.2;
			}
			if (asset_get_type("snd_move_ivy") == asset_sound)
			{
				if (!audio_is_playing(snd_move_ivy))
				{
					audio_play_sound(snd_move_ivy, 0, 0);
					audio_sound_gain(snd_move_ivy, global.sound_volume * global.main_volume, 0);
				}
			}
		}
		else
		if (key_left)
		and (!key_right)
		and (!key_up)
		and (!key_down)
		and (position_meeting(bbox_left - 1, y, obj_wall))
		and (takendamage <= takendamage_freezetime)
		{
			if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
			image_speed = 0;
			image_xscale = -1;
			if (asset_get_type("snd_bump") == asset_sound)
			{
				if (!audio_is_playing(snd_bump))
				{
					audio_play_sound(snd_bump, 0, 0);
					audio_sound_gain(snd_bump, global.sound_volume * global.main_volume, 0);
				}
			}
		}
		else
		if (key_right)
		and (!key_left)
		and (!key_up)
		and (!key_down)
		and (!position_meeting(bbox_right + 1, y, obj_wall))
		and (takendamage <= takendamage_freezetime)
		{
			image_xscale = +1;
			if (sprite_vine_climb> noone){sprite_index = sprite_vine_climb;}else
			if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
			if (key_sprint)
			{
				x += 4;
				image_speed = 0.4;
			}
			else
			{
				x += 2;
				image_speed = 0.2;
			}
			if (asset_get_type("snd_move_ivy") == asset_sound)
			{
				if (!audio_is_playing(snd_move_ivy))
				{
					audio_play_sound(snd_move_ivy, 0, 0);
					audio_sound_gain(snd_move_ivy, global.sound_volume * global.main_volume, 0);
				}
			}
		}
		else
		if (key_right)
		and (!key_left)
		and (!key_up)
		and (!key_down)
		and (position_meeting(bbox_right + 1, y, obj_wall))
		and (takendamage <= takendamage_freezetime)
		{
			if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
			image_speed = 0;
			image_xscale = +1;
			if (asset_get_type("snd_bump") == asset_sound)
			{
				if (!audio_is_playing(snd_bump))
				{
					audio_play_sound(snd_bump, 0, 0);
					audio_sound_gain(snd_bump, global.sound_volume * global.main_volume, 0);
				}
			}
		}
		else
		{
			if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
			image_speed = 0.2;
		}
		if (key_jump)
		{
			if (!key_down)
			{
				midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
				vspeed = -11.5;
			}
			climb = false;
			stomp_spin = false;
			if (asset_get_type("snd_jump") == asset_sound)
			{
				audio_play_sound(snd_jump, 0, 0);
				audio_sound_gain(snd_jump, global.sound_volume * global.main_volume, 0);
			}
		}
	}
}
#endregion /*Climb Vine / Ladder END*/

#region /*In Water Animations*/
if (in_water = true)
and (climb = false)
{
	can_ground_pound = false;
	chain_reaction = 0;

#region /*Crouch Underwater*/
if (key_crouch_hold) /*Holding the crouch button*/
and (allow_crouch = true) /*Can crouch*/
and (crouch = false) /*Not currently crouching*/
and (can_move = true)
and (ground_pound = false)
and (dive = false)
and (on_ground = true)
{
	crouch = true;
	stick_to_wall = false;
	y += 16;
	if (sprite_crouch> noone){sprite_index = sprite_crouch;}else
	if (sprite_stand > noone){sprite_index = sprite_stand;}else
	if (sprite_walk > noone){sprite_index = sprite_walk;}
	if (sprite_mask_crouch >= 0)
	{
		mask_index = sprite_mask_crouch;
	}
	else
	{
		mask_index = spr_player_stand;
	}
	if (asset_get_type("snd_squat") == asset_sound)
	{
		audio_play_sound(snd_squat, 0, 0);
		audio_sound_gain(snd_squat, global.sound_volume * global.main_volume, 0);
	}
}
#endregion /*Crouch Underwater END*/

else

#region /*Don't Crouch Underwater*/
if (!key_crouch_hold)
and (!place_meeting(x, y- 8, obj_wall))
and (crouch = true)
{
	if (vspeed >= 0)
	{
		crouch = false;
		y -= 16;
		draw_xscale = 0.75;
		draw_yscale = 1.25;
		if (sprite_mask >= 0)
		{
			mask_index = sprite_mask;
		}
		else
		{
			mask_index = spr_player_stand;
		}
		if (asset_get_type("snd_rise") == asset_sound)
		{
			audio_play_sound(snd_rise, 0, 0);
			audio_sound_gain(snd_rise, global.sound_volume * global.main_volume, 0);
		}
	}
}
#endregion /*Don't Crouch Underwater END*/

if (crouch = true)
{
	stick_to_wall = false;
	if (on_ground = true)
	{
		if (abs(hspeed) > 3)
		{
			if (asset_get_type("snd_skidding") == asset_sound)
			{
				if (!audio_is_playing(snd_skidding))
				{
					audio_play_sound(snd_skidding, 0, 0);
					audio_sound_gain(snd_skidding, global.sound_volume * global.main_volume, 0);
				}
			}
			effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
		}
		else
		if (asset_get_type("snd_skidding") == asset_sound)
		{
			if (audio_is_playing(snd_skidding))
			{
				audio_stop_sound(snd_skidding);
			}
		}
	}
	if (abs(hspeed) >= 2.5)
	and (on_ground = true)
	{
		if (asset_get_type("spr_player_slide") == asset_sprite)
		{
			if (sprite_mask_crouch >= 0)
			{
				mask_index = sprite_mask_crouch;
			}
			else
			{
				mask_index = spr_player_stand;
			}
			sprite_index = spr_player_slide;
		}
		else
		{
			if (sprite_mask_crouch >= 0)
			{
				mask_index = sprite_mask_crouch;
			}
			else
			{
				mask_index = spr_player_stand;
			}
			if (sprite_crouch_crawl > noone){sprite_index = sprite_crouch_crawl;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
			if (image_index > image_number - 1)
			{
				image_speed = 0;
			}
			else
			{
				image_speed = 0.5;
			}
		}
	}
	else
	if (on_ground = true)
	{
		
		#region /*Crouch Stand*/
		if (speed = 0)
		and (!key_left)
		and (!key_right)
		{
			if (sprite_crouch> noone){sprite_index = sprite_crouch;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
			if (image_index > image_number - 1)
			{
				image_speed = 0;
			}
			else
			{
				image_speed = 0.5;
			}
		}
		#endregion /*Crouch Stand END*/
		
		else
		
		#region /*Crouch Crawl*/
		if (key_left)
		or(key_right)
		{
			if (sprite_crouch_crawl > noone){sprite_index = sprite_crouch_crawl;}else
			if (sprite_crouch> noone){sprite_index = sprite_crouch;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
			image_speed = 0.5;
		}
		#endregion /*Crouch Crawl END*/
		
	}
	else
	if (!place_meeting(x, y + 1, obj_wall))
	or(!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	or(!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	or(!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	{
		if (key_jump)
		{
			image_index = 0;
		}
		if (image_index > image_number - 1)
		{
			image_speed = 0;
		}
		else
		{
			image_speed = 0.3;
		}
		if (vspeed > 0)
		{
			if (sprite_swim_fall > noone){sprite_index = sprite_swim_fall;}else
			if (sprite_swim > noone){sprite_index = sprite_swim;}else
			if (sprite_swim_stand > noone){sprite_index = sprite_swim_stand;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
		}
		else
		{
			if (sprite_swim > noone){sprite_index = sprite_swim;}else
			if (sprite_swim_stand > noone){sprite_index = sprite_swim_stand;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
		}
	}
}
else
if (on_ground = true)
{
	
	#region /*Skidding*/
	if (hspeed < 0)
	and (key_right)
	or(hspeed > 0)
	and (key_left)
	{
		if (asset_get_type("snd_skidding") == asset_sound)
		{
			if (!audio_is_playing(snd_skidding))
			{
				audio_play_sound(snd_skidding, 0, 0);
				audio_sound_gain(snd_skidding, global.sound_volume * global.main_volume, 0);
			}
		}
		if (sprite_swim > noone){sprite_index = sprite_swim;}else
		if (sprite_swim_stand > noone){sprite_index = sprite_swim_stand;}else
		if (sprite_stand > noone){sprite_index = sprite_stand;}else
		if (sprite_walk > noone){sprite_index = sprite_walk;}
		effect_create_above(ef_smoke, x, bbox_bottom, 1, c_white);
		if (image_index > image_number - 1)
		{
			image_speed = 0;
		}
		else
		{
			image_speed = 0.5;
		}
	}
	#endregion /*Skidding END*/
	
	else
	
	#region /*Run*/
	if (hspeed <+ 0.1)
	or(hspeed >- 0.1)
	{
		if (hold_item_in_hands != "")
		{
			if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front;}else
			if (sprite_standing_with_item_in_front > noone){sprite_index = sprite_standing_with_item_in_front;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}else
			{sprite_index = sprite_stand;}
		}
		else
		if (speeddash = true)
		{
			if (sprite_swim > noone){sprite_index = sprite_swim;}else
			if (sprite_run > noone){sprite_index = sprite_run;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}
		}
		else
		if (abs(speed) >= 6)
		{
			if (sprite_swim > noone){sprite_index = sprite_swim;}else
			if (sprite_run > noone){sprite_index = sprite_run;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}
		}
		/*Against Wall*/
		else
		{
			if (place_meeting(x - 1, y, obj_wall))
			or(place_meeting(x + 1, y, obj_wall))
			{
				if (sprite_swim > noone){sprite_index = sprite_swim;}else
				if (sprite_against_wall > noone){sprite_index = sprite_against_wall;}else
				if (sprite_stand > noone){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
			/*Walk*/
			else
			{
				if (sprite_swim > noone){sprite_index = sprite_swim;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}else
				if (sprite_run > noone){sprite_index = sprite_run;}else
				if (sprite_stand > noone){sprite_index = sprite_stand;}
			}
		}
		image_speed = speed / 13.5+0.1;
	}
	#endregion /*Run END*/
	
	else
	
	#region /*Stand Underwater*/
	if (hspeed = 0)
	and (!key_left)
	and (!key_right)
	{
		if (sprite_swim_stand > noone){sprite_index = sprite_swim_stand;}else
		if (sprite_swim > noone){sprite_index = sprite_swim;}else
		if (sprite_stand > noone){sprite_index = sprite_stand;}else
		if (sprite_walk > noone){sprite_index = sprite_walk; image_speed = 0;}
		image_speed = 0.1;
	}
	#endregion /*Stand Underwater END*/
	
	#region /*Mask*/
	if (sprite_mask >= 0)
	{
		mask_index = sprite_mask;
	}
	else
	{
		mask_index = spr_player_stand;
	}
	#endregion /*Mask END*/
	
}
else

#region /*Swimming Sprites*/
if (!place_meeting(x, y + 1, obj_wall))
and(!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
and(!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
and(!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
{
	
	#region /*Skidding*/
	if (hspeed <-0.2)
	and (image_xscale > 0)
	or(hspeed >+0.2)
	and (image_xscale < 0)
	{
		if (asset_get_type("snd_skidding") == asset_sound)
		{
			if (!audio_is_playing(snd_skidding))
			{
				audio_play_sound(snd_skidding, 0, 0);
				audio_sound_gain(snd_skidding, global.sound_volume * global.main_volume, 0);
			}
		}
		if (asset_get_type("spr_player_swim_skidding") == asset_sprite)
		{
			sprite_index = spr_player_swim_skidding;
		}
		else
		{
			if (sprite_swim_stand > noone){sprite_index = sprite_swim_stand;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
		}
		if (image_index > image_number - 1)
		{
			image_speed = 0;
		}
		else
		{
			image_speed = 0.5;
		}
	}
	#endregion /*Skidding END*/
	
	/*Single Swim*/
	else
	if (key_jump)
	{
		image_index = 0;
	}
	if (image_index > image_number - 1)
	{
		image_speed = 0;
	}
	else
	{
		image_speed = 0.3;
	}
	if (vspeed > 0)
	{
		if (sprite_swim_fall > noone){sprite_index = sprite_swim_fall;}else
		if (sprite_swim > noone){sprite_index = sprite_swim;}else
		if (sprite_swim_stand > noone){sprite_index = sprite_swim_stand;}else
		if (sprite_stand > noone){sprite_index = sprite_stand;}else
		if (sprite_walk > noone){sprite_index = sprite_walk;}
	}
	else
	{
		if (sprite_swim > noone){sprite_index = sprite_swim;}else
		if (sprite_swim_stand > noone){sprite_index = sprite_swim_stand;}else
		if (sprite_stand > noone){sprite_index = sprite_stand;}else
		if (sprite_walk > noone){sprite_index = sprite_walk;}
	}
	if (sprite_mask >= 0)
	{
		mask_index = sprite_mask;
	}
	else
	{
		mask_index = spr_player_stand;
	}
}
#endregion /*Swimming Sprites END*/

}
#endregion /*In Water Animations END*/

else
{

#region /*Crouch*/
if (key_crouch_hold) /*Holding the crouch button*/
and (allow_crouch = true) /*Can crouch*/
and (crouch = false) /*Not currently crouching*/
and (can_move = true)
and (ground_pound = false)
and (dive = false)
and (on_ground = true)
{
	crouch = true;
	draw_xscale = 1.5;
	draw_yscale = 0.5;
	if (sprite_crouch> noone){sprite_index = sprite_crouch;}else
	if (sprite_stand > noone){sprite_index = sprite_stand;}else
	if (sprite_walk > noone){sprite_index = sprite_walk;}
	
	if (sprite_mask_crouch >= 0)
	{
		mask_index = sprite_mask_crouch;
	}
	else
	{
		mask_index = spr_player_stand;
	}
	if (!place_meeting(x, y + 16, obj_wall))
	or(!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	or(!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	or(!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	{
		y += 32;
	}
	if (asset_get_type("snd_crouch") == asset_sound)
	{
		audio_play_sound(snd_crouch, 0, 0);
		audio_sound_gain(snd_crouch, global.sound_volume * global.main_volume, 0);
	}
}
#endregion /*Crouch END*/

else

#region /*Don't crouch*/
if (!key_crouch_hold)
and (!place_meeting(x, y - 8, obj_wall))
and (crouch = true)
and (vspeed >= 0)
{
	crouch = false;
	y -= 16;
	draw_xscale = 0.75;
	draw_yscale = 1.25;
	if (sprite_mask >= 0)
	{
		mask_index = sprite_mask;
	}
	else
	{
		mask_index = spr_player_stand;
	}
	if (asset_get_type("snd_rise") == asset_sound)
	{
		audio_play_sound(snd_rise, 0, 0);
		audio_sound_gain(snd_rise, global.sound_volume * global.main_volume, 0);
	}
}
#endregion /*Don't crouch END*/

#region /*Roll*/
if (allow_roll = true)
and (roll = true)
{
	if (asset_get_type("spr_player_roll") == asset_sprite)
	{
		sprite_index = spr_player_roll;
	}
	if (sprite_mask_crouch >= 0)
	{
		mask_index = sprite_mask_crouch;
	}
	else
	{
		mask_index = spr_player_stand;
	}
	if (asset_get_type("obj_wall") == asset_object)
	and (!place_meeting(x, y + 1, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	{
		roll = false;
	}
	if (image_index > image_number - 1)
	{
		image_speed = 0;
		roll = false;
	}
	else
	{
		image_speed = 0.5;
	}
}
#endregion /*Roll END*/

else
if (crouch = true)
{
	
	#region /*Destroy blocks above you when you jump while crouching*/
	if (key_jump)
	{
		with (instance_create_depth(bbox_left + 16, bbox_top, 0, obj_blockbreak))
		{
			image_xscale = 0.75;
			image_yscale = 0.75;
		}
		with (instance_create_depth(x, bbox_top, 0, obj_blockbreak))
		{
			image_xscale = 0.75;
			image_yscale = 0.75;
		}
		with (instance_create_depth(bbox_right - 16, bbox_top, 0, obj_blockbreak))
		{
			image_xscale = 0.75;
			image_yscale = 0.75;
		}
	}
	#endregion /*Destroy blocks above you when you jump while crouching END*/
	
	if (on_ground = true)
	{
		if (abs(hspeed) > 3)
		{
			if (asset_get_type("snd_skidding") == asset_sound)
			{
				if (!audio_is_playing(snd_skidding))
				{
					audio_play_sound(snd_skidding, 0, 0);
					audio_sound_gain(snd_skidding, global.sound_volume * global.main_volume, 0);
				}
			}
			effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
			scr_gamepad_vibration(player, 0.1, 10);
		}
		else
		if (asset_get_type("snd_skidding") == asset_sound)
		{
			if (audio_is_playing(snd_skidding))
			{
				audio_stop_sound(snd_skidding);
			}
		}
	}
	if (abs(hspeed) >= 2.5)
	and (on_ground = true)
	{
		if (sprite_mask_crouch >= 0)
		{
			mask_index = sprite_mask_crouch;
		}
		else
		{
			mask_index = spr_player_stand;
		}
		if (sprite_crouch_crawl > noone){sprite_index = sprite_crouch_crawl;}else
		if (sprite_crouch> noone){sprite_index = sprite_crouch;}else
		if (sprite_stand > noone){sprite_index = sprite_stand;}else
		if (sprite_walk > noone){sprite_index = sprite_walk;}
		if (image_index > image_number - 1)
		{
			image_speed = 0;
		}
		else
		{
			image_speed = 0.5;
		}
	}
	else
	if (on_ground = true)
	{
		
		#region /*Crouch Still*/
		if (speed = 0)
		and (!key_left)
		and (!key_right)
		{
			sprite_index = sprite_crouch;
			if (sprite_crouch> noone){sprite_index = sprite_crouch;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
			if (image_index > image_number - 1)
			{
				image_speed = 0;
			}
			else
			{
				image_speed = 0.5;
			}
		}
		#endregion /*Crouch Still END*/
		
		else
		
		#region /*Crouch Crawl*/
		if (key_left)
		or(key_right)
		{
			if (sprite_crouch_crawl > noone){sprite_index = sprite_crouch_crawl;}else
			if (sprite_crouch> noone){sprite_index = sprite_crouch;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
			image_speed = 0.5;
		}
		#endregion /*Crouch Crawl END*/
		
	}

	else
	if (asset_get_type("obj_wall") == asset_object)
	and (!place_meeting(x, y + 1, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	{
		
		#region /*Crouch Jump*/
		if (vspeed < 0)
		{
			if (sprite_crouch_jump > noone){sprite_index = sprite_crouch_jump;}else
			if (sprite_crouch_fall > noone){sprite_index = sprite_crouch_fall;}else
			if (sprite_jump > noone) and (vspeed <= 0){sprite_index = sprite_jump;}else
			if (sprite_fall_slower > noone) and (vspeed > 0) and (key_a_hold){sprite_index = sprite_fall_slower;}else
			if (sprite_fall > noone) and (vspeed > 0){sprite_index = sprite_fall; image_speed = 0.5;}else
			if (sprite_jump > noone){sprite_index = sprite_jump;}else
			if (sprite_crouch> noone){sprite_index = sprite_crouch;}else
			if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
		}
		#endregion /*Crouch Jump END*/
		
		else
		if (vspeed > 0)
		and (stick_to_wall = false)
		{
			if (sprite_crouch_fall > noone){sprite_index = sprite_crouch_fall;}else
			if (sprite_crouch_jump > noone){sprite_index = sprite_crouch_jump;}else
			if (sprite_jump > noone) and (vspeed <= 0){sprite_index = sprite_jump;}else
			if (sprite_fall_slower > noone) and (vspeed > 0) and (key_a_hold){sprite_index = sprite_fall_slower;}else
			if (sprite_fall > noone) and (vspeed > 0){sprite_index = sprite_fall; image_speed = 0.5;}else
			if (sprite_jump > noone){sprite_index = sprite_jump;}else
			if (sprite_crouch> noone){sprite_index = sprite_crouch;}else
			if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
		}
	}
	jump = 0;
	if (sprite_mask_crouch >= 0)
	{
		mask_index = sprite_mask_crouch;
	}
	else
	{
		mask_index = spr_player_stand;
	}
}
else
if (ground_pound = true)
{
	if (sprite_ground_pound > noone){sprite_index = sprite_ground_pound;}else
	if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
	if (sprite_jump > noone){sprite_index = sprite_jump;}else
	if (sprite_stand > noone){sprite_index = sprite_stand;}else
	if (sprite_walk > noone){sprite_index = sprite_walk;}
}
else
if (ground_pound = 2)
{
	if (sprite_ground_pound_get_up > noone){sprite_index = sprite_ground_pound_get_up;}else
	{
		if (image_index > 0)
		{
			image_speed = 0;
			ground_pound = false;
		}
	}
	if (image_index > image_number - 1)
	{
		image_speed = 0;
		ground_pound = false;
	}
	else
	{
		image_speed = 0.5;
	}
}
else
if (ground_pound = 3)
{
	if (sprite_stomp_spin > noone){sprite_index = sprite_stomp_spin;}else
	if (sprite_jump > noone){sprite_index = sprite_jump;}else
	if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
	if (sprite_stand > noone){sprite_index = sprite_stand;}else
	if (sprite_walk > noone){sprite_index = sprite_walk;}
}
else
if (on_ground = true)
and (vspeed = 0)
{
	
	#region /*Skidding*/
	if (hspeed < 0)
	and (key_right)
	or(hspeed > 0)
	and (key_left)
	{
		if (asset_get_type("obj_ice_block") == asset_object)
		and (place_meeting(x, y + 1, obj_ice_block))
		{
			if (asset_get_type("snd_skidding_ice") == asset_sound)
			{
				if (!audio_is_playing(snd_skidding_ice))
				{
					audio_play_sound(snd_skidding_ice, 0, 0);
					audio_sound_gain(snd_skidding_ice, global.sound_volume * global.main_volume, 0);
				}
			}
		}
		else
		if (asset_get_type("snd_skidding") == asset_sound)
		{
			if (!audio_is_playing(snd_skidding))
			{
				audio_play_sound(snd_skidding, 0, 0);
				audio_sound_gain(snd_skidding, global.sound_volume * global.main_volume, 0);
			}
		}
		if (asset_get_type("obj_ice_block") == asset_object)
		and (place_meeting(x, y + 1, obj_ice_block))
		{
			if (hold_item_in_hands != "")
			{
				if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front; image_speed = speed / 10 + 0.1;}else
				if (sprite_standing_with_item_in_front > noone){sprite_index = sprite_standing_with_item_in_front; image_speed = speed / 10 + 0.1;}else
				if (sprite_walk > noone){sprite_index = sprite_walk; image_speed = speed / 10 + 0.1;}else
				{sprite_index = sprite_stand; image_speed = 0.5;}
			}
			else
			if (sprite_skidding_ice > noone){sprite_index = sprite_skidding_ice; image_speed = 0.5;}else
			if (sprite_skidding> noone){sprite_index = sprite_skidding; image_speed = 0.5;}else
			if (sprite_run > noone){sprite_index = sprite_run;}else
			if (sprite_walk > noone) and (hspeed <> 0){sprite_index = sprite_walk;}else
			{sprite_index = sprite_stand;}
		}
		else
		{
			if (hold_item_in_hands != "")
			{
				if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front; image_speed = speed / 10 + 0.1;}else
				if (sprite_standing_with_item_in_front > noone){sprite_index = sprite_standing_with_item_in_front; image_speed = speed / 10 + 0.1;}else
				if (sprite_walk > noone){sprite_index = sprite_walk; image_speed = speed / 10 + 0.1;}else
				{sprite_index = sprite_stand; image_speed = 0.5;}
			}
			else
			if (sprite_skidding> noone){sprite_index = sprite_skidding; image_speed = 0.5;}else
			if (abs(hspeed) > 20) and (sprite_run4> noone){sprite_index = sprite_run4;}else
			if (abs(hspeed) > 15) and (sprite_run3> noone){sprite_index = sprite_run3;}else
			if (abs(hspeed) > 10) and (sprite_run2> noone){sprite_index = sprite_run2;}else
			if (abs(hspeed) > 5) and (sprite_run > noone){sprite_index = sprite_run;}else
			if (sprite_walk >  noone) and (hspeed <> 0){sprite_index = sprite_walk;}else
			if (sprite_run > noone) and (hspeed <> 0){sprite_index = sprite_run;}else
			{sprite_index = sprite_stand;}
		}
		effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
	}
	#endregion /*Skidding END*/
	
	else
	
	#region /*Skidding Stop*/
	if (hspeed < 0)
	and (!key_left)
	or(hspeed > 0)
	and (!key_right)
	{
		if (hold_item_in_hands != "")
		{
			if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front; image_speed = speed / 10 + 0.1;}else
			if (sprite_standing_with_item_in_front > noone){sprite_index = sprite_standing_with_item_in_front; image_speed = speed / 10 + 0.1;}else
			if (sprite_walk > noone){sprite_index = sprite_walk; image_speed = speed / 10 + 0.1;}else
			{sprite_index = sprite_stand; image_speed = 0.5;}
		}
		else
		if (sprite_skidding_stop > noone){sprite_index = sprite_skidding_stop; image_speed = 0.5;}else
		if (abs(hspeed) > 20) and (sprite_run4> noone){sprite_index = sprite_run4; image_speed = speed / 10 + 0.1;}else
		if (abs(hspeed) > 15) and (sprite_run3> noone){sprite_index = sprite_run3; image_speed = speed / 10 + 0.1;}else
		if (abs(hspeed) > 10) and (sprite_run2> noone){sprite_index = sprite_run2; image_speed = speed / 10 + 0.1;}else
		if (abs(hspeed) > 5) and (sprite_run > noone){sprite_index = sprite_run; image_speed = speed / 10 + 0.1;}else
		if (sprite_walk > noone) and (hspeed <> 0){sprite_index = sprite_walk; image_speed = speed / 10 + 0.1;}else
		if (sprite_run > noone) and (hspeed <> 0){sprite_index = sprite_run; image_speed = speed / 10 + 0.1;}else
		{sprite_index = sprite_stand; image_speed = 0.5;}
	}
	#endregion /*Skidding Stop END*/
	
	else
	
	#region /*Look Up*/
	if (hspeed = 0)
	and (key_up)
	and (!key_down)
	and (can_move = true)
	{
		if (look_up_start_animation = true)
		{
			if (sprite_look_up_start> noone){sprite_index = sprite_look_up_start;}else
			if (sprite_look_up > noone){sprite_index = sprite_look_up;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
		}
		else
		{
			if (sprite_look_up > noone){sprite_index = sprite_look_up;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
		}
		if (image_index > image_number - 1)
		and (look_up_start_animation = true)
		{
			image_index = 1;
			look_up_start_animation = false;
		}
		image_speed = 0.3;
		if (sprite_mask >= 0)
		{
			mask_index = sprite_mask;
		}
		else
		{
			mask_index = spr_player_stand;
		}
	}
	#endregion /*Look Up END*/
	
	else
	
	#region /*Run*/
	if (abs(hspeed) > 0)
	{
		if (hold_item_in_hands != "")
		{
			if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front;}else
			if (sprite_standing_with_item_in_front > noone){sprite_index = sprite_standing_with_item_in_front;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}else
			{sprite_index = sprite_stand;}
		}
		else
		if (abs(hspeed) >= 20)
		{
			if (sprite_run4> noone){sprite_index = sprite_run4;}else
			if (sprite_run3> noone){sprite_index = sprite_run3;}else
			if (sprite_run2> noone){sprite_index = sprite_run2;}else
			if (sprite_run > noone){sprite_index = sprite_run;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}else
			{sprite_index = sprite_stand;}
		}
		else
		if (abs(hspeed) >= 15)
		{
			if (sprite_run3> noone){sprite_index = sprite_run3;}else
			if (sprite_run2> noone){sprite_index = sprite_run2;}else
			if (sprite_run > noone){sprite_index = sprite_run;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}else
			{sprite_index = sprite_stand;}
		}
		else
		if (abs(hspeed) >= 10)
		{
			if (sprite_run2> noone){sprite_index = sprite_run2;}else
			if (sprite_run > noone){sprite_index = sprite_run;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}else
			{sprite_index = sprite_stand;}
		}
		else
		if (abs(hspeed) >= 5)
		{
			if (sprite_run > noone){sprite_index = sprite_run;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}else
			{sprite_index = sprite_stand;}
		}
		else
		{
			if (sprite_walk > noone){sprite_index = sprite_walk;} /*Walk*/ else
			if (sprite_run > noone){sprite_index = sprite_run;} /*If no walk sprite, use run sprite*/ else
			{sprite_index = sprite_stand;}
		}
		if (asset_get_type("obj_ice_block") == asset_object)
		and (place_meeting(x, y + 1, obj_ice_block))
		{
			image_speed = 0.5;
		}
		else
		{
			image_speed = speed / 10 + 0.1;
		}
	}
	#endregion /*Run END*/
	
	else
	
	#region /*Against Wall*/
	if (place_meeting(x - 1, y, obj_wall))
	and (on_ground = true)
	and (key_left)
	or(place_meeting(x + 1, y, obj_wall))
	and (on_ground = true)
	and (key_right)
	{
		if (crouch = false)
		{
			if (sprite_against_wall > noone){sprite_index = sprite_against_wall; image_speed = 0.5;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
		}
		if (asset_get_type("snd_bump") == asset_sound)
		{
			if (!audio_is_playing(snd_bump))
			{
				audio_play_sound(snd_bump, 0, 0);
				audio_sound_gain(snd_bump, global.sound_volume * global.main_volume, 0);
			}
		}
	}
	#endregion /*Against Wall END*/
	
	else
	
	#region /*Stand*/
	if (hspeed = 0)
	and (!key_left)
	and (!key_right)
	{
		look_up_start_animation = true;
		if (asset_get_type("obj_bump_in_ground") == asset_object)
		and (place_meeting(x, y + 1, obj_bump_in_ground))
		and (sprite_standing_on_something > noone)
		{
			sprite_index = sprite_standing_on_something;
		}
		else
		if (have_heart_balloon = false)
		and (hp <= 1)
		and (max_hp >= 2)
		and (invincible <= false)
		and (sprite_panting > noone)
		{
			sprite_index = sprite_panting;
			image_speed = 0.3;
		}
		else
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		and (global.rain = true)
		and (sprite_stand_cold > noone)
		{
			sprite_index = sprite_stand_cold;
			image_speed = 1;
		}
		else
		{
			if (image_index >= image_number - 1)
			{
				image_index = 0;
				idle_animtaion = choose(0, 0, 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
			}
			if (idle_animtaion = 1)
			and (sprite_stand_blink > noone)
			{
				sprite_index = sprite_stand_blink;
			}
			else
			if (idle_animtaion = 2)
			and (sprite_idle_animation1 > noone)
			{
				sprite_index = sprite_idle_animation1;
			}
			else
			if (idle_animtaion = 3)
			and (sprite_idle_animation2 > noone)
			{
				sprite_index = sprite_idle_animation2;
			}
			else
			if (idle_animtaion = 4)
			and (sprite_idle_animation3 > noone)
			{
				sprite_index = sprite_idle_animation3;
			}
			else
			if (idle_animtaion = 5)
			and (sprite_idle_animation4 > noone)
			{
				sprite_index = sprite_idle_animation4;
			}
			else
			if (idle_animtaion = 6)
			and (sprite_idle_animation5 > noone)
			{
				sprite_index = sprite_idle_animation5;
			}
			else
			if (idle_animtaion = 7)
			and (sprite_idle_animation6 > noone)
			{
				sprite_index = sprite_idle_animation6;
			}
			else
			if (idle_animtaion = 8)
			and (sprite_idle_animation7 > noone)
			{
				sprite_index = sprite_idle_animation7;
			}
			else
			if (idle_animtaion = 9)
			and (sprite_idle_animation8 > noone)
			{
				sprite_index = sprite_idle_animation8;
			}
			else
			if (idle_animtaion = 10)
			and (sprite_idle_animation9 > noone)
			{
				sprite_index = sprite_idle_animation9;
			}
			else
			if (sprite_stand > noone)
			{
				sprite_index = sprite_stand;
			}
			
			#region /*If there isn't any stand or idle animation existing, then just use walk sprite*/
			else
			if (sprite_walk > noone)
			{
				sprite_index = sprite_walk;
				image_speed = 0;
			}
			#endregion /*If there isn't any stand or idle animation existing, then just use walk sprite END*/
			
			image_speed = 0.3;
		}
	}
	else
	{
		idle_animtaion = 0;
	}
	#endregion /*Stand END*/
	
	#region /*Mask*/
	if (sprite_mask >= 0)
	{
		mask_index = sprite_mask;
	}
	else
	{
		mask_index = spr_player_stand;
	}
	#endregion /*Maske END*/
	
}
else

#region /*Jumping Sprites*/
if (asset_get_type("obj_wall") == asset_object)
and (!place_meeting(x, y + 1, obj_wall))
and (asset_get_type("obj_semisolid_platform") == asset_object)
and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
{
	if (burnt> 0)
	{
		if (sprite_burnt > noone){sprite_index = sprite_burnt;}else
		if (sprite_die > noone){sprite_index = sprite_die;}else
		if (sprite_jump > noone) and (vspeed <= 0){sprite_index = sprite_jump;}else
		if (sprite_fall_slower > noone) and (vspeed > 0) and (key_a_hold){sprite_index = sprite_fall_slower;}else
		if (sprite_fall > noone) and (vspeed > 0){sprite_index = sprite_fall; image_speed = 0.5;}else
		if (sprite_jump > noone){sprite_index = sprite_jump;}else
		if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
		if (sprite_stand > noone){sprite_index = sprite_stand;}else
		if (sprite_walk > noone){sprite_index = sprite_walk;}
	}
	else
	if (dive = true)
	{
		if (sprite_dive > noone){sprite_index = sprite_dive;if (image_index > image_number - 1){image_speed = 0;}else{image_speed = 0.5;}}else
		if (sprite_jump > noone) and (vspeed <= 0){sprite_index = sprite_jump;}else
		if (sprite_fall_slower > noone) and (vspeed > 0) and (key_a_hold){sprite_index = sprite_fall_slower;}else
		if (sprite_fall > noone) and (vspeed > 0){sprite_index = sprite_fall; image_speed = 0.5;}else
		if (sprite_jump > noone){sprite_index = sprite_jump;}else
		if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
		if (sprite_stand > noone){sprite_index = sprite_stand;}else
		if (sprite_walk > noone){sprite_index = sprite_walk;}
	}
	else
	
	#region /*Wall slide down*/
	if (stick_to_wall = true)
	and (vspeed >= 0)
	{
		if (crouch = false)
		and (ground_pound = false)
		and (ledge_grab = false)
		{
			if (vspeed > 0)
			{
				if (sprite_wall_slide_down > noone){sprite_index = sprite_wall_slide_down;}else
				if (sprite_wall_slide > noone){sprite_index = sprite_wall_slide;}else
				if (sprite_stand > noone){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
			else
			{
				if (sprite_wall_slide > noone){sprite_index = sprite_wall_slide;}else
				if (sprite_stand > noone){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
			image_speed = 0.5;
		}
	}
	#endregion /*Wall slide down END*/
	
	else
	if (vspeed < 0)
	{
		if (stomp_spin = true)
		{
			if (sprite_stomp_spin > noone){sprite_index = sprite_stomp_spin;if (image_index > image_number - 1){image_speed = 0;}else{image_speed = 0.5;}}else
			if (sprite_jump > noone){sprite_index = sprite_jump;}else
			if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
		}
		else
		if (spring>= 2)
		{
			if (asset_get_type("spr_player_spring_double") == asset_sprite)
			{
				sprite_index = spr_player_spring_double;
			}
			else
			{
				sprite_index = sprite_stomp_spin;
			}
			if (image_index > image_number - 1)
			{
				image_speed = 0;
			}
			else
			{
				image_speed = 0.5;
			}
		}
		else
		/*Make it look natural when climbing wall*//*IMPORTANT*/
		/*Run up wall / wall_slide up*/
		if (stick_to_wall = true)
		{
			if (crouch = false)
			and (ground_pound = false)
			and (ledge_grab = false)
			{
				if(sprite_wall_slide_up > noone){sprite_index = sprite_wall_slide_up;}else
				if(sprite_wall_slide > noone){sprite_index = sprite_wall_slide;}else
				if (sprite_stand > noone){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
				image_speed = 0.5;
			}
		}
		else
		if (invincible >= true)
		and (asset_get_type("spr_player_invincible_jump") == asset_sprite)
		{
			sprite_index = spr_player_invincible_jump;
			image_speed = 1;
		}
		/*Walljump*/
		else
		{
			if (wall_jump >= 0)
			and (asset_get_type("spr_player_wall_jump") == asset_sprite)
			{
				sprite_index = spr_player_wall_jump;
				if (image_index > image_number - 1)
				{
					image_speed = 0;
				}
				else
				{
					image_speed = 0.5;
				}
			}
			else
		
			#region /*Single Jump*/
			if (jump <= 1)
			{
				if (speeddash = true)
				{
					if (asset_get_type("spr_player_speeddashjump") == asset_sprite)
					{
						sprite_index = spr_player_speeddashjump;
					}
					else
					if (asset_get_type("spr_player_jump2") == asset_sprite)
					and (asset_get_type("spr_player_jump3") == asset_sprite)
					{
						if (sprite_index!= sprite_jump)
						and (sprite_index!= spr_player_jump2)
						and (sprite_index!= spr_player_jump3)
						{
							sprite_index = choose(sprite_jump,spr_player_jump2,spr_player_jump3);
						}
					}
					else
					if (spring = false)
					{
						if (sprite_jump > noone){sprite_index = sprite_jump;}else
						if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
						if (sprite_stand > noone){sprite_index = sprite_stand;}else
						if (sprite_walk > noone){sprite_index = sprite_walk;}
					}
				}
				else
				if (asset_get_type("spr_player_jump2") == asset_sprite)
				and (asset_get_type("spr_player_jump3") == asset_sprite)
				{
					if (sprite_index!= sprite_jump)
					and (sprite_index!= spr_player_jump2)
					and (sprite_index!= spr_player_jump3)
					{
						sprite_index = choose(sprite_jump, spr_player_jump2, spr_player_jump3);
					}
				}
				else
				if (spring = false)
				{
					if (sprite_jump > noone){sprite_index = sprite_jump;}else
					if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
					if (sprite_stand > noone){sprite_index = sprite_stand;}else
					if (sprite_walk > noone){sprite_index = sprite_walk;}
				}
			}
			#endregion /*Single Jump END*/
		
			else
		
			#region /*Double Jump*/
			if (jump = 2)
			{
				if (sprite_double_jump > noone){sprite_index = sprite_double_jump;}else
				if (sprite_jump > noone){sprite_index = sprite_jump;}else
				if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
				if (sprite_stand > noone){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
				image_speed = 0.5;
			}
			#endregion /*Double Jump END*/

			else

			#region /*Triple Jump*/
			if (jump >= 3)
			{
				if (sprite_triple_jump > noone){sprite_index = sprite_triple_jump;}else
				if (sprite_jump > noone){sprite_index = sprite_jump;}else
				if (sprite_stand > noone){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
			#endregion /*Triple Jump*/

			if (image_index > image_number - 1)
			{
				image_speed = 0;
			}
			else
			{
				image_speed = 0.5;
			}
		}
	}
	else
	if (vspeed > 0)
	and (stick_to_wall = false)
	and (spring = false)
	{
		if (invincible >= true)
		and (asset_get_type("spr_player_invincible_jump") == asset_sprite)
		{
			sprite_index = spr_player_invincible_jump;
			image_speed = 1;
		}
		else
		{
			
			#region /*Fall sprites*/
			if (jump_transition_to_fall_animation = 0)
			{
				image_index = 0;
				jump_transition_to_fall_animation = 1
			}
			if (jump_transition_to_fall_animation = 1)
			{
				image_speed = 0.5;
				if (sprite_jump_transition_to_fall > noone){sprite_index = sprite_jump_transition_to_fall;}else
				{jump_transition_to_fall_animation = 2;}
				if (image_index > image_number - 1)
				{
					image_index = 0;
					jump_transition_to_fall_animation = 2;
				}
			}
			if (jump_transition_to_fall_animation = 2)
			{
				if (key_jump_hold)
				{
					if (sprite_fall_slower > noone){sprite_index = sprite_fall_slower;}else
					if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
					if (sprite_jump_transition_to_fall > noone){sprite_index = sprite_jump_transition_to_fall; image_index = image_number - 1;}else
					if (sprite_jump > noone){sprite_index = sprite_jump; image_index = image_number - 1;}else
					if (sprite_stand > noone){sprite_index = sprite_stand;}else
					if (sprite_walk > noone){sprite_index = sprite_walk;}
				}
				else
				{
					if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
					if (sprite_fall_slower > noone){sprite_index = sprite_fall_slower;}else
					if (sprite_jump_transition_to_fall > noone){sprite_index = sprite_jump_transition_to_fall; image_index = image_number - 1;}else
					if (sprite_jump > noone){sprite_index = sprite_jump; image_index = image_number - 1;}else
					if (sprite_stand > noone){sprite_index = sprite_stand;}else
					if (sprite_walk > noone){sprite_index = sprite_walk;}
				}
			}
			#endregion /*Fall sprites END*/
			
		}
	}
	if (sprite_mask >= 0)
	{
		mask_index = sprite_mask;
	}
	else
	{
		mask_index = spr_player_stand;
	}
}
#endregion /*Jumping Sprites END*/

}

#region/*Stop skidding ice sound*/
if (asset_get_type("obj_ice_block") == asset_object)
{
	if (asset_get_type("snd_skidding_ice") == asset_sound)
	{
		if (crouch = false)
		{
			if (speed < 2)
			or(hspeed > 0)
			and (key_right)
			or(hspeed < 0)
			and (key_left)
			or(!key_left)
			and (!key_right)
			or(!place_meeting(x, y + 1, obj_ice_block))
			{
				if (asset_get_type("snd_skidding_ice") == asset_sound)
				{
					if (audio_is_playing(snd_skidding_ice))
					{
						audio_stop_sound(snd_skidding_ice);
					}
				}
			}
		}
		else
		if (!place_meeting(x, y + 1, obj_ice_block))
		or(speed < 1)
		{
			if (asset_get_type("snd_skidding_ice") == asset_sound)
			{
				if (audio_is_playing(snd_skidding_ice))
				{
					audio_stop_sound(snd_skidding_ice);
				}
			}
		}
	}
}
#endregion /*Stop skidding ice sound END*/

#region /*Stop skidding sound*/
if (crouch = false)
{
	if (speed < 2)
	or(hspeed > 0)
	and (key_right)
	or(hspeed < 0)
	and (key_left)
	or(!key_left)
	and (!key_right)
	or(!place_meeting(x, y + 1, obj_wall))
	{
		if (asset_get_type("snd_skidding") == asset_sound)
		{
			if (audio_is_playing(snd_skidding))
			{
				audio_stop_sound(snd_skidding);
			}
		}
	}
}
else
if (!place_meeting(x, y + 1, obj_wall))
or(speed < 1)
{
	if (asset_get_type("snd_skidding") == asset_sound)
	{
		if (audio_is_playing(snd_skidding))
		{
			audio_stop_sound(snd_skidding);
		}
	}
}
#endregion /*Stop skidding sound END*/

#region /*Footstep sounds*/
if (on_ground = true)
{
	if (speed > 0)
	and (crouch = false)
	{
		if (hspeed < 0)
		and (!key_right)
		or(hspeed > 0)
		and (!key_left)
		{
			if (image_index < 1)
			{
				
				#region /*Left Footstep Sounds*/
				
				#region /*Dirt Footstep Left*/
				if (asset_get_type("obj_ground") == asset_object)
				and (place_meeting(x, y + 1, obj_ground))
				and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 1)
				{
					if (asset_get_type("snd_footstep_dirt_left") == asset_sound)
					{
						if (!audio_is_playing(snd_footstep_dirt_left))
						{
							audio_play_sound(snd_footstep_dirt_left, 0, 0);
							audio_sound_gain(snd_footstep_dirt_left, global.footstep_volume * global.main_volume, 0);
						}
					}
				}
				#endregion /*Dirt Footstep Left END*/
				
				else
				
				#region /*Glass Footstep Left*/
				if (asset_get_type("obj_ground") == asset_object)
				and (place_meeting(x, y + 1, obj_ground))
				and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 2)
				{
					if (asset_get_type("snd_footstep_glass_left") == asset_sound)
					{
						if (!audio_is_playing(snd_footstep_glass_left))
						{
							audio_play_sound(snd_footstep_glass_left, 0, 0);
							audio_sound_gain(snd_footstep_glass_left, global.footstep_volume * global.main_volume, 0);
						}
					}
				}
				#endregion /*Glass Footstep Left END*/
				
				else
				
				#region /*Grass Footstep Left*/
				if (asset_get_type("obj_ground") == asset_object)
				and (place_meeting(x, y + 1, obj_ground))
				and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 3)
				{
					if (asset_get_type("snd_footstep_grass_left") == asset_sound)
					{
						if (!audio_is_playing(snd_footstep_grass_left))
						{
							audio_play_sound(snd_footstep_grass_left, 0, 0);
							audio_sound_gain(snd_footstep_grass_left, global.footstep_volume * global.main_volume, 0);
						}
					}
				}
				#endregion /*Grass Footstep Left END*/
				
				else
				
				#region /*Gravel Footstep Left*/
				if (asset_get_type("obj_ground") == asset_object)
				and (place_meeting(x, y + 1, obj_ground))
				and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 4)
				{
					if (asset_get_type("snd_footstep_gravel_left") == asset_sound)
					{
						if (!audio_is_playing(snd_footstep_gravel_left))
						{
							audio_play_sound(snd_footstep_gravel_left, 0, 0);
							audio_sound_gain(snd_footstep_gravel_left, global.footstep_volume * global.main_volume, 0);
						}
					}
				}
				#endregion /*Gravel Footstep Left END*/
				
				else
				
				#region /*Metal Footstep Left*/
				if (asset_get_type("obj_ground") == asset_object)
				and (place_meeting(x, y + 1, obj_ground))
				and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 5)
				{
					if (asset_get_type("snd_footstep_metal_left") == asset_sound)
					{
						if (!audio_is_playing(snd_footstep_metal_left))
						{
							audio_play_sound(snd_footstep_metal_left, 0, 0);
							audio_sound_gain(snd_footstep_metal_left, global.footstep_volume * global.main_volume, 0);
						}
					}
				}
				#endregion /*Metal Footstep Left END*/
				
				else
				
				#region /*Stone Footstep Left*/
				if (asset_get_type("obj_ground") == asset_object)
				and (place_meeting(x, y + 1, obj_ground))
				and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 6)
				{
					if (asset_get_type("snd_footstep_stone_left") == asset_sound)
					{
						if (!audio_is_playing(snd_footstep_stone_left))
						{
							audio_play_sound(snd_footstep_stone_left, 0, 0);
							audio_sound_gain(snd_footstep_stone_left, global.footstep_volume * global.main_volume, 0);
						}
					}
				}
				#endregion /*Stone Footstep Left END*/
				
				else
				
				#region /*Wood Footstep Left*/
				if (asset_get_type("obj_ground") == asset_object)
				and (place_meeting(x, y + 1, obj_ground))
				and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 7)
				{
					if (asset_get_type("snd_footstep_wood_left") == asset_sound)
					{
						if (!audio_is_playing(snd_footstep_wood_left))
						{
							audio_play_sound(snd_footstep_wood_left, 0, 0);
							audio_sound_gain(snd_footstep_wood_left, global.footstep_volume * global.main_volume, 0);
						}
					}
				}
				#endregion /*Wood Footstep Left END*/
				
				else
				
				#region /*Default Footstep Left*/
				{
					if (asset_get_type("snd_footstep_default_left") == asset_sound)
					{
						if (!audio_is_playing(snd_footstep_default_left))
						{
							audio_play_sound(snd_footstep_default_left, 0, 0);
							audio_sound_gain(snd_footstep_default_left, global.footstep_volume * global.main_volume, 0);
						}
					}
				}
				#endregion /*Default Footstep Left END*/
				
				#endregion /*Left Footstep Sounds END*/
				
			}
			else
			if (image_index > image_number/ 2 - 1)
			and (image_index < image_number/ 2 + 1)
			{
				
				#region /*Right Footstep Sounds*/
				
				#region /*Dirt Footstep Right*/
				if (asset_get_type("obj_ground") == asset_object)
				and (place_meeting(x, y + 1, obj_ground))
				and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 1)
				{
					if (asset_get_type("snd_footstep_dirt_right") == asset_sound)
					{
						if (!audio_is_playing(snd_footstep_dirt_right))
						{
							audio_play_sound(snd_footstep_dirt_right, 0, 0);
							audio_sound_gain(snd_footstep_dirt_right, global.footstep_volume * global.main_volume, 0);
						}
					}
				}
				#endregion /*Dirt Footstep Right END*/
				
				else
				
				#region /*Glass Footstep Right*/
				if (asset_get_type("obj_ground") == asset_object)
				and (place_meeting(x, y + 1, obj_ground))
				and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 2)
				{
					if (asset_get_type("snd_footstep_glass_right") == asset_sound)
					{
						if (!audio_is_playing(snd_footstep_glass_right))
						{
							audio_play_sound(snd_footstep_glass_right, 0, 0);
							audio_sound_gain(snd_footstep_glass_right, global.footstep_volume * global.main_volume, 0);
						}
					}
				}
				#endregion /*Glass Footstep Right END*/
				
				else
				
				#region /*Grass Footstep Right*/
				if (asset_get_type("obj_ground") == asset_object)
				and (place_meeting(x, y + 1, obj_ground))
				and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 3)
				{
					if (asset_get_type("snd_footstep_grass_right") == asset_sound)
					{
						if (!audio_is_playing(snd_footstep_grass_right))
						{
							audio_play_sound(snd_footstep_grass_right, 0, 0);
							audio_sound_gain(snd_footstep_grass_right, global.footstep_volume * global.main_volume, 0);
						}
					}
				}
				#endregion /*Grass Footstep Right END*/
				
				else
				
				#region /*Gravel Footstep Right*/
				if (asset_get_type("obj_ground") == asset_object)
				and (place_meeting(x, y + 1, obj_ground))
				and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 4)
				{
					if (asset_get_type("snd_footstep_gravel_right") == asset_sound)
					{
						if (!audio_is_playing(snd_footstep_gravel_right))
						{
							audio_play_sound(snd_footstep_gravel_right, 0, 0);
							audio_sound_gain(snd_footstep_gravel_right, global.footstep_volume * global.main_volume, 0);
						}
					}
				}
				#endregion /*Gravel Footstep Right END*/
				
				else
				
				#region /*Metal Footstep Right*/
				if (asset_get_type("obj_ground") == asset_object)
				and (place_meeting(x, y + 1, obj_ground))
				and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 5)
				{
					if (asset_get_type("snd_footstep_metal_right") == asset_sound)
					{
						if (!audio_is_playing(snd_footstep_metal_right))
						{
							audio_play_sound(snd_footstep_metal_right, 0, 0);
							audio_sound_gain(snd_footstep_metal_right, global.footstep_volume * global.main_volume, 0);
						}
					}
				}
				#endregion /*Metal Footstep Right END*/
				
				else
				
				#region /*Stone Footstep Right*/
				if (asset_get_type("obj_ground") == asset_object)
				and (place_meeting(x, y + 1, obj_ground))
				and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 6)
				{
					if (asset_get_type("snd_footstep_stone_right") == asset_sound)
					{
						if (!audio_is_playing(snd_footstep_stone_right))
						{
							audio_play_sound(snd_footstep_stone_right, 0, 0);
							audio_sound_gain(snd_footstep_stone_right, global.footstep_volume * global.main_volume, 0);
						}
					}
				}
				#endregion /*Stone Footstep Right END*/
				
				else
				
				#region /*Wood Footstep Right*/
				if (asset_get_type("obj_ground") == asset_object)
				and (place_meeting(x, y + 1, obj_ground))
				and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 7)
				{
					if (asset_get_type("snd_footstep_wood_right") == asset_sound)
					{
						if (!audio_is_playing(snd_footstep_wood_right))
						{
							audio_play_sound(snd_footstep_wood_right, 0, 0);
							audio_sound_gain(snd_footstep_wood_right, global.footstep_volume * global.main_volume, 0);
						}
					}
				}
				#endregion /*Wood Footstep Right END*/
				
				else
				
				#region /*Default Footstep Right*/
				{
					if (asset_get_type("snd_footstep_default_right") == asset_sound)
					{
						if (!audio_is_playing(snd_footstep_default_right))
						{
							audio_play_sound(snd_footstep_default_right, 0, 0);
							audio_sound_gain(snd_footstep_default_right, global.footstep_volume * global.main_volume, 0);
						}
					}
				}
				#endregion /*Default Footstep Right END*/
				
				#endregion /*Right Footstep Sounds END*/
				
			}
		}
	}
}
#endregion /*Footstep sounds END*/

#region /*Running Sparks Effect*/
if (on_ground = true)
and (abs(hspeed) >= speed_max_walk)
{
	if (abs(hspeed) >speed_max_walk + 1)
	{
		if (spark1_effect = false)
		{
			if (abs(hspeed) <7)
			{
				if (key_sprint)
				and (stick_to_wall = false)
				and (wall_jump = 0)
				{
					audio_stop_sound(voice);
					voice = audio_play_sound(voice_startdash, 0, 0);
					audio_sound_gain(voice_startdash, global.voices_volume * global.main_volume, 0);
					audio_sound_pitch(voice_startdash, default_voice_pitch);
				}
			}
			effect_speedspark_subimg = 0; /*Start speedspark animation*/
			spark1_effect = true;
		}
	}
	else
	{
		spark1_effect = false;
	}
	if (abs(hspeed) >7)
	{
		if (spark2_effect = false)
		{
			if (abs(hspeed) <7.5)
			{
				if (key_sprint)
				and (stick_to_wall = false)
				and (wall_jump = 0)
				{
					if (asset_get_type("snd_speeddash") == asset_sound)
					{
						audio_play_sound(snd_speeddash, 0, 0);
						audio_sound_gain(snd_speeddash, global.sound_volume * global.main_volume, 0);
					}
				}
			}
			effect_speedspark_subimg = 0; /*Start speedspark animation*/
			spark2_effect = true;
		}
	}
	else
	{
		spark2_effect = false;
	}
}
else
{
	if (abs(hspeed) < speed_max_walk)
	{
		spark1_effect = false;
	}
	spark2_effect = false;
}
#endregion /*Running Sparks Effect END*/

#region /*Speedlines Effect*/
if (asset_get_type("obj_speedline") == asset_object)
{
	if (invincible >= true)
	and (assist_invincible = false)
	and (instance_exists(obj_player))
	{
		with(instance_create_depth(xx, yy, 0, obj_speedline))
		{
			image_angle = instance_nearest(x, y, obj_player).angle;
			image_blend = instance_nearest(x, y, obj_player).image_blend;
			image_index = instance_nearest(x, y, obj_player).image_index;
			image_speed = 0;
			sprite_index = instance_nearest(x, y, obj_player).sprite_index;
			image_xscale = instance_nearest(x, y, obj_player).image_xscale * instance_nearest(x, y, obj_player).default_xscale;
			image_yscale = instance_nearest(x, y, obj_player).image_yscale * instance_nearest(x, y, obj_player).default_yscale;
		}
	}
	else
	if (vspeed < 0)
	or(vspeed > 0)
	{
		instance_create_depth(xx, yy, 0, obj_speedline);
	}
}
#endregion /*Speedlines Effect END*/

if (on_ground = true)
{
	can_dive = true;
}

#region /*Sprite standing with item in front*/
if (hold_item_in_hands != "")
and (speed > 0)
and (crouch = false)
and (sprite_index != sprite_vine_climb)
and (sprite_index != sprite_vine_stay)
{
	if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front;}else
	if (sprite_standing_with_item_in_front > noone){sprite_index = sprite_standing_with_item_in_front;}else
	if (sprite_walk > noone){sprite_index = sprite_walk;}else
	{sprite_index = sprite_stand;}
}
else
if (hold_item_in_hands != "")
and (crouch = false)
and (sprite_index != sprite_vine_climb)
and (sprite_index != sprite_vine_stay)
{
	if (sprite_standing_with_item_in_front > noone){sprite_index = sprite_standing_with_item_in_front;}else
	if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front; image_index = 0; image_speed = 0;}else
	if (sprite_stand > noone){sprite_index = sprite_stand;}else
	if (sprite_walk > noone){sprite_index = sprite_walk;}
}
#endregion /*Sprite standing with item in front END*/

#region /*Glide*/
if (allow_glide = true)
{
	if (can_glide > 0)
	{
		can_glide -= 1;
	}
	if (on_ground = false)
	and (!place_meeting(x, y + 32, obj_wall))
	and (key_jump)
	and (rope_swing = false)
	and (stick_to_wall = false)
	and (climb = false)
	and (horizontal_rope_climb = false)
	and (can_glide = 0)
	{
		glide = true;
		ground_pound = false;
		can_glide = 3;
	}
	if (on_ground = true)
	or (rope_swing = true)
	or (stick_to_wall = true)
	or (climb = true)
	or (horizontal_rope_climb = true)
	{
		can_glide = 3;
	}
	if (key_crouch_pressed)
	{
		can_glide = 20;
	}
}
if (glide = true)
{
	speed_max = speed_max_run;
	dive = false;
	gravity = 0.1;
	if (vspeed > 1)
	{
		vspeed = 1;
	}
	if (sprite_glide_down > noone){sprite_index = sprite_glide_down;}else
	if (sprite_spring_up > noone){sprite_index = sprite_spring_up;}else
	if (sprite_spring_down > noone){sprite_index = sprite_spring_down;}else
	if (sprite_double_jump > noone){sprite_index = sprite_double_jump;}else
	if (sprite_jump > noone){sprite_index = sprite_jump;}else
	if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
	if (sprite_stand > noone){sprite_index = sprite_stand;}else
	if (sprite_walk > noone){sprite_index = sprite_walk;}
	if (key_sprint_pressed)
	or (key_crouch_pressed)
	or (on_ground = true)
	and (vspeed >= 0)
	or (rope_swing = true)
	or (stick_to_wall = true)
	or (climb = true)
	or (horizontal_rope_climb = true)
	or (ground_pound = true)
	{
		glide = false;
		can_glide = 3;
	}
}
#endregion /*Glide END*/

#endregion /*________________________________Handling the sprites and sounds in the step event________________________________END*/

#region /*Partner Character Code*/
if (partner_character = true)
{
	
	#region /*What player to follow*/
	if (player = 1)
	{
		if (instance_exists(obj_camera))
		and (instance_exists(obj_camera.player4))
		{
			partner_follow_player = obj_camera.player4;
		}
		else
		if (instance_exists(obj_camera))
		and (instance_exists(obj_camera.player3))
		{
			partner_follow_player = obj_camera.player3;
		}
		else
		if (instance_exists(obj_camera))
		and (instance_exists(obj_camera.player2))
		{
			partner_follow_player = obj_camera.player2;
		}
	}
	else
	if (player = 2)
	{
		if (instance_exists(obj_camera))
		and (instance_exists(obj_camera.player1))
		{
			partner_follow_player = obj_camera.player1;
		}
		else
		if (instance_exists(obj_camera))
		and (instance_exists(obj_camera.player4))
		{
			partner_follow_player = obj_camera.player4;
		}
		else
		if (instance_exists(obj_camera))
		and (instance_exists(obj_camera.player3))
		{
			partner_follow_player = obj_camera.player3;
		}
	}
	else
	if (player = 3)
	{
		if (instance_exists(obj_camera))
		and (instance_exists(obj_camera.player2))
		{
			partner_follow_player = obj_camera.player2;
		}
		else
		if (instance_exists(obj_camera))
		and (instance_exists(obj_camera.player1))
		{
			partner_follow_player = obj_camera.player1;
		}
		else
		if (instance_exists(obj_camera))
		and (instance_exists(obj_camera.player4))
		{
			partner_follow_player = obj_camera.player4;
		}
	}
	else
	if (player = 4)
	{
		if (instance_exists(obj_camera))
		and (instance_exists(obj_camera.player3))
		{
			partner_follow_player = obj_camera.player3;
		}
		else
		if (instance_exists(obj_camera))
		and (instance_exists(obj_camera.player2))
		{
			partner_follow_player = obj_camera.player2;
		}
		else
		if (instance_exists(obj_camera))
		and (instance_exists(obj_camera.player1))
		{
			partner_follow_player = obj_camera.player1;
		}
	}
	#endregion /*What player to follow END*/
	
	if (instance_exists(obj_camera))
	and (instance_exists(partner_follow_player))
	and (distance_to_object(partner_follow_player) > 100)
	and (x < partner_follow_player.x - 100)
	{
		active_right = true;
		if (invincible >= true)
		and (assist_invincible = false)
		{
			speed_max = lerp(speed_max, 10, 0.1);
		}
		else
		{
			if (speed_max < speed_max_run)
			{
				speed_max = lerp(speed_max, speed_max_run, 0.1);
			}
		}
	}
	else
	{
		active_right = false;
	}
	if (instance_exists(obj_camera))
	and (instance_exists(partner_follow_player))
	and (distance_to_object(partner_follow_player) > 100)
	and (x > partner_follow_player.x + 100)
	{
		active_left = true;
		if (invincible >= true)
		and (assist_invincible = false)
		{
			speed_max = lerp(speed_max, 10, 0.1);
		}
		else
		{
			if (speed_max < speed_max_run)
			{
				speed_max = lerp(speed_max, speed_max_run, 0.1);
			}
		}
	}
	else
	{
		active_left = false;
	}
	if (instance_exists(obj_camera))
	and (instance_exists(partner_follow_player))
	and (distance_to_object(partner_follow_player) > 100)
	and (y > partner_follow_player.y + 100)
	and (on_ground = true)
	or (instance_exists(obj_camera))
	and (instance_exists(partner_follow_player))
	and (distance_to_object(partner_follow_player) > 100)
	and (place_meeting(x - 1, y, obj_wall))
	and (x > partner_follow_player.x + 100)
	and (on_ground = true)
	or (instance_exists(obj_camera))
	and (instance_exists(partner_follow_player))
	and (distance_to_object(partner_follow_player) > 100)
	and (place_meeting(x + 1, y, obj_wall))
	and (x < partner_follow_player.x - 100)
	and (on_ground = true)
	{
		active_jump = true;
		active_up = true;
	}
	else
	{
		active_jump = false;
		active_up = false;
	}
	if (instance_exists(obj_camera))
	and (instance_exists(partner_follow_player))
	and (distance_to_object(partner_follow_player) > 100)
	and (y < partner_follow_player.y - 100)
	{
		active_down = true;
	}
	else
	{
		active_down = false;
	}
}
#endregion /*Partner Character Code*/
