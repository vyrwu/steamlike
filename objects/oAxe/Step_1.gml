/// @description Insert description here
// You can write your code in this editor
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

if (image_angle > 90) && (image_angle < 270) {
	image_yscale = -1;
} else {
	image_yscale = 1;
}