
/// @description Insert description here
// You can write your code in this editor

	var _ww = global.GUIww;
	var _hh = global.GUIhh;

if (paused == true)
{
	var i = 0;
	menu_x = _ww/2;
	menu_y = _hh*.55; //- ((button_h * buttons)/2 + button_h);
	

	draw_set_font(pauseFont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	repeat (buttons)
	{
		draw_sprite_ext(s_button_pressable,0,menu_x,menu_y + button_h * i,buttonXScale,buttonYScale,0,-1,1); //Draw pressed button
		//Button pressed, draw pressed icon, but don't select until released
		if(touch_buttons_vertical(menu_x, menu_y, i, maxWidth, maxHeight, button_h)==1)
		{
			menu_index = i;

			draw_sprite_ext(s_button_pressable,1,menu_x,menu_y + button_h * i,buttonXScale,buttonYScale,0,-1,1); //Draw pressed button
		}
		
		//Button released, find what button is touched and use that button
		if(touch_buttons_vertical(menu_x, menu_y, i, maxWidth, maxHeight, button_h)==2)
		{
			menu_index = i;
			touchSelect = true;
			draw_sprite_ext(s_button_pressable,0,menu_x,menu_y + button_h * i,buttonXScale,buttonYScale,0,-1,1); //Draw pressed button
		}
		if(global.debug == true)
		{
			//Debugging, show outline of buttons
			//Draw touch boxes
			//var _sw = string_width(button[i]);
			//var _sh = string_height(button[i]);
			var _sw = maxWidth;
			var _sh = maxHeight;
			var _x1 = menu_x-_sw*.6;
			var _x2 = menu_x+_sw*.6;
			var _y1 = menu_y+button_h*i-_sh*.7;
			var _y2 = menu_y+button_h*i+_sh*.6;
			//Show Outline of Button
			draw_set_color(c_yellow);
			draw_rectangle(_x1, _y1, _x2, _y2 ,true);
		}
		
		draw_text_outline(menu_x, menu_y + button_h * i, button[i], c_black,c_ltgray);

		i++;	
	}
	i = 0;
}