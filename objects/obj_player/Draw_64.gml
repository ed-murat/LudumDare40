if(place_meeting(x,y,obj_directionsign)) {
	startTextFade = 1;
	runOn = 1;
}

if(place_meeting(x,y,obj_badguy)) {
	endTextFade = 1;
	runOn = 2;
}

if(startTextFade > 0) {
	draw_set_font(fnt_snowcap_100);
	draw_set_color(c_black);
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_set_alpha(startTextFade);
	draw_text(window_get_width()/2,window_get_height()/2,startText);
	draw_set_alpha(1);
	startTextFade -= 0.025;
}

if(endTextFade > 0) {
	draw_set_font(fnt_snowcap_100);
	draw_set_color(c_black);
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_set_alpha(endTextFade);
	draw_text(window_get_width()/2,window_get_height()/2,endText);
	draw_set_alpha(1);
	endTextFade -= 0.025;
}

if(runOn == 1) {
	draw_set_font(fnt_cocogoose_18);
	draw_set_color(c_black);
	draw_set_valign(fa_center);
	draw_set_halign(fa_left);
	draw_text(20,20,string(floor(distance_to_object(obj_badguy)/100))+" meters");
}
else if(runOn == 2) {
	draw_set_font(fnt_cocogoose_18);
	draw_set_color(c_black);
	draw_set_valign(fa_center);
	draw_set_halign(fa_left);
	draw_text(20,20,"0 meter");
}

draw_set_font(fnt_cocogoose_18);
draw_set_color(c_black);
draw_set_valign(fa_center);
draw_set_halign(fa_right);
draw_text(window_get_width()-20,20,string(money)+" $");