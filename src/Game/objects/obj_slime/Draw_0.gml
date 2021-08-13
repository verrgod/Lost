/// @description draw shader for hitflash effect on slimes

draw_self();

if (flash > 0)
{
	flash-= 1;
	shader_set(sh_white);
	draw_self();
	shader_reset();
}