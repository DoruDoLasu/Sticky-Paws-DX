if (fall < 100) {
	if (place_meeting(x, y - 1, obj_player)) {
		fall ++;
		image_blend = c_red;
		
		if fall > 75 {
			var random_x = 2.5;
			var random_y = 4;
		} else if fall > 50 {
			var random_x = 2;
			var random_y = 3;
		} else if fall > 25 {
			var random_x = 1.5;
			var random_y = 2;
		} else {
			var random_x = 1;
			var random_y = 1;
		}
		
		xx = random_range(x - random_x, x + random_x);
		yy = random_range(y - random_y, y + random_y);
		
	} else {
		fall = false;
		image_blend = c_white;
		xx = x;
		yy = y;
	}
} else {
	vspeed = clamp(vspeed, -16, 16); /* Limit the vertical speed END */
	gravity_direction = 270;
	gravity = 0.5;
	image_blend = c_red;
	xx = random_range(x - 2.5, x + 2.5);
	yy = xx;
}

#region /* Falling Block falling outside of view */
if (image_alpha < 1) {
	gravity = 0;
	respawn_timer --;
	
	if (respawn_timer <= 0 && !place_meeting(xstart, ystart, obj_player)) {
		x = xstart;
		y = ystart;
		image_alpha = 1;
		effect_create_above(ef_smoke, x, y, 2, c_white);
	}
}
#endregion /* Falling Block falling outside of view END */