/*________________________________Create Event________________________________*/

#region /*What custom character to use. Change the character sprites and voice*/
player = 1;
custom_character = global.character_for_player_1;
initialize_custom_character_timer = 0;
#endregion /*What custom character to use. Change the character sprites and voice END*/

#region /*Initialize Custom Character*/

#region /*Allow*/
allow_double_jump = false; /*Makes the character able to double jump in mid-air*/
allow_roll = false;
allow_ledge_grab = false; /*Needs fixing, the player should stick to the wall more, if there isn't a wall you should fall, if the wall moves you should move with it*/
allow_ground_pound = true; /*If you can ground pound or not*/
allow_ground_poundjump = true;
allow_wall_jump = true; /*If you can wall jump or not*/
allow_wall_climb = false; /*If you can wall climb or not*/
allow_dive = true; /*Dive when you have speed or during a ground pound*/
allow_dive_ground_boost = true;
allow_survive_lava = true;
allow_run = true;
allow_homing_attack = false;
allow_crawl = true;
allow_tongue = false; /*A tongue that extends*/
allow_overflow_hp = false;
#endregion /*Allow END*/

#region /*Play as Custom Character*/

#region /*Sprite origin point variables*/
mask_xorig = 0;
mask_yorig = 0;
mask_crouch_xorig = 0;
mask_crouch_yorig = 0;
sprite_against_wall_xorig = 0;
sprite_against_wall_yorig = 0;
sprite_climb_under_look_up_xorig = 0;
sprite_climb_under_look_up_yorig = 0;
sprite_climb_under_spin_fast_xorig = 0;
sprite_climb_under_spin_fast_yorig = 0;
sprite_climb_under_spin_xorig = 0;
sprite_climb_under_spin_yorig = 0;
sprite_climb_under_still_xorig = 0;
sprite_climb_under_still_yorig = 0;
sprite_climb_under_xorig = 0;
sprite_climb_under_yorig = 0;
sprite_crawl_xorig = 0;
sprite_crawl_yorig = 0;
sprite_crouch_fall_xorig = 0;
sprite_crouch_fall_yorig = 0;
sprite_crouch_jump_xorig = 0;
sprite_crouch_jump_yorig = 0;
sprite_crouch_xorig = 0;
sprite_crouch_yorig = 0;
sprite_die_xorig = 0;
sprite_die_yorig = 0;
sprite_dive_xorig = 0;
sprite_dive_yorig = 0;
sprite_double_jump_xorig = 0;
sprite_double_jump_yorig = 0;
sprite_fall_slower_xorig = 0;
sprite_fall_slower_yorig = 0;
sprite_fall_xorig = 0;
sprite_fall_yorig = 0;
sprite_ground_pound_get_up_xorig = 0;
sprite_ground_pound_get_up_yorig = 0;
sprite_ground_pound_xorig = 0;
sprite_ground_pound_yorig = 0;
sprite_jump_xorig = 0;
sprite_jump_yorig = 0;
sprite_triple_jump_xorig = 0;
sprite_triple_jump_yorig = 0;
sprite_look_up_xorig = 0;
sprite_look_up_yorig = 0;
sprite_run_xorig = 0;
sprite_run_yorig = 0;
sprite_run2_xorig = 0;
sprite_run2_yorig = 0;
sprite_run3_xorig = 0;
sprite_run3_yorig = 0;
sprite_run4_xorig = 0;
sprite_run4_yorig = 0;
sprite_skidding_xorig = 0;
sprite_skidding_yorig = 0;
sprite_spring_up_xorig = 0;
sprite_spring_up_yorig = 0;
sprite_spring_transition_xorig = 0;
sprite_spring_transition_yorig = 0;
sprite_spring_down_xorig = 0;
sprite_spring_down_yorig = 0;
sprite_stand_cold_xorig = 0;
sprite_stand_cold_yorig = 0;
sprite_stand_xorig = 0;
sprite_stand_yorig = 0;
sprite_standing_on_something_xorig = 0;
sprite_standing_on_something_yorig = 0;
sprite_stomp_spin_xorig = 0;
sprite_stomp_spin_yorig = 0;
sprite_swim_fall_xorig = 0;
sprite_swim_fall_yorig = 0;
sprite_swim_xorig = 0;
sprite_swim_yorig = 0;
sprite_vine_climb_xorig = 0;
sprite_vine_climb_yorig = 0;
sprite_vine_stay_xorig = 0;
sprite_vine_stay_yorig = 0;
sprite_walk_xorig = 0;
sprite_walk_yorig = 0;
sprite_wall_slide_down_xorig = 0;
sprite_wall_slide_down_yorig = 0;
sprite_wall_slide_up_xorig = 0;
sprite_wall_slide_up_yorig = 0;
sprite_wall_slide_xorig = 0;
sprite_wall_slide_yorig = 0;
#endregion /*If there is no config.ini file, then make every xorig and yorig variable zero END*/

