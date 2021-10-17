/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//sprite = s_logo_back;
displayText = "Next World";
buttonXScale = 1.6;
buttonYScale = 1.2;

update_button = function() {
	//SlideTransition(TRANS_MODE.GOTO,levelRoom);
	global.selectedWorld++;
}