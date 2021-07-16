#region /*Show Enter Level Key*/
if (can_move = true)
and(can_enter_level >= 30)
and(asset_get_type("obj_level") == asset_object)
and(distance_to_object(instance_nearest(x, y, obj_level)) < 4)
and(speed = 0)
and(instance_nearest(x, y, obj_level).clear_rate != "closed")
and(global.pause = false)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_outlined(80, window_get_height() - 28, "Enter Level", global.default_text_size, c_black, c_white, 1);
	if (gamepad_is_connected(0))
	and(asset_get_type("spr_xbox_buttons") == asset_sprite)
	{
		draw_sprite_ext(spr_xbox_buttons, 0, 180, window_get_height() - 28, 0.5, 0.5, 0, c_white, 1);
	}
	else
	if (asset_get_type("spr_keyboard_keys") == asset_sprite)
	{
		draw_sprite_ext(spr_keyboard_keys, global.player1_key_jump, 180, window_get_height() - 28, 0.5, 0.5, 0, c_white, 1);
	}
}
#endregion /*Show Enter Level Key END*/

scr_show_fps();

#region /*Have a black screen at the first frame so transitions look natural*/
if (black_screen_at_start_delay<1)
{
	draw_rectangle_color(0,0,window_get_width()*2,window_get_height()*2,c_black,c_black,c_black,c_black,false);
	black_screen_at_start_delay += 1;
}
#endregion /*Have a black screen at the first frame so transitions look natural END*/

#region /*Draw mouse cursor for menu navigation*/
//if (window_has_focus())
if (global.controls_used_for_menu_navigation="mouse")
and(os_type!=os_ios)
and(os_type!=os_android)
and(global.pause = false)
{
	draw_sprite_ext(spr_cursor,0,window_mouse_get_x(),window_mouse_get_y(),1,1,0,c_white,1);
}
#endregion /*Draw mouse cursor for menu navigation END*/