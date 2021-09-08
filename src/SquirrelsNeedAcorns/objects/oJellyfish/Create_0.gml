/// @description Jellyfish Create
// You can write your code in this editor
if(live_call()) return live_result;
// Inherit the parent event
event_inherited();
moveSpeed = .25;
moveDistance = 15;

attributes =
{
	description : "A slow moving creature, beware of it's tentacles!",
	damage : 1,
	moveSpeed : .25,
	pushable : false,
	stationary : false,
	paletteSwap : 0,
	dropOnDestroy: false,
	topCollide : collideProperty.bounce, 
	botCollide : collideProperty.damage,
	rightCollide : collideProperty.damage,
	leftCollide : collideProperty.damage,
	bounceStrength : 5
	
}

moveSomewhere = function()
{
	//var _targX = irandom(radius*2) - radius/2;
	//var _targY = irandom(radius*2) - radius/2;
	//_targX = _targX + sign(_targX)*minRadius;
	//_targY = _targY + sign(_targY)*minRadius;
	
//	targX = createX + _targX;
	var _dir = createY - y +.01;
	targY = createY + moveDistance*sign(_dir);
}
state = state.idle;

//Twerp variables
pTimer = 0;
pLength = room_speed * 2;
pStart = 50;
pEnd = 150;
pStartX = x;
pStartY = y;