#endregion /*Sprite origin point variables END*/

#region /*Mask Index*/
sprite_mask = sprite_index;
#endregion /*Mask Index END*/

#region /*Mask Crouch Index*/
sprite_mask_crouch = sprite_index;
#endregion /*Mask Crouch Index END*/

#region /*Sprite variables*/
sprite_stand = spr_player_stand;
sprite_stand_cold = noone;
sprite_standing_on_something = noone;
sprite_look_up_start = noone;
sprite_look_up = noone;
sprite_crouch = noone;
sprite_crouch_crawl = noone;
sprite_crouch_jump = noone;
sprite_crouch_fall = noone;
sprite_skidding = noone;
sprite_skidding_stop = noone;
sprite_spring_up = noone;
sprite_spring_transition = noone;
sprite_spring_down = noone;
sprite_player_spring_up = noone;
sprite_player_spring_transition = noone;
sprite_player_spring_down = noone;
sprite_swim = noone;
sprite_swim_fall = noone;
sprite_against_wall = noone;
sprite_walk = noone;
sprite_run = noone;
sprite_run2 = noone;
sprite_run3 = noone;
sprite_run4 = noone;
sprite_jump = noone;
sprite_double_jump = noone;
sprite_triple_jump = noone;
sprite_fall = noone;
sprite_fall_slower = noone;
sprite_climb_under_still = noone;
sprite_climb_under = noone;
sprite_climb_under_look_up = noone;
sprite_climb_under_spin = noone;
sprite_climb_under_spin_fast = noone;
sprite_ground_pound = noone;
sprite_ground_pound_get_up = noone;
sprite_stomp_spin = noone;
sprite_wall_slide = noone;
sprite_wall_slide_up = noone;
sprite_wall_slide_down = noone;
sprite_dive = noone;
sprite_die = noone;
sprite_vine_climb = noone;
sprite_vine_stay = noone;
#endregion /*Sprite variables END*/

#region /*Sound variables*/

#region /*Voices*/

#region /*Voice Wall Jump*/
voice_wall_jump_1 = noone; /*Voice Wall Jump 1*/
voice_wall_jump_2 = noone; /*Voice Wall Jump 2*/
voice_wall_jump_3 = noone; /*Voice Wall Jump 3*/
voice_wall_jump_4 = noone; /*Voice Wall Jump 4*/
voice_wall_jump_5 = noone; /*Voice Wall Jump 5*/
voice_wall_jump_6 = noone; /*Voice Wall Jump 6*/
voice_wall_jump_7 = noone; /*Voice Wall Jump 7*/
voice_wall_jump_8 = noone; /*Voice Wall Jump 8*/
voice_wall_jump_9 = noone; /*Voice Wall Jump 9*/
voice_wall_jump_10 = noone; /*Voice Wall Jump 10*/
#endregion /*Voice Wall Jump END*/

#region /*Voice Start Running*/
voice_start_running_1 = noone; /*Voice Start Running 1*/
voice_start_running_2 = noone; /*Voice Start Running 2*/
voice_start_running_3 = noone; /*Voice Start Running 3*/
voice_start_running_4 = noone; /*Voice Start Running 4*/
voice_start_running_5 = noone; /*Voice Start Running 5*/
voice_start_running_6 = noone; /*Voice Start Running 6*/
voice_start_running_7 = noone; /*Voice Start Running 7*/
voice_start_running_8 = noone; /*Voice Start Running 8*/
voice_start_running_9 = noone; /*Voice Start Running 9*/
voice_start_running_10 = noone; /*Voice Start Running 10*/
#endregion /*Voice Start Running END*/

