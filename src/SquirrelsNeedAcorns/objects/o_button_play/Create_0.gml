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
	if(global.levelSelectArray[global.selectedLevel].unlocked == true)
	{
		SlideTransition(TRANS_MODE.GOTO,global.levelSelectArray[global.selectedLevel].roomName);
	}
	else
	{
		//Play cancel sound	
	}
}
drawText = function ()
{
	draw_set_valign(fa_center);
	draw_set_halign(fa_middle);
	draw_set_font(fTextLarge);
	draw_text_outline(x ,y, string(displayText),c_black, c_ltgray);
}