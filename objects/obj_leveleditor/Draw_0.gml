///Draw Event
draw_set_alpha(0.5);
draw_rectangle_color(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 0, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
draw_line_width_color(0, camera_get_view_y(view_camera[0]), 0, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), 4, c_white, c_white);
draw_line_width_color(0, camera_get_view_y(view_camera[0]), 0, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), 2, c_black, c_black);

draw_set_alpha(0.5);
draw_rectangle_color(1, camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), 0, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
draw_line_width_color(camera_get_view_x(view_camera[0]), 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), 0, 4, c_white, c_white);
draw_line_width_color(camera_get_view_x(view_camera[0]), 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), 0, 2, c_black, c_black);

/*Level Height Line*/
if (instance_exists(obj_level_height))
{
	draw_line_width_color(camera_get_view_x(view_camera[0]), obj_level_height.y - 16, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), obj_level_height.y - 16, 4, c_white, c_white);
}
if (instance_exists(obj_level_height))
{
	draw_line_width_color(camera_get_view_x(view_camera[0]), obj_level_height.y - 16, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), obj_level_height.y - 16, 2, c_black, c_black);
}

/*Level Width Line*/
if (instance_exists(obj_level_width))
{
	draw_line_width_color(obj_level_width.x - 16, camera_get_view_y(view_camera[0]), obj_level_width.x - 16, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), 4, c_white, c_white);
}
if (instance_exists(obj_level_width))
{
	draw_line_width_color(obj_level_width.x - 16, camera_get_view_y(view_camera[0]), obj_level_width.x - 16, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), 2, c_black, c_black);
}

/*Water Level Height Line*/
if (instance_exists(obj_water_level_height))
{
	draw_line_width_color(camera_get_view_x(view_camera[0]), obj_water_level_height.y - 16, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), obj_water_level_height.y - 16, 4, c_white, c_white);
}
if (instance_exists(obj_water_level_height))
{
	draw_line_width_color(camera_get_view_x(view_camera[0]), obj_water_level_height.y - 16, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), obj_water_level_height.y - 16, 2, c_black, c_black);
}

#region /*Set what controls are used to navigate the menus*/

#region /*Get distance from fake mouse to real mouse*/
var mouse_moving = point_distance(mx, my, window_mouse_get_x(), window_mouse_get_y());
#endregion /*Get distance from fake mouse to real mouse END*/

#region /*update positions of fake mouse*/
mx = window_mouse_get_x();
my = window_mouse_get_y();
#endregion /*update positions of fake mouse*/

if (keyboard_check(vk_anykey))
{
	global.controls_used_for_menu_navigation = "keyboard";
}
else
if (mouse_check_button(mb_any))
or(mouse_wheel_down())
or(mouse_wheel_up())
or(mouse_moving)
{
	global.controls_used_for_menu_navigation = "mouse";
}
else
if (gamepad_button_check(0, gp_face1))
or(gamepad_button_check(0, gp_face2))
or(gamepad_button_check(0, gp_face3))
or(gamepad_button_check(0, gp_face4))
or(gamepad_button_check(0, gp_padd))
or(gamepad_button_check(0, gp_padl))
or(gamepad_button_check(0, gp_padr))
or(gamepad_button_check(0, gp_padu))
or(gamepad_button_check(0, gp_select))
or(gamepad_button_check(0, gp_shoulderl))
or(gamepad_button_check(0, gp_shoulderlb))
or(gamepad_button_check(0, gp_shoulderr))
or(gamepad_button_check(0, gp_shoulderrb))
or(gamepad_button_check(0, gp_start))
or(gamepad_button_check(0, gp_stickl))
or(gamepad_button_check(0, gp_stickr))
or(gamepad_axis_value(0, gp_axislh) <> 0)
or(gamepad_axis_value(0, gp_axislv) <> 0)
or(gamepad_axis_value(0, gp_axisrh) <> 0)
or(gamepad_axis_value(0, gp_axisrv) <> 0)
{
	global.controls_used_for_menu_navigation = "controller";
}
#endregion /*Set what controls are used to navigate the menus END*/

#region /*Backgrounds*/
layer_background_sprite(layer_background_get_id(layer_get_id("Background")), global.custom_background1);
layer_background_sprite(layer_background_get_id(layer_get_id("Background_2")), global.custom_background2);
layer_background_sprite(layer_background_get_id(layer_get_id("Background_3")), global.custom_background3);
layer_background_sprite(layer_background_get_id(layer_get_id("Background_4")), global.custom_background4);
#endregion /*Backgrounds END*/

#region /*Make background visible*/
if (room = room_leveleditor)
{
	if (global.custom_background1> noone)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background")), true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background")), false)
	}

	if (global.custom_background2> noone)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_2")), true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_2")), false)
	}

	if (global.custom_background3> noone)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_3")), true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_3")), false)
	}

	if (global.custom_background4> noone)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_4")), true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_4")), false)
	}
}
#endregion /*Make background visible END*/

#region /*Spawn transparent foreground*/
if (asset_get_type("obj_foreground2") == asset_object)
and (!instance_exists(obj_foreground2))
{
	instance_create_depth(0, 0, 0, obj_foreground2);
}
if (asset_get_type("obj_foreground_secret") == asset_object)
and (!instance_exists(obj_foreground_secret))
{
	instance_create_depth(0, 0, 0, obj_foreground_secret);
}
#endregion /*Spawn transparent foreground END*/

#region /*Controls for level editor*/
key_up = (keyboard_check_pressed(global.player1_key_up)) and (!keyboard_check_pressed(global.player1_key_down))or(keyboard_check_pressed(vk_up)) and (!keyboard_check_pressed(vk_down))or(keyboard_check_pressed(ord("W"))) and (!keyboard_check_pressed(ord("S")))or(gamepad_button_check_pressed(0, gp_padu)) and (!gamepad_button_check_pressed(0, gp_padd))or(gamepad_axis_value(0, gp_axislv) < 0);
key_left = (keyboard_check_pressed(global.player1_key_left)) and (!keyboard_check_pressed(global.player1_key_right))or(keyboard_check_pressed(vk_left)) and (!keyboard_check_pressed(vk_right))or(keyboard_check_pressed(ord("A"))) and (!keyboard_check_pressed(ord("D")))or(gamepad_button_check_pressed(0, gp_padl)) and (!gamepad_button_check_pressed(0, gp_padr))or(gamepad_axis_value(0, gp_axislh) < 0);
key_right = (keyboard_check_pressed(global.player1_key_right)) and (!keyboard_check_pressed(global.player1_key_left))or(keyboard_check_pressed(vk_right)) and (!keyboard_check_pressed(vk_left))or(keyboard_check_pressed(ord("D"))) and (!keyboard_check_pressed(ord("A")))or(gamepad_button_check_pressed(0, gp_padr)) and (!gamepad_button_check_pressed(0, gp_padl))or(gamepad_axis_value(0, gp_axislh) > 0);
key_down = (keyboard_check_pressed(global.player1_key_down)) and (!keyboard_check_pressed(global.player1_key_up))or(keyboard_check_pressed(vk_down)) and (!keyboard_check_pressed(vk_up))or(keyboard_check_pressed(ord("S"))) and (!keyboard_check_pressed(ord("W")))or(gamepad_button_check_pressed(0, gp_padd)) and (!gamepad_button_check_pressed(0, gp_padu))or(gamepad_axis_value(0, gp_axislv) > 0);
key_a_pressed = (gamepad_button_check_pressed(0, gp_face1))or(keyboard_check_pressed(global.player1_key_jump))or(keyboard_check_pressed(ord("Z")))or(keyboard_check_pressed(vk_space))or(keyboard_check_pressed(vk_enter));
key_a_released = (gamepad_button_check_released(0, gp_face1))or(keyboard_check_released(global.player1_key_jump))or(keyboard_check_released(ord("Z")))or(keyboard_check_released(vk_space))or(keyboard_check_released(vk_enter));
key_a_hold = (gamepad_button_check(0, gp_face1))or(keyboard_check(global.player1_key_jump))or(keyboard_check(ord("Z")))or(keyboard_check(vk_space))or(keyboard_check(vk_enter));
key_b_hold = (gamepad_button_check(0, gp_face2))or(keyboard_check(global.player1_key_sprint))or(keyboard_check(ord("X")))or(keyboard_check(vk_backspace));
key_b_pressed = (gamepad_button_check_pressed(0, gp_face2))or(keyboard_check_pressed(global.player1_key_sprint))or(keyboard_check_pressed(ord("X")))or(keyboard_check_pressed(vk_backspace))or(mouse_check_button_pressed(mb_right))or(mouse_check_button_pressed(mb_side1));
key_b_released = (gamepad_button_check_released(0, gp_face2))or(keyboard_check_released(global.player1_key_sprint))or(keyboard_check_released(ord("X")))or(keyboard_check_released(vk_backspace));
#endregion /*Controls for level editor END*/

