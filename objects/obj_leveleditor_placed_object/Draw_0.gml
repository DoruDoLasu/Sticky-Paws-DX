key_a=(gamepad_button_check(0,gp_face1))or(keyboard_check(global.player1_key_jump));
key_a_pressed=(gamepad_button_check_pressed(0,gp_face1))or(keyboard_check_pressed(global.player1_key_jump));
key_a_released=(gamepad_button_check_released(0,gp_face1))or(keyboard_check_released(global.player1_key_jump));
key_b=(gamepad_button_check(0,gp_face2))or(keyboard_check(global.player1_key_sprint));

#region /*if current undo value is less than this objects undo value, then delete this object*/
if (asset_get_type("obj_leveleditor")==asset_object)
and(instance_exists(obj_leveleditor))
and(undo_value>obj_leveleditor.current_undo_value)
{
	if (obj_leveleditor.current_undo_value>-1)
	{
		undo_value_visible=false;
	}
	if (obj_leveleditor.quit_level_editor>0)
	{
		instance_destroy();
	}
}
if (asset_get_type("obj_leveleditor")==asset_object)
and(instance_exists(obj_leveleditor))
and(undo_value<=obj_leveleditor.current_undo_value)
{
	undo_value_visible=true;
}
#endregion /*if current undo value is less than this objects undo value, then delete this object END*/

#region /*Make sprite transparent if you're setting difficulty levels*/
if (asset_get_type("obj_leveleditor")==asset_object)
and(instance_exists(obj_leveleditor))
and(sprite_index>noone)
{

	#region /*Show only normal difficulty layer in regular colors when saving a thumbnail*/
	if (obj_leveleditor.quit_level_editor>=true)
	and(normal=true)
	{
		draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_white,1);
		image_alpha = 1;
		image_blend = c_white;
	}
	else
	#endregion /*Show only normal difficulty layer in regular colors when saving a thumbnail END*/

	#region /*All layer*/
	if (obj_leveleditor.difficulty_layer=0)
	and(obj_leveleditor.quit_level_editor=false)
	{
		#region /*Transparent Object*/
		if (easy=true)
		and(normal=false)
		and(hard=false)
		{
			draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_lime,0.1);
			image_alpha = 0.1;
			image_blend = c_lime;
		}
		else
		if (easy=true)
		and(normal=true)
		and(hard=false)
		{
			draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_white,0.1);
			image_alpha = 0.1;
			image_blend = c_white;
		}
		else
		if (easy=false)
		and(normal=true)
		and(hard=false)
		{
			draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_yellow,0.1);
			image_alpha = 0.1;
			image_blend = c_yellow;
		}
		else
		if (easy=false)
		and(normal=true)
		and(hard=true)
		{
			draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_white,0.1);
			image_alpha = 0.1;
			image_blend = c_white;
		}
		else
		if (easy=false)
		and(normal=false)
		and(hard=true)
		{
			draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_red,0.1);
			image_alpha = 0.1;
			image_blend = c_red;
		}
		else
		if (easy=true)
		and(normal=false)
		and(hard=true)
		{
			draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_white,0.1);
			image_alpha = 0.1;
			image_blend = c_white;
		}
		#endregion /*Transparent Object END*/
	
		else
		if (easy=true)
		and(normal=true)
		and(hard=true)
		{
			draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_white,1);
			image_alpha = 1;
			image_blend = c_white;
		}
	}
	else
	#endregion /*All layer END*/

	#region /*Easy layer*/
	if (obj_leveleditor.difficulty_layer=1)
	and(obj_leveleditor.quit_level_editor=false)
	{
		if (easy=true)
		{
			draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_lime,1);
			image_alpha = 1;
			image_blend = c_lime;
		}
		else
		{
			#region /*Transparent Object*/
			if (easy=true)
			and(normal=false)
			and(hard=false)
			{
				draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_lime,0.1);
				image_alpha = 0.1;
				image_blend = c_lime;
			}
			else
			if (easy=true)
			and(normal=true)
			and(hard=false)
			{
				draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_white,0.1);
				image_alpha = 0.1;
				image_blend = c_white;
			}
			else
			if (easy=false)
			and(normal=true)
			and(hard=false)
			{
				draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_yellow,0.1);
				image_alpha = 0.1;
				image_blend = c_yellow;
			}
			else
			if (easy=false)
			and(normal=true)
			and(hard=true)
			{
				draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_white,0.1);
				image_alpha = 0.1;
				image_blend = c_white;
			}
			else
			if (easy=false)
			and(normal=false)
			and(hard=true)
			{
				draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_red,0.1);
				image_alpha = 0.1;
				image_blend = c_red;
			}
			else
			if (easy=true)
			and(normal=false)
			and(hard=true)
			{
				draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_white,0.1);
				image_alpha = 0.1;
				image_blend = c_white;
			}
			#endregion /*Transparent Object END*/
		}
	}
	#endregion /*Easy layer END*/

	#region /*Normal layer*/
	if (obj_leveleditor.difficulty_layer=2)
	and(obj_leveleditor.quit_level_editor=false)
	{
		if (normal=true)
		{
			draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_yellow,1);
			image_alpha = 1;
			image_blend = c_yellow;
		}
		else
		{
			#region /*Transparent Object*/
			if (easy=true)
			and(normal=false)
			and(hard=false)
			{
				draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_lime,0.1);
				image_alpha = 0.1;
				image_blend = c_lime;
			}
			else
			if (easy=true)
			and(normal=true)
			and(hard=false)
			{
				draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_white,0.1);
				image_alpha = 0.1;
				image_blend = c_white;
			}
			else
			if (easy=false)
			and(normal=true)
			and(hard=false)
			{
				draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_yellow,0.1);
				image_alpha = 0.1;
				image_blend = c_yellow;
			}
			else
			if (easy=false)
			and(normal=true)
			and(hard=true)
			{
				draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_white,0.1);
				image_alpha = 0.1;
				image_blend = c_white;
			}
			else
			if (easy=false)
			and(normal=false)
			and(hard=true)
			{
				draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_red,0.1);
				image_alpha = 0.1;
				image_blend = c_red;
			}
			else
			if (easy=true)
			and(normal=false)
			and(hard=true)
			{
				draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_white,0.1);
				image_alpha = 0.1;
				image_blend = c_white;
			}
			#endregion /*Transparent Object END*/
		}
	}
	#endregion /*Normal layer END*/

	#region /*Hard layer*/
	if (obj_leveleditor.difficulty_layer=3)
	and(obj_leveleditor.quit_level_editor=false)
	{
		if (hard=true)
		{
			draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_red,1);
			image_alpha = 1;
			image_blend = c_red;
		}
		else
		{
			#region /*Transparent Object*/
			if (easy=true)
			and(normal=false)
			and(hard=false)
			{
				draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_lime,0.1);
				image_alpha = 0.1;
				image_blend = c_lime;
			}
			else
			if (easy=true)
			and(normal=true)
			and(hard=false)
			{
				draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_white,0.1);
				image_alpha = 0.1;
				image_blend = c_white;
			}
			else
			if (easy=false)
			and(normal=true)
			and(hard=false)
			{
				draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_yellow,0.1);
				image_alpha = 0.1;
				image_blend = c_yellow;
			}
			else
			if (easy=false)
			and(normal=true)
			and(hard=true)
			{
				draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_white,0.1);
				image_alpha = 0.1;
				image_blend = c_white;
			}
			else
			if (easy=false)
			and(normal=false)
			and(hard=true)
			{
				draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_red,0.1);
				image_alpha = 0.1;
				image_blend = c_red;
			}
			else
			if (easy=true)
			and(normal=false)
			and(hard=true)
			{
				draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_white,0.1);
				image_alpha = 0.1;
				image_blend = c_white;
			}
			#endregion /*Transparent Object END*/
		}
	}
	#endregion /*Hard layer END*/

}
else
if (sprite_index>noone)
{
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,draw_angle,c_white,1);
	image_alpha = 1;
	image_blend = c_white;
}
#endregion /*Make sprite transparent if you're setting difficulty levels END*/

#region /*if all dificulty variables are false, then delete the object*/
if (easy=false)
and(normal=false)
and(hard=false)
{
	instance_destroy();
}
#endregion /*if all dificulty variables are false, then delete the object END*/

#region /*Make object change difficulty layer depending on what difficulty layer is selected*/
if (asset_get_type("obj_leveleditor")==asset_object)
and(instance_exists(obj_leveleditor))
and(obj_leveleditor.difficulty_layer>0)
and(obj_leveleditor.drag_object=false)
and(obj_leveleditor.pause=false)
and(!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, +192, room_height * 2))
and(!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width()-256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
and(!keyboard_check(vk_space))
and(!mouse_check_button(mb_middle))
{
	if (obj_leveleditor.erase_mode=true)
	and(mouse_check_button(mb_left))
	or(mouse_check_button(mb_right))
	{
		if (position_meeting(obj_leveleditor.x,obj_leveleditor.y,id))
		
		/*Erase brush size 1*/
		or(obj_leveleditor.erase_brush_size>=1)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y,id))
		or(obj_leveleditor.erase_brush_size>=1)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y+32,id))
		or(obj_leveleditor.erase_brush_size>=1)and(position_meeting(obj_leveleditor.x,obj_leveleditor.y+32,id))
		/*Erase brush size 1 END*/
		
		/*Erase brush size 2*/
		or(obj_leveleditor.erase_brush_size>=2)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y-32,id))
		or(obj_leveleditor.erase_brush_size>=2)and(position_meeting(obj_leveleditor.x,obj_leveleditor.y-32,id))
		or(obj_leveleditor.erase_brush_size>=2)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y-32,id))
		or(obj_leveleditor.erase_brush_size>=2)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y,id))
		or(obj_leveleditor.erase_brush_size>=2)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y+32,id))
		/*Erase brush size 2 END*/
		
		/*Erase brush size 3*/
		or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y-32,id))
		or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y,id))
		or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y+32,id))
		or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y+64,id))
		or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y+64,id))
		or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x,obj_leveleditor.y+64,id))
		or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y+64,id))
		/*Erase brush size 3 END*/
		
		/*Erase brush size 4*/
		or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y-64,id))
		or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y-64,id))
		or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x,obj_leveleditor.y-64,id))
		or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y-64,id))
		or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y-64,id))
		or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y-32,id))
		or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y,id))
		or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y+32,id))
		or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y+64,id))
		/*Erase brush size 4 END*/
		
		/*Erase brush size 5*/
		or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y-64,id))
		or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y-32,id))
		or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y,id))
		or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y+32,id))
		or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y+64,id))
		or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y+96,id))
		or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y+96,id))
		or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y+96,id))
		or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x,obj_leveleditor.y+96,id))
		or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y+96,id))
		or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y+96,id))
		/*Erase brush size 5 END*/
		
		{
			if (obj_leveleditor.difficulty_layer=1)
			{
				if (easy=true)
				{
					easy=false;
				}
			}
			else
			if (obj_leveleditor.difficulty_layer=2)
			{
				if (normal=true)
				{
					normal=false;
				}
			}
			else
			if (obj_leveleditor.difficulty_layer=3)
			{
				if (hard=true)
				{
					hard=false;
				}
			}
		}
	}
}
#endregion /*Make object change difficulty layer depending on what difficulty layer is selected END*/