#region /*Voice Rope Catch*/
voice_rope_catch_1 = noone; /*Voice Rope Catch 1*/
voice_rope_catch_2 = noone; /*Voice Rope Catch 2*/
voice_rope_catch_3 = noone; /*Voice Rope Catch 3*/
voice_rope_catch_4 = noone; /*Voice Rope Catch 4*/
voice_rope_catch_5 = noone; /*Voice Rope Catch 5*/
voice_rope_catch_6 = noone; /*Voice Rope Catch 6*/
voice_rope_catch_7 = noone; /*Voice Rope Catch 7*/
voice_rope_catch_8 = noone; /*Voice Rope Catch 8*/
voice_rope_catch_9 = noone; /*Voice Rope Catch 9*/
voice_rope_catch_10 = noone; /*Voice Rope Catch 10*/
#endregion /*Voice Rope Catch END*/

#region /*Voice Jump Spring*/
voice_jump_spring_1 = noone; /*Voice Jump Spring 1*/
voice_jump_spring_2 = noone; /*Voice Jump Spring 2*/
voice_jump_spring_3 = noone; /*Voice Jump Spring 3*/
voice_jump_spring_4 = noone; /*Voice Jump Spring 4*/
voice_jump_spring_5 = noone; /*Voice Jump Spring 5*/
voice_jump_spring_6 = noone; /*Voice Jump Spring 6*/
voice_jump_spring_7 = noone; /*Voice Jump Spring 7*/
voice_jump_spring_8 = noone; /*Voice Jump Spring 8*/
voice_jump_spring_9 = noone; /*Voice Jump Spring 9*/
voice_jump_spring_10 = noone; /*Voice Jump Spring 10*/
#endregion /*Voice Jump Spring END*/

#region /*Voice Jump Rope*/
voice_jump_rope_1 = noone; /*Voice Jump Rope 1*/
voice_jump_rope_2 = noone; /*Voice Jump Rope 2*/
voice_jump_rope_3 = noone; /*Voice Jump Rope 3*/
voice_jump_rope_4 = noone; /*Voice Jump Rope 4*/
voice_jump_rope_5 = noone; /*Voice Jump Rope 5*/
voice_jump_rope_6 = noone; /*Voice Jump Rope 6*/
voice_jump_rope_7 = noone; /*Voice Jump Rope 7*/
voice_jump_rope_8 = noone; /*Voice Jump Rope 8*/
voice_jump_rope_9 = noone; /*Voice Jump Rope 9*/
voice_jump_rope_10 = noone; /*Voice Jump Rope 10*/
#endregion /*Voice Jump Rope END*/

#region /*Voice Jump*/
voice_jump_1 = noone; /*Voice Jump 1*/
voice_jump_2 = noone; /*Voice Jump 2*/
voice_jump_3 = noone; /*Voice Jump 3*/
voice_jump_4 = noone; /*Voice Jump 4*/
voice_jump_5 = noone; /*Voice Jump 5*/
voice_jump_6 = noone; /*Voice Jump 6*/
voice_jump_7 = noone; /*Voice Jump 7*/
voice_jump_8 = noone; /*Voice Jump 8*/
voice_jump_9 = noone; /*Voice Jump 9*/
voice_jump_10 = noone; /*Voice Jump 10*/
#endregion /*Voice Jump END*/

#region /*Voice Jump 3rd*/
voice_jump_3rd_1 = noone; /*Voice Jump 3rd 1*/
voice_jump_3rd_2 = noone; /*Voice Jump 3rd 2*/
voice_jump_3rd_3 = noone; /*Voice Jump 3rd 3*/
voice_jump_3rd_4 = noone; /*Voice Jump 3rd 4*/
voice_jump_3rd_5 = noone; /*Voice Jump 3rd 5*/
voice_jump_3rd_6 = noone; /*Voice Jump 3rd 6*/
voice_jump_3rd_7 = noone; /*Voice Jump 3rd 7*/
voice_jump_3rd_8 = noone; /*Voice Jump 3rd 8*/
voice_jump_3rd_9 = noone; /*Voice Jump 3rd 9*/
voice_jump_3rd_10 = noone; /*Voice Jump 3rd 10*/
#endregion /*Voice Jump 3rd END*/

