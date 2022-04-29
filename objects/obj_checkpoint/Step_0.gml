#region /*Gravity*/
if (asset_get_type("obj_wall") == asset_object)
and (!position_meeting(x, bbox_bottom + 1, obj_wall))
and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
and (asset_get_type("obj_camera") == asset_object)
and (instance_exists(obj_camera))
and (x < obj_camera.view_x_center + 960)
and (x > obj_camera.view_x_center - 960)
and (y < obj_camera.view_y_center + 960)
and (y > obj_camera.view_y_center - 960)
{
	gravity = 0.5;
}
else
{
	hspeed = 0;
	vspeed = 0;
	gravity = 0;
	x = xprevious;
	y = yprevious;
}
if (vspeed >= 16)
{
	vspeed = 16;
}
#endregion /*Gravity END*/

if (global.x_checkpoint = x)
and (global.y_checkpoint = y)
{
	image_index = 1;
	image_speed = 0;
}
if (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
{
	if (instance_nearest(x, y, obj_player).x > x - 32)
	and (instance_nearest(x, y, obj_player).x < x + 32)
	and (instance_nearest(x, y, obj_player).y < y)
	or(place_meeting(x, y, instance_nearest(x, y, obj_player)))
	{
		if (asset_get_type("obj_wall") == asset_object)
		and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
		{
			if (image_index = 0)
			{
				image_index = 1;
				image_speed = 0;
				with(instance_nearest(x, y, obj_player))
				{
					hp += 1;
				}
				effect_create_below(ef_ring, x, y, 2, c_white);
				
				#region /*Collect 10 basic collectibles*/
				if (asset_get_type("obj_basic_collectible") == asset_object)
				{
					if (asset_get_type("snd_basic_collectible") == asset_sound)
					{
						audio_play_sound(snd_basic_collectible, 0, 0);
					}
					var obj;
					obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
					with(obj)
					{
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
					}
					obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
					with(obj)
					{
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
						delay_time = 10;
					}
					obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
					with(obj)
					{
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
						delay_time = 20;
					}
					obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
					with(obj)
					{
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
						delay_time = 30;
					}
					obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
					with(obj)
					{
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
						delay_time = 40;
					}
					obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
					with(obj)
					{
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
						delay_time = 50;
					}
					obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
					with(obj)
					{
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
						delay_time = 60;
					}
					obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
					with(obj)
					{
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
						delay_time = 70;
					}
					obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
					with(obj)
					{
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
						delay_time = 80;
					}
					obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
					with(obj)
					{
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
						delay_time = 90;
					}
					
					#region /* 2000 Score*/
					score += 2000;
					if (asset_get_type("obj_scoreup") == asset_object)
					{
						obj = instance_create_depth(x, y, 0, obj_scoreup);
						with(obj)
						{
							scoreup = 2000;
						}
					}
					#endregion /* 2000 Score END*/
					
					#region /*Checkpoint text when touching the checkpoint, so everybody knows that this is a checkpoint*/
					if (asset_get_type("obj_scoreup") == asset_object)
					{
						obj = instance_create_depth(x, y- 20, 0, obj_scoreup);
						with(obj)
						{
							scoreup = "CHECKPOINT";
						}
					}
					#endregion /*Checkpoint text when touching the checkpoint, so everybody knows that this is a checkpoint END*/
				}
				#endregion /*Collect 10 basic collectibles END*/
				
				global.x_checkpoint = x;
				global.y_checkpoint = y;
				global.checkpoint_millisecond = global.timeattack_millisecond;
				global.checkpoint_second = global.timeattack_second;
				global.checkpoint_minute = global.timeattack_minute;
				global.checkpoint_realmillisecond = global.timeattack_realmillisecond;
				
				#region /*Save Level Editor Checkpoint*/
				if (asset_get_type("room_leveleditor") == asset_room)
				and (room = room_leveleditor)
				and (global.character_select_in_this_menu = "main_game")
				and (global.actually_play_edited_level = true)
				{
					var uppercase_level_name;
					uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
					uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
					var level_name = string(uppercase_level_name);
					
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real(level_name, "x_checkpoint", x);
					ini_write_real(level_name, "y_checkpoint", y);
					ini_write_real(level_name, "checkpoint_millisecond", global.timeattack_millisecond);
					ini_write_real(level_name, "checkpoint_second", global.timeattack_second);
					ini_write_real(level_name, "checkpoint_minute", global.timeattack_minute);
					ini_write_real(level_name, "checkpoint_realmillisecond", global.timeattack_realmillisecond);
					ini_close();
				}
				else
				if (asset_get_type("room_leveleditor") == asset_room)
				and (room = room_leveleditor)
				and (global.character_select_in_this_menu = "level_editor")
				and (global.actually_play_edited_level = true)
				{
					var uppercase_level_name;
					uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 1));
					uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))) - 1);
					var level_name = string(uppercase_level_name);
					
					ini_open(working_directory + "/save_files/custom_level_save.ini");
					ini_write_real(level_name, "x_checkpoint", x);
					ini_write_real(level_name, "y_checkpoint", y);
					ini_write_real(level_name, "checkpoint_millisecond", global.timeattack_millisecond);
					ini_write_real(level_name, "checkpoint_second", global.timeattack_second);
					ini_write_real(level_name, "checkpoint_minute", global.timeattack_minute);
					ini_write_real(level_name, "checkpoint_realmillisecond", global.timeattack_realmillisecond);
					ini_close();
				}
				#endregion /*Save Level Editor Checkpoint END*/
				
			}
		}
	}
}