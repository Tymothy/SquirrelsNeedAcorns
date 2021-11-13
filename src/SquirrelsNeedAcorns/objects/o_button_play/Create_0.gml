/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//sprite = s_logo_back;
displayText = "Play";
buttonXScale = 2.5;
buttonYScale = 1.5;
//maxWidth = buttonXScale * sprite_get_width(buttonSprite);
//maxHeight = buttonYScale * sprite_get_height(buttonSprite);

update_button = function() {
	SlideTransition(TRANS_MODE.GOTO,global.levelSelectArray[global.selectedLevel].roomName);
}
