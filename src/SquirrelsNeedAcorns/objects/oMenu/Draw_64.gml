
//Draw the buttons created in the Create event
if(room == rMainMenu)
{
	var i = 0;
	draw_set_font(menuFont);
	menu_x = global.GUIww/2;
	menu_y = global.GUIhh/2;
	//button_h = font_get_size(menuFont)*1.5;

	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	
	repeat (buttons)
	{
		//Function needs, button[i], menu_x, menu_y, button_h
		if(touch_buttons(menu_x, menu_y, i, button[i], button_h))
		{
			menu_index = i;
			touchSelect = true;
		}
		/*Debugging, show outline of buttons
		//Draw touch boxes
		var _sw = string_width(button[i]);
		var _sh = string_height(button[i]);
		var _x1 = menu_x-_sw*.6;
		var _x2 = menu_x+_sw*.6;
		var _y1 = menu_y+button_h*i-_sh*.7;
		var _y2 = menu_y+button_h*i+_sh*.6;
		//Show Outline of Button
		draw_set_color(c_yellow);
		draw_rectangle(_x1, _y1, _x2, _y2 ,true);
		*/
		
		draw_text_outline(menu_x, menu_y + button_h * i, button[i], c_black,c_ltgray);
		if (menu_index == i)
		{
		draw_text_outline(menu_x, menu_y + button_h * i, button[i], c_black,c_aqua);
		}
		i++;	
	}
	i = 0;
	
		//Draw Version
		draw_set_color(c_gray);
	draw_set_font(fConthrax11);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	//Draw at very top left of screen
		draw_text(5, 5, string("Squirrels Need Acorns - Alpha Version 0.4.1"));
		
	//Draw Title
	draw_set_font(fEthno36);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	
	draw_text_outline(menu_x, menu_y/2, "Squirrels\nNeed Acorns", c_white, c_aqua);
	
} //End Main Menu

if(room == rHowTo)
{
	var i = 0;
	draw_set_font(menuFont);
	//Set menu at top left
	menu_x = global.GUIww/4;
	menu_y = global.GUIhh/4;
	button_h = font_get_size(menuFont)*1.5;
	//menu_x = 200;
	//menu_y = 100; //- ((button_h * buttons)/2 + button_h);
	//button_h = 60;

	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
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
		draw_text_outline(menu_x, menu_y + button_h * i, button[i], c_black,c_aqua);
		}
		i++;	
	}
	i = 0;
	
	//	draw_sprite(sWASD, image_index,100,700);
		
	var text_x = global.GUIww * .65;
	var text_y = global.GUIhh * .15;
	draw_set_color (c_ltgray);
	draw_set_font(fConthrax11);
	var textSpacing = font_get_size(fConthrax11)*1.5;
	
		draw_text(text_x,text_y+textSpacing*0,string("WASD or arrow keys to move"));
		
		draw_text(text_x,text_y+textSpacing*3,string("The goal is to collect as many"));
		draw_text(text_x,text_y+textSpacing*4,string("acorns as you can in 60 seconds."));
		
		draw_text(text_x,text_y+textSpacing*6,string("Watch your fuel, don't hit the"));
		draw_text(text_x,text_y+textSpacing*7,string("walls too hard, and avoid spikes."));
		
		draw_text(text_x,text_y+textSpacing*9,string("Press space bar in game to pause."));;
		
		draw_text(text_x,text_y+textSpacing*14,string("M to toggle music."));
		

		//Left side
		draw_set_font(fConthrax26);
		text_x = global.GUIww *.25;
		text_y = global.GUIhh *.65;
		//draw_text(text_x,text_y,string("Movement"));
		
}

if(room == rHighscore)
{
	var i = 0;
	draw_set_font(menuFont);
	//Set menu at top left
	menu_x = global.GUIww/4;
	menu_y = global.GUIhh/4;
	button_h = font_get_size(menuFont)*1.5;
	//menu_x = 200;
	//menu_y = 100; //- ((button_h * buttons)/2 + button_h);
	//button_h = 60;

	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
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
		draw_text_outline(menu_x, menu_y + button_h * i, button[i], c_black,c_aqua);
		}
		i++;	
	}
	i = 0;
	
	//	draw_sprite(sWASD, image_index,100,700);
		
	var text_x = global.GUIww * .65;
	var text_y = global.GUIhh * .15;
	draw_set_color (c_ltgray);
	draw_set_font(fConthrax11);
	var textSpacing = font_get_size(fConthrax11)*1.5;
	
	ini_open("savedata.ini");
	var _rGameIce1 = ini_read_real("stats", "rGameIce1", 0);
		draw_text(text_x,text_y+textSpacing*0,string("Ice Asteroid - ")+string(_rGameIce1));
		//draw_text(text_x,text_y+textSpacing*3,string("The goal is to collect as many"));
		//draw_text(text_x,text_y+textSpacing*4,string("acorns as you can in 60 seconds."));
		//draw_text(text_x,text_y+textSpacing*6,string("Be mindful of your fuel and"));
		//draw_text(text_x,text_y+textSpacing*7,string("hitting the walls too hard."));
		//draw_text(text_x,text_y+textSpacing*10,string("M to toggle music."));
	ini_close();

		//Left side
		draw_set_font(fConthrax26);
		text_x = global.GUIww *.25;
		text_y = global.GUIhh *.65;
		draw_text(text_x,text_y,string("Movement"));
		
}

if(room == rLevelSelect)
{
	var i = 0;
	draw_set_font(menuFont);
	menu_x = global.GUIww/2;
	menu_y = global.GUIhh/2;

	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
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
		draw_text_outline(menu_x, menu_y + button_h * i, button[i], c_black,c_aqua);
		}
		i++;	
	}
	i = 0;


} //End Level Select

if(room == rEndRun)
{
	var i = 0;
	draw_set_font(menuFont);
	menu_x = global.GUIww/2;
	menu_y = global.GUIhh/2;

	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
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
		draw_text_outline(menu_x, menu_y + button_h * i, button[i], c_black,c_aqua);
		}
		i++;	
	}
	i = 0;
	
	//Write score
	draw_text_outline(menu_x, menu_y*.5, "Points scored this run", c_black, c_ltgray);
	draw_set_font(fConthrax26);
	draw_text_outline(menu_x, menu_y*.5+font_get_size(fConthrax26)*1.5,string(global.points),c_black, c_yellow);


} //End Level Select

if(room == rOptions)
{
	
}
