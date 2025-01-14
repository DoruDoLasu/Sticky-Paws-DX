#region /* Set the gravity */
gravity_direction = 270; /* Direction of the gravity */
if (!place_meeting(x, y + 1, obj_wall))
&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
{
	gravity = 0.5; /* The gravity */
}
else
{
	gravity = 0;
}
#endregion /* Set the gravity END */

#region /* If inside wall, destroy yourself */
if (position_meeting(x, y, obj_wall))
{
	instance_destroy();
}
#endregion /* If inside wall, destroy yourself END */

if (instance_exists(obj_player))
{
	if (allow_move)
	{
		if (dir = +1)
		{
			if (instance_nearest(x, y, obj_player).x > x)
			&& (instance_nearest(x, y, obj_player).hspeed >+ 2)
			{
				hspeed = instance_nearest(x, y, obj_player).hspeed;
				if (hspeed >+8)
				{
					hspeed = + 8;
				}
			}
			else
			{
				hspeed = +2;
			}
		}
		else
		{
			if (instance_nearest(x, y, obj_player).x < x)
			&& (instance_nearest(x, y, obj_player).hspeed <- 2)
			{
				hspeed = instance_nearest(x, y, obj_player).hspeed;
				if (hspeed <- 8)
				{
					hspeed = - 8;
				}
			}
			else
			{
				hspeed = - 2;
			}
		}
	}
	else
	{
		hspeed = 0;
	}
	if (place_meeting(x, y, obj_player))
	&& (bounce_up == false)
	{
		if (instance_nearest(x, y, obj_player).have_heart_balloon == false)
		{
			with(instance_nearest(x, y, obj_player))
			{
				have_heart_balloon = true;
				hp = max_hp; /* Refill HP to max */
				xx_heart = x;
				yy_heart = y;
				
				#region /* Save heart balloon to be true */
				if (player == 1)
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player1_have_heart_balloon", true);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				if (player == 2)
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player2_have_heart_balloon", true);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				if (player == 3)
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player3_have_heart_balloon", true);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				if (player == 4)
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player4_have_heart_balloon", true);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				#endregion /* Save heart balloon to be true END */
				
			}
		}
		else
		{
			#region /* 10 Basic Collectibles */
			scr_audio_play(snd_basic_collectible, volume_source.sound);
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 10;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 20;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 30;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 40;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 50;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 60;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 70;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 80;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 90;
			}
			#endregion /* 10 Basic Collectibles END */
		}
		#region /* 1000 Score */
		score += 1000;
		with(instance_create_depth(x, y, 0, obj_score_up))
		{
			score_up = 1000;
		}
		#endregion /* 1000 Score END */
		effect_create_below(ef_ring, x, y, 1, c_white);
		instance_destroy();
	}
}

#region /* When falling, it's not bouncing up anymore */
if (vspeed >= 0)
{
	bounce_up = false;
}
#endregion /* When falling, it's not bouncing up anymore END */

if (place_meeting(x - 1, y, obj_wall))
{
	dir = +1;
}
if (place_meeting(x + 1, y, obj_wall))
{
	dir =- 1;
}
if (place_meeting(x, y - 1, obj_wall))
{
	vspeed = +4;
}

#region /* Expanding Ring Effect */
effect_time ++;
if (effect_time > 60)
{
	effect_time = 0;
	effect_create_below(ef_ring, x, y, 1, c_white);
}
#endregion /* Expanding Ring Effect END */