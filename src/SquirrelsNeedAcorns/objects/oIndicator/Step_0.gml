/// @description Insert description here
// You can write your code in this editor

//update position
x = device_mouse_x(my_touch);
y = device_mouse_y(my_touch);

//destroy on release
if (device_mouse_check_button_released(my_touch, mb_any)){
	instance_destroy();	
}