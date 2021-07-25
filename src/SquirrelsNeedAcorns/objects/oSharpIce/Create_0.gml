/// @description Insert description here
// You can write your code in this editor

//State Machine
enum state {
	idle,
	animating,
	resting
    }
state = state.idle;
image_speed = 0;

animationProbability = 10; // Probablitiy of animation starting.  60 = ~ 1 time per second of idle.
animationInProgress = false;
animationRestTime = 20; //Minimum frames before animating again

animationRestTimer = animationRestTime; //Working variable that is reset constantly to track time
cycleCounter = 0;