#region /*Voice Jump 2nd*/
voice_jump_2nd_1 = noone; /*Voice Jump 2nd 1*/
voice_jump_2nd_2 = noone; /*Voice Jump 2nd 2*/
voice_jump_2nd_3 = noone; /*Voice Jump 2nd 3*/
voice_jump_2nd_4 = noone; /*Voice Jump 2nd 4*/
voice_jump_2nd_5 = noone; /*Voice Jump 2nd 5*/
voice_jump_2nd_6 = noone; /*Voice Jump 2nd 6*/
voice_jump_2nd_7 = noone; /*Voice Jump 2nd 7*/
voice_jump_2nd_8 = noone; /*Voice Jump 2nd 8*/
voice_jump_2nd_9 = noone; /*Voice Jump 2nd 9*/
voice_jump_2nd_10 = noone; /*Voice Jump 2nd 10*/
#endregion /*Voice Jump 2nd END*/

#region /*Voice Get Invincibility*/
voice_get_invincibility_1 = noone; /*Voice Get Invincibility 1*/
voice_get_invincibility_2 = noone; /*Voice Get Invincibility 2*/
voice_get_invincibility_3 = noone; /*Voice Get Invincibility 3*/
voice_get_invincibility_4 = noone; /*Voice Get Invincibility 4*/
voice_get_invincibility_5 = noone; /*Voice Get Invincibility 5*/
voice_get_invincibility_6 = noone; /*Voice Get Invincibility 6*/
voice_get_invincibility_7 = noone; /*Voice Get Invincibility 7*/
voice_get_invincibility_8 = noone; /*Voice Get Invincibility 8*/
voice_get_invincibility_9 = noone; /*Voice Get Invincibility 9*/
voice_get_invincibility_10 = noone; /*Voice Get Invincibility 10*/
#endregion /*Voice Get Invincibility END*/

#region /*Voice Enter Goal*/
voice_enter_goal_1 = noone; /*Voice Enter Goal 1*/
voice_enter_goal_2 = noone; /*Voice Enter Goal 2*/
voice_enter_goal_3 = noone; /*Voice Enter Goal 3*/
voice_enter_goal_4 = noone; /*Voice Enter Goal 4*/
voice_enter_goal_5 = noone; /*Voice Enter Goal 5*/
voice_enter_goal_6 = noone; /*Voice Enter Goal 6*/
voice_enter_goal_7 = noone; /*Voice Enter Goal 7*/
voice_enter_goal_8 = noone; /*Voice Enter Goal 8*/
voice_enter_goal_9 = noone; /*Voice Enter Goal 9*/
voice_enter_goal_10 = noone; /*Voice Enter Goal 10*/
#endregion /*Voice Enter Goal END*/

#region /*Voice Dive*/
voice_dive_1 = noone; /*Voice Dive 1*/
voice_dive_2 = noone; /*Voice Dive 2*/
voice_dive_3 = noone; /*Voice Dive 3*/
voice_dive_4 = noone; /*Voice Dive 4*/
voice_dive_5 = noone; /*Voice Dive 5*/
voice_dive_6 = noone; /*Voice Dive 6*/
voice_dive_7 = noone; /*Voice Dive 7*/
voice_dive_8 = noone; /*Voice Dive 8*/
voice_dive_9 = noone; /*Voice Dive 9*/
voice_dive_10 = noone; /*Voice Dive 10*/
#endregion /*Voice Dive END*/

#region /*Voice Damage*/
voice_damage_1 = noone; /*Voice Damage 1*/
voice_damage_2 = noone; /*Voice Damage 2*/
voice_damage_3 = noone; /*Voice Damage 3*/
voice_damage_4 = noone; /*Voice Damage 4*/
voice_damage_5 = noone; /*Voice Damage 5*/
voice_damage_6 = noone; /*Voice Damage 6*/
voice_damage_7 = noone; /*Voice Damage 7*/
voice_damage_8 = noone; /*Voice Damage 8*/
voice_damage_9 = noone; /*Voice Damage 9*/
voice_damage_10 = noone; /*Voice Damage 10*/
#endregion /*Voice Damage END*/

