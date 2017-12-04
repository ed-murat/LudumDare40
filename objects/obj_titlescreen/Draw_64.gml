draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_red);
draw_set_font(fnt_snowcap_100);
draw_text(window_get_width()/2,window_get_height()/5-80,"Christmas");

draw_set_color(c_white);
draw_text(window_get_width()/2,window_get_height()/5+80,"Tax");

draw_sprite(spr_controls,0,window_get_width()/4,window_get_height()/2+100);
draw_sprite(spr_coininfos,0,3*window_get_width()/4,window_get_height()/2+100);

draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_white);
draw_set_font(fnt_cocogoose_32);
draw_text(window_get_width()/2,4*window_get_height()/5+100,"Press 'Space' to start");