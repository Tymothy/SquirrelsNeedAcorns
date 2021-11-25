/// @description Insert description here


//Disable buttons when the virtual keyboard is active
if(global.virtualKeyboardOn == true)
{
	touchSelect = false;	
}

if (touchSelect == true 
&& ableToSelect == true)
{

	activate_button();	
	play_sound();
	sound = soundSuccess;
	touchSelect = false; //Reset touch select so buttons aren't constantly pushed.


}	
	
if (device_mouse_check_button_pressed(0, mb_any)) {

	ableToSelect = false;
}
	
if (device_mouse_check_button_released(0, mb_any)) {
	ableToSelect = true;
}

if(global.resolutionChanged == true)
{
	x = xStart * global.GUIww;
	y = yStart * global.GUIhh
}
