/// @function draw_menu_button(x, y, string, menu_index, menu_takes_you_to)
/// @description draw_menu_button(x, y, string, menu_index, menu_takes_you_to)
/// @param x
/// @param y
/// @param string
/// @param menu_index
/// @param menu_takes_you_to

function draw_menu_button(x_position, y_position, string_text, menu_index, menu_takes_you_to, highlight_color = c_lime, alpha = 1)
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	#region /* Button */
	if (point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position + 1, x_position + 370, y_position + 41))
	&& (global.controls_used_for_menu_navigation == "mouse")
	//&& (menu_delay == 0)
	&& (open_dropdown == false)
	|| (menu == menu_index)
	&& (global.controls_used_for_menu_navigation == "keyboard")
	&& (open_dropdown == false)
	|| (menu == menu_index)
	&& (global.controls_used_for_menu_navigation == "controller")
	&& (open_dropdown == false)
	{
		menu = menu_index;
		draw_sprite_ext(spr_menu_button, 0, x_position, y_position + 21, 1, 1, 0, highlight_color, alpha);
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (string_width(string_text) >= 360)
		{
			scr_draw_text_outlined(x_position + 185, y_position + 21, string(string_text), global.default_text_size * 0.7, c_black, c_white, alpha); /* White text inside the menu button */
		}
		else
		{
			scr_draw_text_outlined(x_position + 185, y_position + 21, string(string_text), global.default_text_size, c_black, c_white, alpha); /* White text inside the menu button */
		}
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position - 24, y_position + 20, 1, 1, 0, c_white, alpha);
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position + 394, y_position + 20, 1, 1, 180, c_white, alpha);
	}
	else
	{
		draw_sprite_ext(spr_menu_button, 0, x_position, y_position + 21, 1, 1, 0, c_white, alpha);
		if (highlight_color != c_lime)
		{
			draw_sprite_ext(spr_menu_button, 0, x_position, y_position + 21, 1, 1, 0, highlight_color, 0.1 * alpha);
		}
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (string_width(string_text) >= 360)
		{
			scr_draw_text_outlined(x_position + 185, y_position + 21, string(string_text), global.default_text_size * 0.7, c_white, c_black, alpha); /* Black text inside the menu button */
		}
		else
		{
			scr_draw_text_outlined(x_position + 185, y_position + 21, string(string_text), global.default_text_size, c_white, c_black, alpha); /* Black text inside the menu button */
		}
	}
	
	#region /* Clicking the menu button */
	if (point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position + 1, x_position + 370, y_position + 41))
	{
		if (menu_takes_you_to != false)
		|| (menu_takes_you_to != noone)
		|| (menu_takes_you_to != "")
		|| (menu_takes_you_to != menu_index)
		{
			if (mouse_check_button_released(mb_left))
			//&& (menu_delay == 0)
			&& (open_dropdown == false)
			{
				menu = menu_takes_you_to;
			}
		}
	}
	#endregion /* Clicking the menu button END */
	
	#endregion /* Button END */
	
}