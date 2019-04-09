/// @description controller cross-compat in nice
x = oPlayer.x;
y = oPlayer.y+10;

if (oPlayer.controller == 0) {
	image_angle = point_direction(x, y, mouse_x, mouse_y);
} else {
	var controllerRh = gamepad_axis_value(0, gp_axisrh);
	var controllerRv = gamepad_axis_value(0, gp_axisrv);
	// this section could be somewhere else
	if (abs(controllerRh) > 0.2) || (abs(controllerRv) > 0.2) {
		controllerAngle = point_direction(0, 0, controllerRh, controllerRv);
	}
	image_angle = controllerAngle;
}

recoil = max(0, recoil - 1);

firingDelay = firingDelay - 1;
if ((mouse_check_button(mb_left)) || gamepad_button_check(0, gp_shoulderrb)) && (firingDelay < 0) {
	recoil = 4;
	firingDelay = 5;
	ScreenShake(2, 10)
	with (instance_create_layer(x, y, "Bullets", oBullet)) {
		speed = 25;
		direction = other.image_angle + random_range(-3, 3);
		image_angle = direction;
	}
}

x -= lengthdir_x(recoil, image_angle);
y -= lengthdir_y(recoil, image_angle);

if (image_angle > 90) && (image_angle < 270) {
	image_yscale = -1;
} else {
	image_yscale = 1;
}
