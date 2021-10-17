/// @description Insert description here
// You can write your code in this editor
if(live_call()) return live_result;
// Inherit the parent event
event_inherited();
//sprite = s_logo_back;
level = 0; //Set to array value of level.  Level 1 is 0
levelRoom = global.levelSelectArray[level].roomName;
buttonText = global.levelSelectArray[level].levelName;
world = global.selectedWorld;
displayText = string_copy(buttonText, 1, 3);
buttonXScale = 1.6;
buttonYScale = 1.2;

endStepRan = false; //Run the end step code once to take the changes to the button

update_button = function() {
	//SlideTransition(TRANS_MODE.GOTO,levelRoom);
	global.selectedLevel = level;
}