/// @description Insert description here
// You can write your code in this editor
if(live_call()) return live_result;
// Inherit the parent event
event_inherited();

attributes =
{
	description : "An acorn better left untouched.  Explosive.",
	damage : 1,
	moveSpeed : 0,
	pushable : false,
	stationary : true,
	paletteSwap : 0,
	dropOnDestroy: false,
	topCollide : collideProperty.push,
	botCollide : collideProperty.push,
	rightCollide : collideProperty.push,
	leftCollide : collideProperty.push,
	pushStrength : 15
}

image_speed = 1;
active = true;