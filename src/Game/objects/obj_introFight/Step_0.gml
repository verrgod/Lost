/// @description Insert description here
// You can write your code in this editor

camera_set_view_pos(view_camera[0], xpos, 0);
xpos = max(xpos -0.6, 0); //move camera

if (!fadeout) a = max(a - 0.005, 0.25); else a = min(a + 0.005, 1);

l += 0.35; //lettering speed

print = string_copy(str, 1, l);
if (l > string_length(str) + 100) && (next < array_length_1d(strings) - 1)
{
    l = 0;
    next++;
    if (next == array_length_1d(strings) - 1) holdspace++;
}
str = strings[next];

if (keyboard_check_direct(vk_space))
{
    holdspace++;
}

if (holdspace > 80) || (xpos < 100) fadeout = 1;

if  (a == 1) && (fadeout == 1) room_goto_next();