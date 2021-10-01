/// @desc Insert description here
if(live_call()) return live_result;

xTo = xstart;
yTo = ystart;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;

camDist = 50;

//Speedup camera system
//Setup buffer zone where camera does not move
playerBuffer = 5; //If player is within this many pixels of the center of the camera, don't move the camera
maxBuff = 30;
moveCam = false;
lookAhead = 80;

if (instance_exists(oPlayer))
{
		x = oPlayer.x;
		y = oPlayer.y;
//		zoom = 1.5; // Higher is "zoomed out"
}