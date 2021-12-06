/// @description Insert description here
// You can write your code in this editor

//State Machine
enum state {
	idle,
	animating,
	resting,
	moving
    }
	

state = state.idle;

enum collideProperty {
	standard,
	damage,
	bounce,
	speedUp,
	speedDown,
	push
}

attributes =
{
	description : "Default description",
	damage : 0,
	moveSpeed : 0,
	pushable : false,
	stationary : true,
	paletteSwap : 0,
	dropOnDestroy: false,
	topCollide : collideProperty.standard,
	botCollide : collideProperty.standard,
	rightCollide : collideProperty.standard,
	leftCollide : collideProperty.standard,
	pushStrength : 0
}
image_speed = 0;

//X and Y position where object was created
createX = x;
createY = y;
targX = x;
targY = y;

active = true; //Used to turn on/off objects
idleTimer = 30;
idleCountdown = idleTimer;

animationProbability = 10; // Probablitiy of animation starting.  60 = ~ 1 time per second of idle.
animationInProgress = false;
animationRestTime = 20; //Minimum frames before animating again

animationRestTimer = animationRestTime; //Working variable that is reset constantly to track time
cycleCounter = 0;

damageOnContact = 0;
moveSpeed = 0;
active = true;
oneTimeRun = false;

oneTimeRunFunc = function() {
	show_debug_message("Default oneTimeRun message.  No action taken.");
	oneTimeRun = false;
}