#region /* Draw level sprite */
if (asset_get_type("spr_level_ring") == asset_sprite)
{
	draw_sprite_ext(spr_level_ring, image_index, x, y, image_xscale, image_yscale, image_angle, ring_color, image_alpha);
}
if (asset_get_type("spr_level") == asset_sprite)
{
	draw_sprite_ext(spr_level, image_index, x, y, image_xscale, image_yscale, image_angle, level_color, image_alpha);
}
if (asset_get_type("spr_level_crown") == asset_sprite)
{
	draw_sprite_ext(spr_level_crown, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, level_perfect);
}
#endregion /* Draw level sprite END */

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (level_number != 0)
{
	scr_draw_text_outlined(x, y, string(level_number), global.default_text_size * 2, c_black, c_white, image_alpha);
}

#region /* Show if Checkpoint is activated */
if (checkpoint_x > 0)
&& (asset_get_type("spr_checkpoint") == asset_sprite)
or(checkpoint_y > 0)
&& (asset_get_type("spr_checkpoint") == asset_sprite)
{
	draw_sprite_ext(spr_checkpoint, 1, x + 32, y, 0.5, 0.5, 0, c_white, 1);
}
#endregion /* Show if Checkpoint is activated END */