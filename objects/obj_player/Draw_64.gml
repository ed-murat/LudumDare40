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
draw_text(window_get_width()-20,20,string(money)+"$");
//var colorR = 295 - floor((tax/50)*(255-40));
draw_set_color(make_color_rgb(guiRed,guiGB,guiGB));
draw_text(window_get_width()-20,45,string(tax)+"%");


if(place_meeting(x,y,obj_trigger_endrun)) {
	hspd = 0;

	if(alphaEnd < 0.85) {
		alphaEnd += 0.1;
	}

	if(alphaEnd != 0) {
		draw_set_color(c_black);
		draw_set_alpha(alphaEnd);
		draw_rectangle(0,0,room_width,room_height,0);
		draw_set_alpha(1);
	}

	if(alphaEnd > 0.80) {
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		var final_money = floor(money-(money*(tax/100)));
		draw_set_font(fnt_snowcap_100);
		draw_text(window_get_width()/2,window_get_height()/4-40,"Run ended !");
		draw_set_font(fnt_cocogoose_48);
		draw_text(window_get_width()/2,3*window_get_height()/4,string(floor(final_money/55))+" gifts given !");
		
		draw_set_font(fnt_cocogoose_32);
		draw_set_halign(fa_right);
		draw_text(window_get_width()/2-40,window_get_height()/2-60,"Money earned :");
		draw_text(window_get_width()/2-40,window_get_height()/2,"Tax :");
		draw_text(window_get_width()/2-40,window_get_height()/2+60,"Total :");
		
		draw_set_halign(fa_left);
		draw_text(window_get_width()/2+40,window_get_height()/2-60,string(money)+"$");
		draw_set_color(c_red);
		draw_text(window_get_width()/2+40,window_get_height()/2,string(tax)+"%");
		draw_set_color(c_white);
		draw_text(window_get_width()/2+40,window_get_height()/2+60,string(final_money)+"$");
		
		draw_set_font(fnt_cocogoose_18);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_text(30,window_get_height()-40,"R to restart");
	}
}