#region /*List of Placable Objects*/
total_number_of_objects = 65; /*This is the total number of objects you have in the list to let the level editor know (0 is counted as object number 1)*/
if (selected_object = 0){place_object = "wall";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_wall") == asset_sprite){sprite_index = spr_wall;}mask_index = spr_wall;}
if (selected_object = 1){place_object = "wall_dirt";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_wall_dirt") == asset_sprite){sprite_index = spr_wall_dirt;}mask_index = spr_wall;}
if (selected_object = 2){place_object = "wall_glass";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_wall_glass") == asset_sprite){sprite_index = spr_wall_glass;}mask_index = spr_wall;}
if (selected_object = 3){place_object = "wall_grass";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_wall_grass") == asset_sprite){sprite_index = spr_wall_grass;}mask_index = spr_wall;}
if (selected_object = 4){place_object = "wall_gravel";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_wall_gravel") == asset_sprite){sprite_index = spr_wall_gravel;}mask_index = spr_wall;}
if (selected_object = 5){place_object = "wall_metal";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_wall_metal") == asset_sprite){sprite_index = spr_wall_metal;}mask_index = spr_wall;}
if (selected_object = 6){place_object = "wall_stone";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_wall_stone") == asset_sprite){sprite_index = spr_wall_stone;}mask_index = spr_wall;}
if (selected_object = 7){place_object = "wall_wood";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_wall_wood") == asset_sprite){sprite_index = spr_wall_wood;}mask_index = spr_wall;}

if (selected_object = 8){place_object = "wall_jump_panel";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_wall_jump_panel") == asset_sprite){sprite_index = spr_wall_jump_panel;}mask_index = spr_wall;draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2, camera_get_view_y(view_camera[view_current]) + 144, Text("Wall Jump Panel - When a character doesn't have the wall jump ability, lets even these characters wall jump"), global.default_text_size * 0.75, c_black, c_white, selected_menu_alpha);}
if (selected_object = 9){place_object = "wall_climb_panel";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_wall_climb_panel") == asset_sprite){sprite_index = spr_wall_climb_panel;}mask_index = spr_wall;draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2, camera_get_view_y(view_camera[view_current]) + 144, Text("Wall Climb Panel - When a character doesn't have the wall climb ability, lets even these characters wall climb"), global.default_text_size * 0.75, c_black, c_white, selected_menu_alpha);}
if (selected_object = 10){place_object = "spikes";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_spikes") == asset_sprite){sprite_index = spr_spikes;}mask_index = spr_wall;}
if (selected_object = 11){place_object = "semisolid_platform";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_semisolid_platform") == asset_sprite){sprite_index = spr_semisolid_platform;}mask_index = spr_wall;}
if (selected_object = 12){place_object = "brick_block";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_brick_block") == asset_sprite){sprite_index = spr_brick_block;}mask_index = spr_wall;}
if (selected_object = 13){place_object = "question_block";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_question_block") == asset_sprite){sprite_index = spr_question_block;}mask_index = spr_wall;}
if (selected_object = 14){place_object = "hard_block";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_hard_block") == asset_sprite){sprite_index = spr_hard_block;}mask_index = spr_wall;}
if (selected_object = 15){place_object = "falling_block";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_falling_block") == asset_sprite){sprite_index = spr_falling_block;}mask_index = spr_wall;}
if (selected_object = 16){place_object = "falling_block_long";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_falling_block_long") == asset_sprite){sprite_index = spr_falling_block_long;}if (asset_get_type("spr_cardboard") == asset_sprite){mask_index = spr_cardboard;}}
if (selected_object = 17){place_object = "cloud_block";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_cloud_block") == asset_sprite){sprite_index = spr_cloud_block;}mask_index = spr_wall;}
if (selected_object = 18){place_object = "ice_block";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_ice_block") == asset_sprite){sprite_index = spr_ice_block;}mask_index = spr_wall;}
if (selected_object = 19){place_object = "cardboard_block";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_cardboard_block") == asset_sprite){sprite_index = spr_cardboard_block;}mask_index = spr_wall;}
if (selected_object = 20){place_object = "cardboard";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_cardboard") == asset_sprite){sprite_index = spr_cardboard;}if (asset_get_type("spr_cardboard") == asset_sprite){mask_index = spr_cardboard;}}
if (selected_object = 21){place_object = "cardboard_long";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_cardboard_long") == asset_sprite){sprite_index = spr_cardboard_long;}if (asset_get_type("spr_cardboard_long") == asset_sprite){mask_index = spr_cardboard_long;}}
if (selected_object = 22){place_object = "bump_in_ground";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;}mask_index = spr_wall;}
if (selected_object = 23){place_object = "basic_collectible";can_make_place_brush_size_bigger = true;sprite_index = global.resource_pack_sprite_basic_collectible;mask_index = spr_wall;}
if (selected_object = 24){place_object = "big_collectible_1";can_make_place_brush_size_bigger = false;sprite_index = global.resource_pack_sprite_big_collectible;mask_index = spr_wall;}
if (selected_object = 25){place_object = "big_collectible_2";can_make_place_brush_size_bigger = false;sprite_index = global.resource_pack_sprite_big_collectible;mask_index = spr_wall;}
if (selected_object = 26){place_object = "big_collectible_3";can_make_place_brush_size_bigger = false;sprite_index = global.resource_pack_sprite_big_collectible;mask_index = spr_wall;}
if (selected_object = 27){place_object = "big_collectible_4";can_make_place_brush_size_bigger = false;sprite_index = global.resource_pack_sprite_big_collectible;mask_index = spr_wall;}
if (selected_object = 28){place_object = "big_collectible_5";can_make_place_brush_size_bigger = false;sprite_index = global.resource_pack_sprite_big_collectible;mask_index = spr_wall;}
if (selected_object = 29){place_object = "heart";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_heart") == asset_sprite){sprite_index = spr_heart;}mask_index = spr_wall;}
if (selected_object = 30){place_object = "hp_pickup";can_make_place_brush_size_bigger = true;sprite_index = global.resource_pack_sprite_hp_pickup;mask_index = spr_wall;}
if (selected_object = 31){place_object = "invincibility_powerup";can_make_place_brush_size_bigger = true;sprite_index = global.resource_pack_sprite_invincibility_powerup;mask_index = spr_wall;}
if (selected_object = 32){place_object = "invincibility_powerup_coil_spring";can_make_place_brush_size_bigger = true;draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 16, 1, 1, 0, c_white, 0.5);draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 1, 1, 0, c_white, 0.5);sprite_index = noone;mask_index = spr_wall;}
if (selected_object = 33){place_object = "one-up";can_make_place_brush_size_bigger = true; if (sprite_lives_icon > noone){draw_sprite_ext(sprite_lives_icon, 0, x, y, 1, 1, 0, c_white, 0.5);}sprite_index = noone;mask_index = spr_wall;}
if (selected_object = 34){place_object = "two-up";can_make_place_brush_size_bigger = true; if (sprite_lives_icon > noone){draw_sprite_ext(sprite_lives_icon, 0, x, y, 1, 1, 0, c_lime, 0.5);}sprite_index = noone;mask_index = spr_wall;}
if (selected_object = 35){place_object = "three-up";can_make_place_brush_size_bigger = true; if (sprite_lives_icon > noone){draw_sprite_ext(sprite_lives_icon, 0, x, y, 1, 1, 0, c_blue, 0.5);}sprite_index = noone;mask_index = spr_wall;}
if (selected_object = 36){place_object = "basic_enemy";can_make_place_brush_size_bigger = true;sprite_index = sprite_basic_enemy;mask_index = spr_wall;}
if (selected_object = 37){place_object = "basic_enemy_blind";can_make_place_brush_size_bigger = true;sprite_index = sprite_basic_enemy_blind;mask_index = spr_wall;}
if (selected_object = 38){place_object = "enemy_bowlingball";can_make_place_brush_size_bigger = true;sprite_index = sprite_enemy_bowlingball;mask_index = spr_wall;}
if (selected_object = 39){place_object = "enemy_bowlingball_blind";can_make_place_brush_size_bigger = true;sprite_index = sprite_enemy_bowlingball_blind;mask_index = spr_wall;}
if (selected_object = 40){place_object = "big_stationary_enemy";can_make_place_brush_size_bigger = true;sprite_index = sprite_big_stationary_enemy;mask_index = spr_wall;}
if (selected_object = 41){place_object = "blaster";can_make_place_brush_size_bigger = true;sprite_index = global.resource_pack_sprite_blaster;mask_index = spr_wall;}
if (selected_object = 42){place_object = "spring";can_make_place_brush_size_bigger = false; if (asset_get_type("spr_spring") == asset_sprite){sprite_index = spr_spring;}mask_index = spr_wall;}
if (selected_object = 43){place_object = "ladder";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_ladder") == asset_sprite){sprite_index = spr_ladder;}mask_index = spr_wall;}
if (selected_object = 44){place_object = "arrow_sign";can_make_place_brush_size_bigger = false; if (asset_get_type("spr_arrow_sign") == asset_sprite){if (!place_meeting(x, y, obj_leveleditor_placed_object)) and (erase_mode = false){draw_sprite_ext(spr_arrow_sign, 0, x, y, 1, 1, 0, c_white, 0.2);}sprite_index = noone;}mask_index = spr_2x2_block;}
if (selected_object = 45){place_object = "arrow_sign_small";can_make_place_brush_size_bigger = false; if (asset_get_type("spr_arrow_sign_small") == asset_sprite){if (!place_meeting(x, y, obj_leveleditor_placed_object)) and (erase_mode = false){draw_sprite_ext(spr_arrow_sign_small, 0, x, y, 0.5, 0.5, 0, c_white, 0.2);}sprite_index = noone;}mask_index = spr_2x2_block;}
if (selected_object = 46){place_object = "checkpoint";can_make_place_brush_size_bigger = false; if (asset_get_type("spr_checkpoint") == asset_sprite){if (!place_meeting(x, y, obj_leveleditor_placed_object)) and (erase_mode = false){draw_sprite_ext(spr_checkpoint, 0, x, y, 1, 1, 0, c_white, 0.2);}sprite_index = noone;}mask_index = spr_2x2_block;}
if (selected_object = 47){place_object = "spikes_emerge_block";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_spikes_emerge_block") == asset_sprite){sprite_index = spr_spikes_emerge_block;}mask_index = spr_wall;}
if (selected_object = 48){place_object = "oneway";can_make_place_brush_size_bigger = false; if (asset_get_type("spr_oneway") == asset_sprite){draw_sprite_ext(spr_oneway, 0, x, y, 1, 1, 0, c_white, 0.2);sprite_index = noone;mask_index = spr_wall;}}
if (selected_object = 49){place_object = "oneway2";can_make_place_brush_size_bigger = false; if (asset_get_type("spr_oneway") == asset_sprite){draw_sprite_ext(spr_oneway, 0, x, y, 1, 1,90, c_white, 0.2);sprite_index = noone;mask_index = spr_wall;}}
if (selected_object = 50){place_object = "oneway3";can_make_place_brush_size_bigger = false; if (asset_get_type("spr_oneway") == asset_sprite){draw_sprite_ext(spr_oneway, 0, x, y, 1, 1, 180, c_white, 0.2);sprite_index = noone;mask_index = spr_wall;}}
if (selected_object = 51){place_object = "oneway4";can_make_place_brush_size_bigger = false; if (asset_get_type("spr_oneway") == asset_sprite){draw_sprite_ext(spr_oneway, 0, x, y, 1, 1, 270, c_white, 0.2);sprite_index = noone;mask_index = spr_wall;}}
if (selected_object = 52){place_object = "horizontal_rope";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_horizontal_rope") == asset_sprite){sprite_index = spr_horizontal_rope;}mask_index = spr_wall;}
if (selected_object = 53){place_object = "water";can_make_place_brush_size_bigger = false; if (asset_get_type("spr_water_surface") == asset_sprite){sprite_index = spr_water_surface;}mask_index = spr_wall;}
if (selected_object = 54){place_object = "air_bubbles_spawner";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_air_bubbles_spawner") == asset_sprite){sprite_index = spr_air_bubbles_spawner;}else if (asset_get_type("spr_bubble") == asset_sprite){sprite_index = spr_bubble;}mask_index = spr_wall;}
if (selected_object = 55){place_object = "water_level_change_slow";can_make_place_brush_size_bigger = false; if (asset_get_type("spr_water_level_change_slow") == asset_sprite){sprite_index = spr_water_level_change_slow;}mask_index = spr_wall;}
if (selected_object = 56){place_object = "water_level_change_fast";can_make_place_brush_size_bigger = false; if (asset_get_type("spr_water_level_change_fast") == asset_sprite){sprite_index = spr_water_level_change_fast;}mask_index = spr_wall;}
if (selected_object = 57){place_object = "water_level_change_faster";can_make_place_brush_size_bigger = false; if (asset_get_type("spr_water_level_change_faster") == asset_sprite){sprite_index = spr_water_level_change_faster;}mask_index = spr_wall;}
if (selected_object = 58){place_object = "clipped_shirt";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_clipped_shirt") == asset_sprite){sprite_index = spr_clipped_shirt;}mask_index = spr_wall;}
if (selected_object = 59){place_object = "bucket";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;}mask_index = spr_wall;}
if (selected_object = 60){place_object = "bird";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_bird") == asset_sprite){sprite_index = spr_bird;}mask_index = spr_wall;}
if (selected_object = 61){place_object = "sign_crouch";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_sign_crouch") == asset_sprite){sprite_index = spr_sign_crouch;}mask_index = spr_wall;}
if (selected_object = 62){place_object = "boss";can_make_place_brush_size_bigger = false; if (asset_get_type("spr_boss_stand") == asset_sprite){sprite_index = spr_boss_stand;}mask_index = spr_wall;}
if (selected_object = 63){place_object = "boss_barrier";can_make_place_brush_size_bigger = true; if (asset_get_type("spr_boss_barrier") == asset_sprite){sprite_index = spr_boss_barrier;}mask_index = spr_wall;}
if (selected_object = 64){place_object = "cake_stealing_enemy";can_make_place_brush_size_bigger = false;sprite_index = sprite_basic_enemy; if (asset_get_type("spr_cake") == asset_sprite){draw_sprite_ext(spr_cake, 0, x, y - 16, 1, 1, 0, c_white, 0.5);}mask_index = spr_wall;}
if (selected_object = 65){place_object = "artwork_collection";can_make_place_brush_size_bigger = false; if (asset_get_type("spr_artwork_collection") == asset_sprite){sprite_index = spr_artwork_collection;}mask_index = spr_wall;}
#endregion /*List of Placable Objects END*/

#region /*Change Brush Size. Key 187 = +. key 189 = -*/
if (key_a_pressed)or(mouse_check_button(mb_left)){if (mouse_wheel_up()) and!(mouse_check_button(mb_middle))or(keyboard_check_pressed(vk_add))or(keyboard_check_pressed(187)) and!(keyboard_check(vk_control)){if (place_brush_size <5){place_brush_size += 1;}}}
if (key_a_pressed)or(mouse_check_button(mb_left)){if (mouse_wheel_down()) and!(mouse_check_button(mb_middle))or(keyboard_check_pressed(vk_subtract))or(keyboard_check_pressed(189)) and!(keyboard_check(vk_control)){if (place_brush_size > 0){place_brush_size -= 1;}}}
if (erase_mode = false){if (keyboard_check_pressed(vk_add))or(keyboard_check_pressed(187)) and!(keyboard_check(vk_control)){if (place_brush_size <5){place_brush_size += 1;}}
if (keyboard_check_pressed(vk_subtract))or(keyboard_check_pressed(189)) and!(keyboard_check(vk_control)){if (place_brush_size > 0){place_brush_size -= 1;}}}
if (erase_mode = true){if (mouse_wheel_up()) and!(mouse_check_button(mb_middle))or(keyboard_check_pressed(vk_add))or(keyboard_check_pressed(187)) and!(keyboard_check(vk_control)){if (erase_brush_size <5){erase_brush_size += 1;}}
if (mouse_wheel_down()) and!(mouse_check_button(mb_middle))or(keyboard_check_pressed(vk_subtract))or(keyboard_check_pressed(189)) and!(keyboard_check(vk_control)){if (erase_brush_size > 0){erase_brush_size -= 1;}}}#endregion /*Change Brush Size. Key 187 = +. key 189 = -END*/

#region /*Keyboard Shortcuts*/

#region /*Press D key to change to drawing tool in level editor*/
if (keyboard_check_pressed(ord("D")))
{
	if (fill_mode = false)
	and (erase_mode = false)
	{
		if (place_brush_size = 0)
		{
			place_brush_size = 1;
		}
		else
		if (place_brush_size = 1)
		{
			place_brush_size = 2;
		}
		else
		if (place_brush_size = 2)
		{
			place_brush_size = 3;
		}
		else
		if (place_brush_size = 3)
		{
			place_brush_size = 4;
		}
		else
		if (place_brush_size = 4)
		{
			place_brush_size = 5;
		}
		else
		if (place_brush_size = 5)
		{
			place_brush_size = 0;
		}
	}
	else
	{
		fill_mode = false;
		erase_mode = false;
	}
}
else
#endregion /*Press D key to change to drawing tool in level editor END*/

#region /*Press E key to change to erase tool in level editor*/
if (keyboard_check_pressed(ord("E")))
{
	if (erase_mode = false)
	{
		erase_mode = true;
	}
	else
	if (erase_mode = true)
	{
		fill_mode = false;
		if (erase_brush_size = 0)
		{
			erase_brush_size = 1;
		}
		else
		if (erase_brush_size = 1)
		{
			erase_brush_size = 2;
		}
		else
		if (erase_brush_size = 2)
		{
			erase_brush_size = 3;
		}
		else
		if (erase_brush_size = 3)
		{
			erase_brush_size = 4;
		}
		else
		if (erase_brush_size = 4)
		{
			erase_brush_size = 5;
		}
		else
		if (erase_brush_size = 5)
		{
			erase_brush_size = 0;
		}
	}
}
else
#endregion /*Press E key to change to erase tool in level editor*/

#region /*Press F key to change to fill tool in level editor*/
if (keyboard_check_pressed(ord("F")))
{
	if (fill_mode = false)
	{
		erase_mode = false;
		fill_mode = true;
	}
	else
	if (fill_mode_type = "fill")
	{
		erase_mode = false;
		fill_mode_type = "horizontal";
		fill_mode = true;
	}
	else
	if (fill_mode_type = "horizontal")
	{
		erase_mode = false;
		fill_mode_type = "vertical";
		fill_mode = true;
	}
	else
	if (fill_mode_type = "vertical")
	{
		erase_mode = false;
		fill_mode_type = "fill";
		fill_mode = true;
	}
}
#endregion /*Press F key to change to fill tool in level editor*/

#endregion /*Keyboard Shortcuts END*/

#region /*Grid hotkeys*/
if (keyboard_check(vk_control))
and (keyboard_check(vk_shift))
and (keyboard_check_pressed(ord("A")))
and (pause = false)
{
	show_grid = true;
	if (global.grid_hsnap > 16)
	or(global.grid_vsnap > 16)
	{
		global.grid_hsnap -= 16;
		global.grid_vsnap -= 16;
	}
}
else
if (keyboard_check(vk_control))
and (keyboard_check(vk_shift))
and (keyboard_check_pressed(ord("S")))
and (pause = false)
{
	show_grid = true;
	global.grid_hsnap += 16;
	global.grid_vsnap += 16;
}
else
if (keyboard_check(vk_control))
and (!keyboard_check(vk_shift))
and (keyboard_check_pressed(ord("A")))
and (pause = false)
{
	show_grid = true;
	if (global.grid_hsnap > 1)
	or(global.grid_vsnap > 1)
	{
		global.grid_hsnap -= 1;
		global.grid_vsnap -= 1;
	}
}
else
if (keyboard_check(vk_control))
and (!keyboard_check(vk_shift))
and (keyboard_check_pressed(ord("S")))
and (pause = false)
{
	show_grid = true;
	global.grid_hsnap += 1;
	global.grid_vsnap += 1;
}
#endregion /*Grid hotkeys END*/

#region /*Draw Grid*/

#region /*Show or hide grid hotkey*/
if (keyboard_check_pressed(ord("G")))
and (pause = false)
{
	if (show_grid = false)
	{
		show_grid = true;
	}
	else
	{
		show_grid = false;
	}
}
#endregion /*Show or hide grid hotkey END*/

#region /*Fade grid in and out when toggeling*/
if (show_grid = true)
{
	grid_alpha = lerp(grid_alpha, 0.25, 0.1);
}
else
{
	grid_alpha = lerp(grid_alpha, 0, 0.1);
}
#endregion /*Fade grid in and out when toggeling END*/

var grid_width = 1,
grid_offset = 16; /*If the grid should have an offset from the top_left corner of the screen, normally this should be 16*/
draw_set_alpha(grid_alpha);

if (quit_level_editor <= 0)
{
	
	#region /*Draw Horizontal Line in the Grid*/
	for(var i = 0; i < room_width; i += global.grid_hsnap)
	{
		if (global.grid_hsnap > 1)
		{
			draw_line_width_color(i + grid_offset, - 16 + grid_offset, i + grid_offset, room_height + 16 + grid_offset, grid_width, c_white, c_white);
		}
	}
	#endregion /*Draw Horizontal Line in the Grid END*/
	
	#region /*Draw Vertical Line in the Grid*/
	for(var i = 0; i < room_height; i += global.grid_vsnap)
	{
		if (global.grid_vsnap > 1)
		{
			draw_line_width_color(- 16 + grid_offset, i + grid_offset, room_width + 16 + grid_offset, i + grid_offset, grid_width, c_white, c_white);
		}
	}
	#endregion /*Draw Vertical Line in the Grid END*/
	
	#region /*Draw Horizontal Line in the Grid for indicating rooms*/
	for(var i = 0; i < room_width; i += global.grid_hsnap * 24)
	{
		if (global.grid_hsnap > 1)
		{
			draw_line_width_color(i + grid_offset, - 16 + grid_offset, i + grid_offset, room_height + 16 + grid_offset, grid_width * 3, c_white, c_white);
		}
	}
	#endregion /*Draw Horizontal Line in the Grid for indicating rooms END*/
	
	#region /*Draw Vertical Line in the Grid for indicating rooms*/
	for(var i = 0; i < room_height; i += global.grid_vsnap * 13)
	{
		if (global.grid_vsnap > 1)
		{
			draw_line_width_color(- 16 + grid_offset, i + grid_offset, room_width + 16 + grid_offset, i + grid_offset, grid_width * 3, c_white, c_white);
		}
	}
	#endregion /*Draw Vertical Line in the Grid for indicating rooms END*/
	
	if (instance_exists(obj_level_height))
	{
		draw_line_width_color(0, obj_level_height.y/ 2, room_width, obj_level_height.y/ 2, grid_width + 1, c_purple, c_purple); /*Draw Horizontal Line in the middle of the level*/
	}
	if (instance_exists(obj_level_width))
	{
		draw_line_width_color(obj_level_width.x/ 2, 0, obj_level_width.x/ 2, room_height, grid_width + 1, c_purple, c_purple); /*Draw Vertical Line in the middle of the level*/
	}
}

draw_set_alpha(1);
#endregion /*Draw Grid END*/

#region /*Zoom In and Out (Draw red rectangles around the screen when you can't zoom any more)*/
if (pause = false)
{

	#region /*Zoom Out*/
	if (zoom_out = true)
	{
		if (camera_get_view_width(view_camera[view_current]) < room_width)
		and (camera_get_view_height(view_camera[view_current]) < room_height)
		{
			camera_set_view_size((view_camera[view_current]), camera_get_view_width(view_camera[view_current]) +8, camera_get_view_height(view_camera[view_current]) + 4.5);
			camera_set_view_pos((view_camera[view_current]), camera_get_view_x(view_camera[view_current]) -4, camera_get_view_y(view_camera[view_current]) - 2.5);
		}
		else
		{
			draw_rectangle_color(0, 0, camera_get_view_x(view_camera[view_current]) +8, room_height, c_red, c_red, c_red, c_red, false);
			draw_rectangle_color(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 8, 0, room_width, room_height, c_red, c_red, c_red, c_red, false);
			draw_rectangle_color(0, 0, room_width, camera_get_view_y(view_camera[view_current]) +8, c_red, c_red, c_red, c_red, false);
			draw_rectangle_color(0, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 8, room_width, room_height, c_red, c_red, c_red, c_red, false);
		}
	}
	#endregion /*Zoom Out END*/
	
	else
	
	#region /*Reset Zoom*/
	if (zoom_reset = true)
	{
		
		#region /*Limit so cursor and view can't go outside room*/
		scr_set_screen_size();
		
		#region /*Limit controller x and controller y inside room*/
		if (controller_x < camera_get_view_x(view_camera[view_current]))
		{
			controller_x = camera_get_view_x(view_camera[view_current]);
		}
		if (controller_x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		{
			controller_x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]);
		}
		if (controller_y < camera_get_view_y(view_camera[view_current]))
		{
			controller_y = camera_get_view_y(view_camera[view_current]);
		}
		if (controller_y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
		{
			controller_y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]);
		}
		#endregion /*Limit controller x and controller y inside room END*/
		
		#region /*Limit x and y inside room*/
		if (x < camera_get_view_x(view_camera[view_current]))
		{
			x = camera_get_view_x(view_camera[view_current]);
		}
		if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		{
			x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]);
		}
		if (y < camera_get_view_y(view_camera[view_current]))
		{
			y = camera_get_view_y(view_camera[view_current]);
		}
		if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
		{
			y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]);
		}
		#endregion /*Limit x and y inside room END*/
		
		#region /*Limit view inside room*/
		camera_set_view_pos(view_camera[view_current],
		max(0, min(camera_get_view_x(view_camera[view_current]), room_width - camera_get_view_width(view_camera[view_current]))),
		max(0, min(camera_get_view_y(view_camera[view_current]), room_height - camera_get_view_height(view_camera[view_current]))));
		#endregion /*Limit view inside room END*/
		
		#endregion /*Limit so view and cursor can't go outside room END*/
		
	}
	#endregion /*Reset Zoom END*/
	
	else
	
	#region /*Zoom In*/
	if (zoom_in = true)
	{
		if (camera_get_view_width(view_camera[view_current]) > 696)
		and (camera_get_view_height(view_camera[view_current]) > 368)
		{
			camera_set_view_size((view_camera[view_current]), camera_get_view_width(view_camera[view_current]) - 8, camera_get_view_height(view_camera[view_current]) -4.5);
			camera_set_view_pos((view_camera[view_current]), camera_get_view_x(view_camera[view_current]) + 4, camera_get_view_y(view_camera[view_current]) + 2.5);
		}
		else
		{
			draw_rectangle_color(0, 0, camera_get_view_x(view_camera[view_current]) + 1, room_height, c_red, c_red, c_red, c_red, false);
			draw_rectangle_color(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 1, 0, room_width, room_height, c_red, c_red, c_red, c_red, false);
			draw_rectangle_color(0, 0, room_width, camera_get_view_y(view_camera[view_current]) + 1, c_red, c_red, c_red, c_red, false);
			draw_rectangle_color(0, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 1, room_width, room_height, c_red, c_red, c_red, c_red, false);
		}
	}
	#endregion /*Zoom In END*/

}
#endregion /*Zoom In and Out (Draw red rectangles around the screen when you can't zoom any more) END*/

#region /*Select Object Menu*/
if (mouse_check_button(mb_any))
or(keyboard_check(vk_anykey))
or(key_a_hold)
{
	selected_menu_alpha = lerp(selected_menu_alpha, 0, 0.1);
}
else
{
	selected_menu_alpha = lerp(selected_menu_alpha, 0, 0.01);
}
if (quit_level_editor <= 0)
{
	draw_set_alpha(selected_menu_alpha);
	draw_rectangle_color(camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]), camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) + 128, c_black, c_black, c_black, c_black, false);
	if (asset_get_type("spr_wall") == asset_sprite){draw_sprite_ext(spr_wall, 0,											camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_wall_dirt") == asset_sprite){draw_sprite_ext(spr_wall_dirt, 0,									camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_wall_glass") == asset_sprite){draw_sprite_ext(spr_wall_glass, 0,								camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 2, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_wall_grass") == asset_sprite){draw_sprite_ext(spr_wall_grass, 0,								camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 3, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_wall_gravel") == asset_sprite){draw_sprite_ext(spr_wall_gravel, 0,								camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 4, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_wall_metal") == asset_sprite){draw_sprite_ext(spr_wall_metal, 0,								camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 5, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_wall_stone") == asset_sprite){draw_sprite_ext(spr_wall_stone, 0,								camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 6, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_wall_wood") == asset_sprite){draw_sprite_ext(spr_wall_wood, 0,									camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 7, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_wall_jump_panel") == asset_sprite){draw_sprite_ext(spr_wall_jump_panel, 0,						camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 8 + 16, camera_get_view_y(view_camera[view_current]) + 64, 1.5, 1.5, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_wall_climb_panel") == asset_sprite){draw_sprite_ext(spr_wall_climb_panel, 0,					camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 9 + 16, camera_get_view_y(view_camera[view_current]) + 64, 1.5, 1.5, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_spikes") == asset_sprite){draw_sprite_ext(spr_spikes, 0,										camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 10, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_semisolid_platform") == asset_sprite){draw_sprite_ext(spr_semisolid_platform, 0,				camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 11, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_brick_block") == asset_sprite){draw_sprite_ext(spr_brick_block, 0,								camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 12, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_question_block") == asset_sprite){draw_sprite_ext(spr_question_block, 0,						camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 13, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_hard_block") == asset_sprite){draw_sprite_ext(spr_hard_block, 0,								camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 14, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_falling_block") == asset_sprite){draw_sprite_ext(spr_falling_block, 0,							camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 15, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_falling_block_long") == asset_sprite){draw_sprite_ext(spr_falling_block_long, 0,				camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 16 - 16, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_cloud_block") == asset_sprite){draw_sprite_ext(spr_cloud_block, 0,								camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 17, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_ice_block") == asset_sprite){draw_sprite_ext(spr_ice_block, 0,									camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 18, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_cardboard_block") == asset_sprite){draw_sprite_ext(spr_cardboard_block, 0,						camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 19, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_cardboard") == asset_sprite){draw_sprite_ext(spr_cardboard, 0,									camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 20 - 8, camera_get_view_y(view_camera[view_current]) + 64, 0.5, 0.5, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_cardboard_long") == asset_sprite){draw_sprite_ext(spr_cardboard_long, 0,						camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 21 - 16, camera_get_view_y(view_camera[view_current]) + 64, 0.5, 0.5, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(spr_bump_in_ground, 0,						camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 22, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 0,														camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 23, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);
	draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0,															camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 24, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 24, camera_get_view_y(view_camera[view_current]) + 64, "1", global.default_text_size, c_white, c_black,selected_menu_alpha);
	draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0,															camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 25, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 25, camera_get_view_y(view_camera[view_current]) + 64, "2", global.default_text_size, c_white, c_black,selected_menu_alpha);
	draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0,															camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 26, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 26, camera_get_view_y(view_camera[view_current]) + 64, "3", global.default_text_size, c_white, c_black,selected_menu_alpha);
	draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0,															camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 27, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 27, camera_get_view_y(view_camera[view_current]) + 64, "4", global.default_text_size, c_white, c_black,selected_menu_alpha);
	draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0,															camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 28, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 28, camera_get_view_y(view_camera[view_current]) + 64, "5", global.default_text_size, c_white, c_black,selected_menu_alpha);
	if (asset_get_type("spr_heart") == asset_sprite){draw_sprite_ext(spr_heart, 0,											camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 29, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	draw_sprite_ext(global.resource_pack_sprite_hp_pickup, 0,																camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 30, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);
	draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0,													camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 31, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);
	draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0,																camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 32, camera_get_view_y(view_camera[view_current]) + 64 + 16, 1, 1, 0, c_white,selected_menu_alpha);draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 32, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);
	if (sprite_lives_icon > noone){draw_sprite_ext(sprite_lives_icon, 0,													camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 33, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);draw_set_halign(fa_center);draw_set_valign(fa_center);
	draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 33, camera_get_view_y(view_camera[view_current]) + 64, "1-up", global.default_text_size / 2, c_white, c_black,selected_menu_alpha);}
	if (sprite_lives_icon > noone){draw_sprite_ext(sprite_lives_icon, 0,													camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 34, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_lime,selected_menu_alpha);draw_set_halign(fa_center);draw_set_valign(fa_center);
	draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 34, camera_get_view_y(view_camera[view_current]) + 64, "2-up", global.default_text_size / 2, c_white, c_black,selected_menu_alpha);}
	if (sprite_lives_icon > noone){draw_sprite_ext(sprite_lives_icon, 0,													camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 35, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_blue,selected_menu_alpha);draw_set_halign(fa_center);draw_set_valign(fa_center);
	draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 35, camera_get_view_y(view_camera[view_current]) + 64, "3-up", global.default_text_size / 2, c_white, c_black,selected_menu_alpha);}
	if (sprite_basic_enemy > noone){draw_sprite_ext(sprite_basic_enemy, 0,													camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 36, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (sprite_basic_enemy_blind > noone){draw_sprite_ext(sprite_basic_enemy_blind, 0,										camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 37, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (sprite_enemy_bowlingball > noone){draw_sprite_ext(sprite_enemy_bowlingball, 0,										camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 38, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (sprite_enemy_bowlingball_blind > noone){draw_sprite_ext(sprite_enemy_bowlingball_blind, 0,							camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 39, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (sprite_big_stationary_enemy > noone){draw_sprite_ext(sprite_big_stationary_enemy, 0,								camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 40, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	draw_sprite_ext(global.resource_pack_sprite_blaster, 0,																	camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 41, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);
	if (asset_get_type("spr_spring") == asset_sprite){draw_sprite_ext(spr_spring, 0,										camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 42, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_ladder") == asset_sprite){draw_sprite_ext(spr_ladder, 0,										camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 43, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_arrow_sign") == asset_sprite){draw_sprite_ext(spr_arrow_sign, 0,								camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 44, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_arrow_sign_small") == asset_sprite){draw_sprite_ext(spr_arrow_sign_small, 0,					camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 45, camera_get_view_y(view_camera[view_current]) + 64, 0.5, 0.5, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_checkpoint") == asset_sprite){draw_sprite_ext(spr_checkpoint, 0,								camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 46, camera_get_view_y(view_camera[view_current]) + 64 - 16, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_spikes_emerge_block") == asset_sprite){draw_sprite_ext(spr_spikes_emerge_block, 0,				camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 47, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_oneway") == asset_sprite){draw_sprite_ext(spr_oneway, 0,										camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 48, camera_get_view_y(view_camera[view_current]) + 64 - 16, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_oneway") == asset_sprite){draw_sprite_ext(spr_oneway, 0,										camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 49 - 16, camera_get_view_y(view_camera[view_current]) + 64, 1, 1,90, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_oneway") == asset_sprite){draw_sprite_ext(spr_oneway, 0,										camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 50, camera_get_view_y(view_camera[view_current]) + 64 + 16, 1, 1, 180, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_oneway") == asset_sprite){draw_sprite_ext(spr_oneway, 0,										camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 51 + 16, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 270, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_horizontal_rope") == asset_sprite){draw_sprite_ext(spr_horizontal_rope, 0,						camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 52, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_water_surface") == asset_sprite){draw_sprite_ext(spr_water_surface, 0,							camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 53, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_air_bubbles_spawner") == asset_sprite){draw_sprite_ext(spr_air_bubbles_spawner, 0,				camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 54, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_water_level_change_slow") == asset_sprite){draw_sprite_ext(spr_water_level_change_slow, 0,		camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 55, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_water_level_change_fast") == asset_sprite){draw_sprite_ext(spr_water_level_change_fast, 0,		camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 56, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_water_level_change_faster") == asset_sprite){draw_sprite_ext(spr_water_level_change_faster, 0,	camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 57, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_clipped_shirt") == asset_sprite){draw_sprite_ext(spr_clipped_shirt, 0,							camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 58, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_bucket") == asset_sprite){draw_sprite_ext(spr_bucket, 0,										camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 59, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_bird") == asset_sprite){draw_sprite_ext(spr_bird, 0,											camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 60, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_sign_crouch") == asset_sprite){draw_sprite_ext(spr_sign_crouch, 0,								camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 61, camera_get_view_y(view_camera[view_current]) + 64, 0.4, 0.4, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_boss_stand") == asset_sprite){draw_sprite_ext(spr_boss_stand, 0,								camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 62, camera_get_view_y(view_camera[view_current]) + 64, 0.4, 0.4, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_boss_barrier") == asset_sprite){draw_sprite_ext(spr_boss_barrier, 0,							camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 63, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	draw_sprite_ext(sprite_basic_enemy, 0,																					camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 64, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha); if (asset_get_type("spr_cake") == asset_sprite){draw_sprite_ext(spr_cake, 0, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 64, camera_get_view_y(view_camera[view_current]) + 64 - 16, 1, 1, 0, c_white,selected_menu_alpha);}
	if (asset_get_type("spr_artwork_collection") == asset_sprite){draw_sprite_ext(spr_artwork_collection, 0,				camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2 + selected_object_menu_x + 64 * 65, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white,selected_menu_alpha);}
	draw_set_color(c_black);
	draw_arrow(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2, camera_get_view_y(view_camera[view_current]) + 16- 8, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2, camera_get_view_y(view_camera[view_current]) + 16 +8, 40);
	draw_set_color(c_white);
	draw_arrow(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2, camera_get_view_y(view_camera[view_current]) + 16- 8, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2, camera_get_view_y(view_camera[view_current]) + 16 +8, 30);
	draw_set_color(c_black);
	draw_arrow(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2, camera_get_view_y(view_camera[view_current]) + 128- 16 +8, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2, camera_get_view_y(view_camera[view_current]) + 128- 16- 8, 40);
	draw_set_color(c_white);
	draw_arrow(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2, camera_get_view_y(view_camera[view_current]) + 128- 16 +8, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2, camera_get_view_y(view_camera[view_current]) + 128- 16- 8, 30);
	draw_set_alpha(1);
}
#endregion /*Select Object Menu END*/

#region /*Position the Cursor*/
if (quit_level_editor <= 0)
{

#region /*Scroll Cursor*/
if (keyboard_check(vk_space))
and (mouse_check_button(mb_left))
or(mouse_check_button(mb_middle))
{
	if (asset_get_type("spr_cursor_scroll") == asset_sprite)
	{
		mouse_sprite = spr_cursor_scroll;
		window_set_cursor(cr_none);
	}
	else
	{
		window_set_cursor(cr_size_all);
	}
}
else
if (keyboard_check(vk_space))
{
	if (asset_get_type("spr_cursor_scroll") == asset_sprite)
	{
		mouse_sprite = spr_cursor_scroll;
		window_set_cursor(cr_none);
	}
	else
	{
		window_set_cursor(cr_size_all);
	}
}
#endregion /*Scroll Cursor END*/

else

#region /*Fill Cursor*/
if (fill_mode = true)
and (erase_mode = false)
and (scroll_view = false)
and (!place_meeting(x, y, obj_level_player_1_start))
and (!place_meeting(x, y, obj_level_player_2_start))
and (!place_meeting(x, y, obj_level_player_3_start))
and (!place_meeting(x, y, obj_level_player_4_start))
and (!place_meeting(x, y, obj_level_end))
{
	if (!place_meeting(x, y, obj_leveleditor_placed_object))
	and (sprite_index > 0)
	{
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 0.2);
	}
	draw_set_alpha(0.5);
	draw_set_alpha(1);
	if (asset_get_type("spr_cursor_fill") == asset_sprite)
	{
		mouse_sprite = spr_cursor_fill;
		window_set_cursor(cr_none);
	}
	else
	{
		window_set_cursor(cr_arrow);
	}
}
#endregion /*Fill Cursor END*/

else

#region /*Erase Cursor*/
if (erase_mode = true)
and (scroll_view = false)
{
	draw_set_alpha(0.5);
	{
		if (erase_brush_size = 5)
		{
			draw_rectangle_color(x - 80, y- 80, x + 112, y + 112, c_red, c_red, c_red, c_red, false);
		}
		else
		if (erase_brush_size = 4)
		{
			draw_rectangle_color(x - 80, y- 80, x +80, y + 80, c_red, c_red, c_red, c_red, false);
		}
		else
		if (erase_brush_size = 3)
		{
			draw_rectangle_color(x - 48, y - 48, x +80, y + 80, c_red, c_red, c_red, c_red, false);
		}
		else
		if (erase_brush_size = 2)
		{
			draw_rectangle_color(x - 48, y - 48, x + 48, y + 48, c_red, c_red, c_red, c_red, false);
		}
		else
		if (erase_brush_size = 1)
		{
			draw_rectangle_color(x - 16, y - 16, x + 48, y + 48, c_red, c_red, c_red, c_red, false);
		}
		else
		{
			draw_rectangle_color(x - 16, y - 16, x + 16, y + 16, c_red, c_red, c_red, c_red, false);
		}
	}
	draw_set_alpha(1);
	if (asset_get_type("spr_cursor_erase") == asset_sprite)
	{
		mouse_sprite = spr_cursor_erase;
		window_set_cursor(cr_none);
	}
	else
	{
		window_set_cursor(cr_arrow);
	}
}
#endregion /*Erase Cursor END*/

else

#region /*Default Cursor*/
if (asset_get_type("obj_leveleditor_placed_object") == asset_object)
and (scroll_view = false)
and (drag_object = false)
and (fill_mode = false)
and (pause = false)
{
	if (!place_meeting(x, y, obj_leveleditor_placed_object))
	and (sprite_index > 0)
	{
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 0.2);
	}

	if (can_make_place_brush_size_bigger = true)
	{
		if!place_meeting(x + 32, y, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 1){draw_sprite_ext(sprite_index, image_index, x + 32, y, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x + 32, y + 32, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 1){draw_sprite_ext(sprite_index, image_index, x + 32, y + 32, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x, y + 32, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 1){draw_sprite_ext(sprite_index, image_index, x, y + 32, 1, 1, 0, c_white, 0.2);}

		if!place_meeting(x + 32, y - 32, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 2){draw_sprite_ext(sprite_index, image_index, x + 32, y - 32, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x, y - 32, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 2){draw_sprite_ext(sprite_index, image_index, x, y - 32, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x -32, y - 32, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 2){draw_sprite_ext(sprite_index, image_index, x -32, y - 32, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x -32, y, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 2){draw_sprite_ext(sprite_index, image_index, x -32, y, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x -32, y + 32, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 2){draw_sprite_ext(sprite_index, image_index, x -32, y + 32, 1, 1, 0, c_white, 0.2);}

		if!place_meeting(x + 64, y - 32, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x + 64, y - 32, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x + 64, y, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x + 64, y, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x + 64, y + 32, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x + 64, y + 32, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x + 64, y+64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x + 64, y+64, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x + 32, y+64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x + 32, y+64, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x, y+64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x, y+64, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x -32, y+64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x -32, y+64, 1, 1, 0, c_white, 0.2);}

		if!place_meeting(x + 64, y - 64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x + 64, y - 64, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x + 32, y - 64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x + 32, y - 64, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x, y - 64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x, y - 64, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x -32, y - 64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x -32, y - 64, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x - 64, y - 64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x - 64, y - 64, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x - 64, y - 32, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x - 64, y - 32, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x - 64, y, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x - 64, y, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x - 64, y + 32, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x - 64, y + 32, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x - 64, y+64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x - 64, y+64, 1, 1, 0, c_white, 0.2);}

		if!place_meeting(x +96, y - 64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x +96, y - 64, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x +96, y - 32, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x +96, y - 32, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x +96, y, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x +96, y, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x +96, y + 32, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x +96, y + 32, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x +96, y+64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x +96, y+64, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x +96, y+96, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x +96, y+96, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x + 64, y+96, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x + 64, y+96, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x + 32, y+96, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x + 32, y+96, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x, y+96, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x, y+96, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x -32, y+96, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x -32, y+96, 1, 1, 0, c_white, 0.2);}
		if!place_meeting(x - 64, y+96, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x - 64, y+96, 1, 1, 0, c_white, 0.2);}
	}

	#region /*Draw a rectangle around the placable objects*/
	if (place_brush_size = 5)
	and (can_make_place_brush_size_bigger = true)
	{
		draw_rectangle_color(x - 80, y- 80, x + 112, y + 112, c_black, c_black, c_black, c_black, true);
	}
	else
	if (place_brush_size = 4)
	and (can_make_place_brush_size_bigger = true)
	{
		draw_rectangle_color(x - 80, y- 80, x +80, y + 80, c_black, c_black, c_black, c_black, true);
	}
	else
	if (place_brush_size = 3)
	and (can_make_place_brush_size_bigger = true)
	{
		draw_rectangle_color(x - 48, y - 48, x +80, y + 80, c_black, c_black, c_black, c_black, true);
	}
	else
	if (place_brush_size = 2)
	and (can_make_place_brush_size_bigger = true)
	{
		draw_rectangle_color(x - 48, y - 48, x + 48, y + 48, c_black, c_black, c_black, c_black, true);
	}
	else
	if (place_brush_size = 1)
	and (can_make_place_brush_size_bigger = true)
	{
		draw_rectangle_color(x - 16, y - 16, x + 48, y + 48, c_black, c_black, c_black, c_black, true);
	}
	else
	{
		if (mask_index = spr_2x2_block)
		{
			draw_rectangle_color(x - 24, y- 24, x + 24, y + 24, c_black, c_black, c_black, c_black, true);
		}
		else
		{
			draw_rectangle_color(x - 16, y - 16, x + 16, y + 16, c_black, c_black, c_black, c_black, true);
		}
	}
	#endregion /*Draw a rectangle around the placable objects END*/

	if (asset_get_type("spr_cursor_brush") == asset_sprite)
	{
		mouse_sprite = spr_cursor_brush;
		window_set_cursor(cr_none);
	}
	else
	{
		window_set_cursor(cr_arrow);
	}
}
#endregion /*Default Cursor END*/

else

#region /*Drag Cursor*/
if (asset_get_type("obj_leveleditor_placed_object") == asset_object)
and (place_meeting(x, y, obj_leveleditor_placed_object))
or(asset_get_type("obj_level_player_1_start") == asset_object)
and (place_meeting(x, y, obj_level_player_1_start))
or(asset_get_type("obj_level_player_2_start") == asset_object)
and (place_meeting(x, y, obj_level_player_2_start))
or(asset_get_type("obj_level_player_3_start") == asset_object)
and (place_meeting(x, y, obj_level_player_3_start))
or(asset_get_type("obj_level_player_4_start") == asset_object)
and (place_meeting(x, y, obj_level_player_4_start))
or(asset_get_type("obj_level_end") == asset_object)
and (place_meeting(x, y, obj_level_end))
{
	if (drag_object = false)
	and (fill_mode = false)
	and (erase_mode = false)
	and (!mouse_check_button(mb_left))
	or(!key_a_hold)
	{
		if (asset_get_type("spr_cursor_grab") == asset_sprite)
		{
			mouse_sprite = spr_cursor_grab;
			window_set_cursor(cr_none);
		}
	}
	else
	if (drag_object = true)
	and (erase_mode = false)
	{
		if (asset_get_type("spr_cursor_grab") == asset_sprite)
		{
			mouse_sprite = spr_cursor_grab;
			window_set_cursor(cr_none);
		}
		else
		{
			window_set_cursor(cr_drag);
		}
	}
}
#endregion /*Drag Cursor END*/

}
#endregion /*Position the Cursor END*/

#region /*Change modes*/
if (mouse_check_button_pressed(mb_right))
{
	if (pause = false)
	and (menu_delay = 0)
	{
		erase_mode = true;
	}
}
if (mouse_check_button_released(mb_right))
{
	if (pause = false)
	and (menu_delay = 0)
	{
		erase_mode = false;
	}
}
#endregion /*Change modes END*/

if (quit_level_editor <= 0)
{
	
	#region /*When pressing left click, increase current undo value*/
	if (mouse_check_button_pressed(mb_left))
	{
		current_undo_value += 1;
	}
	#endregion /*When pressing left click, increase current undo value END*/
	
	#region /*Minimum undo value*/
	if (current_undo_value <= 0)
	{
		current_undo_value = 0;
	}
	#endregion /*Minimum undo value END*/
	
	#region /*Can put objects above other objects toggle*/
	if (keyboard_check_pressed(ord("S")))
	and (!keyboard_check(vk_control))
	{
		if (can_put_objects_above_other_objects = false)
		{
			can_put_objects_above_other_objects = true;
		}
		else
		{
			can_put_objects_above_other_objects = false;
		}
	}
	#endregion /*Can put objects above other objects toggle END*/
	
	#region /*Fill with Objects*/
	if (mouse_check_button(mb_left))
	and (!keyboard_check(vk_space))
	and (!mouse_check_button(mb_middle))
	and (!mouse_check_button(mb_right))
	and (!key_b_hold)
	and (scroll_view = false)
	and (drag_object = false)
	and (fill_mode = true)
	and (erase_mode = false)
	and (pause = false)
	and (menu_delay = 0)
	and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2)) /*Can't place objects when clicking the bottom buttons*/
	and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /*Can't place objects when clicking the bottom buttons*/
	and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 256, - 64, display_get_gui_width(), + 64)) /*Can't place objects when clicking the top buttons*/
	{
		if (!place_meeting(x, y, obj_leveleditor_placed_object))
		and (!place_meeting(x, y, obj_leveleditor_fill))
		{
			if (fill_mode_type = "fill")
			{
				with (instance_create_depth(x, y, 0, obj_leveleditor_fill))
				{
					fill_mode_type = "fill";
				}
			}
			else
			if (fill_mode_type = "horizontal")
			{
				with (instance_create_depth(x, y, 0, obj_leveleditor_fill))
				{
					fill_mode_type = "horizontal";
				}
			}
			else
			if (fill_mode_type = "vertical")
			{
				with (instance_create_depth(x, y, 0, obj_leveleditor_fill))
				{
					fill_mode_type = "vertical";
				}
			}
		}
	}
	#endregion /*Fill with Objects END*/
	
	#region /*SELECT WHAT OBJECT TO PLACe*/
	
	#region /*Scroll Objects Left*/
	if (mouse_wheel_up())
	and (!mouse_check_button(mb_middle))
	and (!key_a_pressed)
	and (!mouse_check_button(mb_left))
	and (erase_mode = false)
	and (pause = false)
	or (keyboard_check_pressed(ord("Q")))
	and (!mouse_check_button(mb_middle))
	and (!key_a_pressed)
	and (!mouse_check_button(mb_left))
	and (erase_mode = false)
	and (pause = false)
	or(gamepad_button_check_pressed(0, gp_shoulderl))
	and (erase_mode = false)
	and (pause = false)
	{
		if (asset_get_type("obj_leveleditor_fill") == asset_object)
		and (!instance_exists(obj_leveleditor_fill))
		{
			if (asset_get_type("snd_leveleditor_cycle_item_left") == asset_sound)
			{
				audio_play_sound(snd_leveleditor_cycle_item_left, 0, 0);
				audio_sound_gain(snd_leveleditor_cycle_item_left, global.sound_volume * global.main_volume, 0);
			}
			if (selected_object > 0)
			{
				selected_object -= 1;
				selected_object_menu_x += 64;
			}
			else
			{
				selected_object = total_number_of_objects;
				selected_object_menu_x =- 64 *total_number_of_objects;
			}
			selected_menu_alpha = 2;
		}
	}
	#endregion /*Scroll Objects Left END*/
	
	#region /*Scroll Objects Right*/
	if (mouse_wheel_down())
	and (!mouse_check_button(mb_middle))
	and (!key_a_pressed)
	and (!mouse_check_button(mb_left))
	and (erase_mode = false)
	and (pause = false)
	or (keyboard_check_pressed(ord("W")))
	and (!mouse_check_button(mb_middle))
	and (!key_a_pressed)
	and (!mouse_check_button(mb_left))
	and (erase_mode = false)
	and (pause = false)
	or(gamepad_button_check_pressed(0, gp_shoulderr))
	and (erase_mode = false)
	and (pause = false)
	{
		if (asset_get_type("obj_leveleditor_fill") == asset_object)
		and (!instance_exists(obj_leveleditor_fill))
		{
			if (asset_get_type("snd_leveleditor_cycle_item_right") == asset_sound)
			{
				audio_play_sound(snd_leveleditor_cycle_item_right, 0, 0);
				audio_sound_gain(snd_leveleditor_cycle_item_right, global.sound_volume * global.main_volume, 0);
			}
			if (selected_object <total_number_of_objects)
			{
				selected_object += 1;
				selected_object_menu_x -= 64;
			}
			else
			{
				selected_object = 0;
				selected_object_menu_x = 0;
			}
			selected_menu_alpha = 2;
		}
	}
	#endregion /*Scroll Objects Right END*/
	
	#endregion /*SELECT WHAT OBJECT TO PLACE END*/
	
}

#region /*Menu Navigation Delay*/
if (menu_delay > 0)
{
	menu_delay -= 1;
}
if (menu_delay < 0)
{
	menu_delay = 0;
}
#endregion /*Menu Navigation Delay END*/

if (os_type == os_ios)
or(os_type == os_android)
{
	virtual_key_add(1100 - 128, 0, 400, 128, vk_escape); /*Pause virtual key*/

	#region /*Pause virtual key*/
	if (keyboard_check(vk_escape))
	{
		draw_sprite_ext(spr_virtual_key_pause, 0, camera_get_view_x(view_camera[view_current]) + 1100 - 64, camera_get_view_y(view_camera[view_current]) + 32, 0.9, 0.9, 0, c_gray, 0.5);
	}
	else
	{
		draw_sprite_ext(spr_virtual_key_pause, 0, camera_get_view_x(view_camera[view_current]) + 1100 - 64, camera_get_view_y(view_camera[view_current]) + 32, 1, 1, 0, c_white, 0.5);
	}
	#endregion /*Pause virtual key END*/
	
}

#region /*Change mouse cursor. Draw mouse cursor for menu navigation*/
if (global.controls_used_for_menu_navigation = "controller")
{
	
	#region /*Scroll mouse cursor*/
	if (scroll_view = true)
	and (pause = false)
	and (asset_get_type("spr_cursor_scroll") == asset_sprite)
	{
		draw_sprite_ext(spr_cursor_scroll, 1, cursor_x, cursor_y, 1, 1, 0, c_red, 1);
	}
	else
	if (asset_get_type("spr_cursor_scroll") == asset_sprite)
	and (keyboard_check(vk_space))
	and (pause = false)
	{
		draw_sprite_ext(spr_cursor_scroll, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /*Scroll mouse cursor END*/
	
	else
	
	#region /*Grab mouse cursor*/
	if (asset_get_type("spr_cursor_grab") == asset_sprite)
	and (position_meeting(cursor_x, cursor_y, obj_leveleditor_placed_object))
	and (!mouse_check_button(mb_left))
	and (!mouse_check_button(mb_right))
	and (drag_object = false)
	and (asset_get_type("obj_level_player_1_start") == asset_object)
	and (instance_exists(obj_level_player_1_start))
	and (obj_level_player_1_start.drag_object = false)
	and (asset_get_type("obj_level_player_2_start") == asset_object)
	and (instance_exists(obj_level_player_2_start))
	and (obj_level_player_2_start.drag_object = false)
	and (asset_get_type("obj_level_player_3_start") == asset_object)
	and (instance_exists(obj_level_player_3_start))
	and (obj_level_player_3_start.drag_object = false)
	and (asset_get_type("obj_level_player_4_start") == asset_object)
	and (instance_exists(obj_level_player_4_start))
	and (obj_level_player_4_start.drag_object = false)
	and (asset_get_type("obj_level_end") == asset_object)
	and (instance_exists(obj_level_end))
	and (obj_level_end.drag_object = false)
	and (erase_mode = false)
	and (set_difficulty_mode = false)
	and (pause = false)
	and (!point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2))
	and (!point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
	and (!point_in_rectangle(cursor_x, cursor_y, grid_button_x - 32, 0, display_get_gui_width(), 64))
	{
		draw_sprite_ext(spr_cursor_grab, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	else
	if (position_meeting(cursor_x, cursor_y, obj_leveleditor_placed_object))
	and (drag_object = true)
	and (set_difficulty_mode = false)
	and (pause = false)
	and (asset_get_type("obj_level_player_1_start") == asset_object)
	and (instance_exists(obj_level_player_1_start))
	and (obj_level_player_1_start.drag_object = false)
	and (asset_get_type("obj_level_player_2_start") == asset_object)
	and (instance_exists(obj_level_player_2_start))
	and (obj_level_player_2_start.drag_object = false)
	and (asset_get_type("obj_level_player_3_start") == asset_object)
	and (instance_exists(obj_level_player_3_start))
	and (obj_level_player_3_start.drag_object = false)
	and (asset_get_type("obj_level_player_4_start") == asset_object)
	and (instance_exists(obj_level_player_4_start))
	and (obj_level_player_4_start.drag_object = false)
	and (pause = false)
	or(asset_get_type("obj_level_end") == asset_object)
	and (instance_exists(obj_level_end))
	and (obj_level_end.drag_object = true)
	and (pause = false)
	and (!point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2))
	and (!point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
	and (!point_in_rectangle(cursor_x, cursor_y, grid_button_x - 32, 0, display_get_gui_width(), 64))
	{
		draw_sprite_ext(spr_cursor_grab, 1, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /*Grab mouse cursor END*/
	
	else
	
	#region /*Default mouse cursor*/
	if (point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2))
	and (asset_get_type("spr_cursor") == asset_sprite)
	or (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
	and (asset_get_type("spr_cursor") == asset_sprite)
	or (point_in_rectangle(cursor_x, cursor_y, grid_button_x - 32, 0, display_get_gui_width(), 64))
	and (asset_get_type("spr_cursor") == asset_sprite)
	or(pause = true)
	and (asset_get_type("spr_cursor") == asset_sprite)
	{
		draw_sprite_ext(spr_cursor, erase_brush_size, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /*Default mouse cursor END*/
	
	else
	
	#region /*Erase mouse cursor*/
	if (asset_get_type("spr_cursor_erase") == asset_sprite)
	and (erase_mode = true)
	and (pause = false)
	{
		draw_sprite_ext(spr_cursor_erase, erase_brush_size, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /*Erase mouse cursor END*/
	
	else
	
	#region /*Fill mouse cursor*/
	if (asset_get_type("spr_cursor_fill") == asset_sprite)
	and (fill_mode = true)
	and (fill_mode_type = "fill")
	and (drag_object = false)
	and (erase_mode = false)
	and (set_difficulty_mode = false)
	and (pause = false)
	{
		draw_sprite_ext(spr_cursor_fill_full, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /*Fill mouse cursor END*/
	
	else
	
	#region /*Fill Horizontal mouse cursor*/
	if (asset_get_type("spr_cursor_fill") == asset_sprite)
	and (fill_mode = true)
	and (fill_mode_type = "horizontal")
	and (drag_object = false)
	and (erase_mode = false)
	and (set_difficulty_mode = false)
	and (pause = false)
	{
		draw_sprite_ext(spr_cursor_fill, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /*Fill Horizontal mouse cursor END*/
	
	else
	
	#region /*Fill Vertical mouse cursor*/
	if (asset_get_type("spr_cursor_fill") == asset_sprite)
	and (fill_mode = true)
	and (fill_mode_type = "vertical")
	and (drag_object = false)
	and (erase_mode = false)
	and (set_difficulty_mode = false)
	and (pause = false)
	{
		draw_sprite_ext(spr_cursor_fill, 0, cursor_x, cursor_y, 1, 1, 90, c_white, 1);
	}
	#endregion /*Fill Vertical mouse cursor END*/
	
	else
	
	#region /*Brush mouse cursor*/
	if (asset_get_type("spr_cursor_brush") == asset_sprite)
	and (pause = false)
	{
		draw_sprite_ext(spr_cursor_brush, place_brush_size, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /*Brush mouse cursor END*/
	
}
#endregion /*Change mouse cursor. Draw mouse cursor for menu navigation END*/