#region /*Voice Burned Running*/
voice_burned_running_1 = noone; /*Voice Burned Running 1*/
voice_burned_running_2 = noone; /*Voice Burned Running 2*/
voice_burned_running_3 = noone; /*Voice Burned Running 3*/
voice_burned_running_4 = noone; /*Voice Burned Running 4*/
voice_burned_running_5 = noone; /*Voice Burned Running 5*/
voice_burned_running_6 = noone; /*Voice Burned Running 6*/
voice_burned_running_7 = noone; /*Voice Burned Running 7*/
voice_burned_running_8 = noone; /*Voice Burned Running 8*/
voice_burned_running_9 = noone; /*Voice Burned Running 9*/
voice_burned_running_10 = noone; /*Voice Burned Running 10*/
#endregion /*Voice Burned Running END*/

#region /*Voice Burned*/
voice_burned_1 = noone; /*Voice Burned 1*/
voice_burned_2 = noone; /*Voice Burned 2*/
voice_burned_3 = noone; /*Voice Burned 3*/
voice_burned_4 = noone; /*Voice Burned 4*/
voice_burned_5 = noone; /*Voice Burned 5*/
voice_burned_6 = noone; /*Voice Burned 6*/
voice_burned_7 = noone; /*Voice Burned 7*/
voice_burned_8 = noone; /*Voice Burned 8*/
voice_burned_9 = noone; /*Voice Burned 9*/
voice_burned_10 = noone; /*Voice Burned 10*/
#endregion /*Voice Burned END*/

#endregion /*Voices END*/

#region /*Voices Variation Number*/
voice_wall_jump_sndnumb = 1;
voice_start_running_sndnumb = 1;
voice_rope_catch_sndnumb = 1;
voice_jump_spring_sndnumb = 1;
voice_jump_rope_sndnumb = 1;
voice_jump_sndnumb = 1;
voice_jump_3rd_sndnumb = 1;
voice_jump_2nd_sndnumb = 1;
voice_get_invincibility_sndnumb = 1;
voice_enter_goal_sndnumb = 1;
voice_dive_sndnumb = 1;
voice_damage_sndnumb = 1;
voice_burned_running_sndnumb = 1;
voice_burned_sndnumb = 1;
#endregion /*Voices Variation Number*/

voice_wallkick = noone;
voice_startdash = noone;
voice_rope_catch = noone;
voice_jump_spring = noone;
voice_jump_rope = noone;
voice_jump = noone;
voice_jump3rd = noone;
voice_jump2nd = noone;
voice_get_star = noone;
voice_enter_goal = noone;
voice_dive = noone;
voice_damage = noone;
voice_burned_running = noone;
voice_burned = noone;

#endregion /*Sound variables END*/

#endregion /*Play as Custom Character END*/

#region /*Character Values Handeling*/
acceleration_on_ground = 0.3; /*How much acceleration the character has on ground*/
acceleration_in_air = 0.3; /*How much acceleration the character has in air*/
acceleration_on_ice = 0.05; /*How much acceleration the character has on ice*/
hp = 1; /*Starting HP*/
max_hp = 1; /*Starting Max HP*/
max_overflow_hp = 4; /*Starting Max Overflow HP*/
speed_max_walk = 4 /*Default speed_max_walk is 4. Top speed with simple walking*/
speed_max_run = 8 /*Default speed_max_run is 8. Top speed with simple running*/
triple_jump_height = 14.5;
normal_jump_height = 11.5;
higher_jump_height = 13;
double_jump_height = 11.5;
hoverstomp_distance = 500;
#endregion /*Character Values Handeling END*/

#endregion /*Initialize Custom Character END*/

/*________________________________*/

