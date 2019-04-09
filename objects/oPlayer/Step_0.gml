/// @description Happens every frame. vk_left (virtual keyboard)
if  (hasControl) {
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right)|| keyboard_check(ord("D"));
	key_jump = keyboard_check(vk_space);

	if (key_left) || (key_right) || (key_jump) {
		controller = 0;
	}
	// controller movement settings
	axislhValue = gamepad_axis_value(0, gp_axislh);
	if (abs(axislhValue) > 0.2) {
		key_left = abs(min(axislhValue, 0));
		key_right = max(axislhValue, 0);
		controller = 1;
	}

	if (gamepad_button_check_pressed(0, gp_face1)) {
		key_jump = 1;
		controller = 1;
	}
}
else {
	key_right = 0;
	key_left = 0
	key_jump = 0;
}
// var lasts 1 frame
var move = key_right - key_left;
hsp = move * walksp;
vsp += grv;

if (place_meeting(x, y+1, oWall)) and (key_jump) {
	vsp = -7;
}
 
// collision horizontally
if (place_meeting(x+hsp, y, oWall)) {
	while (!place_meeting(x+sign(hsp), y, oWall)) {
		x += sign(hsp); 
	}
	hsp = 0;
}
x += hsp;

// collision vertically
if (place_meeting(x, y+vsp, oWall)) {
	while (!place_meeting(x, y+sign(vsp), oWall)) {
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

// animation
if (!place_meeting(x, y+1, oWall)) {
	sprite_index = sPlayerA;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
} else {
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = sPlayer;
	} else {
		sprite_index = sPlayerR;
	}
}

if (hsp != 0) {
	// flip the sprite
	image_xscale = sign(hsp);
}