#region /*Initialize object mask*/
if (asset_get_type("spr_wall")==asset_sprite)
{
	mask_index=spr_wall;
}
image_speed=0;
image_index=0;
#endregion /*Initialize object mask END*/

if (delay<3)
{
	delay+=1;
}

if (asset_get_type("obj_leveleditor")==asset_object)
and(instance_exists(obj_leveleditor))
and(delay=3)
{
	#region /*Destroy if erased or placed outside room*/
	if (asset_get_type("obj_level_start")==asset_object)
	and(instance_exists(obj_level_start))
	and(place_meeting(x,y,obj_level_start))
	and(obj_leveleditor.drag_object=false)
	and(obj_level_start.drag_object=false)
	or(asset_get_type("obj_level_end")==asset_object)
	and(instance_exists(obj_level_end))
	and(place_meeting(x,y,obj_level_end))
	and(obj_leveleditor.drag_object=false)
	and(obj_level_end.drag_object=false)
	or(x<0)
	or(x>room_width)
	or(y<0)
	or(y>room_height)
	{
		#region /*Reset Level Editor Checkpoint*/
		if (asset_get_type("room_leveleditor")==asset_room)
		and(room=room_leveleditor)
		{
			if (!directory_exists(working_directory+"/Custom Levels"))
			{
				directory_create(working_directory+"/Custom Levels");
			}
			#region /*Create directory for saving custom levels*/
			ini_open(working_directory+"/Custom Levels/custom_level_save.ini");
			ini_key_delete("Level"+string(global.level_editor_level),"x_checkpoint");
			ini_key_delete("Level"+string(global.level_editor_level),"y_checkpoint");
			ini_key_delete("Level"+string(global.level_editor_level),"checkpoint_millisecond");
			ini_key_delete("Level"+string(global.level_editor_level),"checkpoint_second");
			ini_key_delete("Level"+string(global.level_editor_level),"checkpoint_minute");
			ini_key_delete("Level"+string(global.level_editor_level),"checkpoint_realmillisecond");
			ini_close();
			#endregion /*Create directory for saving custom levels END*/
		}
		#endregion /*Reset Level Editor Checkpoint END*/
		instance_destroy();
	}
	#endregion /*Destroy if erased or placed outside room END*/
}

