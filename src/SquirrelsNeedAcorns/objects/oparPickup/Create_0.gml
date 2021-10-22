/// @description Insert description here
// You can write your code in this editor
pointValue = 0;
fuelValue = 0;
lifeValue = 0;
attractable = false; //If player can attract this item with an upgrade
speedPower = 0;
speedTime = 0;

bounceSpeed = .5;
bounceDist = 40;
bounceDistInit = bounceDist;
bounceGoingDown = true;

targetX = 0;
targetY = 0;
dropCount = 0;
dropDistance = 0;
moveTowardsPlayer = false;
moveSpeed = .025; //Speed is used in lerp function, .1 is 10% the distance in each frame

