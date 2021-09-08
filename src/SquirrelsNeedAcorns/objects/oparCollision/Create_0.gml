/// @description Insert description here
// You can write your code in this editor
if(live_call()) return live_result;
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
	bounce
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
	leftCollide : collideProperty.standard
}
image_speed = 0;

//X and Y position where object was created
createX = x;
createY = y;
targX = x;
targY = y;

animationProbability = 10; // Probablitiy of animation starting.  60 = ~ 1 time per second of idle.
animationInProgress = false;
animationRestTime = 20; //Minimum frames before animating again

animationRestTimer = animationRestTime; //Working variable that is reset constantly to track time
cycleCounter = 0;

damageOnContact = 0;
moveSpeed = 0;