#region /*Modify Objects*/
if (!keyboard_check(vk_space))
and(!mouse_check_button(mb_middle))
and(!mouse_check_button(mb_right))
and(delay>1)
{
	if (keyboard_check_pressed(ord("Q")))
	{
		if (asset_get_type("obj_leveleditor")==asset_object)
		and(instance_exists(obj_leveleditor))
		{
			if (position_meeting(obj_leveleditor.x,obj_leveleditor.y,id))
			and(obj_leveleditor.pause=false)
			{
				if (asset_get_type("obj_leveleditor")==asset_object)
				{
					with(obj_leveleditor)
					{
						move_snap(global.grid_hsnap,global.grid_vsnap); /*Make sure to always move snap*/
					}
				}
				
				#region /*Change bump in ground to it's different forms*/
				if (object=28)
				{
					object=29;
				}
				else
				if (object=29)
				{
					object=30;
				}
				else
				if (object=30)
				{
					object=31;
				}
				else
				if (object=31)
				{
					object=32;
				}
				else
				if (object=32)
				{
					object=33;
				}
				else
				if (object=33)
				{
					object=34;
				}
				else
				if (object=34)
				{
					object=35;
				}
				else
				if (object=35)
				{
					object=36;
				}
				else
				if (object=36)
				{
					object=37;
				}
				else
				if (object=37)
				{
					object=38;
				}
				else
				if (object=38)
				{
					object=39;
				}
				else
				if (object=39)
				{
					object=28;
				}
				#endregion /*Change bump in ground to it's different forms END*/				
				
				#region /*Change Basic Collectible Direction*/
				else
				if (object=40)
				{
					object=41;
				}
				else
				if (object=41)
				{
					object=42;
				}
				else
				if (object=42)
				{
					object=43;
				}
				else
				if (object=43)
				{
					object=44;
				}
				else
				if (object=44)
				{
					object=45;
				}
				else
				if (object=45)
				{
					object=46;
				}
				else
				if (object=46)
				{
					object=47;
				}
				else
				if (object=47)
				{
					object=40;
				}
				#endregion /*Change Basic Collectible Direction*/
				
				#region /*Change Big Collectible*/
				else
				if (object=48)
				{
					object=49;
				}
				else
				if (object=49)
				{
					object=50;
				}
				else
				if (object=50)
				{
					object=51;
				}
				else
				if (object=51)
				{
					object=52;
				}
				else
				if (object=52)
				{
					object=48;
				}
				#endregion /*Change Big Collectible*/
				
				#region /*Falling Block*/
				else
				if (object=19)
				{
					object=20;
				}
				else
				if (object=20)
				{
					object=19;
				}
				else
				if (object=21)
				{
					object=22;
				}
				else
				if (object=22)
				{
					object=21;
				}
				#endregion /*Falling Block END*/
				
				#region /*Brick Block*/
				else
				if (object=4)
				{
					object=5;
				}
				else
				if (object=5)
				{
					object=6;
				}
				else
				if (object=6)
				{
					object=7;
				}
				else
				if (object=7)
				{
					object=8;
				}
				else
				if (object=8)
				{
					object=9;
				}
				else
				if (object=9)
				{
					object=10;
				}
				else
				if (object=10)
				{
					object=4;
				}
				#endregion /*Brick Block*/
				
				#region /*Question Block*/
				else
				if (object=11)
				{
					object=12;
				}
				else
				if (object=12)
				{
					object=13;
				}
				else
				if (object=13)
				{
					object=14;
				}
				else
				if (object=14)
				{
					object=15;
				}
				else
				if (object=15)
				{
					object=16;
				}
				else
				if (object=16)
				{
					object=17;
				}
				else
				if (object=17)
				{
					object=11;
				}
				#endregion /*Question Block*/
				
				#region /*Extra Lives Pickup*/
				else
				if (object=56)
				{
					object=57;
				}
				else
				if (object=57)
				{
					object=58;
				}
				else
				if (object=58)
				{
					object=56;
				}
				#endregion /*Extra Lives Pickup END*/
				
				#region /*Change Oneway Direction*/
				else
				if (object=68)
				{
					object=69;
				}
				else
				if (object=69)
				{
					object=70;
				}
				else
				if (object=70)
				{
					object=71;
				}
				else
				if (object=71)
				{
					object=68;
				}
				#endregion /*Change Oneway Direction END*/
				
				#region /*Change Clipped Clothing on Rope*/
				else
				if (object=74)
				{
					object=75;
				}
				else
				if (object=75)
				{
					object=76;
				}
				else
				if (object=76)
				{
					object=74;
				}
				#endregion /*Change Clipped Clothing on Rope END*/
				
				#region /*Change bucket to it's different forms*/
				if (object=77)
				{
					object=78;
				}
				else
				if (object=78)
				{
					object=79;
				}
				else
				if (object=79)
				{
					object=80;
				}
				else
				if (object=80)
				{
					object=81;
				}
				else
				if (object=81)
				{
					object=82;
				}
				else
				if (object=82)
				{
					object=83;
				}
				else
				if (object=83)
				{
					object=84;
				}
				else
				if (object=84)
				{
					object=85;
				}
				else
				if (object=85)
				{
					object=86;
				}
				else
				if (object=86)
				{
					object=87;
				}
				else
				if (object=87)
				{
					object=88;
				}
				else
				if (object=88)
				{
					object=77;
				}
				#endregion /*Change bucket to it's different forms END*/
				
				#region /*Change Moveset Signs*/
				else
				if (object=90)
				{
					object=91;
				}
				else
				if (object=91)
				{
					object=92;
				}
				else
				if (object=92)
				{
					object=93;
				}
				else
				if (object=93)
				{
					object=94;
				}
				else
				if (object=94)
				{
					object=90;
				}
				#endregion /*Change Moveset Signs END*/
			}
		}
	}

	#region /*Use objects to change other objects*/
	if (mouse_check_button(mb_left))
	or(key_a)
	{
		if (!mouse_check_button(mb_middle))
		{
			if (asset_get_type("obj_leveleditor")==asset_object)
			and(instance_exists(obj_leveleditor))
			{
				if (position_meeting(obj_leveleditor.x,obj_leveleditor.y,id))
				and(obj_leveleditor.pause=false)
				{
					if (obj_leveleditor.place_object=27)
					{
						#region /*Bump in Ground*/
						if (object=24)
						or(object=26)
						{
							object=25;
						}
						#endregion /*Bump in Ground END*/

						#region /*Brick Block*/
						if (asset_get_type("spr_brick_block")==asset_sprite)
						and(object=spr_brick_block)
						or(asset_get_type("spr_basic_collectible_brick_block")==asset_sprite)
						and(object=spr_basic_collectible_brick_block)
						or(asset_get_type("spr_powerup_brick_block")==asset_sprite)
						and(object=spr_powerup_brick_block)
						or(asset_get_type("spr_1up_brick_block")==asset_sprite)
						and(object=spr_1up_brick_block)
						or(asset_get_type("spr_star_brick_block")==asset_sprite)
						and(object=spr_star_brick_block)
						{
							if (asset_get_type("spr_basic_collectible_brick_block")==asset_sprite)
							{
								object=spr_basic_collectible_brick_block;
							}
						}
						#endregion /*Brick Block END*/
	
						#region /*Question Block*/
						if (asset_get_type("spr_question_block")==asset_sprite)
						and(object=spr_question_block)
						or(asset_get_type("spr_basic_collectible_question_block")==asset_sprite)
						and(object=spr_basic_collectible_question_block)
						or(asset_get_type("spr_powerup_question_block")==asset_sprite)
						and(object=spr_powerup_question_block)
						or(asset_get_type("spr_1up_question_block")==asset_sprite)
						and(object=spr_1up_question_block)
						or(asset_get_type("spr_star_question_block")==asset_sprite)
						and(object=spr_star_question_block)
						{
							if (asset_get_type("spr_basic_collectible_question_block")==asset_sprite)
							{
								object=spr_basic_collectible_question_block;
							}
						}
						#endregion /*Question Block END*/
					}

					if (obj_leveleditor.place_object=27)
					{
						#region /*Bump in Ground*/
						if (asset_get_type("spr_bump_in_ground")==asset_sprite)
						and(object=spr_bump_in_ground)
						or(asset_get_type("spr_basic_collectible_bump_in_ground")==asset_sprite)
						and(object=spr_basic_collectible_bump_in_ground)
						if (asset_get_type("spr_powerup_bump_in_ground")==asset_sprite)
						and(object=spr_powerup_bump_in_ground)
						{
							if (asset_get_type("spr_powerup_bump_in_ground")==asset_sprite)
							{
								object=spr_powerup_bump_in_ground;
							}
						}
						#endregion /*Bump in Ground END*/
	
						#region /*Brick Block*/
						if (asset_get_type("spr_brick_block")==asset_sprite)
						and(object=spr_brick_block)
						or(asset_get_type("spr_basic_collectible_brick_block")==asset_sprite)
						and(object=spr_basic_collectible_brick_block)
						or(asset_get_type("spr_powerup_brick_block")==asset_sprite)
						and(object=spr_powerup_brick_block)
						or(asset_get_type("spr_1up_brick_block")==asset_sprite)
						and(object=spr_1up_brick_block)
						or(asset_get_type("spr_star_brick_block")==asset_sprite)
						and(object=spr_star_brick_block)
						{
							if (asset_get_type("spr_powerup_brick_block")==asset_sprite)
							{
							object=spr_powerup_brick_block;
							}
						}
						#endregion /*Brick Block END*/
	
						#region /*Question Block*/
						if (asset_get_type("spr_brick_block")==asset_sprite)
						and(object=spr_question_block)
						or(asset_get_type("spr_basic_collectible_question_block")==asset_sprite)
						and(object=spr_basic_collectible_question_block)
						or(asset_get_type("spr_powerup_question_block")==asset_sprite)
						and(object=spr_powerup_question_block)
						or(asset_get_type("spr_1up_question_block")==asset_sprite)
						and(object=spr_1up_question_block)
						or(asset_get_type("spr_star_question_block")==asset_sprite)
						and(object=spr_star_question_block)
						{
							if (asset_get_type("spr_powerup_question_block")==asset_sprite)
							{
								object=spr_powerup_question_block;
							}
						}
						#endregion /*Question Block END*/
					}

					if (obj_leveleditor.place_object=29)
					{
						#region /*Brick Block*/
						if (asset_get_type("spr_brick_block")==asset_sprite)
						and(object=spr_brick_block)
						or(asset_get_type("spr_basic_collectible_brick_block")==asset_sprite)
						and(object=spr_basic_collectible_brick_block)
						or(asset_get_type("spr_powerup_brick_block")==asset_sprite)
						and(object=spr_powerup_brick_block)
						or(asset_get_type("spr_1up_brick_block")==asset_sprite)
						and(object=spr_1up_brick_block)
						or(asset_get_type("spr_star_brick_block")==asset_sprite)
						and(object=spr_star_brick_block)
						{
							if (asset_get_type("spr_1up_brick_block")==asset_sprite)
							{
								object=spr_1up_brick_block;
							}
						}
						#endregion /*Brick Block END*/
	
						#region /*Question Block*/
						if (asset_get_type("spr_question_block")==asset_sprite)
						and(object=spr_question_block)
						or(asset_get_type("spr_basic_collectible_question_block")==asset_sprite)
						and(object=spr_basic_collectible_question_block)
						or(asset_get_type("spr_powerup_question_block")==asset_sprite)
						and(object=spr_powerup_question_block)
						or(asset_get_type("spr_1up_question_block")==asset_sprite)
						and(object=spr_1up_question_block)
						or(asset_get_type("spr_star_question_block")==asset_sprite)
						and(object=spr_star_question_block)
						{
							if (asset_get_type("spr_1up_question_block")==asset_sprite)
							{
								object=spr_1up_question_block;
							}
						}
						#endregion /*Question Block END*/
					}

					if (obj_leveleditor.place_object=28)
					{
						#region /*Brick Block*/
						if (asset_get_type("spr_brick_block")==asset_sprite)
						and(object=spr_brick_block)
						or(asset_get_type("spr_basic_collectible_brick_block")==asset_sprite)
						and(object=spr_basic_collectible_brick_block)
						or(asset_get_type("spr_powerup_brick_block")==asset_sprite)
						and(object=spr_powerup_brick_block)
						or(asset_get_type("spr_1up_brick_block")==asset_sprite)
						and(object=spr_1up_brick_block)
						or(asset_get_type("spr_star_brick_block")==asset_sprite)
						and(object=spr_star_brick_block)
						{
							if (asset_get_type("spr_star_brick_block")==asset_sprite)
							{
								object=spr_star_brick_block;
							}
						}
						#endregion /*Brick Block END*/
	
						#region /*Question Block*/
						if (asset_get_type("spr_question_block")==asset_sprite)
						and(object=spr_question_block)
						or(asset_get_type("spr_basic_collectible_question_block")==asset_sprite)
						and(object=spr_basic_collectible_question_block)
						or(asset_get_type("spr_powerup_question_block")==asset_sprite)
						and(object=spr_powerup_question_block)
						or(asset_get_type("spr_1up_question_block")==asset_sprite)
						and(object=spr_1up_question_block)
						or(asset_get_type("spr_star_question_block")==asset_sprite)
						and(object=spr_star_question_block)
						{
							if (asset_get_type("spr_star_question_block")==asset_sprite)
							{
								object=spr_star_question_block;
							}
						}
						#endregion /*Question Block END*/
					}
				}
			}
		}
	}
	#endregion /*Use objects to change other objects END*/
}
#endregion /*Modify Objects END*/

#region /*Change certain objects angle*/
if (object=62)
{
	draw_line_width_color(x,y,angle_x,angle_y,4,c_black,c_black);
	draw_line_width_color(x,y,angle_x,angle_y,2,c_white,c_white);
	draw_angle = point_direction(x, y, angle_x, angle_y)-90;
}
if (object=64)
or(object=65)
{
	draw_angle = point_direction(x, y, angle_x, angle_y);
}


if (place_object_angle = true)
{	
	if (instance_exists(obj_leveleditor))
	{
		angle_x = obj_leveleditor.x;
		angle_y = obj_leveleditor.y;
	}
	if (mouse_check_button_released(mb_left))
	{
		place_object_angle = false;
	}
}
#endregion /*Change certain objects angle END*/

#region /*Delete / Erase Objects*/
if (asset_get_type("obj_leveleditor")==asset_object)
and(instance_exists(obj_leveleditor))
and(obj_leveleditor.difficulty_layer=0)
and(obj_leveleditor.drag_object=false)
and(obj_leveleditor.erase_mode=true)
and(obj_leveleditor.pause=false)
and(!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, +192, room_height * 2))
and(!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 256, -64, display_get_gui_width(), +64))
and(!keyboard_check(vk_space))
and(!mouse_check_button(mb_middle))
{
	if (obj_leveleditor.set_difficulty_mode = true)
	and(!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width()-256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /*Can't place objects when clicking the bottom right buttons*/
	or(obj_leveleditor.set_difficulty_mode = false)
	and(!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width()-64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /*Can't place objects when clicking the bottom right buttons*/
	{
		if (mouse_check_button(mb_right))
		or(mouse_check_button(mb_left))
		{
			if (position_meeting(obj_leveleditor.x,obj_leveleditor.y,id))
		
			/*Erase brush size 1*/
			or(obj_leveleditor.erase_brush_size>=1)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y,id))
			or(obj_leveleditor.erase_brush_size>=1)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y+32,id))
			or(obj_leveleditor.erase_brush_size>=1)and(position_meeting(obj_leveleditor.x,obj_leveleditor.y+32,id))
			/*Erase brush size 1 END*/
		
			/*Erase brush size 2*/
			or(obj_leveleditor.erase_brush_size>=2)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y-32,id))
			or(obj_leveleditor.erase_brush_size>=2)and(position_meeting(obj_leveleditor.x,obj_leveleditor.y-32,id))
			or(obj_leveleditor.erase_brush_size>=2)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y-32,id))
			or(obj_leveleditor.erase_brush_size>=2)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y,id))
			or(obj_leveleditor.erase_brush_size>=2)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y+32,id))
			/*Erase brush size 2 END*/
		
			/*Erase brush size 3*/
			or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y-32,id))
			or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y,id))
			or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y+32,id))
			or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y+64,id))
			or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y+64,id))
			or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x,obj_leveleditor.y+64,id))
			or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y+64,id))
			/*Erase brush size 3 END*/
		
			/*Erase brush size 4*/
			or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y-64,id))
			or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y-64,id))
			or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x,obj_leveleditor.y-64,id))
			or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y-64,id))
			or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y-64,id))
			or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y-32,id))
			or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y,id))
			or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y+32,id))
			or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y+64,id))
			/*Erase brush size 4 END*/
		
			/*Erase brush size 5*/
			or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y-64,id))
			or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y-32,id))
			or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y,id))
			or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y+32,id))
			or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y+64,id))
			or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y+96,id))
			or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y+96,id))
			or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y+96,id))
			or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x,obj_leveleditor.y+96,id))
			or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y+96,id))
			or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y+96,id))
			/*Erase brush size 5 END*/
		
			{
				if (asset_get_type("snd_leveleditor_erase_object")==asset_sound)
				{
					audio_play_sound(snd_leveleditor_erase_object,0,0);
					audio_sound_gain(snd_leveleditor_erase_object,global.sfx_volume,0);
				}
				with(obj_leveleditor)
				{
					move_snap(global.grid_hsnap,global.grid_vsnap); /*Make sure to always move snap*/
				}
				instance_destroy();
			}
		}
	}
}
#endregion /*Delete / Erase Objects END*/

