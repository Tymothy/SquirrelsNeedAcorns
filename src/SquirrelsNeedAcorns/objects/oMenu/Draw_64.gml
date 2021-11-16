if(live_call()) return live_result;
//Draw the buttons created in the Create event
var _ww = global.GUIww;
var _hh = global.GUIhh;
button_h = max(0,font_get_size(menuFont)*3.5);

	if(room == rMainMenu)
	{

		menu_x = global.GUIww/2;
		menu_y = global.GUIhh/2;
		//button_h = font_get_size(menuFont)*1.5;

	
			//Draw Version
			draw_set_color(c_gray);
		draw_set_font(fTextNormal);
		draw_set_halign(fa_left);
		draw_set_valign(fa_bottom);
		//Draw at very top left of screen
		draw_text(global.GUIww*.03, global.GUIhh*.89, "This is an alpha build, all content subject to change.");
		draw_text(global.GUIww*.03, global.GUIhh*.93, "Progress may not save between updates.");
		draw_text(global.GUIww*.03, global.GUIhh*.97, string(global.versionText));
		
		//Draw Title
		draw_set_font(fTextExtraLarge);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
	
		draw_text_outline(menu_x, menu_y/2, "Squirrels\nNeed Acorns", c_black, c_ltgray);
	
	} //End Main Menu

	if(room == rHowTo)
	{
		var i = 0;
		draw_set_font(menuFont);
		//Set menu at top left
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		menu_x = _ww *.5;
		menu_y = _hh *.8;
		//button_h = font_get_size(menuFont)*1.5;
		//menu_x = 200;
		//menu_y = 100; //- ((button_h * buttons)/2 + button_h);
		//button_h = 60;

		//draw_set_valign(fa_middle);
		//draw_set_halign(fa_center);
		repeat (buttons)
		{
			draw_sprite_ext(s_button_pressable,0,menu_x,menu_y + button_h * i,buttonXScale,buttonYScale,0,-1,1); //Draw pressed button
			//Function needs, button[i], menu_x, menu_y, button_h
			if(touch_buttons(menu_x, menu_y, i, maxWidth, maxHeight, button_h))
			{
				menu_index = i;
				touchSelect = true;
				draw_sprite_ext(s_button_pressable,1,menu_x,menu_y + button_h * i,buttonXScale,buttonYScale,0,-1,1); //Draw pressed button
			}
			draw_text_outline(menu_x, menu_y + button_h * i, button[i], c_black,c_ltgray);
			//if (menu_index == i)
			//{
			//draw_text_outline(menu_x, menu_y + button_h * i, button[i], c_black,c_aqua);
			//}
			i++;	
		}
		i = 0;
	
		//	draw_sprite(sWASD, image_index,100,700);
		
		var text_x = _ww * .5;
		var left_text_x = _ww *.15;
		var right_text_x = _ww * .85;
		var text_y = _hh *.1;

		left_text_x = text_x;

		var textSpacing = font_get_size(fTextNormal)*1.8;
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_font(fTextLarge);
		draw_text_outline(text_x,text_y+textSpacing*0,string("How to Play"),c_white,c_aqua);
		draw_set_font(fTextNormal);	
		draw_set_color (c_ltgray);
//		draw_text_outline(text_x,text_y+textSpacing*3,string("Under construction."), c_black,c_ltgray);		
		draw_text_outline(text_x,text_y+textSpacing*3,string("Touch left or right side of to screen move in game."), c_black,c_ltgray);
		
		draw_set_halign(fa_center);
		draw_text_outline(left_text_x,text_y+textSpacing*5,string("Depending on the level, the goal"), c_black,c_ltgray);
		draw_text_outline(left_text_x,text_y+textSpacing*6,string("is to either reach the golden acorn"), c_black,c_ltgray);
		draw_text_outline(left_text_x,text_y+textSpacing*7,string("or to collect as many acorns as possible"), c_black,c_ltgray);		
		draw_text_outline(left_text_x,text_y+textSpacing*8,string("before the time runs out."), c_black,c_ltgray);		
		//draw_text_outline(left_text_x,text_y+textSpacing*9,string("as you can before time runs out."), c_black,c_ltgray);
		
		draw_text_outline(left_text_x,text_y+textSpacing*10,string("For an added challenge, complete the levels faster!"), c_black,c_ltgray);
		draw_text_outline(left_text_x,text_y+textSpacing*11,string("Unlock additional levels by collecting acorns"), c_black,c_ltgray);
		draw_text_outline(left_text_x,text_y+textSpacing*12,string("and then completing the level."), c_black,c_ltgray);
		//draw_text_outline(left_text_x,text_y+textSpacing*13,string(""), c_black,c_ltgray);

		//draw_set_halign(fa_right);
		draw_text_outline(left_text_x,text_y+textSpacing*14,string("The game is designed for landscape mode"), c_black,c_ltgray);		
		draw_text_outline(left_text_x,text_y+textSpacing*15,string("but is fully playable in portrait mode,"), c_black,c_ltgray);
		draw_text_outline(left_text_x,text_y+textSpacing*16,string("with only some cosmetic graphic issues."), c_black,c_ltgray);
		
		//draw_text_outline(text_x,text_y+textSpacing*6,string("Make sure to keep an eye on your fuel"), c_black,c_ltgray);		
		//draw_text_outline(text_x,text_y+textSpacing*6,string("possible, or to collect as many acorns"), c_black,c_ltgray);		
		//draw_text_outline(text_x,text_y+textSpacing*6,string("as you can before time runs out."), c_black,c_ltgray);
//		draw_text_outline(text_x,text_y+textSpacing*8,string("Watch your fuel, don't hit the"), c_black,c_ltgray);
//		draw_text_outline(text_x,text_y+textSpacing*9,string("walls too hard, and avoid spikes."), c_black,c_ltgray);

			//Left side
			draw_set_font(fTextLarge);
			text_x = global.GUIww *.25;
			text_y = global.GUIhh *.65;
			//draw_text(text_x,text_y,string("Movement"));
		
	}

	if(room == rHighscore)
	{
		var i = 0;
		draw_set_font(menuFont);
		//Set menu at top left
		menu_x = global.GUIww*.5;
		menu_y = global.GUIhh*.75;
		//button_h = font_get_size(menuFont)*1.5;
		//menu_x = 200;
		//menu_y = 100; //- ((button_h * buttons)/2 + button_h);
		//button_h = 60;

		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
		repeat (buttons)
		{
			draw_sprite_ext(s_button_pressable,0,menu_x,menu_y + button_h * i,buttonXScale,buttonYScale,0,-1,1); //Draw pressed button
			//Function needs, button[i], menu_x, menu_y, button_h
			if(touch_buttons(menu_x, menu_y, i, maxWidth, maxHeight, button_h))
			{
				menu_index = i;
				touchSelect = true;
				draw_sprite_ext(s_button_pressable,1,menu_x,menu_y + button_h * i,buttonXScale,buttonYScale,0,-1,1); //Draw pressed button
			}
			draw_text_outline(menu_x, menu_y + button_h * i, button[i], c_black,c_ltgray);
			//if (menu_index == i)
			//{
			//draw_text_outline(menu_x, menu_y + button_h * i, button[i], c_black,c_aqua);
			//}
			i++;	
		}
		i = 0;
	
		//	draw_sprite(sWASD, image_index,100,700);
		
		var text_x = global.GUIww * .5;
		var text_y = global.GUIhh * .15;
		var textSpacing = font_get_size(fTextNormal)*1.5;
	
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_font(fTextLarge);
		draw_text_outline(text_x,text_y-textSpacing*1,string("High Scores"),c_white,c_aqua);
	
		draw_set_color (c_ltgray);
		draw_set_font(fTextNormal);

	}

	if(room == rLevelSelect)
	{
		menu_x = global.GUIww*.5 - (maxWidth + (buttons+button_w)/2);
		menu_y = global.GUIhh*.65;

	} //End Level Select

	if(room == rEndRun)
	{
		var i = 0;
		draw_set_font(menuFont);
		menu_x = global.GUIww/2;
		menu_y = global.GUIhh*.6;

		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
	
		//Write score
		//draw_text_outline(menu_x, menu_y*.5, "Points scored this run", c_black, c_ltgray);
		draw_set_font(fTextLarge);
		
		if(global.gameMode == 2)
		{
			draw_set_font(fTextNormal);
			draw_text_outline(menu_x, menu_y * .15 + (font_get_size(menuFont)*1.5) * 2, "Practice Mode - Score not saved.", c_black, c_ltgray);
		}
		else
		{
			switch(global.GOALTYPE)
			{
				case GOALTYPE.GOAL :
					if(global.goalReached == true)
					{
						draw_text_outline(menu_x, menu_y*.5,string(global.points),c_black, c_yellow);
						//if(global.points >= global.availablePoints)
						//{
						var _time = string_format(global.time, 2, 3)
						draw_text_outline(menu_x, menu_y*.5+font_get_size(fTextLarge)*2,string(_time) + " seconds",c_black, c_yellow);
						//}		
					}
					else
					{
						draw_text_outline(menu_x, menu_y*.5,"Goal not reached",c_black, c_yellow);
					}
					break;
				
				case GOALTYPE.COLLECT :
					draw_text_outline(menu_x, menu_y*.5,string(global.points),c_black, c_yellow);		
					break;
							
			}
		}
		
		
		//Gamemode specific
		draw_set_font(menuFont);
		draw_text_outline(menu_x, menu_y*.15, string(global.gameModeString), c_black, c_ltgray);
		
		{
			draw_text_outline(menu_x, menu_y*.15+font_get_size(menuFont)*1.5, string(global.levelSelectArray[global.selectedLevel].levelName),c_black,c_ltgray);	
		}
		
	} //End EndRun

	if(room == rOptions)
	{
		menu_x = global.GUIww/2;
		menu_y = global.GUIhh/2;
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);	
		draw_text_outline(_ww*.5, _hh *.2,string("Options"),c_white,c_aqua);

	}