#region /*Don't change these variables*/
allow_timeup = true;
allow_timeattack = true;
simple_controls = false; /*Simple Controls, used for testing if a level can be completed with limitations. All levels should be able to be finished, not 100% completed, with this option set to true. This option should be false by default when creating executable*/
stop_screen_from_scrolling_left = false; /*Stop the screen from being able to screoll left*/

assist_invincible = false;
buffer_jump = 0; /*Jump buffer timer, set to 0*/
can_climb_horizontal_rope_cooldown = 0;
can_dive = true;
can_double_jump = true;
can_ground_pound = true;
can_ledge_grab = true;
can_tongue = true;
dive = false;
dive_on_ground = false;
double_jump_depleted_blink = 0;
ground_pound = false;
hspeed_dir = 1;
ledge_grab = false;
ledge_grab_jump = false;
roll = false;
ropeAngleVelocity = 0;
ropeswing = false;
stick_to_wall = false;
wall_jump = false;
can_wall_jump = true;
look_up_start_animation = true;
#endregion /*Don't change these variables END*/

#region /*Rope Swing Variables*/
grappleX = x;
grappleY = y;
ropeAngle = point_direction(grappleX, grappleY, x, y);
ropeLength = point_distance(grappleX, grappleY, x, y);
#endregion /*Rope Swing Variables END*/

speed_max = 4; /*Default max speed is 4, this value is what changes and determines the max speed*/
have_heart_balloon = false; /*If you have the heart balloon upgrade or not. You start without it*/
double_tap_run_timer = 0;
double_tap_left = false;
double_tap_right = false;

