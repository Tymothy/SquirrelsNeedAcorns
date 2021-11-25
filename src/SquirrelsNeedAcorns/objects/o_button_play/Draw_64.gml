/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(sprite != -1)
{
	draw_sprite(sprite,0,x,y);
}
//draw_set_color(c_ltgray);

switch(global.levelSelectArray[global.selectedLevel].unlocked)
{
	case true:
		drawText();
	break;
	
	case false:
		draw_sprite_ext(s_button_pressable,0,x,y,buttonXScale,buttonYScale,0,c_white,1);//Draw normal to overwrite the selected
		draw_sprite_ext(s_button_pressable,1,x,y,buttonXScale,buttonYScale,0,c_black,.75);
		drawText();
	break;
}

