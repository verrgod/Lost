/// @description draw textbox


// draw textbox
draw_self();

// draw text
draw_set_font(font_sign);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_ext_color(x, y, textToShow, lineHeight, textWidth, c_black, c_black, c_black, c_black, 1);

with (obj_player)
{
	hasControl = false;
	vSpeed = 0;
	gravSpeed = 0;
}

with (obj_slime)
{
	state = "Idle"
}