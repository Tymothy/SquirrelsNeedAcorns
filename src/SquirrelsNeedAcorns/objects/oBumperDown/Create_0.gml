/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

attributes =
{
	description : "Bounces objects extremely fast",
	damage : 0,
	moveSpeed : 0,
	pushable : false,
	stationary : true,
	paletteSwap : 0,
	dropOnDestroy: false,
	topCollide : collideProperty.bounce, 
	botCollide : collideProperty.standard,
	rightCollide : collideProperty.standard,
	leftCollide : collideProperty.standard,
	bounceStrength : 12
}