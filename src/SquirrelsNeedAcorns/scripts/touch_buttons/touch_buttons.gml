// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function touch_buttons_vertical(menu_x, menu_y, i, width, height, button_h){
/// @desc Return true if button is touched
/// @arg x
/// @arg y
/// @arg i
/// @arg button[i]
/// @arg button_h

		//var _sw = string_width(button_i);
		//var _sh = string_height(button_i);
		var _x1 = menu_x-width*.6;
		var _x2 = menu_x+width*.6;
		var _y1 = menu_y+button_h*i-height*.6;
		var _y2 = menu_y+button_h*i+height*.6;
		
		if device_mouse_check_button_released(0, mb_any)
		   {
		   if(device_mouse_x_to_gui(0) > _x1 && 
		     device_mouse_x_to_gui(0) < _x2 && 
			 device_mouse_y_to_gui(0) > _y1 &&
			 device_mouse_y_to_gui(0) < _y2)
		      {
		      return 2;
		
		      }
		   }		
		if device_mouse_check_button(0, mb_any)
		   {
		   if(device_mouse_x_to_gui(0) > _x1 && 
		     device_mouse_x_to_gui(0) < _x2 && 
			 device_mouse_y_to_gui(0) > _y1 &&
			 device_mouse_y_to_gui(0) < _y2)
		      {
		      return 1;
		
		      }
		   else
		      {
		     // pressed = false;
		      }
		   }
	
}
function touch_buttons_horizontal(menu_x, menu_y, i, width, height, button_w){
/// @desc Return true if button is touched
/// @arg menu_x
/// @arg menu_y
/// @arg i
/// @arg button[i]
/// @arg button_h

		//var _sw = string_width(button_i);
		//var _sh = string_height(button_i);
		var _sw = width;
			var _sh =height;
			var _x1 = menu_x+width*i+i*button_w-i-_sw*.5;
			var _x2 = menu_x+width*i+i*button_w+_sw*.5;
			var _y1 = menu_y-_sh*.6;
			var _y2 = menu_y+_sh*.6;
			
		if device_mouse_check_button_released(0, mb_any)
		   {
		   if(device_mouse_x_to_gui(0) > _x1 && 
		     device_mouse_x_to_gui(0) < _x2 && 
			 device_mouse_y_to_gui(0) > _y1 &&
			 device_mouse_y_to_gui(0) < _y2)
		      {
		      return 2;
		
		      }
		   }
		if device_mouse_check_button(0, mb_any)
		   {
		   if(device_mouse_x_to_gui(0) > _x1 && 
		     device_mouse_x_to_gui(0) < _x2 && 
			 device_mouse_y_to_gui(0) > _y1 &&
			 device_mouse_y_to_gui(0) < _y2)
		      {
		      return 1;
		
		      }
		   else
		      {
		     // pressed = false;
		      }
		   }
	
}