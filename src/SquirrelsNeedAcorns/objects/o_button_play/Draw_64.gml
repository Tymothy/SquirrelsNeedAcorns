/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(sprite != -1)
{
	draw_sprite(sprite,0,x,y);
}
//draw_set_color(c_ltgray);
draw_text_outline(x,y, string(displayText),c_black, c_ltgray);