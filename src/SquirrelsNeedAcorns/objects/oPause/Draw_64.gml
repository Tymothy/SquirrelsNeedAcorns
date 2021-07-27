if(live_call()) return live_result;
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
		if(touch_buttons(menu_x, menu_y, i, button[i], button_h))
		{
			menu_index = i;
			touchSelect = true;
		}		
		draw_text_outline(menu_x, menu_y + button_h * i, button[i], c_black,c_ltgray);
		if (menu_index == i)
		{
		draw_text_outline(menu_x, menu_y + button_h * i, button[i], c_black,c_ltgray);
		}
		i++;	
	}
	i = 0;


}
