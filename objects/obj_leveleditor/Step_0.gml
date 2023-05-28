if (global.actually_play_edited_level == false)
{
	var cam_x = camera_get_view_x(view_camera[view_current]);
	var cam_y = camera_get_view_y(view_camera[view_current]);
	var cam_width = camera_get_view_width(view_camera[view_current]);
	var cam_height = camera_get_view_height(view_camera[view_current]);
	
	#region /* Deactivate instances outside view. Run this code at start of Step Event */
	deactivate_timer += 1;
	if (deactivate_timer >= 5)
	&& (pressing_play_timer == 0)
	&& (pause <= 1)
	{
		if (startup_loading_timer <= 3)
		{
			startup_loading_timer += 1;
		}
		
		if (quit_level_editor == 0)
		&& (global.play_edited_level == false)
		&& (startup_loading_timer >= 3)
		{
			instance_activate_all();
			instance_deactivate_region(cam_x - 32, cam_y - 32, cam_width + 32, cam_height + 32, false, true);
		}
		
		#region /* Activate objects that always should be active */
		instance_activate_object(obj_foreground1);
		instance_activate_object(obj_foreground_above_static_objects);
		instance_activate_object(obj_foreground2);
		instance_activate_object(obj_foreground_secret);
		instance_activate_object(obj_level_player1_start);
		instance_activate_object(obj_level_player2_start);
		instance_activate_object(obj_level_player3_start);
		instance_activate_object(obj_level_player_4_start);
		instance_activate_object(obj_level_end);
		instance_activate_object(obj_level_height);
		instance_activate_object(obj_level_width);
		instance_activate_object(obj_water_level_height);
		instance_activate_object(obj_background_brightness_gameplay);
		#endregion /* Activate objects that always should be active END */
		
		deactivate_timer = 0;
	}
	#endregion /* Deactivate instances outside view. Run this code at start of Step Event END */
	
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var view_center_x = cam_x + cam_width * 0.5;
	var view_center_y = cam_y + cam_height * 0.5;
	
	grid_button_x = display_get_gui_width() - 224;
	
	scr_audio_play(level_editing_music, volume_source.music);
	
	if (global.selected_level_editing_music != previous_selected_level_editing_music)
	{
		if (global.selected_level_editing_music == 0)
		{
			audio_stop_sound(level_editing_music);
			level_editing_music = noone;
			previous_selected_level_editing_music = 0;
		}
		else
		if (global.selected_level_editing_music == 1)
		{
			audio_stop_sound(level_editing_music);
			if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_1.ogg"))
			&& (floor(random(3 - 1)) == 0)
			{
				level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_1.ogg");
			}
			else
			if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_2.ogg"))
			&& (floor(random(3 - 1)) == 0)
			{
				level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_2.ogg");
			}
			else
			if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_3.ogg"))
			&& (floor(random(3 - 1)) == 0)
			{
				level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_3.ogg");
			}
			else
			if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_4.ogg"))
			{
				level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_4.ogg");
			}
			previous_selected_level_editing_music = 1;
		}
		else
		if (global.selected_level_editing_music == 2)
		&& (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_1.ogg"))
		{
			audio_stop_sound(level_editing_music);
			level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_1.ogg");
			previous_selected_level_editing_music = 2;
		}
		else
		if (global.selected_level_editing_music == 3)
		&& (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_2.ogg"))
		{
			audio_stop_sound(level_editing_music);
			level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_2.ogg");
			previous_selected_level_editing_music = 3;
		}
		else
		if (global.selected_level_editing_music == 4)
		&& (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_3.ogg"))
		{
			audio_stop_sound(level_editing_music);
			level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_3.ogg");
			previous_selected_level_editing_music = 4;
		}
		else
		if (global.selected_level_editing_music == 5)
		&& (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_4.ogg"))
		{
			audio_stop_sound(level_editing_music);
			level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_4.ogg");
			previous_selected_level_editing_music = 5;
		}
		else
		{
			audio_stop_sound(level_editing_music);
			level_editing_music = noone;
		}
		if (file_exists("config.ini"))
		{
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "selected_level_editing_music", global.selected_level_editing_music);
			ini_close();
		}
	}
	
	if (pause == false)
	{
		scr_controls_for_level_editor();
	}
	else
	if (pause)
	{
		scr_menu_navigation_initialization(1, true);
	}
	
	scr_toggle_fullscreen();

	#region /* Always keep the brush size within these values */
	if (place_brush_size < 0)
	{
		place_brush_size = 0;
	}
	if (place_brush_size > 5)
	{
		place_brush_size = 5;
	}
	if (erase_brush_size < 0)
	{
		erase_brush_size = 0;
	}
	if (erase_brush_size > 5)
	{
		erase_brush_size = 5;
	}
	#endregion /* Always keep the brush size within these values END */
	
	if (get_window_height != old_window_get_height)
	|| (get_window_width != old_window_get_width)
	{
		scr_set_screen_size();
		old_window_get_height = get_window_height;
		old_window_get_width = get_window_width;
	}
	
	#region /* Holding the play key down */
	if (keyboard_check_pressed(key_play))
	|| (gamepad_button_check_pressed(global.player1_slot, button_play))
	|| (point_in_rectangle(mouse_get_x, mouse_get_y, play_level_icon_x - 32, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64))
	&& (mouse_check_button_pressed(mb_left))
	{
		if (pause == false)
		{
			pressing_play_timer = 1;
		}
	}
	if (keyboard_check(key_play))
	|| (gamepad_button_check(global.player1_slot, button_play))
	|| (point_in_rectangle(mouse_get_x, mouse_get_y, play_level_icon_x - 32, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64))
	&& (mouse_check_button(mb_left))
	|| (pressing_play_timer < 3)
	{
		if (pause == false)
		&& (pressing_play_timer >= 1)
		{
			pressing_play_timer += 1;
		}
	}
	#endregion /* Holding the play key down END */
	
	#region /* Play Level when releasing Enter Key */
	if (pressing_play_timer >= 1)
	{
		instance_activate_all(); /* Activate all instances before saving the custom level. You need this code right here otherwise the game crashes */
		if (keyboard_check_released(key_play))
		|| (gamepad_button_check_released(global.player1_slot, button_play))
		|| (point_in_rectangle(mouse_get_x, mouse_get_y, play_level_icon_x - 32, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64))
		&& (mouse_check_button_released(mb_left))
		|| (global.full_level_map_screenshot)
		|| (pressing_play_timer > 60)
		{
			if (pause == false)
			&& (menu_delay == 0)
			&& (global.character_select_in_this_menu == "level_editor")
			{
				if (!instance_exists(obj_camera))
				|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 64, get_window_height * 0.5 - 32, get_window_width, get_window_height * 0.5 + 32))
				&& (!instance_exists(obj_camera))
				|| (global.full_level_map_screenshot)
				{
					
					#region /* Limit so cursor and view can't go outside room */
					if (cam_width < 1920)
					|| (cam_height < 1080)
					{
						camera_set_view_size(view_camera[view_current], 1920, 1080);
					}
					scr_set_screen_size();
					
					#region /* Limit controller x and controller y inside room */
					if (controller_x < cam_x)
					{
						controller_x = cam_x;
					}
					if (controller_x > cam_x + cam_width)
					{
						controller_x = cam_x + cam_width;
					}
					if (controller_y < cam_y)
					{
						controller_y = cam_y;
					}
					if (controller_y > cam_y + cam_height)
					{
						controller_y = cam_y + cam_height;
					}
					#endregion /* Limit controller x and controller y inside room END */
					
					#region /* Limit x and y inside room */
					if (x < cam_x)
					{
						x = cam_x;
					}
					if (x > cam_x + cam_width)
					{
						x = cam_x + cam_width;
					}
					if (y < cam_y)
					{
						y = cam_y;
					}
					if (y > cam_y + cam_height)
					{
						y = cam_y + cam_height;
					}
					#endregion /* Limit x and y inside room END */
					
					#region /* Limit view inside room */
					camera_set_view_pos(view_camera[view_current],
					max(0, min(cam_x, room_width - cam_width)),
					max(0, min(cam_y, room_height - cam_height)));
					#endregion /* Limit view inside room END */
				
					#endregion /* Limit so view and cursor can't go outside room END */
				
					global.checkpoint_x = 0;
					global.checkpoint_y = 0;
					global.checkpoint_millisecond = 0;
					global.checkpoint_second = 0;
					global.checkpoint_minute = 0;
					global.checkpoint_realmillisecond = 0;
				
					menu_delay = 9999; /* Disable all menu control */
					lives = 5;
					global.lives_until_assist = 0;
					global.character_select_in_this_menu = "level_editor";
				
					audio_stop_sound(level_editing_music); /* Stop the background music that plays during level editing when playtesting a level */
				
					if (!global.world_editor)
					{
						ini_open(working_directory + "/save_files/custom_level_save.ini");
						ini_write_real(string(global.level_name), "checkpoint_x", 0);
						ini_write_real(string(global.level_name), "checkpoint_y", 0);
						ini_write_real(string(global.level_name), "checkpoint_millisecond", 0);
						ini_write_real(string(global.level_name), "checkpoint_second", 0);
						ini_write_real(string(global.level_name), "checkpoint_minute", 0);
						ini_write_real(string(global.level_name), "checkpoint_realmillisecond", 0);
						ini_close();
						
						#region /* Save Level Thumbnail */
						var thumbnail_sprite = sprite_create_from_surface(application_surface, 0, 0, cam_width, cam_height, false, true, 0, 0);
						if (global.level_name != "")
						{
							sprite_save(thumbnail_sprite, 0, working_directory + "/custom_levels/" + string(global.level_name) + "/automatic_thumbnail.png");
						}
						scr_delete_sprite_properly(thumbnail_sprite);
						#endregion /* Save Level Thumbnail END */
						
						scr_save_custom_level();
						
						if (pressing_play_timer >= 60 || global.full_level_map_screenshot)
						{
							if (!instance_exists(obj_camera))
							{
								instance_activate_object(obj_camera);
								instance_create_depth(obj_level_player1_start.x, obj_level_player1_start.y, 0, obj_camera);
							}
						}
						else
						{
							if (!instance_exists(obj_camera))
							{
								instance_activate_object(obj_camera);
								instance_create_depth(view_center_x, view_center_y, 0, obj_camera);
							}
						}
					}
					else
					{
						/* Save World Thumbnail */
						var thumbnail_sprite = sprite_create_from_surface(application_surface, 0, 0, cam_width, cam_height, false, true, 0, 0);
						if (global.level_name != "")
						{
							sprite_save(thumbnail_sprite, 0, working_directory + "/custom_worlds/" + string(global.level_name) + "/automatic_thumbnail.png");
						}
						scr_delete_sprite_properly(thumbnail_sprite);
						
						scr_save_custom_world();
						
						if (point_in_rectangle(mouse_get_x, mouse_get_y, play_level_icon_x - 32, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64) || global.full_level_map_screenshot)
						{
							instance_create_depth(obj_level_player1_start.x, obj_level_player1_start.y, 0, obj_player_map);
						}
						else
						{
							var level_instance = instance_nearest(x, y, obj_level);
							instance_create_depth(level_instance ? level_instance.x : x, level_instance ? level_instance.y : y, 0, obj_player_map);
						}
					}
					scr_scale_background();
					global.actually_play_edited_level = false;
					global.play_edited_level = true;
					instance_destroy();
				}
			}
		}
	}
	#endregion /* Play Level when releasing Enter Key END */

	if (global.create_level_from_template)
	&& (create_level_from_template_save_delay < 10)
	{
		create_level_from_template_save_delay += 1;
	}
	else
	if (global.create_level_from_template)
	&& (create_level_from_template_save_delay == 10)
	{
	
		#region /* Limit so cursor and view can't go outside room */
		if (cam_width < 1920)
		|| (cam_height < 1080)
		{
			camera_set_view_size(view_camera[view_current], 1920, 1080);
		}
		scr_set_screen_size();
	
		#region /* Limit controller x and controller y inside room */
		if (controller_x < cam_x)
		{
			controller_x = cam_x;
		}
		if (controller_x > cam_x + cam_width)
		{
			controller_x = cam_x + cam_width;
		}
		if (controller_y < cam_y)
		{
			controller_y = cam_y;
		}
		if (controller_y > cam_y + cam_height)
		{
			controller_y = cam_y + cam_height;
		}
		#endregion /* Limit controller x and controller y inside room END */
	
		#region /* Limit x and y inside room */
		if (x < cam_x)
		{
			x = cam_x;
		}
		if (x > cam_x + cam_width)
		{
			x = cam_x + cam_width;
		}
		if (y < cam_y)
		{
			y = cam_y;
		}
		if (y > cam_y + cam_height)
		{
			y = cam_y + cam_height;
		}
		#endregion /* Limit x and y inside room END */
	
		#region /* Limit view inside room */
		camera_set_view_pos(view_camera[view_current],
		max(0, min(cam_x, room_width - cam_width)),
		max(0, min(cam_y, room_height - cam_height)));
		#endregion /* Limit view inside room END */
	
		#endregion /* Limit so view and cursor can't go outside room END */
	
		global.checkpoint_x = 0;
		global.checkpoint_y = 0;
		global.checkpoint_millisecond = 0;
		global.checkpoint_second = 0;
		global.checkpoint_minute = 0;
		global.checkpoint_realmillisecond = 0;
	
		ini_open(working_directory + "/save_files/custom_level_save.ini");
		ini_write_real(string(global.level_name), "checkpoint_x", 0);
		ini_write_real(string(global.level_name), "checkpoint_y", 0);
		ini_write_real(string(global.level_name), "checkpoint_millisecond", 0);
		ini_write_real(string(global.level_name), "checkpoint_second", 0);
		ini_write_real(string(global.level_name), "checkpoint_minute", 0);
		ini_write_real(string(global.level_name), "checkpoint_realmillisecond", 0);
		ini_close();
	
		#region /* Save Thumbnail */
		var thumbnail_sprite;
		thumbnail_sprite = sprite_create_from_surface(application_surface,
		cam_x,
		cam_y,
		cam_width,
		cam_height, false, true, 0, 0);
		if (global.level_name != "")
		{
			sprite_save(thumbnail_sprite, 0, working_directory + "/custom_levels/" + string(global.level_name) + "/automatic_thumbnail.png");
		}
		scr_delete_sprite_properly(thumbnail_sprite);
		#endregion /* Save Thumbnail END */
		
		menu_delay = 10; /* Disable all menu control */
		lives = 5;
		global.lives_until_assist = 0;
		global.actually_play_edited_level = false;
		global.play_edited_level = false; /* Set this to false so you don't playtest the level */
		global.character_select_in_this_menu = "level_editor";
		create_level_from_template_save_delay += 1; /* Stop saving template level */
	}
	
	#region /* Menu cursor image speed */
	menu_cursor_index += 0.3;
	if (menu_cursor_index > 4)
	{
		menu_cursor_index = 0;
	}
	#endregion /* Menu cursor image speed END */
	
	#region /* If you haven't yet quit the level editor, then run this code */
	if (quit_level_editor <= 0)
	{
		
		#region /* Controller Input Changes */
		if (global.controls_used_for_menu_navigation != "controller")
		{
			x = mouse_x;
			y = mouse_y;
			cursor_x = mouse_get_x;
			cursor_y = mouse_get_y;
			controller_x = mouse_get_x;
			controller_y = mouse_get_y;
			
			#region /* Move view with keyboard */
			if (keyboard_check(vk_control))
			{
				controller_view_speed = 16;
			}
			else
			{
				controller_view_speed = 8;
			}
			var view_x_direction = 0;
			var view_y_direction = 0;
			if (pause == false)
			{
				if (keyboard_check(global.player_[inp.key][1][1][action.up]))
				&& (!keyboard_check(global.player_[inp.key][1][1][action.down]))
				|| (keyboard_check(vk_up))
				&& (!keyboard_check(vk_down))
				{
					if (view_center_y > 0)
					{
						view_y_direction = -controller_view_speed; /* Move camera up */
					}
				}
				if (keyboard_check(global.player_[inp.key][1][1][action.down]))
				&& (!keyboard_check(global.player_[inp.key][1][1][action.up]))
				|| (keyboard_check(vk_down))
				&& (!keyboard_check(vk_up))
				{
					if (instance_exists(obj_level_height))
					&& (view_center_y < obj_level_height.y)
					{
						view_y_direction = +controller_view_speed; /* Move camera down */
					}
				}
				if (keyboard_check(global.player_[inp.key][1][1][action.left]))
				&& (!keyboard_check(global.player_[inp.key][1][1][action.right]))
				|| (keyboard_check(vk_left))
				&& (!keyboard_check(vk_right))
				{
					if (view_center_x > 0)
					{
						view_x_direction = -controller_view_speed; /* Move camera left */
					}
				}
				if (keyboard_check(global.player_[inp.key][1][1][action.right]))
				&& (!keyboard_check(global.player_[inp.key][1][1][action.left]))
				|| (keyboard_check(vk_right))
				&& (!keyboard_check(vk_left))
				{
					if (instance_exists(obj_level_width))
					&& (view_center_x < obj_level_width.x)
					{
						view_x_direction = +controller_view_speed; /* Move camera right */
					}
				}
			}
			camera_set_view_pos(view_camera[view_current], cam_x + view_x_direction, cam_y + view_y_direction); /* Move actual camera */
			#endregion /* Move view with gamepad END */
		
		}
		else
		if (global.controls_used_for_menu_navigation == "controller")
		{
			x = controller_x;
			y = controller_y;
			cursor_x = controller_x;
			cursor_y = controller_y;
		
			#region /* Keep controller_x and controller_y within view */
			if (controller_x < cam_x)
			{
				controller_x = cam_x;
			}
			if (controller_x > cam_x + cam_width)
			{
				controller_x = cam_x + cam_width;
			}
			if (controller_y < cam_y)
			{
				controller_y = cam_y;
			}
			if (controller_y > cam_y + cam_height)
			{
				controller_y = cam_y + cam_height;
			}
			#endregion /* Keep controller_x and controller_y within view END */
			
			if (pause == false)
			{
				if (key_up)
				&& (controller_y > cam_y)
				{
					if (key_move_faster)
					{
						controller_y -= 12;
					}
					else
					{
						controller_y -= 4;
					}
				}
				if (key_down)
				&& (controller_y < cam_y + cam_height)
				{
					if (key_move_faster)
					{
						controller_y += 12;
					}
					else
					{
						controller_y += 4;
					}
				}
				if (key_left)
				&& (controller_x > cam_x)
				{
					if (key_move_faster)
					{
						controller_x -= 12;
					}
					else
					{
						controller_x -= 4;
					}
				}
				if (key_right)
				&& (controller_x < cam_x + cam_width)
				{
					if (key_move_faster)
					{
						controller_x += 12;
					}
					else
					{
						controller_x += 4;
					}
				}
			}
			
			#region /* Move view with gamepad */
			if (key_move_faster)
			{
				controller_view_speed = 24;
			}
			else
			{
				controller_view_speed = 8;
			}
			var view_x_direction = 0;
			var view_y_direction = 0;
			if (gamepad_axis_value(global.player1_slot, gp_axisrv) < 0)
			|| (key_up)
			&& (controller_y <= cam_y)
			{
				view_y_direction = -controller_view_speed; /* Move camera up */
				if (controller_y > cam_y)
				{
					controller_y -= controller_view_speed;
				}
			}
			if (gamepad_axis_value(global.player1_slot, gp_axisrv) > 0)
			|| (key_down)
			&& (controller_y >= cam_y + cam_height)
			{
				view_y_direction = +controller_view_speed; /* Move camera down */
				if (controller_y < cam_y + cam_height)
				{
					controller_y += controller_view_speed;
				}
			}
			if (gamepad_axis_value(global.player1_slot, gp_axisrh) < 0)
			|| (key_left)
			&& (controller_x <= cam_x)
			{
				view_x_direction = -controller_view_speed; /* Move camera left */
				if (controller_x > cam_x)
				{
					controller_x -= controller_view_speed;
				}
			}
			if (gamepad_axis_value(global.player1_slot, gp_axisrh) > 0)
			|| (key_right)
			&& (controller_x >= cam_x + cam_width)
			{
				view_x_direction = +controller_view_speed; /* Move camera right */
				if (controller_x < cam_x + cam_width)
				{
					controller_x += controller_view_speed;
				}
			}
			camera_set_view_pos(view_camera[view_current], cam_x + view_x_direction, cam_y + view_y_direction); /* Move actual camera */
			#endregion /* Move view with gamepad END */
			
		}
		#endregion /* Controller Input Changes END */
	
		move_snap(global.grid_hsnap, global.grid_vsnap); /* Make sure to always move snap */
	
		#region /* Place Object */
		var is_mouse_left_button_pressed = mouse_check_button_pressed(mb_left);
		var is_gamepad_button_pressed = gamepad_button_check(global.player1_slot, button_play);
		var is_play_key_pressed = keyboard_check(key_play);
		
		if (!is_play_key_pressed
		    && !is_gamepad_button_pressed
		    && ((can_make_place_brush_size_bigger && mouse_check_button(mb_left))
		        || (!can_make_place_brush_size_bigger && is_mouse_left_button_pressed)
		        || (can_make_place_brush_size_bigger && key_a_hold)
		        || (!can_make_place_brush_size_bigger && key_a_pressed)))
		{
			if (!keyboard_check(vk_space))
			&& (!mouse_check_button(mb_middle))
			&& (!mouse_check_button(mb_right))
			&& (pressing_play_timer == 0)
			&& (scroll_view == false)
			&& (drag_object == false)
			&& (fill_mode == false)
			&& (erase_mode == false)
			&& (pause == false)
			&& (menu_delay == 0)
			&& (!place_meeting(x, y, obj_level_player1_start))
			&& (!place_meeting(x, y, obj_level_player2_start))
			&& (!place_meeting(x, y, obj_level_player3_start))
			&& (!place_meeting(x, y, obj_level_player_4_start))
			&& (!position_meeting(x, y, obj_level_height))
			&& (!position_meeting(x, y, obj_level_width))
			&& (!position_meeting(x, y, obj_water_level_height))
			&& (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2)) /* Can't place objects when clicking the bottom buttons */
			&& (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 256, - 64, display_get_gui_width(), + 64)) /* Can't place objects when clicking the top buttons */
			&& (!point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 64, get_window_height * 0.5 - 32, get_window_width, get_window_height * 0.5 + 32)) /* Can't place objects when clicking the play button */
			{
				if (show_grid)
				&& (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 32 - 32, 80 + icons_at_top_y + 16 - 32, display_get_gui_width() + 64, 80 + icons_at_top_y + 16 + 32)) /* Up && down buttons when grid is on */
				|| (show_grid == false)
				{
					if (global.enable_difficulty_selection_settings)
					&& (global.enable_difficutly_layers_in_level_editor)
					&& (set_difficulty_mode)
					&& (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /* Can't place objects when clicking the bottom right buttons */
					|| (global.enable_difficulty_selection_settings)
					&& (global.enable_difficutly_layers_in_level_editor)
					&& (set_difficulty_mode == false)
					&& (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /* Can't place objects when clicking the bottom right buttons */
					|| (global.enable_difficulty_selection_settings == false)
					|| (global.enable_difficutly_layers_in_level_editor == false)
					{
						if (x > -16) /* Can only place objects within the level */
						&& (y > -16)
						&& (instance_exists(obj_level_width))
						&& (obj_level_width.drag_object == false)
						&& (obj_level_width.drag_release_timer == 0)
						&& (x < obj_level_width.x + 16)
						&& (instance_exists(obj_level_height))
						&& (obj_level_height.drag_object == false)
						&& (obj_level_height.drag_release_timer == 0)
						&& (y < obj_level_height.y + 16)
						{
							if (place_object_delay_timer < 3)
							{
								place_object_delay_timer += 1;
							}
							if (place_object_delay_timer >= 3)
							{
									
								drag_object = false;
									
								#region /* Brush size 1 */
								scr_brush_size_place_object(   0,    0, 1, true);
								#endregion /* Brush size 1 END */
									
								#region /* Brush size 2 */
								scr_brush_size_place_object(   0, + 32, 2, false);
								scr_brush_size_place_object(+ 32,    0, 2, false);
								scr_brush_size_place_object(+ 32, + 32, 2, false);
								#endregion /* Brush size 2 END */
									
								#region /* Brush size 3 */
								scr_brush_size_place_object(   0, - 32, 3, false);
								scr_brush_size_place_object(+ 32, - 32, 3, false);
								scr_brush_size_place_object(- 32,    0, 3, false);
								scr_brush_size_place_object(- 32, + 32, 3, false);
								scr_brush_size_place_object(- 32, - 32, 3, false);
								#endregion /* Brush size 3 END */
									
								#region /* Brush size 4 */
								scr_brush_size_place_object(   0, + 64, 4, false);
								scr_brush_size_place_object(+ 32, + 64, 4, false);
								scr_brush_size_place_object(+ 64,    0, 4, false);
								scr_brush_size_place_object(+ 64, + 32, 4, false);
								scr_brush_size_place_object(+ 64, + 64, 4, false);
								scr_brush_size_place_object(+ 64, - 32, 4, false);
								scr_brush_size_place_object(- 32, + 64, 4, false);
								#endregion /* Brush size 4 END */
									
								#region /* Brush size 5 */
								scr_brush_size_place_object(   0, - 64, 5, false);
								scr_brush_size_place_object(+ 32, - 64, 5, false);
								scr_brush_size_place_object(+ 64, - 64, 5, false);
								scr_brush_size_place_object(- 32, - 64, 5, false);
								scr_brush_size_place_object(- 64,    0, 5, false);
								scr_brush_size_place_object(- 64, + 32, 5, false);
								scr_brush_size_place_object(- 64, + 64, 5, false);
								scr_brush_size_place_object(- 64, - 32, 5, false);
								scr_brush_size_place_object(- 64, - 64, 5, false);
								#endregion /* Brush size 5 END */
									
								#region /* Brush size 6 */
								scr_brush_size_place_object(   0, + 96, 6, false);
								scr_brush_size_place_object(+ 32, + 96, 6, false);
								scr_brush_size_place_object(+ 64, + 96, 6, false);
								scr_brush_size_place_object(+ 96,    0, 6, false);
								scr_brush_size_place_object(+ 96, + 32, 6, false);
								scr_brush_size_place_object(+ 96, + 64, 6, false);
								scr_brush_size_place_object(+ 96, + 96, 6, false);
								scr_brush_size_place_object(+ 96, - 32, 6, false);
								scr_brush_size_place_object(+ 96, - 64, 6, false);
								scr_brush_size_place_object(- 32, + 96, 6, false);
								scr_brush_size_place_object(- 64, + 96, 6, false);
								#endregion /* Brush size 6 END */
									
								/* Unlocked objects should be set as not recently unlocked anymore */
								ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
								if (ini_read_real("Unlock Placable Objects", place_object, false)) /* Only update if the current object is recently unlocked */
								{
									ini_write_real("Unlock Placable Objects", place_object, 2); /* Set that the unlockable object isn't recently unlocked and "New" anymore */
								}
								ini_close();
									
								#region /* Reset Level Editor Checkpoint */
								if (room == room_leveleditor)
								&& (global.character_select_in_this_menu == "level_editor")
								&& (global.create_level_from_template == false)
								{
									ini_open(working_directory + "/save_files/custom_level_save.ini");
									ini_key_delete(global.level_name, "checkpoint_x");
									ini_key_delete(global.level_name, "checkpoint_y");
									ini_key_delete(global.level_name, "checkpoint_millisecond");
									ini_key_delete(global.level_name, "checkpoint_second");
									ini_key_delete(global.level_name, "checkpoint_minute");
									ini_key_delete(global.level_name, "checkpoint_realmillisecond");
									ini_key_delete(global.level_name, "checkpoint_direction");
									ini_close();
								}
								#endregion /* Reset Level Editor Checkpoint END */
									
								#region /* Reset ranking highscore to actual custom level when placing objects */
								if (global.character_select_in_this_menu == "level_editor")
								&& (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
								{
									if (global.character_select_in_this_menu == "level_editor")
									{
										ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
									}
										
									#region /* Reset Fastest Time Hard */
									ini_key_delete("rank", "rank_timeattack_millisecond");
									ini_key_delete("rank", "rank_timeattack_second");
									ini_key_delete("rank", "rank_timeattack_minute");
									ini_key_delete("rank", "rank_timeattack_realmillisecond");
									#endregion /* Reset Fastest Time END */
										
									ini_key_delete("rank", "rank_level_score");
									ini_close();
								}
								#endregion /* Reset ranking highscore to actual custom level when placing objects END */
									
							}
						}
					}
				}
			}
		}
		else
		{
			place_object_delay_timer = 0;
		}
		#endregion /* Place Object END */
	
		#region /* Nearest Placed Object Code */
		with(instance_nearest(x, y, obj_leveleditor_placed_object))
		{
		
			scr_modify_objects_in_level_editor();
		
		}
		#endregion /* Nearest Placed Object Code END */
	
	}
	#endregion /* If you haven't yet quit the level editor, then run this code END */

	if (mouse_check_button_released(mb_left))
	{
		placing_object -= 0.2;
	}
	if (placing_object <= 0.9)
	&& (placing_object > 0)
	{
		placing_object -= 0.2;	
	}
	
	scr_set_controls_used_to_navigate();
	
	scr_make_background_visible();
	
	#region /* Keyboard Shortcuts */
	
	#region /* Press D key to change to drawing tool in level editor */
	if (keyboard_check_pressed(key_draw))
	&& (pause == false)
	|| (gamepad_button_check_pressed(global.player1_slot, button_draw))
	&& (pause == false)
	{
		if (fill_mode == false)
		&& (erase_mode == false)
		{
			if (place_brush_size == 0)
			{
				place_brush_size = 1;
			}
			else
			if (place_brush_size == 1)
			{
				place_brush_size = 2;
			}
			else
			if (place_brush_size == 2)
			{
				place_brush_size = 3;
			}
			else
			if (place_brush_size == 3)
			{
				place_brush_size = 4;
			}
			else
			if (place_brush_size == 4)
			{
				place_brush_size = 5;
			}
			else
			if (place_brush_size == 5)
			{
				place_brush_size = 0;
			}
		}
		else
		{
			fill_mode = false;
			erase_mode = false;
		}
	}
	#endregion /* Press D key to change to drawing tool in level editor END */
	
	#region /* Press E key to change to erase tool in level editor */
	if (keyboard_check_pressed(key_erase))
	&& (pause == false)
	|| (gamepad_button_check_pressed(global.player1_slot, button_erase))
	&& (pause == false)
	{
		if (erase_mode == false)
		{
			erase_mode = true;
			fill_mode = false;
		}
		else
		if (erase_mode)
		{
			fill_mode = false;
			if (erase_brush_size == 0)
			{
				erase_brush_size = 1;
			}
			else
			if (erase_brush_size == 1)
			{
				erase_brush_size = 2;
			}
			else
			if (erase_brush_size == 2)
			{
				erase_brush_size = 3;
			}
			else
			if (erase_brush_size == 3)
			{
				erase_brush_size = 4;
			}
			else
			if (erase_brush_size == 4)
			{
				erase_brush_size = 5;
			}
			else
			if (erase_brush_size == 5)
			{
				erase_brush_size = 0;
			}
		}
	}
	#endregion /* Press E key to change to erase tool in level editor */
	
	#region /* Press F key to change to fill tool in level editor */
	if (keyboard_check_pressed(key_fill))
	&& (pause == false)
	|| (gamepad_button_check_pressed(global.player1_slot, button_fill))
	&& (pause == false)
	{
		if (fill_mode == false)
		{
			erase_mode = false;
			fill_mode = true;
		}
		else
		if (fill_mode_type == "fill")
		&& (erase_mode == false)
		&& (fill_mode)
		{
			erase_mode = false;
			fill_mode_type = "horizontal";
		}
		else
		if (fill_mode_type == "horizontal")
		&& (erase_mode == false)
		&& (fill_mode)
		{
			erase_mode = false;
			fill_mode_type = "vertical";
		}
		else
		if (fill_mode_type == "vertical")
		&& (erase_mode == false)
		&& (fill_mode)
		{
			erase_mode = false;
			fill_mode_type = "fill";
		}
	}
	#endregion /* Press F key to change to fill tool in level editor */
	
	#region /* Scroll mouse wheel to change drawing tool size in level editor */
	if (fill_mode == false)
	&& (erase_mode == false)
	&& (mouse_check_button(mb_left))
	&& (pause == false)
	{
		if (mouse_wheel_down())
		{
			if (place_brush_size > 0)
			{
				place_brush_size -= 1;
			}
		}
		else
		if (mouse_wheel_up())
		{
			if (place_brush_size < 5)
			{
				place_brush_size += 1;
			}
		}
	}
	#endregion /* Scroll mouse wheel to change drawing tool size in level editor End */
	
	#region /* Scroll mouse wheel to change erase tool size in level editor */
	if (erase_mode)
	&& (pause == false)
	{
		if (mouse_wheel_down())
		{
			fill_mode = false;
			if (erase_brush_size > 0)
			{
				erase_brush_size -= 1;
			}
		}
		else
		if (mouse_wheel_up())
		{
			fill_mode = false;
			if (erase_brush_size < 5)
			{
				erase_brush_size += 1;
			}
		}
	}
	#endregion /* Scroll mouse wheel to change erase tool size in level editor END */
	
	#region /* Grid hotkeys */
	if (keyboard_check(vk_control))
	&& (keyboard_check(vk_shift))
	&& (keyboard_check_pressed(ord("A")))
	&& (pause == false)
	{
		show_grid = true;
		if (global.grid_hsnap > 16)
		|| (global.grid_vsnap > 16)
		{
			global.grid_hsnap -= 16;
			global.grid_vsnap -= 16;
		}
	}
	else
	if (keyboard_check(vk_control))
	&& (keyboard_check(vk_shift))
	&& (keyboard_check_pressed(ord("S")))
	&& (pause == false)
	{
		show_grid = true;
		global.grid_hsnap += 16;
		global.grid_vsnap += 16;
	}
	else
	if (keyboard_check(vk_control))
	&& (!keyboard_check(vk_shift))
	&& (keyboard_check_pressed(ord("A")))
	&& (pause == false)
	{
		show_grid = true;
		if (global.grid_hsnap > 1)
		|| (global.grid_vsnap > 1)
		{
			global.grid_hsnap -= 1;
			global.grid_vsnap -= 1;
		}
	}
	else
	if (keyboard_check(vk_control))
	&& (!keyboard_check(vk_shift))
	&& (keyboard_check_pressed(ord("S")))
	&& (pause == false)
	{
		show_grid = true;
		global.grid_hsnap += 1;
		global.grid_vsnap += 1;
	}
	#endregion /* Grid hotkeys END */

	#endregion /* Keyboard Shortcuts END */
	
	#region /* Show or hide grid hotkey */
	if (keyboard_check_pressed(key_grid))
	&& (pause == false)
	|| (gamepad_button_check_pressed(global.player1_slot, button_grid))
	&& (pause == false)
	{
		if (show_grid == false)
		{
			show_grid = true;
		}
		else
		{
			show_grid = false;
		}
	}
	#endregion /* Show or hide grid hotkey END */
	
	#region /* Fade grid in and out when toggeling */
	if (show_grid)
	{
		grid_alpha = lerp(grid_alpha, 0.25, 0.1);
	}
	else
	{
		grid_alpha = lerp(grid_alpha, 0, 0.1);
	}
	#endregion /* Fade grid in and out when toggeling END */
	
	#region /* Zoom In and Out (Draw red rectangles around the screen when you can't zoom any more) */
	if (pause == false)
	{
		
		#region /* Zoom Out */
		if (zoom_out)
		{
			if (cam_width < 3840) /* 1920 * 2 = 3840 */
			&& (cam_height < 2160) /* 1080 * 2 = 2160 */
			{
				camera_set_view_size((view_camera[view_current]), cam_width + 8, cam_height + 4.5);
				camera_set_view_pos((view_camera[view_current]), cam_x -4, cam_y - 2.5); /* Move camera position when zooming out so it doesn't look too weird */
			}
		}
		#endregion /* Zoom Out END */
		
		else
		
		#region /* Reset Zoom */
		if (zoom_reset)
		{
			
			#region /* Limit so cursor and view can't go outside room */
			scr_set_screen_size();
			
			#region /* Limit controller x and controller y inside room */
			if (controller_x < cam_x)
			{
				controller_x = cam_x;
			}
			if (controller_x > cam_x + cam_width)
			{
				controller_x = cam_x + cam_width;
			}
			if (controller_y < cam_y)
			{
				controller_y = cam_y;
			}
			if (controller_y > cam_y + cam_height)
			{
				controller_y = cam_y + cam_height;
			}
			#endregion /* Limit controller x and controller y inside room END */
			
			#region /* Limit x and y inside room */
			if (x < cam_x)
			{
				x = cam_x;
			}
			if (x > cam_x + cam_width)
			{
				x = cam_x + cam_width;
			}
			if (y < cam_y)
			{
				y = cam_y;
			}
			if (y > cam_y + cam_height)
			{
				y = cam_y + cam_height;
			}
			#endregion /* Limit x and y inside room END */
		
			#region /* Limit view inside room */
			camera_set_view_pos(view_camera[view_current],
			max(0, min(cam_x, room_width - cam_width)),
			max(0, min(cam_y, room_height - cam_height)));
			#endregion /* Limit view inside room END */
		
			#endregion /* Limit so view and cursor can't go outside room END */
		
		}
		#endregion /* Reset Zoom END */
	
		else
	
		#region /* Zoom In */
		if (zoom_in)
		{
			if (cam_width > 696)
			&& (cam_height > 368)
			{
				camera_set_view_size((view_camera[view_current]), cam_width - 8, cam_height -4.5);
				camera_set_view_pos((view_camera[view_current]), cam_x + 4, cam_y + 2.5); /* Move camera position when zooming in so it doesn't look too weird */
			}
		}
		#endregion /* Zoom In END */

	}
	#endregion /* Zoom In and Out (Draw red rectangles around the screen when you can't zoom any more) END */
	
	#region /* Select Object Menu */
	if (mouse_check_button(mb_any))
	|| (keyboard_check(vk_anykey))
	|| (key_a_hold)
	{
		selected_menu_alpha = lerp(selected_menu_alpha, 0, 0.1);
	}
	else
	{
		selected_menu_alpha = lerp(selected_menu_alpha, 0, 0.01);
	}
	#endregion /* Select Object Menu END */
	
	#region /* Position the Cursor */
	if (quit_level_editor <= 0)
	{

	#region /* Scroll Cursor */
	if (keyboard_check(vk_space))
	&& (mouse_check_button(mb_left))
	|| (mouse_check_button(mb_middle))
	{
		if (asset_get_type("spr_cursor_scroll") == asset_sprite)
		{
			mouse_sprite = spr_cursor_scroll;
			window_set_cursor(cr_none);
		}
		else
		{
			window_set_cursor(cr_size_all);
		}
	}
	else
	if (keyboard_check(vk_space))
	{
		if (asset_get_type("spr_cursor_scroll") == asset_sprite)
		{
			mouse_sprite = spr_cursor_scroll;
			window_set_cursor(cr_none);
		}
		else
		{
			window_set_cursor(cr_size_all);
		}
	}
	#endregion /* Scroll Cursor END */

	else

	#region /* Fill Cursor */
	if (fill_mode)
	&& (erase_mode == false)
	&& (scroll_view == false)
	&& (!place_meeting(x, y, obj_level_player1_start))
	&& (!place_meeting(x, y, obj_level_player2_start))
	&& (!place_meeting(x, y, obj_level_player3_start))
	&& (!place_meeting(x, y, obj_level_player_4_start))
	&& (!place_meeting(x, y, obj_level_end))
	{
		if (asset_get_type("spr_cursor_fill") == asset_sprite)
		{
			mouse_sprite = spr_cursor_fill;
			window_set_cursor(cr_none);
		}
		else
		{
			window_set_cursor(cr_arrow);
		}
	}
	#endregion /* Fill Cursor END */
	
	else
	
	#region /* Erase Cursor */
	if (erase_mode)
	&& (scroll_view == false)
	&& (pause == false)
	{
		if (asset_get_type("spr_cursor_erase") == asset_sprite)
		{
			mouse_sprite = spr_cursor_erase;
			window_set_cursor(cr_none);
		}
		else
		{
			window_set_cursor(cr_arrow);
		}
	}
	#endregion /* Erase Cursor END */
	
	else
	
	#region /* Default Cursor */
	if (scroll_view == false)
	&& (drag_object == false)
	&& (fill_mode == false)
	&& (pause == false)
	{
		if (asset_get_type("spr_cursor_brush") == asset_sprite)
		{
			mouse_sprite = spr_cursor_brush;
			window_set_cursor(cr_none);
		}
		else
		{
			window_set_cursor(cr_arrow);
		}
	}
	#endregion /* Default Cursor END */
	
	}
	#endregion /* Position the Cursor END */
	
	#region /* Change modes */
	if (mouse_check_button_pressed(mb_right))
	{
		if (pause == false)
		&& (menu_delay == 0)
		{
			erase_mode = true;
		}
	}
	if (mouse_check_button_released(mb_right))
	{
		if (pause == false)
		&& (menu_delay == 0)
		{
			erase_mode = false;
		}
	}
	#endregion /* Change modes END */

	if (quit_level_editor <= 0)
	{
	
		#region /* When pressing left click, increase current undo value */
		if (mouse_check_button_pressed(mb_left))
		{
			current_undo_value += 1;
		}
		#endregion /* When pressing left click, increase current undo value END */
	
		#region /* Minimum undo value */
		if (current_undo_value <= 0)
		{
			current_undo_value = 0;
		}
		#endregion /* Minimum undo value END */
		
		#region /* Fill with Objects */
		if (mouse_check_button(mb_left))
		&& (!keyboard_check(vk_space))
		&& (!mouse_check_button(mb_middle))
		&& (!mouse_check_button(mb_right))
		&& (!key_b_hold)
		&& (scroll_view == false)
		&& (drag_object == false)
		&& (fill_mode)
		&& (erase_mode == false)
		&& (pause == false)
		&& (menu_delay == 0)
		&& (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2)) /* Can't place objects when clicking the bottom buttons */
		&& (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /* Can't place objects when clicking the bottom buttons */
		&& (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 256, - 64, display_get_gui_width(), + 64)) /* Can't place objects when clicking the top buttons */
		{
			if (!place_meeting(x, y, obj_leveleditor_placed_object))
			&& (!place_meeting(x, y, obj_leveleditor_fill))
			{
				if (fill_mode_type == "fill")
				{
					with (instance_create_depth(x, y, 0, obj_leveleditor_fill))
					{
						fill_mode_type = "fill";
					}
				}
				else
				if (fill_mode_type == "horizontal")
				{
					with (instance_create_depth(x, y, 0, obj_leveleditor_fill))
					{
						fill_mode_type = "horizontal";
					}
				}
				else
				if (fill_mode_type == "vertical")
				{
					with (instance_create_depth(x, y, 0, obj_leveleditor_fill))
					{
						fill_mode_type = "vertical";
					}
				}
			}
		}
		#endregion /* Fill with Objects END */
	
		#region /* SELECT WHAT OBJECT TO PLACe */
	
		#region /* Scroll Objects Left */
		if (mouse_wheel_up())
		&& (!mouse_check_button(mb_middle))
		&& (!key_a_pressed)
		&& (!mouse_check_button(mb_left))
		&& (erase_mode == false)
		&& (pause == false)
		|| (gamepad_button_check_pressed(global.player1_slot, gp_padl))
		&& (erase_mode == false)
		&& (pause == false)
		{
			if (!instance_exists(obj_leveleditor_fill))
			{
				scr_audio_play(snd_leveleditor_cycle_item_left, volume_source.sound);
				if (selected_object > 0)
				{
					selected_object -= 1;
					selected_object_menu_x += 64;
				}
				else
				{
					selected_object = total_number_of_objects;
					selected_object_menu_x =- 64 *total_number_of_objects;
				}
				selected_menu_alpha = 2;
			}
		}
		#endregion /* Scroll Objects Left END */
	
		#region /* Scroll Objects Right */
		if (mouse_wheel_down())
		&& (!mouse_check_button(mb_middle))
		&& (!key_a_pressed)
		&& (!mouse_check_button(mb_left))
		&& (erase_mode == false)
		&& (pause == false)
		|| (gamepad_button_check_pressed(global.player1_slot, gp_padr))
		&& (erase_mode == false)
		&& (pause == false)
		{
			if (!instance_exists(obj_leveleditor_fill))
			{
				scr_audio_play(snd_leveleditor_cycle_item_right, volume_source.sound);
				if (selected_object < total_number_of_objects)
				{
					selected_object += 1;
					selected_object_menu_x -= 64;
				}
				else
				{
					selected_object = 0;
					selected_object_menu_x = 0;
				}
				selected_menu_alpha = 2;
			}
		}
		#endregion /* Scroll Objects Right END */
	
		#endregion /* SELECT WHAT OBJECT TO PLACE END */
	
	}

	#region /* Menu Navigation Delay */
	if (menu_delay > 0)
	{
		menu_delay -= 1;
	}
	if (menu_delay < 0)
	{
		menu_delay = 0;
	}
	#endregion /* Menu Navigation Delay END */
	
	#region /* Pause virtual key */
	if (os_type == os_ios or os_type == os_android)
	{
		virtual_key_add(1100 - 128, 0, 400, 128, vk_escape); /* Pause virtual key */
	}
	#endregion /* Pause virtual key END */
	
	#region /* End Game */
	if (quit_level_editor >= true)
	{
		quit_level_editor += 1;
		instance_activate_all(); /* Activate all instances before saving the custom level */
		
		#region /* Save Level */
		if (quit_level_editor == 3)
		{
			
			#region /* Limit so cursor and view can't go outside room */
			if (cam_width < 1920 or cam_height < 1080)
			{
				camera_set_view_size(view_camera[view_current], 1920, 1080);
			}
			scr_set_screen_size();
			
			/* Limit view inside room */
			var view_x = max(0, min(cam_x, room_width - cam_width));
			var view_y = max(0, min(cam_y, room_height - cam_height));
			camera_set_view_pos(view_camera[view_current], view_x, view_y);
			
			/* Limit controller x and y inside room */
			controller_x = clamp(controller_x, cam_x, cam_x + cam_width);
			controller_y = clamp(controller_y, cam_y, cam_y + cam_height);
			
			/* Limit x and y inside room */
			x = clamp(x, cam_x, cam_x + cam_width);
			y = clamp(y, cam_y, cam_y + cam_height);
			
			#endregion /* Limit so view and cursor can't go outside room END */
			
			ini_open(working_directory + "/save_files/custom_level_save.ini");
			ini_write_real(string(global.level_name), "checkpoint_x", 0);
			ini_write_real(string(global.level_name), "checkpoint_y", 0);
			ini_write_real(string(global.level_name), "checkpoint_millisecond", 0);
			ini_write_real(string(global.level_name), "checkpoint_second", 0);
			ini_write_real(string(global.level_name), "checkpoint_minute", 0);
			ini_write_real(string(global.level_name), "checkpoint_realmillisecond", 0);
			ini_close();
			
			global.checkpoint_x = 0;
			global.checkpoint_y = 0;
			global.checkpoint_millisecond = 0;
			global.checkpoint_second = 0;
			global.checkpoint_minute = 0;
			global.checkpoint_realmillisecond = 0;
			
			menu_delay = 9999; /* Disable all menu control */
			lives = 5;
			global.lives_until_assist = 0;
			global.actually_play_edited_level = false;
			global.play_edited_level = false; /* Set this to false so you don't playtest the level */
			global.character_select_in_this_menu = "level_editor";
		}
		#endregion /* Save Level END */
		
		#region /* Save Thumbnail a little bit after saving level */
		if (quit_level_editor == 4)
		{
			var thumbnail_sprite;
			thumbnail_sprite = sprite_create_from_surface(application_surface,
			cam_x,
			cam_y,
			cam_width,
			cam_height, false, true, 0, 0);
			if (global.level_name != "")
			{
				sprite_save(thumbnail_sprite, 0, working_directory + "/custom_levels/" + string(global.level_name) + "/automatic_thumbnail.png");
			}
			scr_delete_sprite_properly(thumbnail_sprite);
		}
		#endregion /* Save Thumbnail a little bit after saving level END */
		
		if (quit_level_editor > 5)
		{
			global.create_level_from_template = false; /* Disable global.create_level_from_template after loading everything and quitting the level editor, to let every object have time to load and save */
			room_goto(room_title);
		}
	}
	#endregion /* End Game END */
	
	#region /* Press Pause Button */
	if (quit_level_editor == false)
	&& (pause == false)
	{
		if (keyboard_check_pressed(vk_escape))
		|| (gamepad_button_check_pressed(global.player1_slot, gp_start))
		|| (gamepad_button_check_pressed(global.player2_slot, gp_start))
		|| (gamepad_button_check_pressed(global.player3_slot, gp_start))
		|| (gamepad_button_check_pressed(global.player4_slot, gp_start))
		|| (gamepad_button_check_pressed(4, gp_start))
		{
			pause = 2;
		}
	}
	if (pause >= 2)
	{
		instance_activate_all();
		pause += 1;
	}
	
	if (pause == 4)
	{
		scr_save_custom_level(); /* Save level before going to the pause menu */
	}
	if (pause == 5)
	{
		global.pause_room = room_leveleditor;
		quit_level_editor = false;
		can_input_level_name = false;
		input_key = false;
		menu = "continue";
		pause = true;
		menu_delay = 10;
	}
	
	#endregion /* Press Pause Button END */
	
	#region /* Keep view within the level */
	if (view_center_x < 0)
	&& (scroll_view == false)
	{
		camera_set_view_pos(view_camera[view_current], 0 - cam_width * 0.5, cam_y);
	}
	if (view_center_y < 0)
	&& (scroll_view == false)
	{
		camera_set_view_pos(view_camera[view_current], cam_x, 0 - cam_height * 0.5);
	}
	if (instance_exists(obj_level_width))
	&& (obj_level_width.drag_object == false)
	&& (obj_level_width.drag_release_timer == 0)
	&& (view_center_x > obj_level_width.x)
	&& (scroll_view == false)
	{
		camera_set_view_pos(view_camera[view_current], obj_level_width.x - cam_width * 0.5, cam_y);
	}
	if (instance_exists(obj_level_height))
	&& (obj_level_height.drag_object == false)
	&& (obj_level_height.drag_release_timer == 0)
	&& (view_center_y > obj_level_height.y)
	&& (scroll_view == false)
	{
		camera_set_view_pos(view_camera[view_current], cam_x, obj_level_height.y - cam_height * 0.5);
	}
	#endregion /* Keep view within the level END */
	
	#region /* Scroll View. Need to have this code at the bottom of the Step Event */
	if (mouse_check_button_pressed(mb_left))
	&& (keyboard_check(vk_space))
	&& (quit_level_editor <= 0)
	|| (mouse_check_button_pressed(mb_middle))
	&& (quit_level_editor <= 0)
	{
		if (!instance_exists(obj_leveleditor_fill))
		{
			drag_x = mouse_x;
			drag_y = mouse_y;
			scroll_view = true;
		}
	}
	if (scroll_view)
	&& (quit_level_editor <= 0)
	&& (!instance_exists(obj_leveleditor_fill))
	{
		camera_set_view_pos(view_camera[view_current], drag_x -(mouse_x -cam_x), drag_y -(mouse_y -cam_y)); /* Scroll the camera position with the mouse */
	}
	if (mouse_check_button_released(mb_left))
	&& (scroll_view)
	|| (mouse_check_button_released(mb_middle))
	&& (scroll_view)
	{
		scroll_view = false;
	}
	#endregion /* Scroll View. Need to have this code at the bottom of the Step Event END */
	
}