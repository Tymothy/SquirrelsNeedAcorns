/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//sprite = s_logo_back;
displayText = "Next\nWorld";
buttonXScale = 1.9;
buttonYScale = 1.5;

update_button = function() {
	//SlideTransition(TRANS_MODE.GOTO,levelRoom);
	if(global.selectedWorld < global.topWorld)
	{
		global.selectedWorld++;
	}
	else
	{
		global.selectedWorld = 0;	
	}
}