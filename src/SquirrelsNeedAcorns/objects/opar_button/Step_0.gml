/// @description Insert description here
if(live_call()) return live_result;
//if (my_touch == -1) {
	
//	for (var i = 0; i < 10; i += 1) {
//		if (device_mouse_check_button_pressed(i, mb_any)) {
//			if (position_meeting(device_mouse_x(i), device_mouse_y(i), id)) {
//				my_touch = i;
//				//What to do to object if it is hit
//				image_index = 1;
////				audio_play_sound(sound_button_select, 1, false);
//				show_debug_message("opar_button clicked");
//			}
//		}
//	}
	
//} else {

//	if (device_mouse_check_button_released(my_touch, mb_any)) {
//		my_touch = -1;
//		//what to do to object when released
//		image_index = 0;
////		audio_play_sound(sound_button_select, 1, false);
//		show_debug_message("opar_button released");
//	}
	

//}
if (touchSelect == true 
&& ableToSelect == true)
{
	audio_play_sound(sound_button_select, 90, false);
	activate_button();	
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