/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//sprite = s_logo_back;
level = 0; //Set to array value of level.  Level 1 is 0
levelRoom = global.levelSelectArray[level].roomName;
buttonText = global.levelSelectArray[level].levelName;
completionLevel = global.levelSelectArray[level].completionLevel;
world = global.selectedWorld;
displayText = string_copy(buttonText, 1, 2);
buttonXScale = 1.25;
buttonYScale = 1.1;

//Completion Symbols
complete1 = oLevelSelect.complete1;
complete2 = oLevelSelect.complete2;
complete3 = oLevelSelect.complete3;
complete4 = oLevelSelect.complete4;

y1 = -18;
y2 = -2;
y3 = 15;
x1 = 25;
x2 = 25;
x3 = 25;

endStepRan = false; //Run the end step code once to take the changes to the button

update_button = function() {
	//SlideTransition(TRANS_MODE.GOTO,levelRoom);
	global.selectedLevel = level;
}

double_tap = function() {
	SlideTransition(TRANS_MODE.GOTO,global.levelSelectArray[global.selectedLevel].roomName);
}