#region /*Drag Object*/
if (asset_get_type("obj_leveleditor")==asset_object)
and(instance_exists(obj_leveleditor))
and(obj_leveleditor.set_difficulty_mode=false)
and (delay>1)
{
	if (!keyboard_check(vk_space))
	and(!mouse_check_button(mb_middle))
	{
		if (mouse_check_button_pressed(mb_left))
		or(key_a_pressed)
		{
			if (position_meeting(obj_leveleditor.x,obj_leveleditor.y,id))
			{
				if (drag_object<true)
				and(obj_leveleditor.pause=false)
				and(!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, +192, room_height * 2))
				and(!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 256, -64, display_get_gui_width(), +64))
				{
					if (obj_leveleditor.set_difficulty_mode = true)
					and(!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width()-256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /*Can't place objects when clicking the bottom right buttons*/
					or(obj_leveleditor.set_difficulty_mode = false)
					and(!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width()-64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /*Can't place objects when clicking the bottom right buttons*/
					{
						drag_object=true;
						obj_leveleditor.drag_object=true;
					}
				}
			}
		}
	}
	#region /*Drag the object*/
	if (drag_object=true)
	{
		x=obj_leveleditor.x;
		y=obj_leveleditor.y;
	}
	#endregion /*Drag the object END*/
	
	#region /*Release the object*/
	if (mouse_check_button_released(mb_left))
	or(key_a_released)
	{
		if (drag_object=true)
		{
			drag_release_timer=3;
			drag_object=0.5;
			obj_leveleditor.drag_object=false;
		}
	}
	#endregion /*Release the object END*/
}

if (drag_release_timer>0)
{
	drag_release_timer-=1;
}
else
{
	if (drag_object=0.5)
	{
		drag_object=false;
	}
}

#endregion /*Drag Object END*/

