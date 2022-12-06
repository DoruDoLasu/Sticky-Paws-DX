function scr_set_controls_used_to_navigate()
{
	
	#region /* Set what controls are used to navigate the game */
	
	var mouse_moving = point_distance(mouse_x_position, mouse_y_position, window_mouse_get_x(), window_mouse_get_y()); /* Get distance from fake mouse to real mouse */
	mouse_x_position = window_mouse_get_x(); /* Update x position of fake mouse only after setting var mouse moving */
	mouse_y_position = window_mouse_get_y(); /* Update y position of fake mouse only after setting var mouse moving */
	
	if (keyboard_check(vk_anykey)) /* If pressing keyboard keys, then set "keyboard" as the navigation method */
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.show_controller_input_change_prompt = 0;
			if (global.controls_used_for_menu_navigation == "controller")
			{
				obj_camera.show_keyboard_and_mouse_input_change_prompt = 100;
			}
			else
			{
				global.controls_used_for_menu_navigation = "keyboard";
			}
		}
		else
		{
			global.controls_used_for_menu_navigation = "keyboard";
		}
		if (instance_exists(obj_camera))
		{
			obj_camera.reset_game_if_no_interactivity = 0;
			obj_camera.reset_game_if_no_interactivity_second_countdown_timer = 0;
			obj_camera.reset_game_if_no_interactivity_second_countdown = 60;
		}
		if (instance_exists(obj_camera_map))
		{
			obj_camera_map.reset_game_if_no_interactivity = 0;
			obj_camera_map.reset_game_if_no_interactivity_second_countdown_timer = 0;
			obj_camera_map.reset_game_if_no_interactivity_second_countdown = 60;
		}
	}
	
	else
	
	if (mouse_check_button(mb_any)) /* If pressing mouse buttons or moving mouse, then set "mouse" as the navigation method */
	or (mouse_wheel_down())
	or (mouse_wheel_up())
	or (mouse_moving)
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.show_controller_input_change_prompt = 0;
			if (global.controls_used_for_menu_navigation == "controller")
			{
				obj_camera.show_keyboard_and_mouse_input_change_prompt = 100;
			}
			else
			{
				global.controls_used_for_menu_navigation = "mouse";
			}
		}
		else
		{
			global.controls_used_for_menu_navigation = "mouse";
		}
		if (instance_exists(obj_camera))
		{
			obj_camera.reset_game_if_no_interactivity = 0;
			obj_camera.reset_game_if_no_interactivity_second_countdown_timer = 0;
			obj_camera.reset_game_if_no_interactivity_second_countdown = 60;
		}
		if (instance_exists(obj_camera_map))
		{
			obj_camera_map.reset_game_if_no_interactivity = 0;
			obj_camera_map.reset_game_if_no_interactivity_second_countdown_timer = 0;
			obj_camera_map.reset_game_if_no_interactivity_second_countdown = 60;
		}
	}
	
	else
	
	if (gamepad_button_check(0, gp_face1)) /* If pressing gamepad buttons, then set "gamepad" as the navigation method */
	or (gamepad_button_check(0, gp_face2))
	or (gamepad_button_check(0, gp_face3))
	or (gamepad_button_check(0, gp_face4))
	or (gamepad_button_check(0, gp_padd))
	or (gamepad_button_check(0, gp_padl))
	or (gamepad_button_check(0, gp_padr))
	or (gamepad_button_check(0, gp_padu))
	or (gamepad_button_check(0, gp_select))
	or (gamepad_button_check(0, gp_shoulderl))
	or (gamepad_button_check(0, gp_shoulderlb))
	or (gamepad_button_check(0, gp_shoulderr))
	or (gamepad_button_check(0, gp_shoulderrb))
	or (gamepad_button_check(0, gp_start))
	or (gamepad_button_check(0, gp_stickl))
	or (gamepad_button_check(0, gp_stickr))
	or (gamepad_axis_value(0, gp_axislh) <> 0)
	or (gamepad_axis_value(0, gp_axislv) <> 0)
	or (gamepad_axis_value(0, gp_axisrh) <> 0)
	or (gamepad_axis_value(0, gp_axisrv) <> 0)
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.show_keyboard_and_mouse_input_change_prompt = 0;
			if (global.controls_used_for_menu_navigation != "controller")
			{
				global.controls_used_for_menu_navigation = "controller";
				obj_camera.show_controller_input_change_prompt = 100;
			}
		}
		else
		{
			global.controls_used_for_menu_navigation = "controller";
		}
		if (instance_exists(obj_camera))
		{
			obj_camera.reset_game_if_no_interactivity = 0;
			obj_camera.reset_game_if_no_interactivity_second_countdown_timer = 0;
			obj_camera.reset_game_if_no_interactivity_second_countdown = 60;
		}
		if (instance_exists(obj_camera_map))
		{
			obj_camera_map.reset_game_if_no_interactivity = 0;
			obj_camera_map.reset_game_if_no_interactivity_second_countdown_timer = 0;
			obj_camera_map.reset_game_if_no_interactivity_second_countdown = 60;
		}
	}
	
	#endregion /* Set what controls are used to navigate the game END */
	
	if (instance_exists(obj_camera))
	or (instance_exists(obj_camera_map))
	{
		if (gamepad_button_check(1, gp_face1))
		or (gamepad_button_check(1, gp_face2))
		or (gamepad_button_check(1, gp_face3))
		or (gamepad_button_check(1, gp_face4))
		or (gamepad_button_check(1, gp_padd))
		or (gamepad_button_check(1, gp_padl))
		or (gamepad_button_check(1, gp_padr))
		or (gamepad_button_check(1, gp_padu))
		or (gamepad_button_check(1, gp_select))
		or (gamepad_button_check(1, gp_shoulderl))
		or (gamepad_button_check(1, gp_shoulderlb))
		or (gamepad_button_check(1, gp_shoulderr))
		or (gamepad_button_check(1, gp_shoulderrb))
		or (gamepad_button_check(1, gp_start))
		or (gamepad_button_check(1, gp_stickl))
		or (gamepad_button_check(1, gp_stickr))
		or (gamepad_axis_value(1, gp_axislh) <> 0)
		or (gamepad_axis_value(1, gp_axislv) <> 0)
		or (gamepad_axis_value(1, gp_axisrh) <> 0)
		or (gamepad_axis_value(1, gp_axisrv) <> 0)
	
		or (gamepad_button_check(2, gp_face1))
		or (gamepad_button_check(2, gp_face2))
		or (gamepad_button_check(2, gp_face3))
		or (gamepad_button_check(2, gp_face4))
		or (gamepad_button_check(2, gp_padd))
		or (gamepad_button_check(2, gp_padl))
		or (gamepad_button_check(2, gp_padr))
		or (gamepad_button_check(2, gp_padu))
		or (gamepad_button_check(2, gp_select))
		or (gamepad_button_check(2, gp_shoulderl))
		or (gamepad_button_check(2, gp_shoulderlb))
		or (gamepad_button_check(2, gp_shoulderr))
		or (gamepad_button_check(2, gp_shoulderrb))
		or (gamepad_button_check(2, gp_start))
		or (gamepad_button_check(2, gp_stickl))
		or (gamepad_button_check(2, gp_stickr))
		or (gamepad_axis_value(2, gp_axislh) <> 0)
		or (gamepad_axis_value(2, gp_axislv) <> 0)
		or (gamepad_axis_value(2, gp_axisrh) <> 0)
		or (gamepad_axis_value(2, gp_axisrv) <> 0)
	
		or (gamepad_button_check(3, gp_face1))
		or (gamepad_button_check(3, gp_face2))
		or (gamepad_button_check(3, gp_face3))
		or (gamepad_button_check(3, gp_face4))
		or (gamepad_button_check(3, gp_padd))
		or (gamepad_button_check(3, gp_padl))
		or (gamepad_button_check(3, gp_padr))
		or (gamepad_button_check(3, gp_padu))
		or (gamepad_button_check(3, gp_select))
		or (gamepad_button_check(3, gp_shoulderl))
		or (gamepad_button_check(3, gp_shoulderlb))
		or (gamepad_button_check(3, gp_shoulderr))
		or (gamepad_button_check(3, gp_shoulderrb))
		or (gamepad_button_check(3, gp_start))
		or (gamepad_button_check(3, gp_stickl))
		or (gamepad_button_check(3, gp_stickr))
		or (gamepad_axis_value(3, gp_axislh) <> 0)
		or (gamepad_axis_value(3, gp_axislv) <> 0)
		or (gamepad_axis_value(3, gp_axisrh) <> 0)
		or (gamepad_axis_value(3, gp_axisrv) <> 0)
		{
			if (instance_exists(obj_camera))
			{
				obj_camera.reset_game_if_no_interactivity = 0;
				obj_camera.reset_game_if_no_interactivity_second_countdown_timer = 0;
				obj_camera.reset_game_if_no_interactivity_second_countdown = 60;
			}
			if (instance_exists(obj_camera_map))
			{
				obj_camera_map.reset_game_if_no_interactivity = 0;
				obj_camera_map.reset_game_if_no_interactivity_second_countdown_timer = 0;
				obj_camera_map.reset_game_if_no_interactivity_second_countdown = 60;
			}
		}
	}
	
	if (instance_exists(obj_title))
	{
		if (keyboard_check(vk_anykey))
		or (mouse_check_button(mb_any))
		or (mouse_wheel_down())
		or (mouse_wheel_up())
		or (instance_exists(obj_camera))
		and (mouse_moving)
		and (global.play_attract_demo = false)

		or (gamepad_button_check(0, gp_face1))
		or (gamepad_button_check(0, gp_face2))
		or (gamepad_button_check(0, gp_face3))
		or (gamepad_button_check(0, gp_face4))
		or (gamepad_button_check(0, gp_padd))
		or (gamepad_button_check(0, gp_padl))
		or (gamepad_button_check(0, gp_padr))
		or (gamepad_button_check(0, gp_padu))
		or (gamepad_button_check(0, gp_select))
		or (gamepad_button_check(0, gp_shoulderl))
		or (gamepad_button_check(0, gp_shoulderlb))
		or (gamepad_button_check(0, gp_shoulderr))
		or (gamepad_button_check(0, gp_shoulderrb))
		or (gamepad_button_check(0, gp_start))
		or (gamepad_button_check(0, gp_stickl))
		or (gamepad_button_check(0, gp_stickr))
		or (gamepad_axis_value(0, gp_axislh) <> 0)
		or (gamepad_axis_value(0, gp_axislv) <> 0)
		or (gamepad_axis_value(0, gp_axisrh) <> 0)
		or (gamepad_axis_value(0, gp_axisrv) <> 0)

		or (gamepad_button_check(1, gp_face1))
		or (gamepad_button_check(1, gp_face2))
		or (gamepad_button_check(1, gp_face3))
		or (gamepad_button_check(1, gp_face4))
		or (gamepad_button_check(1, gp_padd))
		or (gamepad_button_check(1, gp_padl))
		or (gamepad_button_check(1, gp_padr))
		or (gamepad_button_check(1, gp_padu))
		or (gamepad_button_check(1, gp_select))
		or (gamepad_button_check(1, gp_shoulderl))
		or (gamepad_button_check(1, gp_shoulderlb))
		or (gamepad_button_check(1, gp_shoulderr))
		or (gamepad_button_check(1, gp_shoulderrb))
		or (gamepad_button_check(1, gp_start))
		or (gamepad_button_check(1, gp_stickl))
		or (gamepad_button_check(1, gp_stickr))
		or (gamepad_axis_value(1, gp_axislh) <> 0)
		or (gamepad_axis_value(1, gp_axislv) <> 0)
		or (gamepad_axis_value(1, gp_axisrh) <> 0)
		or (gamepad_axis_value(1, gp_axisrv) <> 0)

		or (gamepad_button_check(2, gp_face1))
		or (gamepad_button_check(2, gp_face2))
		or (gamepad_button_check(2, gp_face3))
		or (gamepad_button_check(2, gp_face4))
		or (gamepad_button_check(2, gp_padd))
		or (gamepad_button_check(2, gp_padl))
		or (gamepad_button_check(2, gp_padr))
		or (gamepad_button_check(2, gp_padu))
		or (gamepad_button_check(2, gp_select))
		or (gamepad_button_check(2, gp_shoulderl))
		or (gamepad_button_check(2, gp_shoulderlb))
		or (gamepad_button_check(2, gp_shoulderr))
		or (gamepad_button_check(2, gp_shoulderrb))
		or (gamepad_button_check(2, gp_start))
		or (gamepad_button_check(2, gp_stickl))
		or (gamepad_button_check(2, gp_stickr))
		or (gamepad_axis_value(2, gp_axislh) <> 0)
		or (gamepad_axis_value(2, gp_axislv) <> 0)
		or (gamepad_axis_value(2, gp_axisrh) <> 0)
		or (gamepad_axis_value(2, gp_axisrv) <> 0)

		or (gamepad_button_check(3, gp_face1))
		or (gamepad_button_check(3, gp_face2))
		or (gamepad_button_check(3, gp_face3))
		or (gamepad_button_check(3, gp_face4))
		or (gamepad_button_check(3, gp_padd))
		or (gamepad_button_check(3, gp_padl))
		or (gamepad_button_check(3, gp_padr))
		or (gamepad_button_check(3, gp_padu))
		or (gamepad_button_check(3, gp_select))
		or (gamepad_button_check(3, gp_shoulderl))
		or (gamepad_button_check(3, gp_shoulderlb))
		or (gamepad_button_check(3, gp_shoulderr))
		or (gamepad_button_check(3, gp_shoulderrb))
		or (gamepad_button_check(3, gp_start))
		or (gamepad_button_check(3, gp_stickl))
		or (gamepad_button_check(3, gp_stickr))
		or (gamepad_axis_value(3, gp_axislh) <> 0)
		or (gamepad_axis_value(3, gp_axislv) <> 0)
		or (gamepad_axis_value(3, gp_axisrh) <> 0)
		or (gamepad_axis_value(3, gp_axisrv) <> 0)
		{
			audio_stop_sound(obj_title.trailer_sound);
			video_pause();
			obj_title.play_attract_demo_time = 0;
			global.play_attract_demo = false;
		}
	}
}