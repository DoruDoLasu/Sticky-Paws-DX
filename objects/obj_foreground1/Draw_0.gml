#region /* Destroy this object if it ever appears in the wrong room */
if (asset_get_type("room_title") == asset_room)
&& (room == room_title)
{
	instance_destroy();
}
#endregion /* Destroy this object if it ever appears in the wrong room END */

x = 0;
y = 0;
draw_set_alpha(image_alpha);
instance_activate_object(self);

#region /* Update Foreground1 */
if (global.custom_foreground1 > noone)
&& (global.enable_foreground_layer1)
&& (global.full_level_map_screenshot == false)
&& (asset_get_type("room_leveleditor") == asset_room)
&& (room == room_leveleditor)
{
	if (sprite_exists(global.custom_foreground1))
	{
		draw_sprite(global.custom_foreground1, image_index, x_offset, y_offset);
	}
}
#endregion /* Update Foreground1 END */
draw_set_alpha(1);