#region /*Spawn objects when starting room*/
if (global.play_edited_level=true)
{
	/*Delete objects according to difficulty settings*/
	if (global.difficulty<=1)
	and(easy=true)
	or(global.difficulty=2)
	and(normal=true)
	or(global.difficulty>=3)
	and(hard=true)
	{
		if (object=1)and(asset_get_type("obj_ground")==asset_object){instance_create_depth(x,y,0,obj_ground);instance_destroy();}
		if (object=2){if (global.difficulty>=1)and(asset_get_type("obj_spikes")==asset_object){instance_create_depth(x,y,0,obj_spikes);instance_destroy();}else{if (asset_get_type("obj_ground")==asset_object){instance_create_depth(x,y,0,obj_ground);instance_destroy();}}}
		if (object=3)and(asset_get_type("obj_semisolid_platform")==asset_object){instance_create_depth(x,y,0,obj_semisolid_platform);instance_destroy();}
		#region /*Brick Block*/
		if (object=4)and(asset_get_type("obj_question_block")==asset_object){with(instance_create_depth(x,y,0,obj_question_block)){brick_block = true;}instance_destroy();}
		if (object=5)and(asset_get_type("obj_question_block")==asset_object){with(instance_create_depth(x,y,0,obj_question_block)){brick_block = true;item_inside = "10_basic_collectibles";}instance_destroy();}
		if (object=6)and(asset_get_type("obj_question_block")==asset_object){with(instance_create_depth(x,y,0,obj_question_block)){brick_block = true;item_inside = "heart_balloon";}instance_destroy();}
		if (object=7)and(asset_get_type("obj_question_block")==asset_object){with(instance_create_depth(x,y,0,obj_question_block)){brick_block = true;item_inside = "1-up";}instance_destroy();}
		if (object=8)and(asset_get_type("obj_question_block")==asset_object){with(instance_create_depth(x,y,0,obj_question_block)){brick_block = true;item_inside = "2-up";}instance_destroy();}
		if (object=9)and(asset_get_type("obj_question_block")==asset_object){with(instance_create_depth(x,y,0,obj_question_block)){brick_block = true;item_inside = "3-up";}instance_destroy();}
		if (object=10)and(asset_get_type("obj_question_block")==asset_object){with(instance_create_depth(x,y,0,obj_question_block)){brick_block = true;item_inside = "invincibility_powerup";}instance_destroy();}
		#endregion /*Brick Block END*/
		#region /*Question Block*/
		if (object=11)and(asset_get_type("obj_question_block")==asset_object){instance_create_depth(x,y,0,obj_question_block);instance_destroy();}
		if (object=12)and(asset_get_type("obj_question_block")==asset_object){with(instance_create_depth(x,y,0,obj_question_block)){item_inside = "10_basic_collectibles";}instance_destroy();}
		if (object=13)and(asset_get_type("obj_question_block")==asset_object){with(instance_create_depth(x,y,0,obj_question_block)){item_inside = "heart_balloon";}instance_destroy();}
		if (object=14)and(asset_get_type("obj_question_block")==asset_object){with(instance_create_depth(x,y,0,obj_question_block)){item_inside = "1-up";}instance_destroy();}
		if (object=15)and(asset_get_type("obj_question_block")==asset_object){with(instance_create_depth(x,y,0,obj_question_block)){item_inside = "2-up";}instance_destroy();}
		if (object=16)and(asset_get_type("obj_question_block")==asset_object){with(instance_create_depth(x,y,0,obj_question_block)){item_inside = "3-up";}instance_destroy();}
		if (object=17)and(asset_get_type("obj_question_block")==asset_object){with(instance_create_depth(x,y,0,obj_question_block)){item_inside = "invincibility_powerup";}instance_destroy();}
		#endregion /*Question Block END*/
		if (object=18)and(asset_get_type("obj_hard_block")==asset_object){instance_create_depth(x,y,0,obj_hard_block);instance_destroy();}
		#region /*Falling Block*/
		if (object=19)and(asset_get_type("obj_falling_block")==asset_object){instance_create_depth(x,y,0,obj_falling_block);instance_destroy();}
		if (object=20)and(asset_get_type("obj_falling_block_solid")==asset_object){instance_create_depth(x,y,0,obj_falling_block_solid);instance_destroy();}
		if (object=21)and(asset_get_type("obj_falling_block_long")==asset_object){instance_create_depth(x,y,0,obj_falling_block_long);instance_destroy();}
		if (object=22)and(asset_get_type("obj_falling_block_long_solid")==asset_object){instance_create_depth(x,y,0,obj_falling_block_long_solid);instance_destroy();}
		#endregion /*Question Block END*/
		if (object=23)and(asset_get_type("obj_cloud_block")==asset_object){instance_create_depth(x,y,0,obj_cloud_block);instance_destroy();}
		if (object=24)and(asset_get_type("obj_ice_block")==asset_object){instance_create_depth(x,y,0,obj_ice_block);instance_destroy();}
		if (object=25)and(asset_get_type("obj_cardboard_block")==asset_object){instance_create_depth(x,y,0,obj_cardboard_block);instance_destroy();}
		if (object=26)and(asset_get_type("obj_cardboard")==asset_object){instance_create_depth(x,y,0,obj_cardboard);instance_destroy();}
		if (object=27)and(asset_get_type("obj_cardboard_long")==asset_object){instance_create_depth(x,y,0,obj_cardboard_long);instance_destroy();}
		#region /*Bump in ground*/
		if (object=28)and(asset_get_type("obj_bump_in_ground")==asset_object){instance_create_depth(x,y,0,obj_bump_in_ground);instance_destroy();}
		if (object=29)and(asset_get_type("obj_bump_in_ground")==asset_object){with(instance_create_depth(x,y,0,obj_bump_in_ground)){type_of_bump="8_basic_collectibles";}instance_destroy();}
		if (object=30)and(asset_get_type("obj_bump_in_ground")==asset_object){with(instance_create_depth(x,y,0,obj_bump_in_ground)){type_of_bump="heart_balloon";}instance_destroy();}
		if (object=31)and(asset_get_type("obj_bump_in_ground")==asset_object){with(instance_create_depth(x,y,0,obj_bump_in_ground)){type_of_bump="1-up";}instance_destroy();}
		if (object=32)and(asset_get_type("obj_bump_in_ground")==asset_object){with(instance_create_depth(x,y,0,obj_bump_in_ground)){type_of_bump="2-up";}instance_destroy();}
		if (object=33)and(asset_get_type("obj_bump_in_ground")==asset_object){with(instance_create_depth(x,y,0,obj_bump_in_ground)){type_of_bump="3-up";}instance_destroy();}
		if (object=34)and(asset_get_type("obj_bump_in_ground")==asset_object){with(instance_create_depth(x,y,0,obj_bump_in_ground)){type_of_bump="big_collectible_1";}instance_destroy();}
		if (object=35)and(asset_get_type("obj_bump_in_ground")==asset_object){with(instance_create_depth(x,y,0,obj_bump_in_ground)){type_of_bump="big_collectible_2";}instance_destroy();}
		if (object=36)and(asset_get_type("obj_bump_in_ground")==asset_object){with(instance_create_depth(x,y,0,obj_bump_in_ground)){type_of_bump="big_collectible_3";}instance_destroy();}
		if (object=37)and(asset_get_type("obj_bump_in_ground")==asset_object){with(instance_create_depth(x,y,0,obj_bump_in_ground)){type_of_bump="big_collectible_4";}instance_destroy();}
		if (object=38)and(asset_get_type("obj_bump_in_ground")==asset_object){with(instance_create_depth(x,y,0,obj_bump_in_ground)){type_of_bump="big_collectible_5";}instance_destroy();}
		if (object=39)and(asset_get_type("obj_bump_in_ground")==asset_object){with(instance_create_depth(x,y,0,obj_bump_in_ground)){type_of_bump="invincibility_powerup";}instance_destroy();}
		#endregion /*Bump in ground END*/
		#region /*Basic Collectible*/
		if (object=40)and(asset_get_type("obj_basic_collectible")==asset_object){instance_create_depth(x,y,0,obj_basic_collectible);instance_destroy();}
		if (object=41)and(asset_get_type("obj_basic_collectible")==asset_object){with(instance_create_depth(x,y,0,obj_basic_collectible)){image_angle=315;}instance_destroy();}
		if (object=42)and(asset_get_type("obj_basic_collectible")==asset_object){with(instance_create_depth(x,y,0,obj_basic_collectible)){image_angle=270;}instance_destroy();}
		if (object=43)and(asset_get_type("obj_basic_collectible")==asset_object){with(instance_create_depth(x,y,0,obj_basic_collectible)){image_angle=225;}instance_destroy();}
		if (object=44)and(asset_get_type("obj_basic_collectible")==asset_object){with(instance_create_depth(x,y,0,obj_basic_collectible)){image_angle=180;}instance_destroy();}
		if (object=45)and(asset_get_type("obj_basic_collectible")==asset_object){with(instance_create_depth(x,y,0,obj_basic_collectible)){image_angle=135;}instance_destroy();}
		if (object=46)and(asset_get_type("obj_basic_collectible")==asset_object){with(instance_create_depth(x,y,0,obj_basic_collectible)){image_angle=90;}instance_destroy();}
		if (object=47)and(asset_get_type("obj_basic_collectible")==asset_object){with(instance_create_depth(x,y,0,obj_basic_collectible)){image_angle=45;}instance_destroy();}
		#endregion /*Basic Collectible END*/
		#region /*Big Collectibles*/
		if (object=48)and(asset_get_type("obj_big_collectible")==asset_object){with(instance_create_depth(x,y,0,obj_big_collectible)){big_collectible = 1;}instance_destroy();}
		if (object=49)and(asset_get_type("obj_big_collectible")==asset_object){with(instance_create_depth(x,y,0,obj_big_collectible)){big_collectible = 2;}instance_destroy();}
		if (object=50)and(asset_get_type("obj_big_collectible")==asset_object){with(instance_create_depth(x,y,0,obj_big_collectible)){big_collectible = 3;}instance_destroy();}
		if (object=51)and(asset_get_type("obj_big_collectible")==asset_object){with(instance_create_depth(x,y,0,obj_big_collectible)){big_collectible = 4;}instance_destroy();}
		if (object=52)and(asset_get_type("obj_big_collectible")==asset_object){with(instance_create_depth(x,y,0,obj_big_collectible)){big_collectible = 5;}instance_destroy();}
		#endregion /*Big Collectibles END*/
		if (object=53)and(asset_get_type("obj_heart_balloon")==asset_object){instance_create_depth(x,y,0,obj_heart_balloon);instance_destroy();}
		if (object=54)and(asset_get_type("obj_hp_pickup")==asset_object){instance_create_depth(x,y,0,obj_hp_pickup);instance_destroy();}
		if (object=55)and(asset_get_type("obj_invincibility_powerup")==asset_object){instance_create_depth(x,y,0,obj_invincibility_powerup);instance_destroy();}
		if (object=56)and(asset_get_type("obj_extra_life_pickup")==asset_object){instance_create_depth(x,y,0,obj_extra_life_pickup);instance_destroy();}
		if (object=57)and(asset_get_type("obj_extra_life_pickup")==asset_object){with(instance_create_depth(x,y,0,obj_extra_life_pickup)){number_of_extra_lives = 2;}instance_destroy();}
		if (object=58)and(asset_get_type("obj_extra_life_pickup")==asset_object){with(instance_create_depth(x,y,0,obj_extra_life_pickup)){number_of_extra_lives = 3;}instance_destroy();}
		if (object=59){if (global.difficulty>=1)and(asset_get_type("obj_enemy1")==asset_object){instance_create_depth(x,y,0,obj_enemy1);instance_destroy();}else{instance_destroy();}}
		if (object=60){if (global.difficulty>=1)and(asset_get_type("obj_enemy2")==asset_object){instance_create_depth(x,y,0,obj_enemy2);instance_destroy();}else{instance_destroy();}}
		if (object=61){if (global.difficulty>=1)and(asset_get_type("obj_blaster")==asset_object){instance_create_depth(x,y,0,obj_blaster);instance_destroy();}else{instance_destroy();}}
		if (object=62)and(asset_get_type("obj_spring")==asset_object){with(instance_create_depth(x,y,0,obj_spring)){if (instance_exists(obj_leveleditor_placed_object)){angle_x=instance_nearest(x,y,obj_leveleditor_placed_object).angle_x;angle_y=instance_nearest(x,y,obj_leveleditor_placed_object).angle_y;}}instance_destroy();}
		if (object=63)and(asset_get_type("obj_vine")==asset_object){instance_create_depth(x,y,0,obj_vine);instance_destroy();}
		#region /*Arrow Sign*/
		if (object=64)and(asset_get_type("obj_arrow_sign")==asset_object){with(instance_create_depth(x,y,0,obj_arrow_sign)){if (instance_exists(obj_leveleditor_placed_object)){angle_x=instance_nearest(x,y,obj_leveleditor_placed_object).angle_x;angle_y=instance_nearest(x,y,obj_leveleditor_placed_object).angle_y;}}instance_destroy();}
		#endregion /*Arrow Sign End*/
		#region /*Arrow Sign Small*/
		if (object=65)and(asset_get_type("obj_arrow_sign_small")==asset_object){with(instance_create_depth(x+16,y+16,0,obj_arrow_sign_small)){if (instance_exists(obj_leveleditor_placed_object)){angle_x=instance_nearest(x,y,obj_leveleditor_placed_object).angle_x;angle_y=instance_nearest(x,y,obj_leveleditor_placed_object).angle_y;}}instance_destroy();}
		#endregion /*Arrow Sign Small End*/
		if (object=66)and(asset_get_type("obj_checkpoint")==asset_object){instance_create_depth(x+16,y,0,obj_checkpoint);instance_destroy();}
		if (object=67){if (global.difficulty>=1)and(asset_get_type("obj_spikes_emerge")==asset_object){instance_create_depth(x,y+16,0,obj_spikes_emerge);instance_destroy();}else{instance_destroy();}}
		#region /*Oneway*/
		if (object=68)and(asset_get_type("obj_oneway")==asset_object){instance_create_depth(x,y,0,obj_oneway);instance_destroy();}
		if (object=69)and(asset_get_type("obj_oneway")==asset_object){with(instance_create_depth(x,y,0,obj_oneway)){image_angle=90;}instance_destroy();}
		if (object=70)and(asset_get_type("obj_oneway")==asset_object){with(instance_create_depth(x,y,0,obj_oneway)){image_angle=180;}instance_destroy();}
		if (object=71)and(asset_get_type("obj_oneway")==asset_object){with(instance_create_depth(x,y,0,obj_oneway)){image_angle=270;}instance_destroy();}
		#endregion /*Oneway END*/
		if (object=72)and(asset_get_type("obj_horizontal_rope")==asset_object){instance_create_depth(x,y,0,obj_horizontal_rope);instance_destroy();}
		if (object=73)and(asset_get_type("obj_water")==asset_object){instance_create_depth(x,y,0,obj_water);instance_destroy();}
		if (object=74)and(asset_get_type("obj_clipped_clothes")==asset_object){with(instance_create_depth(x,y,0,obj_clipped_clothes)){sprite_index=spr_clipped_shirt;}instance_destroy();}
		if (object=75)and(asset_get_type("obj_clipped_clothes")==asset_object){with(instance_create_depth(x,y,0,obj_clipped_clothes)){sprite_index=spr_clipped_pants;}instance_destroy();}
		if (object=76)and(asset_get_type("obj_clipped_clothes")==asset_object){with(instance_create_depth(x,y,0,obj_clipped_clothes)){sprite_index=spr_clipped_sock;}instance_destroy();}
		#region /*Bucket*/
		if (object=77)and(asset_get_type("obj_bucket")==asset_object){instance_create_depth(x,y,0,obj_bucket);instance_destroy();}
		if (object=78)and(asset_get_type("obj_bucket")==asset_object){with(instance_create_depth(x,y,0,obj_bucket)){item_inside="8_basic_collectibles";}instance_destroy();}
		if (object=79)and(asset_get_type("obj_bucket")==asset_object){with(instance_create_depth(x,y,0,obj_bucket)){item_inside="heart_balloon";}instance_destroy();}
		if (object=80)and(asset_get_type("obj_bucket")==asset_object){with(instance_create_depth(x,y,0,obj_bucket)){item_inside="1-up";}instance_destroy();}
		if (object=81)and(asset_get_type("obj_bucket")==asset_object){with(instance_create_depth(x,y,0,obj_bucket)){item_inside="2-up";}instance_destroy();}
		if (object=82)and(asset_get_type("obj_bucket")==asset_object){with(instance_create_depth(x,y,0,obj_bucket)){item_inside="3-up";}instance_destroy();}
		if (object=83)and(asset_get_type("obj_bucket")==asset_object){with(instance_create_depth(x,y,0,obj_bucket)){item_inside="big_collectible_1";}instance_destroy();}
		if (object=84)and(asset_get_type("obj_bucket")==asset_object){with(instance_create_depth(x,y,0,obj_bucket)){item_inside="big_collectible_2";}instance_destroy();}
		if (object=85)and(asset_get_type("obj_bucket")==asset_object){with(instance_create_depth(x,y,0,obj_bucket)){item_inside="big_collectible_3";}instance_destroy();}
		if (object=86)and(asset_get_type("obj_bucket")==asset_object){with(instance_create_depth(x,y,0,obj_bucket)){item_inside="big_collectible_4";}instance_destroy();}
		if (object=87)and(asset_get_type("obj_bucket")==asset_object){with(instance_create_depth(x,y,0,obj_bucket)){item_inside="big_collectible_5";}instance_destroy();}
		if (object=88)and(asset_get_type("obj_bucket")==asset_object){with(instance_create_depth(x,y,0,obj_bucket)){item_inside="invincibility_powerup";}instance_destroy();}
		#endregion /*Bucket END*/
		if (object=89)and(asset_get_type("obj_bird")==asset_object){instance_create_depth(x,y,0,obj_bird);instance_destroy();}
		if (object=90)and(asset_get_type("obj_sign_moveset")==asset_object){with(instance_create_depth(x,y,0,obj_sign_moveset)){sprite_index = spr_sign_crouch; sprite_sign = spr_sign_crouch;}instance_destroy();}
		if (object=91)and(asset_get_type("obj_sign_moveset")==asset_object){with(instance_create_depth(x,y,0,obj_sign_moveset)){sprite_index = spr_sign_dive; sprite_sign = spr_sign_dive;}instance_destroy();}
		if (object=92)and(asset_get_type("obj_sign_moveset")==asset_object){with(instance_create_depth(x,y,0,obj_sign_moveset)){sprite_index = spr_sign_groundpound; sprite_sign = spr_sign_groundpound;}instance_destroy();}
		if (object=93)and(asset_get_type("obj_sign_moveset")==asset_object){with(instance_create_depth(x,y,0,obj_sign_moveset)){sprite_index = spr_sign_rope_spin; sprite_sign = spr_sign_rope_spin;}instance_destroy();}
		if (object=94)and(asset_get_type("obj_sign_moveset")==asset_object){with(instance_create_depth(x,y,0,obj_sign_moveset)){sprite_index = spr_sign_walljump; sprite_sign = spr_sign_walljump;}instance_destroy();}
		if (object=95)and(asset_get_type("obj_boss")==asset_object){instance_create_depth(x,y,0,obj_boss);instance_destroy();}
	}
	else
	{
		instance_destroy();/*Destroy object if difficulty setting and difficulty on object doesn't match*/
	}
}
#endregion /*Spawn objects when starting room END*/

