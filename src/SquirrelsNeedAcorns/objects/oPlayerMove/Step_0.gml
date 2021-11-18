/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(y > oCamera.y - camHeight / 2 + topMargin) //If true, we are within the area to touch
{
	if(x < oCamera.x)
	{
		show_debug_message("Moving Left");
		moveLeft = 1;	
	}
	
	else if(x > oCamera.x)
	{
		
		show_debug_message("Moving Right");
		moveRight = 1;
	}
	
	else
	{
		show_debug_message("oPlayerMove hitting else statement that should not fire.  Investigate.");	
	}
}
