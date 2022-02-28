depth = +9;

#region /*If enemies are disabled, destroy this object*/
if (global.assist_enable = true)
and (global.assist_enable_enemies = false)
{
	instance_destroy();
}
#endregion /*If enemies are disabled, destroy this object END*/

if (die_volting = -1)
or(die_volting = +1)
{
	depth = -900;
	if (die_volting = -1)
	{
		image_angle -= 20;
		hspeed = +4;
	}
	else
	{
		image_angle += 20;
		hspeed = -4;
	}
	
	#region /*Set the gravity*/
	gravity_direction = 270; /*Direction of the gravity*/
	gravity = 0.5; /*The gravity*/
	#endregion /*Set the gravity END*/
	
	sprite_used = "stand";
	sprite_index = global.resourcepack_sprite_big_stationary_enemy;
}
else
{

	#region /*Set the gravity*/
	gravity_direction = 270; /*Direction of the gravity*/
	if (asset_get_type("obj_wall") == asset_object)
	and (!place_meeting(x, y + 1, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	{
		if (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		and (x > camera_get_view_x(view_camera[view_current]))
		and (y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
		and (y > camera_get_view_y(view_camera[view_current]))
		{
			gravity = 0.5; /*The gravity*/
		}
	}
	else
	{
		gravity = 0;
	}
	#endregion /*Set the gravity END*/
	
	if (flat = true)
	{
		speed = 0;
		if (image_index > image_number - 1)
		{
			image_speed = 0;
		}
		else
		{
			image_speed = 0.5;
		}
		sprite_used = "flattened";
		sprite_index = global.resourcepack_sprite_big_stationary_enemy_flattened;
		if (image_index > image_number - 1)
		{
			effect_create_above(ef_smoke, x, y, 2, c_white);
			instance_destroy();
		}
	}
	else
	{
		sprite_used = "stand";
		sprite_index = global.resourcepack_sprite_big_stationary_enemy;
	}
}
mask_index = mask;

if (asset_get_type("obj_player") == asset_object)
{
	if (instance_number(obj_player) > 0)
	{
		if (die = false)
		{
			if (instance_nearest(x, y, obj_player).x < x)
			{
				image_xscale = -1;
			}
			else
			{
				image_xscale = +1;
			}
		}
	}
}

#region /*Don't move outside view*/
if (x - 42 > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
or (x + 42 < camera_get_view_x(view_camera[view_current]))
{
	hspeed = 0;
	vspeed = 0;
	speed = 0;
	gravity = 0;
}
if (y + 16 < camera_get_view_y(view_camera[view_current]))
and (!place_meeting(x, y + 1, obj_wall))
and (!place_meeting(x, y + 1, obj_semisolid_platform))
and (flat = true)
and (vspeed < 0)
{
	vspeed = +1;
}
#endregion /*Don't move outside view END*/

#region /*Kill enemy if it's inside the wall*/
if (position_meeting(x, y, obj_wall))
and (die = false)
and (draw_xscale >= 0.8)
{
	stuck_in_wall_counter += 1;
	if (stuck_in_wall_counter >= 3)
	{
		flat = false;
		die = true;
		die_volting = true;
	}
}
else
{
	if (stuck_in_wall_counter > 0)
	{
		stuck_in_wall_counter -= 1;
	}
}
#endregion /*Kill enemy if it's inside the wall END*/