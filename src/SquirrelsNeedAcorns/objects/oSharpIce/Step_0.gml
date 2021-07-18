/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case state.idle: //Waiting to animate
		if(irandom(animationProbability) == 1)
		{
			animationInProgress = true;
			image_speed = 1;		
			state = state.animating;
		}
		break;
		
	case state.animating: 
		/*if(image_index == 0)
		{
			cycleCounter++;
		}
		if (cycleCounter = 2)
		{
			cycleCounter = 0;
			image_speed = 0;
			state = state.resting;
			animationRestTimer = animationRestTime;
		}*/
		break;
		
	case state.resting:
		animationRestTimer--;
		if(animationRestTimer < 1)
		{
			state = state.idle;
		}
		break;
	
}
/*
if (irandom(animationProbability) == 1 && animationInProgress == false && animationRestTimer <1)
{
	animationInProgress = true;
	image_speed = 1;
}

//Stop animation when one cycle is complete
//BUG: Somehow objects with animate 4 times with this code
else if (animationInProgress == true && image_index == 0)
{
	animationInProgress = false;
	image_speed = 0;
	animationRestTimer = animationRestTime;
}

if(animationRestTimer > 0 && animationInProgress == false)
{
	animationRestTimer--;
}
*/