/// @description Insert description here
// You can write your code in this editor
if(live_call()) return live_result;
// Inherit the parent event
event_inherited();
//sprite = s_logo_back;
level = 0; //Set to array value of level.  Level 1 is 0
levelRoom = global.levelSelectArray[level].roomName;
buttonText = global.levelSelectArray[level].levelName;
completionLevel = global.levelSelectArray[level].completionLevel;
world = global.selectedWorld;
displayText = string_copy(buttonText, 1, 3);
buttonXScale = 1.6;
buttonYScale = 1.2;

//Completion Symbols
missing1 = s_missing_1;
missing2 = s_missing_2;
missing3 = s_missing_3;
complete1 = s_pickup_point_acorn;
complete2 = s_pickup_point_superAcorn;
complete3 = sGoalAcorn;
y1 = -18;
y2 = -2;
y3 = 15;
x1 = 25;
x2 = 25;
x3 = 25;
missingTransparency = 1;

endStepRan = false; //Run the end step code once to take the changes to the button

update_button = function() {
	//SlideTransition(TRANS_MODE.GOTO,levelRoom);
	global.selectedLevel = level;
}