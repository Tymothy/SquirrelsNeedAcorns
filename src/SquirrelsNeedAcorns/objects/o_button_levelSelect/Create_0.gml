/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//sprite = s_logo_back;
level = 0; //Set to array value of level.  Level 1 is 0
levelRoom = global.levelSelectArray[level].roomName;
buttonText = global.levelSelectArray[level].levelName;
displayText = string_copy(buttonText, 1, 3);

update_button = function() {
	SlideTransition(TRANS_MODE.GOTO,levelRoom);
}