/// @description Insert description here
// You can write your code in this editor
if(active == false) idleCountdown--;

if(idleCountdown < 0)
{
	active = true;
	idleCountdown = idleTimer;
}