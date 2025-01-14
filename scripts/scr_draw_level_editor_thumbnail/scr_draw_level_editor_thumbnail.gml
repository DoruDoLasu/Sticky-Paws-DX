function scr_draw_level_editor_thumbnail(load_what_levels, show_first_thumbnail_name)
{
	var custom_level_select_blinking = 0;
	
	#region /* Red rectangle behind the level thumbnail to indicate what level you are selecting */
	var top_left_of_thumbnail_x = 394 * (global.select_level_index - column * row) + 100 - 3 + thumbnail_x_offset;
	var top_left_of_thumbnail_y = 226 * (column - scroll) + 250 - 3;
	var bottom_right_of_thumbnail_x = 394 * (global.select_level_index - column * row) + 100 + 384 + 3 + thumbnail_x_offset;
	var bottom_right_of_thumbnail_y = 226 * (column - scroll) + 250 + 216 + 3;
	
	if (menu != "back_from_level_editor")
	&& (menu != "open_custom_levels_folder")
	&& (menu != "online_level_list")
	&& (menu != "search_level_id")
	{
		var custom_level_select_blinking = scr_wave(1, 0, 2, 0);
		draw_rectangle_color(top_left_of_thumbnail_x, top_left_of_thumbnail_y, bottom_right_of_thumbnail_x, bottom_right_of_thumbnail_y, c_red, c_red, c_red, c_red, false);
		draw_set_alpha(custom_level_select_blinking);
		draw_rectangle_color(top_left_of_thumbnail_x, top_left_of_thumbnail_y, bottom_right_of_thumbnail_x, bottom_right_of_thumbnail_y, c_yellow, c_yellow, c_yellow, c_yellow, false);
		draw_set_alpha(1);
	}
	#endregion /* Red rectangle behind the level thumbnail to indicate what level you are selecting END */
	
	#region /* Draw Thumbnail */
	for(i = 0; i < ds_list_size(global.thumbnail_sprite); i += 1)
	{
		column = floor(i/ row)
		if (ds_list_find_value(global.thumbnail_sprite, i) > 0)
		{
			draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, i), 0, 394 * (i - column * row) + 100 + thumbnail_x_offset, 226 * (column - scroll) + 250, 384/sprite_get_width(ds_list_find_value(global.thumbnail_sprite, i)), 216/sprite_get_height(ds_list_find_value(global.thumbnail_sprite, i)), 0, c_white, 1);
		}
		if (show_first_thumbnail_name == false)
		&& (i >= 1)
		&& (menu != "load_custom_level")
		&& (menu != "load_characters")
		&& (menu != "load_official_level_template")
		|| (show_first_thumbnail_name)
		&& (menu != "load_custom_level")
		&& (menu != "load_characters")
		&& (menu != "load_official_level_template")
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			/* Draw level name on top of level thumbnail */ scr_draw_text_outlined(394 * (i - column * row) + 100 + 192 + thumbnail_x_offset, 226 * (column - scroll) + 250 + 184, string(ds_list_find_value(load_what_levels, i)), global.default_text_size * 1.2, c_white, c_black, 1);
			
			#region /* Draw if level have been Clear Checked on top of level thumbnail */
			if (!level_editor_template_select && i >= 1)
			{
				var clear_check = thumbnail_clear_check[i];
				var var_level_id = thumbnail_level_id[i];
				var current_text = "";
				
				if (clear_check && var_level_id != "")
				{
					if (global.select_level_index == i)
					{
						current_text = string(var_level_id);
					}
					
					var current_icon = spr_icons_upload;
					var icon_scale = scr_wave(0.9, 1, 1, 0);
				}
				else if (clear_check)
				{
					if (global.select_level_index == i)
					{
						current_text = string(l10n_text("Clear Checked"));
					}
					
					var current_icon = spr_checkpoint;
					var icon_scale = scr_wave(0.4, 0.5, 1, 0);
				}
				
				if (clear_check)
				{
					var draw_x = 394 * (i - column * row) + 140 + thumbnail_x_offset;
					var draw_y = 226 * (column - scroll) + 274;
					var text_size = global.default_text_size * scr_wave(1, 1.1, 1, 0);
					
					draw_set_halign(fa_left);
					draw_set_valign(fa_middle);
					scr_draw_text_outlined(draw_x, draw_y, current_text, text_size, c_white, c_black, 1);
					draw_sprite_ext(current_icon, 1, draw_x - 20, draw_y, icon_scale, icon_scale, 0, c_white, 1);
				}
			}
			#endregion /* Draw if level have been Clear Checked on top of level thumbnail END */
			
		}
	}
	#endregion /* Draw Thumbnail END */
	
	#region /* Draw 4 red small triangles above the level thumbnail to be even more certain what level you are selecting */
	if (menu != "back_from_level_editor")
	&& (menu != "open_custom_levels_folder")
	&& (menu != "online_level_list")
	&& (menu != "search_level_id")
	{
		var custom_level_select_arrows_moving = scr_wave(10, 0, 1, 0);
		var top_left_x_offset = top_left_of_thumbnail_x - custom_level_select_arrows_moving;
		var top_left_y_offset = top_left_of_thumbnail_y - custom_level_select_arrows_moving;
		var bottom_right_x_offset = bottom_right_of_thumbnail_x + custom_level_select_arrows_moving;
		var bottom_right_y_offset = bottom_right_of_thumbnail_y + custom_level_select_arrows_moving;
		var triangle_size = 32 - custom_level_select_arrows_moving;
		
		/* Draw red triangles */
		draw_triangle_color(top_left_x_offset, top_left_y_offset, top_left_x_offset + triangle_size, top_left_y_offset,
			top_left_x_offset, top_left_y_offset + triangle_size, c_red, c_red, c_red, false);
		
		draw_triangle_color(bottom_right_x_offset, bottom_right_y_offset, bottom_right_x_offset - triangle_size, bottom_right_y_offset,
			bottom_right_x_offset, bottom_right_y_offset - triangle_size, c_red, c_red, c_red, false);
		
		draw_triangle_color(bottom_right_x_offset, top_left_y_offset, bottom_right_x_offset - triangle_size, top_left_y_offset,
			bottom_right_x_offset, top_left_y_offset + triangle_size, c_red, c_red, c_red, false);
		
		draw_triangle_color(top_left_x_offset, bottom_right_y_offset, top_left_x_offset + triangle_size, bottom_right_y_offset,
			top_left_x_offset, bottom_right_y_offset - triangle_size, c_red, c_red, c_red, false);
			
		draw_set_alpha(custom_level_select_blinking);
		
		/* Draw yellow triangles */
		draw_triangle_color(top_left_x_offset, top_left_y_offset, top_left_x_offset + triangle_size, top_left_y_offset,
			top_left_x_offset, top_left_y_offset + triangle_size, c_yellow, c_yellow, c_yellow, false);
			
		draw_triangle_color(bottom_right_x_offset, bottom_right_y_offset, bottom_right_x_offset - triangle_size, bottom_right_y_offset,
			bottom_right_x_offset, bottom_right_y_offset - triangle_size, c_yellow, c_yellow, c_yellow, false);
			
		draw_triangle_color(bottom_right_x_offset, top_left_y_offset, bottom_right_x_offset - triangle_size, top_left_y_offset,
			bottom_right_x_offset, top_left_y_offset + triangle_size, c_yellow, c_yellow, c_yellow, false);
			
		draw_triangle_color(top_left_x_offset, bottom_right_y_offset, top_left_x_offset + triangle_size, bottom_right_y_offset,
			top_left_x_offset, bottom_right_y_offset - triangle_size, c_yellow, c_yellow, c_yellow, false);
			
		draw_set_alpha(1);
	}
	#endregion /* Draw 4 red small triangles above the level thumbnail to be even more certain what level you are selecting END */
	
}