#region /*Custom Music*/
if (asset_get_type("room_title") == asset_room)
and(room != room_title)
{
	
	#region /*Update Music*/
	/*OGG small letter File*/
	if (file_exists("Levels/Level" + string(global.level_editor_level) + "/Sounds/Music/music.ogg"))
	and(global.character_select_in_this_menu="game")
	{
		global.music = audio_create_stream("Levels/Level" + string(global.level_editor_level) + "/Sounds/Music/music.ogg");
	}
	else
	/*OGG big letter File*/
	if (file_exists("Levels/Level" + string(global.level_editor_level) + "/Sounds/Music/Music.ogg"))
	and(global.character_select_in_this_menu="game")
	{
		global.music = audio_create_stream("Levels/Level" + string(global.level_editor_level) + "/Sounds/Music/Music.ogg");
	}
	else
	/*OGG small letter File*/
	if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Sounds/Music/music.ogg"))
	{
		global.music = audio_create_stream(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Sounds/Music/music.ogg");
	}
	else
	/*OGG big letter File*/
	if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Sounds/Music/Music.ogg"))
	{
		global.music = audio_create_stream(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Sounds/Music/Music.ogg");
	}
	else
	{
		global.music = noone;
	}
	#endregion /*Update Music END*/
	
	#region /*Update Music Underwater*/
	/*OGG small letter File*/
	if (file_exists("Levels/Level" + string(global.level_editor_level) + "/Sounds/Music/music_underwater.ogg"))
	and(global.character_select_in_this_menu="game")
	{
		global.music_underwater = audio_create_stream("Levels/Level" + string(global.level_editor_level) + "/Sounds/Music/music_underwater.ogg");
	}
	else
	/*OGG big letter File*/
	if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Sounds/Music/Music_underwater.ogg"))
	and(global.character_select_in_this_menu="game")
	{
		global.music_underwater = audio_create_stream(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Sounds/Music/Music_underwater.ogg");
	}
	else
	/*OGG small letter File*/
	if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Sounds/Music/music_underwater.ogg"))
	{
		global.music_underwater = audio_create_stream(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Sounds/Music/music_underwater.ogg");
	}
	else
	/*OGG big letter File*/
	if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Sounds/Music/Music_underwater.ogg"))
	{
		global.music_underwater = audio_create_stream(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Sounds/Music/Music_underwater.ogg");
	}
	else
	{
		global.music_underwater = noone;
	}
	#endregion /*Update Music Underwater END*/
	
	#region /*Update Level Clear Melody*/
	/*OGG small letter File*/
	if (file_exists("Levels/Level" + string(global.level_editor_level) + "/Sounds/Melody/clear_melody.ogg"))
	and(global.character_select_in_this_menu="game")
	{
		level_clear_melody = audio_create_stream(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Sounds/Melody/clear_melody.ogg");
	}
	else
	/*OGG big letter File*/
	if (file_exists("Levels/Level" + string(global.level_editor_level) + "/Sounds/Melody/Clear_Melody.ogg"))
	and(global.character_select_in_this_menu="game")
	{
		level_clear_melody = audio_create_stream(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Sounds/Melody/Clear_Melody.ogg");
	}
	else
	/*OGG small letter File*/
	if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Sounds/Melody/clear_melody.ogg"))
	{
		level_clear_melody = audio_create_stream(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Sounds/Melody/clear_melody.ogg");
	}
	else
	/*OGG big letter File*/
	if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Sounds/Melody/Clear_Melody.ogg"))
	{
		level_clear_melody = audio_create_stream(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Sounds/Melody/Clear_Melody.ogg");
	}
	else
	{
		level_clear_melody = noone;
	}
	#endregion /*Update Level Clear Melody END*/
	
}
else
{
	global.music = noone;
	global.music_underwater = noone;
	level_clear_melody = noone;
}
#endregion /*Custom Music END*/

#region /*Camera*/
if (asset_get_type("obj_camera") == asset_object)
and(!instance_exists(obj_camera))
{
	instance_create_depth(x, y, 0, obj_camera);
}
#endregion /*Camera END*/

#region /*Heart balloon starting point*/
xx_heart = x;
yy_heart = y;
#endregion /*Heart balloon starting point END*/

#region /*Stop any world map music when playing a level*/
if (asset_get_type("snd_music_map") == asset_sound)
{
	audio_stop_sound(snd_music_map);
}
#endregion /*Stop any world map music when playing a level END*/

overflow_hp = 0; /*Starting Overflow HP. Should be 0 by default*/
controller_connected = false;
stuck_in_wall_counter = 0;
effect_turnaround_subimg = 11
redblinktimer = 0;
die = false;
time = 600;
time_second = 0;
aim_image_index = 0;
invincible = false;
invincible_pitch = 1;
drop_off_wall_climb = false;

in_water = false; /*If the player is in water or not, instead of checking for the actual obj_water, check for this variable instead*/
jump = 0;
triplejumpdelay = 0;
crouch = false;
angle = 0;
speeddash = false;
speedunit = 0;
laststandingx = x;
laststandingy = y;
draw_xscale = 1; /*Sprite horizontal stretching, set to 1*/
draw_yscale = 1; /*Sprite vertical stretching, set to 1*/
xx = x;
yy = y;
smooth_teleport = true;
powerup = noone;
power_meter_running_sound = false;
takendamage = 0;
takendamage_freezetime = 80;
music_pitch = 1;
climb = false;
horizontal_rope_climb = false;
burnt = false;
basic_collectibles = 0;
stomp_spin = false;
chain_reaction = 0;
goal = false;
spring = false;
spring_animation = 0;
can_move = true;
voice = noone;

/*Multiplayer END*/

/*Mobile Version*/
mobile_controls = false;
mobile_direction = +1;
mobile_always_right = false;
mobile_swipe_x = x;
mobile_swipe_y = y;
mobile_swipe_x2 = x;
mobile_swipe_y2 = y;
/*Test*/
mobile_swipe_xprevious = x;
mobile_swipe_yprevious = y;
mobile_swipe = noone;
mobile_swipe_timer = 0;
/*Effects handler*/
spark1_effect = false;
spark2_effect = false;

xspd = 0;
yspd = 0;

#region /*Initialize the controls*/
key_dive_pressed = noone;
key_jump = noone;
key_jump_hold = noone;
key_jump_released = noone;
key_crouch = noone;
key_crouch_pressed = noone;
key_sprint = noone;
key_sprint_pressed = noone;
key_sprint_released = noone;
key_up = noone;
key_up_pressed = noone;
key_left = noone;
key_right = noone;
key_down = noone;
key_attack = noone;
key_attack_pressed = noone;
key_attack_released = noone;
key_spin = noone;
key_spin_pressed = noone;
#endregion /*Initialize the controls END*/