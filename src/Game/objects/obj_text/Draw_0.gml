/// @description Insert description here
// You can write your code in this editor

var halfW = w * 0.5;

// draw box
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_roundrect_ext(x - halfW - border, y - h - (border * 2), x + halfW + border, y, 15, 15, false);
draw_sprite(spr_marker, 0, x, y);
draw_set_alpha(1);


// draw text
DrawSetText(c_white, font_sign, fa_center, fa_top);
draw_text(x, y - h - border, textCurrent);