#region /*Initialize Object*/
if (object=1)and(asset_get_type("spr_wall")==asset_sprite){sprite_index=spr_wall;mask_index=spr_wall;}
if (object=2)and(asset_get_type("spr_spikes")==asset_sprite){sprite_index=spr_spikes;mask_index=spr_wall;}
if (object=3)and(asset_get_type("spr_semisolid_platform")==asset_sprite){sprite_index=spr_semisolid_platform;mask_index=spr_wall;}
#region /*Brick Block*/
if (object=4)and(asset_get_type("spr_brick_block")==asset_sprite){sprite_index=spr_brick_block;mask_index=spr_wall;}
if (object=5)and(asset_get_type("spr_brick_block")==asset_sprite){sprite_index=spr_brick_block;if (asset_get_type("spr_basic_collectible")==asset_sprite){draw_sprite_ext(spr_basic_collectible,0,x,y,0.5,0.5,0,c_white,image_alpha);}mask_index=spr_wall;}
if (object=6)and(asset_get_type("spr_brick_block")==asset_sprite){sprite_index=spr_brick_block;if (asset_get_type("spr_heart")==asset_sprite){draw_sprite_ext(spr_heart,0,x,y,0.5,0.5,0,c_white,image_alpha);}mask_index=spr_wall;}
if (object=7)and(asset_get_type("spr_brick_block")==asset_sprite){sprite_index=spr_brick_block;if (asset_get_type("spr_1up")==asset_sprite){draw_sprite_ext(spr_1up,0,x,y,0.5,0.5,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"1-up",global.default_text_size/2,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=8)and(asset_get_type("spr_brick_block")==asset_sprite){sprite_index=spr_brick_block;if (asset_get_type("spr_2up")==asset_sprite){draw_sprite_ext(spr_2up,0,x,y,0.5,0.5,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"2-up",global.default_text_size/2,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=9)and(asset_get_type("spr_brick_block")==asset_sprite){sprite_index=spr_brick_block;if (asset_get_type("spr_3up")==asset_sprite){draw_sprite_ext(spr_3up,0,x,y,0.5,0.5,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"3-up",global.default_text_size/2,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=10)and(asset_get_type("spr_brick_block")==asset_sprite){sprite_index=spr_brick_block;if (asset_get_type("spr_invincibility_powerup")==asset_sprite){draw_sprite_ext(spr_invincibility_powerup,0,x,y,0.5,0.5,0,c_white,image_alpha);}mask_index=spr_wall;}
#endregion /*Brick Block END*/
#region /*Question Block*/
if (object=11)and(asset_get_type("spr_question_block")==asset_sprite){sprite_index=spr_question_block;mask_index=spr_wall;}
if (object=12)and(asset_get_type("spr_question_block")==asset_sprite){sprite_index=spr_question_block;if (asset_get_type("spr_basic_collectible")==asset_sprite){draw_sprite_ext(spr_basic_collectible,0,x,y,0.5,0.5,0,c_white,image_alpha);}mask_index=spr_wall;}
if (object=13)and(asset_get_type("spr_question_block")==asset_sprite){sprite_index=spr_question_block;if (asset_get_type("spr_heart")==asset_sprite){draw_sprite_ext(spr_heart,0,x,y,0.5,0.5,0,c_white,image_alpha);}mask_index=spr_wall;}
if (object=14)and(asset_get_type("spr_question_block")==asset_sprite){sprite_index=spr_question_block;if (asset_get_type("spr_1up")==asset_sprite){draw_sprite_ext(spr_1up,0,x,y,0.5,0.5,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"1-up",global.default_text_size/2,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=15)and(asset_get_type("spr_question_block")==asset_sprite){sprite_index=spr_question_block;if (asset_get_type("spr_2up")==asset_sprite){draw_sprite_ext(spr_2up,0,x,y,0.5,0.5,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"2-up",global.default_text_size/2,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=16)and(asset_get_type("spr_question_block")==asset_sprite){sprite_index=spr_question_block;if (asset_get_type("spr_3up")==asset_sprite){draw_sprite_ext(spr_3up,0,x,y,0.5,0.5,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"3-up",global.default_text_size/2,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=17)and(asset_get_type("spr_question_block")==asset_sprite){sprite_index=spr_question_block;if (asset_get_type("spr_invincibility_powerup")==asset_sprite){draw_sprite_ext(spr_invincibility_powerup,0,x,y,0.5,0.5,0,c_white,image_alpha);}mask_index=spr_wall;}
#endregion /*Question Block END*/
if (object=18)and(asset_get_type("spr_hard_block")==asset_sprite){sprite_index=spr_hard_block;mask_index=spr_wall;}
if (object=19)and(asset_get_type("spr_falling_block")==asset_sprite){sprite_index=spr_falling_block;mask_index=spr_wall;}
if (object=20)and(asset_get_type("spr_falling_block_solid")==asset_sprite){sprite_index=spr_falling_block_solid;mask_index=spr_wall;}
if (object=21)and(asset_get_type("spr_falling_block_long")==asset_sprite){sprite_index=spr_falling_block_long;mask_index=spr_cardboard;}
if (object=22)and(asset_get_type("spr_falling_block_long_solid")==asset_sprite){sprite_index=spr_falling_block_long_solid;mask_index=spr_cardboard;}
if (object=23)and(asset_get_type("spr_cloud_block")==asset_sprite){sprite_index=spr_cloud_block;mask_index=spr_wall;}
if (object=24)and(asset_get_type("spr_ice_block")==asset_sprite){sprite_index=spr_ice_block;mask_index=spr_wall;}
if (object=25)and(asset_get_type("spr_cardboard_block")==asset_sprite){sprite_index=spr_cardboard_block;mask_index=spr_wall;}
if (object=26)and(asset_get_type("spr_cardboard")==asset_sprite){sprite_index=spr_cardboard;mask_index=spr_cardboard;}
if (object=27)and(asset_get_type("spr_cardboard_long")==asset_sprite){sprite_index=spr_cardboard_long;mask_index=spr_cardboard_long;}
#region /*Bump in ground*/
if (object=28)and(asset_get_type("spr_bump_in_ground")==asset_sprite){sprite_index=spr_bump_in_ground;mask_index=spr_wall;}
if (object=29)and(asset_get_type("spr_bump_in_ground")==asset_sprite){sprite_index=spr_bump_in_ground;if (asset_get_type("spr_basic_collectible")==asset_sprite){draw_sprite_ext(spr_basic_collectible,0,x,y,0.5,0.5,0,c_white,image_alpha);}mask_index=spr_wall;}
if (object=30)and(asset_get_type("spr_bump_in_ground")==asset_sprite){sprite_index=spr_bump_in_ground;if (asset_get_type("spr_heart")==asset_sprite){draw_sprite_ext(spr_heart,0,x,y,0.5,0.5,0,c_white,image_alpha);}mask_index=spr_wall;}
if (object=31)and(asset_get_type("spr_bump_in_ground")==asset_sprite){sprite_index=spr_bump_in_ground;if (asset_get_type("spr_1up")==asset_sprite){draw_sprite_ext(spr_1up,0,x,y,0.5,0.5,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"1-up",global.default_text_size/2,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=32)and(asset_get_type("spr_bump_in_ground")==asset_sprite){sprite_index=spr_bump_in_ground;if (asset_get_type("spr_2up")==asset_sprite){draw_sprite_ext(spr_2up,0,x,y,0.5,0.5,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"2-up",global.default_text_size/2,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=33)and(asset_get_type("spr_bump_in_ground")==asset_sprite){sprite_index=spr_bump_in_ground;if (asset_get_type("spr_3up")==asset_sprite){draw_sprite_ext(spr_3up,0,x,y,0.5,0.5,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"3-up",global.default_text_size/2,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=34)and(asset_get_type("spr_bump_in_ground")==asset_sprite){sprite_index=spr_bump_in_ground;if (asset_get_type("spr_big_collectible")==asset_sprite){draw_sprite_ext(spr_big_collectible,0,x,y,0.4,0.4,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"1",global.default_text_size,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=35)and(asset_get_type("spr_bump_in_ground")==asset_sprite){sprite_index=spr_bump_in_ground;if (asset_get_type("spr_big_collectible")==asset_sprite){draw_sprite_ext(spr_big_collectible,0,x,y,0.4,0.4,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"2",global.default_text_size,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=36)and(asset_get_type("spr_bump_in_ground")==asset_sprite){sprite_index=spr_bump_in_ground;if (asset_get_type("spr_big_collectible")==asset_sprite){draw_sprite_ext(spr_big_collectible,0,x,y,0.4,0.4,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"3",global.default_text_size,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=37)and(asset_get_type("spr_bump_in_ground")==asset_sprite){sprite_index=spr_bump_in_ground;if (asset_get_type("spr_big_collectible")==asset_sprite){draw_sprite_ext(spr_big_collectible,0,x,y,0.4,0.4,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"4",global.default_text_size,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=38)and(asset_get_type("spr_bump_in_ground")==asset_sprite){sprite_index=spr_bump_in_ground;if (asset_get_type("spr_big_collectible")==asset_sprite){draw_sprite_ext(spr_big_collectible,0,x,y,0.4,0.4,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"5",global.default_text_size,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=39)and(asset_get_type("spr_bump_in_ground")==asset_sprite){sprite_index=spr_bump_in_ground;if (asset_get_type("spr_invincibility_powerup")==asset_sprite){draw_sprite_ext(spr_invincibility_powerup,0,x,y,0.5,0.5,0,c_white,image_alpha);}mask_index=spr_wall;}
#endregion /*Bump in ground END*/
#region /*Basic Collectible*/
if (object=40)and(asset_get_type("spr_basic_collectible")==asset_sprite){sprite_index=spr_basic_collectible;draw_angle = 0;mask_index=spr_wall;}
if (object=41)and(asset_get_type("spr_basic_collectible")==asset_sprite){sprite_index=spr_basic_collectible;draw_angle = 315;mask_index=spr_wall;}
if (object=42)and(asset_get_type("spr_basic_collectible")==asset_sprite){sprite_index=spr_basic_collectible;draw_angle = 270;mask_index=spr_wall;}
if (object=43)and(asset_get_type("spr_basic_collectible")==asset_sprite){sprite_index=spr_basic_collectible;draw_angle = 225;mask_index=spr_wall;}
if (object=44)and(asset_get_type("spr_basic_collectible")==asset_sprite){sprite_index=spr_basic_collectible;draw_angle = 180;mask_index=spr_wall;}
if (object=45)and(asset_get_type("spr_basic_collectible")==asset_sprite){sprite_index=spr_basic_collectible;draw_angle = 135;mask_index=spr_wall;}
if (object=46)and(asset_get_type("spr_basic_collectible")==asset_sprite){sprite_index=spr_basic_collectible;draw_angle = 90;mask_index=spr_wall;}
if (object=47)and(asset_get_type("spr_basic_collectible")==asset_sprite){sprite_index=spr_basic_collectible;draw_angle = 45;mask_index=spr_wall;}
#endregion /*Basic Collectible END*/
#region /*Big Collectibles*/
if (object=48)and(asset_get_type("spr_big_collectible")==asset_sprite){sprite_index = spr_big_collectible;draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"1",global.default_text_size,c_white,c_black,image_alpha);mask_index=spr_2x2_block;}
if (object=49)and(asset_get_type("spr_big_collectible")==asset_sprite){sprite_index = spr_big_collectible;draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"2",global.default_text_size,c_white,c_black,image_alpha);mask_index=spr_2x2_block;}
if (object=50)and(asset_get_type("spr_big_collectible")==asset_sprite){sprite_index = spr_big_collectible;draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"3",global.default_text_size,c_white,c_black,image_alpha);mask_index=spr_2x2_block;}
if (object=51)and(asset_get_type("spr_big_collectible")==asset_sprite){sprite_index = spr_big_collectible;draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"4",global.default_text_size,c_white,c_black,image_alpha);mask_index=spr_2x2_block;}
if (object=52)and(asset_get_type("spr_big_collectible")==asset_sprite){sprite_index = spr_big_collectible;draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"5",global.default_text_size,c_white,c_black,image_alpha);mask_index=spr_2x2_block;}
#endregion /*Big Collectibles END*/
if (object=53)and(asset_get_type("spr_heart")==asset_sprite){sprite_index=spr_heart;mask_index=spr_wall;}
if (object=54)and(asset_get_type("spr_hp_pickup")==asset_sprite){sprite_index=spr_hp_pickup;mask_index=spr_wall;}
if (object=55)and(asset_get_type("spr_invincibility_powerup")==asset_sprite){sprite_index=spr_invincibility_powerup;mask_index=spr_wall;}
if (object=56)and(asset_get_type("spr_1up")==asset_sprite){sprite_index = spr_1up;draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"1-up",global.default_text_size/2,image_blend,c_black,image_alpha);mask_index=spr_wall;}
if (object=57)and(asset_get_type("spr_2up")==asset_sprite){sprite_index = spr_2up;draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"2-up",global.default_text_size/2,image_blend,c_black,image_alpha);mask_index=spr_wall;}
if (object=58)and(asset_get_type("spr_3up")==asset_sprite){sprite_index = spr_3up;draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"3-up",global.default_text_size/2,image_blend,c_black,image_alpha);mask_index=spr_wall;}
if (object=59){sprite_index=sprite_enemy1;mask_index=spr_wall;}
if (object=60){sprite_index=sprite_enemy2;mask_index=spr_wall;}
if (object=61)and(asset_get_type("spr_blaster")==asset_sprite){sprite_index=spr_blaster;mask_index=spr_wall;}
if (object=62)and(asset_get_type("spr_spring")==asset_sprite){sprite_index=spr_spring;mask_index=spr_wall;}
if (object=63)and(asset_get_type("spr_ladder")==asset_sprite){sprite_index=spr_ladder;mask_index=spr_wall;}
#region /*Arrow Signs*/
if (object = 64)and(asset_get_type("spr_arrow_sign") == asset_sprite){draw_sprite_ext(spr_arrow_sign, 0, x, y, 1, 1, draw_angle, image_blend, image_alpha);mask_index = spr_2x2_block;sprite_index = noone;}
#endregion /*Arrow Signs END*/
#region /*Arrow Signs Small*/
if (object = 65)and(asset_get_type("spr_arrow_sign_small") == asset_sprite){draw_sprite_ext(spr_arrow_sign_small, 0, x, y, 0.5, 0.5, draw_angle, image_blend, image_alpha);mask_index = spr_2x2_block;sprite_index = noone;}
#endregion /*Arrow Signs Small END*/
if (object=66)and(asset_get_type("spr_checkpoint")==asset_sprite){sprite_index=spr_checkpoint;mask_index=spr_2x2_block;}
if (object=67)and(asset_get_type("spr_spikes_emerge_block")==asset_sprite){sprite_index=spr_spikes_emerge_block;mask_index=spr_wall;}
#region /*Oneway*/
if (object=68)and(asset_get_type("spr_oneway")==asset_sprite){sprite_index = spr_oneway;draw_angle = 0;mask_index = spr_wall;}
if (object=69)and(asset_get_type("spr_oneway")==asset_sprite){sprite_index = spr_oneway;draw_angle = 90;mask_index = spr_wall;}
if (object=70)and(asset_get_type("spr_oneway")==asset_sprite){sprite_index = spr_oneway;draw_angle = 180;mask_index = spr_wall;}
if (object=71)and(asset_get_type("spr_oneway")==asset_sprite){sprite_index = spr_oneway;draw_angle = 270;mask_index = spr_wall;}
#endregion /*Oneway END*/
if (object=72)and(asset_get_type("spr_horizontal_rope")==asset_sprite){sprite_index=spr_horizontal_rope;mask_index=spr_wall;}
if (object=73)and(asset_get_type("spr_water_surface")==asset_sprite){sprite_index=spr_water_surface;mask_index=spr_wall;}
if (object=74)and(asset_get_type("spr_clipped_shirt")==asset_sprite){sprite_index=spr_clipped_shirt;mask_index=spr_wall;}
if (object=75)and(asset_get_type("spr_clipped_pants")==asset_sprite){sprite_index=spr_clipped_pants;mask_index=spr_wall;}
if (object=76)and(asset_get_type("spr_clipped_sock")==asset_sprite){sprite_index=spr_clipped_sock;mask_index=spr_wall;}
#region /*Bucket*/
if (object=77)and(asset_get_type("spr_bucket")==asset_sprite){sprite_index=spr_bucket;mask_index=spr_wall;}
if (object=78)and(asset_get_type("spr_bucket")==asset_sprite){sprite_index=spr_bucket;if (asset_get_type("spr_basic_collectible")==asset_sprite){draw_sprite_ext(spr_basic_collectible,0,x,y,0.5,0.5,0,c_white,image_alpha);}mask_index=spr_wall;}
if (object=79)and(asset_get_type("spr_bucket")==asset_sprite){sprite_index=spr_bucket;if (asset_get_type("spr_heart")==asset_sprite){draw_sprite_ext(spr_heart,0,x,y,0.5,0.5,0,c_white,image_alpha);}mask_index=spr_wall;}
if (object=80)and(asset_get_type("spr_bucket")==asset_sprite){sprite_index=spr_bucket;if (asset_get_type("spr_1up")==asset_sprite){draw_sprite_ext(spr_1up,0,x,y,0.5,0.5,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"1-up",global.default_text_size/2,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=81)and(asset_get_type("spr_bucket")==asset_sprite){sprite_index=spr_bucket;if (asset_get_type("spr_2up")==asset_sprite){draw_sprite_ext(spr_2up,0,x,y,0.5,0.5,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"2-up",global.default_text_size/2,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=82)and(asset_get_type("spr_bucket")==asset_sprite){sprite_index=spr_bucket;if (asset_get_type("spr_3up")==asset_sprite){draw_sprite_ext(spr_3up,0,x,y,0.5,0.5,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"3-up",global.default_text_size/2,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=83)and(asset_get_type("spr_bucket")==asset_sprite){sprite_index=spr_bucket;if (asset_get_type("spr_big_collectible")==asset_sprite){draw_sprite_ext(spr_big_collectible,0,x,y,0.4,0.4,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"1",global.default_text_size,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=84)and(asset_get_type("spr_bucket")==asset_sprite){sprite_index=spr_bucket;if (asset_get_type("spr_big_collectible")==asset_sprite){draw_sprite_ext(spr_big_collectible,0,x,y,0.4,0.4,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"2",global.default_text_size,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=85)and(asset_get_type("spr_bucket")==asset_sprite){sprite_index=spr_bucket;if (asset_get_type("spr_big_collectible")==asset_sprite){draw_sprite_ext(spr_big_collectible,0,x,y,0.4,0.4,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"3",global.default_text_size,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=86)and(asset_get_type("spr_bucket")==asset_sprite){sprite_index=spr_bucket;if (asset_get_type("spr_big_collectible")==asset_sprite){draw_sprite_ext(spr_big_collectible,0,x,y,0.4,0.4,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"4",global.default_text_size,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=87)and(asset_get_type("spr_bucket")==asset_sprite){sprite_index=spr_bucket;if (asset_get_type("spr_big_collectible")==asset_sprite){draw_sprite_ext(spr_big_collectible,0,x,y,0.4,0.4,0,c_white,image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x,y,"5",global.default_text_size,c_white,c_black,image_alpha);mask_index=spr_wall;}
if (object=88)and(asset_get_type("spr_bucket")==asset_sprite){sprite_index=spr_bucket;if (asset_get_type("spr_invincibility_powerup")==asset_sprite){draw_sprite_ext(spr_invincibility_powerup,0,x,y,0.5,0.5,0,c_white,image_alpha);}mask_index=spr_wall;}
#endregion /*Bucket END*/
if (object=89)and(asset_get_type("spr_bird")==asset_sprite){sprite_index=spr_bird;mask_index=spr_wall;}
if (object=90)and(asset_get_type("spr_sign_crouch")==asset_sprite){sprite_index=spr_sign_crouch;mask_index=spr_wall;}
if (object=91)and(asset_get_type("spr_sign_dive")==asset_sprite){sprite_index=spr_sign_dive;mask_index=spr_wall;}
if (object=92)and(asset_get_type("spr_sign_groundpound")==asset_sprite){sprite_index=spr_sign_groundpound;mask_index=spr_wall;}
if (object=93)and(asset_get_type("spr_sign_rope_spin")==asset_sprite){sprite_index=spr_sign_rope_spin;mask_index=spr_wall;}
if (object=94)and(asset_get_type("spr_sign_walljump")==asset_sprite){sprite_index=spr_sign_walljump;mask_index=spr_wall;}
if (object=95)and(asset_get_type("spr_boss_stand")==asset_sprite){sprite_index=spr_boss_stand;mask_index=spr_wall;}
#endregion /*Initialize Object End*/

#region /*Difficulty settings per object*/
if (instance_exists(obj_leveleditor))
and(!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, +192, room_height * 2))
and(!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width()-256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
{

#region /*Set to appear on difficulty level*/
if (mouse_check_button(mb_left))
and(!mouse_check_button(mb_right))
and(obj_leveleditor.erase_mode=false)
and(obj_leveleditor.drag_object=false)
{
	if (position_meeting(obj_leveleditor.x,obj_leveleditor.y,id))
	
	/*Place Brush Size 1*/
	or(obj_leveleditor.place_brush_size>=1)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y,id))
	or(obj_leveleditor.place_brush_size>=1)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y+32,id))
	or(obj_leveleditor.place_brush_size>=1)and(position_meeting(obj_leveleditor.x,obj_leveleditor.y+32,id))
	/*Place Brush Size 1 END*/
	
	/*Place Brush Size 2*/
	or(obj_leveleditor.place_brush_size>=2)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y-32,id))
	or(obj_leveleditor.place_brush_size>=2)and(position_meeting(obj_leveleditor.x,obj_leveleditor.y-32,id))
	or(obj_leveleditor.place_brush_size>=2)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y-32,id))
	or(obj_leveleditor.place_brush_size>=2)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y,id))
	or(obj_leveleditor.place_brush_size>=2)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y+32,id))
	/*Place Brush Size 2 END*/
	
	/*Place Brush Size 3*/
	or(obj_leveleditor.place_brush_size>=3)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y-32,id))
	or(obj_leveleditor.place_brush_size>=3)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y,id))
	or(obj_leveleditor.place_brush_size>=3)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y+32,id))
	or(obj_leveleditor.place_brush_size>=3)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y+64,id))
	or(obj_leveleditor.place_brush_size>=3)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y+64,id))
	or(obj_leveleditor.place_brush_size>=3)and(position_meeting(obj_leveleditor.x,obj_leveleditor.y+64,id))
	or(obj_leveleditor.place_brush_size>=3)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y+64,id))
	/*Place Brush Size 3 END*/
	
	/*Place Brush Size 4*/
	or(obj_leveleditor.place_brush_size>=4)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y-64,id))
	or(obj_leveleditor.place_brush_size>=4)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y-64,id))
	or(obj_leveleditor.place_brush_size>=4)and(position_meeting(obj_leveleditor.x,obj_leveleditor.y-64,id))
	or(obj_leveleditor.place_brush_size>=4)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y-64,id))
	or(obj_leveleditor.place_brush_size>=4)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y-64,id))
	or(obj_leveleditor.place_brush_size>=4)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y-32,id))
	or(obj_leveleditor.place_brush_size>=4)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y,id))
	or(obj_leveleditor.place_brush_size>=4)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y+32,id))
	or(obj_leveleditor.place_brush_size>=4)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y+64,id))
	/*Place Brush Size 4 END*/
	
	/*Place Brush Size 5*/
	or(obj_leveleditor.place_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y-64,id))
	or(obj_leveleditor.place_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y-32,id))
	or(obj_leveleditor.place_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y,id))
	or(obj_leveleditor.place_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y+32,id))
	or(obj_leveleditor.place_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y+64,id))
	or(obj_leveleditor.place_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y+96,id))
	or(obj_leveleditor.place_brush_size>=5)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y+96,id))
	or(obj_leveleditor.place_brush_size>=5)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y+96,id))
	or(obj_leveleditor.place_brush_size>=5)and(position_meeting(obj_leveleditor.x,obj_leveleditor.y+96,id))
	or(obj_leveleditor.place_brush_size>=5)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y+96,id))
	or(obj_leveleditor.place_brush_size>=5)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y+96,id))
	/*Place Brush Size 5 END*/
	
	{
		if (obj_leveleditor.difficulty_layer=1)
		and(obj_leveleditor.set_difficulty_mode=true)
		{
			if (easy=false)
			{
				easy=true;
			}
		}
		else
		if (obj_leveleditor.difficulty_layer=2)
		and(obj_leveleditor.set_difficulty_mode=true)
		{
			if (normal=false)
			{
				normal=true;
			}
		}
		else
		if (obj_leveleditor.difficulty_layer=3)
		and(obj_leveleditor.set_difficulty_mode=true)
		{
			if (hard=false)
			{
				hard=true;
			}
		}
	}
}
#endregion /*Set to appear on difficulty level END*/

