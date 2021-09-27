/// @desc Insert description here

xTo = xstart;
yTo = ystart;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;

if (instance_exists(oPlayer))
{
		x = oPlayer.x;
		y = oPlayer.y;
//		zoom = 1.5; // Higher is "zoomed out"
}