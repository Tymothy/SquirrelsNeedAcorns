/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//sprite = s_logo_back;
displayText = "Play";
buttonXScale = 1.7;
buttonYScale = 1.5;

update_button = function() {
	SlideTransition(TRANS_MODE.GOTO,global.levelSelectArray[global.selectedLevel].roomName);
}