#region /*Set to dissapear on difficulty level*/
if (mouse_check_button(mb_right))
and(!mouse_check_button(mb_left))
{
	if (position_meeting(obj_leveleditor.x,obj_leveleditor.y,id))
	or(obj_leveleditor.erase_brush_size>=1)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y,id))
	or(obj_leveleditor.erase_brush_size>=1)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y+32,id))
	or(obj_leveleditor.erase_brush_size>=1)and(position_meeting(obj_leveleditor.x,obj_leveleditor.y+32,id))

	or(obj_leveleditor.erase_brush_size>=2)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y-32,id))
	or(obj_leveleditor.erase_brush_size>=2)and(position_meeting(obj_leveleditor.x,obj_leveleditor.y-32,id))
	or(obj_leveleditor.erase_brush_size>=2)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y-32,id))
	or(obj_leveleditor.erase_brush_size>=2)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y,id))
	or(obj_leveleditor.erase_brush_size>=2)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y+32,id))

	or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y-32,id))
	or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y,id))
	or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y+32,id))
	or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y+64,id))
	or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y+64,id))
	or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x,obj_leveleditor.y+64,id))
	or(obj_leveleditor.erase_brush_size>=3)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y+64,id))

	or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y-64,id))
	or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y-64,id))
	or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x,obj_leveleditor.y-64,id))
	or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y-64,id))
	or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y-64,id))
	or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y-32,id))
	or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y,id))
	or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y+32,id))
	or(obj_leveleditor.erase_brush_size>=4)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y+64,id))

	or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y-64,id))
	or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y-32,id))
	or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y,id))
	or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y+32,id))
	or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y+64,id))
	or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+96,obj_leveleditor.y+96,id))
	or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+64,obj_leveleditor.y+96,id))
	or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x+32,obj_leveleditor.y+96,id))
	or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x,obj_leveleditor.y+96,id))
	or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x-32,obj_leveleditor.y+96,id))
	or(obj_leveleditor.erase_brush_size>=5)and(position_meeting(obj_leveleditor.x-64,obj_leveleditor.y+96,id))
	{
		if (obj_leveleditor.difficulty_layer=0)
		{
			if (easy=true)
			{
				easy=false;
			}
			if (normal=true)
			{
				normal=false;
			}
			if (hard=true)
			{
				hard=false;
			}
		}
		else
		if (obj_leveleditor.difficulty_layer=1)
		and(obj_leveleditor.set_difficulty_mode=true)
		{
			if (easy=true)
			{
				easy=false;
			}
		}
		else
		if (obj_leveleditor.difficulty_layer=2)
		and(obj_leveleditor.set_difficulty_mode=true)
		{
			if (normal=true)
			{
				normal=false;
			}
		}
		else
		if (obj_leveleditor.difficulty_layer=3)
		and(obj_leveleditor.set_difficulty_mode=true)
		{
			if (hard=true)
			{
				hard=false;
			}
		}
	}
	#endregion /*Set to dissapear on difficulty level END*/

}
}
#endregion /*Difficulty settings per object END*/