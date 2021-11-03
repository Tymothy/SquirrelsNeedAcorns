/// @desc Insert description here
if(live_call()) return live_result;

xTo = xstart;
yTo = ystart;
xPrev = xTo;
yPrev = yTo;
twerpTimer = 40; //Frames for the smooth animation to run

xTimer = 0;
yTimer = 0;

prevLookAheadX = xTo;
prevLookAheadY = xTo;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;

camDist = 50;

//Speedup camera system
//Setup buffer zone where camera does not move
playerBuffer = 5; //If player is within this many pixels of the center of the camera, don't move the camera
maxBuff = 30;
moveCamX = false;
moveCamY = false;
lookAheadXMulti = .1;
lookAheadYMulti = .1;

if (instance_exists(oPlayer))
{
		x = oPlayer.x;
		y = oPlayer.y;
//		zoom = 1.5; // Higher is "zoomed out"
}