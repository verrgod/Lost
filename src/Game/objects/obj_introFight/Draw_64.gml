/// @description draw font

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(font_pixel);
draw_text(683, 650, print); //print texts

if (holdspace > 0)
{
    draw_set_alpha(Wave(0.2, 0.8, 1, 0));
    draw_text(683, 710, "Hold space to skip");
    draw_set_alpha(1);
}

draw_sprite_ext(spr_pixel, 0, 0, 0, 1366, 768, 0, c_black, a);