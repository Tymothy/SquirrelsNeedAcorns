/// @description Insert description here
// You can write your code in this editor
if(endStepRan == false)
{
	levelRoom = global.levelSelectArray[level].roomName;
	buttonText = global.levelSelectArray[level].levelName;
	world = global.selectedWorld;
	displayText = string_copy(buttonText, 1, 3);
	completionLevel = global.levelSelectArray[level].completionLevel;
	endStepRan = true;
}

if(world != global.selectedWorld)
{
	instance_destroy();
}