/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

attributes =
{
	description : "An acorn better left untouched.  Explosive.",
	damage : 0,
	moveSpeed : 0,
	pushable : false,
	stationary : true,
	paletteSwap : 0,
	dropOnDestroy: false,
	topCollide : collideProperty.damage,
	botCollide : collideProperty.damage,
	rightCollide : collideProperty.damage,
	leftCollide : collideProperty.damage
}

image_speed = 1;
active = true;