/// @description Draw button
//draw_self();
//draw_sprite(s_button_pressable,0,x,y);

	draw_set_font(font);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	
		draw_sprite_ext(s_button_pressable,0,x,y,buttonXScale,buttonYScale,0,-1,1); //Draw pressed button
		
		//Button pressed, draw pressed icon, but don't select until released
		if(touch_buttons_vertical(x, y, 0, maxWidth, maxHeight,0)==1)
		{
			draw_sprite_ext(s_button_pressable,1,x,y,buttonXScale,buttonYScale,0,-1,1); //Draw pressed button
		}
		
		//Button released, find what button is touched and use that button
		if(touch_buttons_vertical(x, y, 0, maxWidth, maxHeight, 0)==2)
		{
			touchSelect = true;
			draw_sprite_ext(s_button_pressable,0,x,y,buttonXScale,buttonYScale,0,-1,1); //Draw pressed button
		}
		if(global.debug == true)
		{
			//Debugging, show outline of buttons
			//Draw touch boxes
			//var _sw = string_width(button[i]);
			//var _sh = string_height(button[i]);
			var _sw = maxWidth;
			var _sh = maxHeight;
			var _x1 = x-_sw*.6;
			var _x2 = x+_sw*.6;
			var _y1 = y-_sh*.6;
			var _y2 = y+_sh*.6;
			//Show Outline of Button
			draw_set_color(c_yellow);
			draw_rectangle(_x1, _y1, _x2, _y2 ,true);
		}
