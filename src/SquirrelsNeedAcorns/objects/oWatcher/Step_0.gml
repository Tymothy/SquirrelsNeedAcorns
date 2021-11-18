/// @description Insert description here
// You can write your code in this editor
for(var i = 0; i < 10; i += 1) {
	if (device_mouse_check_button_pressed(i, mb_any)) {
		//Need code to see if player is in game room to decide what child object to use
		with (instance_create_layer(device_mouse_x(i), device_mouse_y(i), layer, oPlayerMove)){
			my_touch = i;	
		}
	}
	
	
}