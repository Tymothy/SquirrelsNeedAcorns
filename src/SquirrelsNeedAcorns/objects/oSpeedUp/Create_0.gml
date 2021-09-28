/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

attributes =
{
	description : "Move over this to speed move faster",
	damage : 0,
	moveSpeed : 0,
	pushable : false,
	stationary : true,
	paletteSwap : 0,
	dropOnDestroy: false,
	topCollide : collideProperty.speedUp,
	botCollide : collideProperty.speedUp,
	rightCollide : collideProperty.speedUp,
	leftCollide : collideProperty.speedUp,
}

active = true;
idleTimer = 30;

idleCountdown = idleTimer;