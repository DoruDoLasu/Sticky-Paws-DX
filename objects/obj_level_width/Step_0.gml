if (x < 0)
{
	x = 0;
}

y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5;

#region /* Drag Object */
if (instance_exists(obj_leveleditor))
and (obj_leveleditor.pause == false)
{
	if (!keyboard_check(vk_space))
	and (!mouse_check_button(mb_middle))
	{
		if (mouse_check_button_pressed(mb_left))
		or (obj_leveleditor.key_a_pressed)
		{
			if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
			{
				if (drag_object < true)
				{
					drag_object = true;
					obj_leveleditor.drag_object = true;
				}
			}
		}
	}
	
	#region /* Drag the object */
	if (drag_object == true)
	and (instance_exists(obj_leveleditor))
	and (obj_leveleditor.x > 100)
	{
		x = obj_leveleditor.x;
	}
	#endregion /* Drag the object END */
	
	#region /* Release the object */
	if (mouse_check_button_released(mb_left))
	or (obj_leveleditor.key_a_released)
	{
		if (drag_object == true)
		{
			drag_release_timer = 3;
			drag_object = 0.5;
			obj_leveleditor.drag_object = false;
		}
	}
	#endregion /* Release the object END */
	
}
#endregion /* Drag Object END */

if (drag_release_timer > 0)
{
	drag_release_timer -= 1;
}
else
{
	if (drag_object = 0.5)
	{
		drag_object = false;
	}
}

if (global.play_edited_level == true)
or (global.actually_play_edited_level == true)
{
	room_width = bbox_left;
	instance_destroy();
}