//Draw Buttons Vertically
if( layout == LAYOUT.VERTICAL)
{
	var i = 0;
	draw_set_font(menuFont);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	
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
			var _y1 = menu_y+button_h*i-_sh*.6;
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

//Draw Buttons Horizontally
if( layout == LAYOUT.HORIZONTAL)
{
	var i = 0;
	draw_set_font(menuFont);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	
	repeat (buttons)
	{
		draw_sprite_ext(s_button_pressable,0,menu_x+maxWidth*i+button_w*i,menu_y,buttonXScale,buttonYScale,0,-1,1); //Draw pressed button
		//Function needs, button[i], menu_x, menu_y, button_h
		if(touch_buttons_horizontal(menu_x, menu_y, i, maxWidth, maxHeight, button_w) == 1)
		{
			menu_index = i;
			draw_sprite_ext(s_button_pressable,1,menu_x+maxWidth*i+button_w*i,menu_y,buttonXScale,buttonYScale,0,-1,1); //Draw pressed button
		}
		if(touch_buttons_horizontal(menu_x, menu_y, i, maxWidth, maxHeight, button_w) == 2)
		{
			menu_index = i;
			touchSelect = true;
			draw_sprite_ext(s_button_pressable,0,menu_x+maxWidth*i+button_w*i,menu_y,buttonXScale,buttonYScale,0,-1,1); //Draw pressed button
		}
		if(global.debug == true)
		{
			//Debugging, show outline of buttons
			//Draw touch boxes
			//var _sw = string_width(button[i]);
			//var _sh = string_height(button[i]);
			var _sw = maxWidth;
			var _sh = maxHeight;
			var _x1 = menu_x+maxWidth*i+i*button_w-i-_sw*.6;
			var _x2 = menu_x+maxWidth*i+i*button_w+_sw*.6;
			var _y1 = menu_y-_sh*.6;
			var _y2 = menu_y+_sh*.6;
			//Show Outline of Button
			draw_set_color(c_yellow);
			draw_rectangle(_x1, _y1, _x2, _y2 ,true);
		}
		
		draw_text_outline(menu_x+maxWidth*i+button_w*i,menu_y, button[i], c_black,c_ltgray);
		
		i++;	
	}
	i = 0;
}