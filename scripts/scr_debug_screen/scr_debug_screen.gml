function scr_debug_screen()
{
	/* Debug information should show up on pause screen and tite screen, so you can optimize those screens too */
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	var version_y = 32;
	var fps_y = 64;
	var fps_real_y = 96;
	var instance_count_y = 128;
	var all_instance_count_y = 160;
	
	var fps_real_target = (os_type == os_switch) ? 60 : 250;
	var instance_count_target = 200;
	
	//if (gamepad_button_check(0, gp_face1))
	//{
	//	effect_create_above(ef_explosion, random_range(0, room_width), random_range(0, room_height), 2, c_aqua);
	//}
	//if (gamepad_button_check(1, gp_face1))
	//{
	//	effect_create_above(ef_explosion, random_range(0, room_width), random_range(0, room_height), 2, c_red);
	//}
	//if (gamepad_button_check(2, gp_face1))
	//{
	//	effect_create_above(ef_explosion, random_range(0, room_width), random_range(0, room_height), 2, c_lime);
	//}
	//if (gamepad_button_check(3, gp_face1))
	//{
	//	effect_create_above(ef_explosion, random_range(0, room_width), random_range(0, room_height), 2, c_yellow);
	//}
	//if (gamepad_button_check(4, gp_face1))
	//{
	//	effect_create_above(ef_explosion, random_range(0, room_width), random_range(0, room_height), 2, c_purple);
	//}
	
	//if (gamepad_button_check(global.player1_slot, gp_face1))
	//{
	//	effect_create_above(ef_ellipse, random_range(0, room_width), random_range(0, room_height), 2, c_aqua);
	//}
	//if (gamepad_button_check(global.player2_slot, gp_face1))
	//{
	//	effect_create_above(ef_ellipse, random_range(0, room_width), random_range(0, room_height), 2, c_red);
	//}
	//if (gamepad_button_check(global.player3_slot, gp_face1))
	//{
	//	effect_create_above(ef_ellipse, random_range(0, room_width), random_range(0, room_height), 2, c_lime);
	//}
	//if (gamepad_button_check(global.player4_slot, gp_face1))
	//{
	//	effect_create_above(ef_ellipse, random_range(0, room_width), random_range(0, room_height), 2, c_yellow);
	//}
	
	if (keyboard_check_pressed(vk_f3) ||
	gamepad_button_check(0, gp_stickl) && gamepad_button_check_pressed(0, gp_stickr) ||
	gamepad_button_check(0, gp_stickr) && gamepad_button_check_pressed(0, gp_stickl) ||
	gamepad_button_check(1, gp_stickl) && gamepad_button_check_pressed(1, gp_stickr) ||
	gamepad_button_check(1, gp_stickr) && gamepad_button_check_pressed(1, gp_stickl) ||
	gamepad_button_check(2, gp_stickl) && gamepad_button_check_pressed(2, gp_stickr) ||
	gamepad_button_check(2, gp_stickr) && gamepad_button_check_pressed(2, gp_stickl) ||
	gamepad_button_check(3, gp_stickl) && gamepad_button_check_pressed(3, gp_stickr) ||
	gamepad_button_check(3, gp_stickr) && gamepad_button_check_pressed(3, gp_stickl) ||
	gamepad_button_check(4, gp_stickl) && gamepad_button_check_pressed(3, gp_stickr) ||
	gamepad_button_check(4, gp_stickr) && gamepad_button_check_pressed(3, gp_stickl))
	{
		global.debug_screen = !global.debug_screen;
		show_debug_overlay(global.debug_screen);
	}
	
	if (global.debug_screen && keyboard_check_pressed(vk_f1))
	{
		with(instance_create_depth(x, y, 0, obj_score_up))
		{
			score_up = "gc_collect();";
		}
		gc_enable(true);
		gc_collect();
	}
	
	if (global.debug_screen)
	{
		
		#region /* Click on FPS to toggle if it should stay on screen even after you close debug screen */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, fps_y - 15, 370, fps_y + 15) && global.controls_used_for_menu_navigation == "mouse")
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(0, fps_y - 16, 370, fps_y + 16, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_released(mb_left))
			{
				global.show_fps = !global.show_fps;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "show_fps", global.show_fps);
				ini_close();
			}
		}
		#endregion /* Click on FPS to toggle if it should stay on screen even after you close debug screen END */
		
		#region /* Click on FPS Real to toggle if it should stay on screen even after you close debug screen */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, fps_real_y - 15, 370, fps_real_y + 15) && global.controls_used_for_menu_navigation == "mouse")
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(0, fps_real_y - 16, 370, fps_real_y + 16, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_released(mb_left))
			{
				global.show_fps_real = !global.show_fps_real;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "show_fps_real", global.show_fps_real);
				ini_close();
			}
		}
		#endregion /* Click on FPS Real to toggle if it should stay on screen even after you close debug screen END */
		
		#region /* Click on Instance Count to toggle if it should stay on screen even after you close debug screen */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, instance_count_y - 15, 370, instance_count_y + 15) && global.controls_used_for_menu_navigation == "mouse")
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(0, instance_count_y - 16, 370, instance_count_y + 16, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_released(mb_left))
			{
				global.show_instance_count = !global.show_instance_count;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "show_instance_count", global.show_instance_count);
				ini_close();
			}
		}
		#endregion /* Click on Instance Count to toggle if it should stay on screen even after you close debug screen END */
		
		#region /* Click on All Instance Count to toggle if it should stay on screen even after you close debug screen */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, all_instance_count_y - 15, 370, all_instance_count_y + 15) && global.controls_used_for_menu_navigation == "mouse")
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(0, all_instance_count_y - 16, 370, all_instance_count_y + 16, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_released(mb_left))
			{
				global.show_all_instance_count = !global.show_all_instance_count;
			}
		}
		#endregion /* Click on All Instance Count to toggle if it should stay on screen even after you close debug screen END */
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (global.controls_used_for_menu_navigation == "controller")
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 32, l10n_text("Press both sticks to toggle debug screen"), global.default_text_size * 0.75, c_black, c_white, 1);
		}
		else
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 32, l10n_text("Press F3 to toggle debug screen"), global.default_text_size * 0.75, c_black, c_white, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 64, l10n_text("Press F1 to use gc_collect()"), global.default_text_size * 0.75, c_black, c_white, 1);
		}
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(32, version_y, string(global.game_name) + " v" + string(scr_get_build_date()), global.default_text_size, c_black, c_white, 1);
	}
	
	#region /* FPS */
	if (global.show_fps || global.debug_screen)
	{
		if (global.show_fps && global.debug_screen)
		{
			draw_sprite_ext(spr_lock_icon, 0, 16, fps_y, 1, 1, 0, c_white, 1);
		}
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		
		if (fps >= global.max_fps)
		{
			scr_draw_text_outlined(32, fps_y, l10n_text("FPS") + ": " + string(fps) + " / " + string(global.max_fps), global.default_text_size, noone, c_lime, 1);
		}
		else
		{
			scr_draw_text_outlined(32, fps_y, l10n_text("FPS") + ": " + string(fps) + " / " + string(global.max_fps), global.default_text_size, noone, make_color_hsv(50 / global.max_fps * fps, 255, 255), 1);
		}
	}
	#endregion /* FPS END */
	
	#region /* FPS Real */
	if (global.show_fps_real || global.debug_screen)
	{
		if (global.show_fps_real && global.debug_screen)
		{
			draw_sprite_ext(spr_lock_icon, 0, 16, fps_real_y, 1, 1, 0, c_white, 1);
		}
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		
		#region /* FPS Real Rating */
		if (fps_real >= fps_real_target)
		{
			scr_draw_text_outlined(32, fps_real_y, l10n_text("FPS Real") + ": " + string(fps_real), global.default_text_size, noone, c_lime, 1);
			scr_draw_text_outlined(320, fps_real_y + scr_wave(-3, +3, 0.5), l10n_text("GOOD"), global.default_text_size, noone, c_lime, 1);
			scr_draw_text_outlined(420, fps_real_y + scr_wave(-3, +3, 0.5), ">" + string(fps_real_target), global.default_text_size * 0.5, noone, c_lime, 1);
		}
		else
		{
			scr_draw_text_outlined(32, fps_real_y, l10n_text("FPS Real") + ": " + string(fps_real), global.default_text_size, noone, make_color_hsv(50 / fps_real_target * fps_real, 255, 255), 1);
			scr_draw_text_outlined(320, fps_real_y, l10n_text("BAD"), global.default_text_size, noone, make_color_hsv(50 / fps_real_target * fps_real, 255, 255), 1);
			scr_draw_text_outlined(420, fps_real_y, "<" + string(fps_real_target), global.default_text_size * 0.5, noone, make_color_hsv(50 / fps_real_target * fps_real, 255, 255), 1);
		}
		#endregion /* FPS Real Rating END */
		
	}
	#endregion /* FPS Real END */
	
	#region /* Instance Count */
	if (global.show_instance_count || global.debug_screen)
	{
		if (global.show_instance_count && global.debug_screen)
		{
			draw_sprite_ext(spr_lock_icon, 0, 16, instance_count_y, 1, 1, 0, c_white, 1);
		}
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(32, instance_count_y, l10n_text("Instance Count") + ": " + string(instance_count), global.default_text_size, c_black, c_white, 1);
	}
	#endregion /* Instance Count END */
	
	#region /* All Instance Count */
	if (global.show_all_instance_count)
	{
		if (global.show_all_instance_count && global.debug_screen)
		{
			draw_sprite_ext(spr_lock_icon, 0, 16, all_instance_count_y, 1, 1, 0, c_white, 1);
		}
		
		#region /* Show what objects are currently in the room */
		for (var i = 0; i < 100; ++i;)
		{
			if (instance_exists(i) && instance_number(i) >= instance_count_target)
			{
				scr_draw_text_outlined(32, all_instance_count_y + (8 * i) + scr_wave(-3, +3, 0.5), string(object_get_name(i)) + ": " + string(instance_number(i)), global.default_text_size, noone, make_color_hsv(instance_number(i), 255, 255), 1);
			}
			else
			if (instance_exists(i))
			{
				scr_draw_text_outlined(32, all_instance_count_y + (8 * i), string(object_get_name(i)) + ": " + string(instance_number(i)), global.default_text_size, noone, make_color_hsv(instance_number(i), 255, 255), 1);
			}
		}
		#endregion /* Show what objects are currently in the room END */
		
	}
	#endregion /* All Instance Count END */
	
	#region /* Controller ports */
	if (os_type == os_switch)
	{
		var description0 = gamepad_get_description(0);
		var description1 = gamepad_get_description(1);
		
		if ((description0 == "Handheld" || description1 == "Handheld") && (description1 != "" || description0 != ""))
		{
			global.player1_slot = 0;
			global.player2_slot = 1;
			global.player3_slot = 2;
			global.player4_slot = 3;
		}
		else
		{
			global.player1_slot = 0;
			global.player2_slot = 1;
			global.player3_slot = 2;
			global.player4_slot = 3;
		}
	}
	else
	{
		global.player1_slot = 0;
		global.player2_slot = 1;
		global.player3_slot = 2;
		global.player4_slot = 3;
	}
	#endregion /* Controller ports END */
	
	if (global.debug_screen)
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		if (gamepad_get_description(0) != "")
		{
			scr_draw_text_outlined(32, 320, "gamepad(0): " + string(gamepad_get_description(0)));
		}
		if (gamepad_get_description(1) != "")
		{
			scr_draw_text_outlined(32, 340, "gamepad(1): " + string(gamepad_get_description(1)));
		}
		if (gamepad_get_description(2) != "")
		{
			scr_draw_text_outlined(32, 360, "gamepad(2): " + string(gamepad_get_description(2)));
		}
		if (gamepad_get_description(3) != "")
		{
			scr_draw_text_outlined(32, 380, "gamepad(3): " + string(gamepad_get_description(3)));
		}
		if (gamepad_get_description(4) != "")
		{
			scr_draw_text_outlined(32, 400, "gamepad(4): " + string(gamepad_get_description(4)));
		}
		scr_draw_text_outlined(32, 420, "player1_slot: " + string(global.player1_slot));
		scr_draw_text_outlined(32, 440, "player2_slot: " + string(global.player2_slot));
		scr_draw_text_outlined(32, 460, "player3_slot: " + string(global.player3_slot));
		scr_draw_text_outlined(32, 480, "player4_slot: " + string(global.player4_slot));
		if (variable_instance_exists(self, "menu"))
		{
			scr_draw_text_outlined(32, 500, "menu: " + string(menu));
		}
		draw_set_halign(fa_center);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32, "current room: " + string(room_get_name(room)));
	}
	
	if (global.debug_screen)
	and (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, 370, 32))
	and (global.controls_used_for_menu_navigation == "mouse")
	{
		draw_set_alpha(0.5);
		draw_rectangle_color(0, 0, 370, 32, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, display_get_gui_width(), 64 + (32 * 12), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(8, 64, l10n_text("This bar is split into sections, with each section being 1/60th of a second. As you can see, the bar is made up of various colours:"), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(8, 64 + (32 * 3), l10n_text("Green - Input / Output processing (ie: keyboard, mouse, gamepad, networking etc...)"), global.default_text_size, noone, c_lime, 1);
		scr_draw_text_outlined(8, 64 + (32 * 4), l10n_text("Red - The update speed of the step event"), global.default_text_size, noone, c_red, 1);
		scr_draw_text_outlined(8, 64 + (32 * 5), l10n_text("Yellow - The time required for the draw event"), global.default_text_size, noone, c_yellow, 1);
		scr_draw_text_outlined(8, 64 + (32 * 6), l10n_text("Orange - Debug update time, which is only normally visible when you use the debug module"), global.default_text_size, noone, c_orange, 1);
		scr_draw_text_outlined(8, 64 + (32 * 7), l10n_text("White - GPU left over time, which is the time spent waiting for the GPU to finish the rendering of the frame before the next one can start"), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(8, 64 + (32 * 8), l10n_text("Cyan - The text rendering time"), global.default_text_size, noone, c_aqua, 1);
		scr_draw_text_outlined(8, 64 + (32 * 9), l10n_text("Grey - The time required to clear screen each draw step"), global.default_text_size, noone, c_grey, 1);
		scr_draw_text_outlined(8, 64 + (32 * 10), l10n_text("Blue - The time required for the Garbage Collector to run"), global.default_text_size, noone, c_blue, 1);
		scr_draw_text_outlined(8, 64 + (32 * 11), l10n_text("Dark Red - The GPU flush, which is how long the GPU takes to clear images from memory"), global.default_text_size, noone, c_maroon, 1);
	}
	
}