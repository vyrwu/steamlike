/// @description DRAW BLACK BARS

if(mode != TRANS_MODE.OFF) {
	ph = percent * h_half;
	draw_set_color(c_black);
	draw_rectangle(0, 0, w, ph, false);
	draw_rectangle(0, h, w, h - ph, false);
}

draw_set_color(c_white);
draw_text(50, 50, string(percent));	
