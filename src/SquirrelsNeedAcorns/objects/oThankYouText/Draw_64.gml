/// @description Insert description here
// You can write your code in this editor
	var _ww = global.GUIww;
	var _hh = global.GUIhh;
	
		var text_x = _ww * .5;
		var left_text_x = _ww *.15;
		var right_text_x = _ww * .85;
		var text_y = _hh *.1;

		left_text_x = text_x;

		var textSpacing = font_get_size(fTextNormal)*1.8;
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_font(fTextLarge);
		draw_text_outline(text_x,text_y+textSpacing*0,string("Thank You!"),c_black,c_ltgray);
		draw_set_font(fTextNormal);	
		draw_set_color (c_ltgray);		
		draw_set_halign(fa_center);
		
		draw_text_outline(left_text_x,text_y+textSpacing*3,string("Thank you for playing my first game!"), c_black,c_ltgray);
		
		draw_text_outline(left_text_x,text_y+textSpacing*5,string("Squirrels Need Acorns is the very first game"), c_black,c_ltgray);
		draw_text_outline(left_text_x,text_y+textSpacing*6,string("I have ever created and I am extremely excited"), c_black,c_ltgray);
		draw_text_outline(left_text_x,text_y+textSpacing*7,string("I am able to share it with you."), c_black,c_ltgray);		
		
		draw_text_outline(left_text_x,text_y+textSpacing*9,string("Special thank you to my family, friends, and"), c_black,c_ltgray);		
		draw_text_outline(left_text_x,text_y+textSpacing*10,string("the Advanced Kind community.  Without you,"), c_black,c_ltgray);
		draw_text_outline(left_text_x,text_y+textSpacing*11, string("this game probably would not exist."), c_black,c_ltgray);
		
		draw_text_outline(left_text_x,text_y+textSpacing*13,string("If you would like to get in touch, please join"), c_black,c_ltgray);
		draw_text_outline(left_text_x,text_y+textSpacing*14,string("the Discord community below.  I would love"), c_black,c_ltgray);
		draw_text_outline(left_text_x,text_y+textSpacing*15,string("to hear your thoughts on the game!"), c_black,c_ltgray);
		
		draw_text_outline(left_text_x,text_y+textSpacing*17,string("I despise ads, so this game is fully ad free."), c_black,c_ltgray);
		draw_text_outline(left_text_x,text_y+textSpacing*18,string("However, if you would like to support me,"), c_black,c_ltgray);
		draw_text_outline(left_text_x,text_y+textSpacing*19,string("please consider donating by clicking below."), c_black,c_ltgray);
		
		draw_text_outline(left_text_x,text_y+textSpacing*21,string("I sincerely thank you for taking time to play"), c_black,c_ltgray);
		draw_text_outline(left_text_x,text_y+textSpacing*22,string("my first game and I hope that you enjoy it."), c_black,c_ltgray);
		
		draw_text_outline(left_text_x,text_y+textSpacing*24,string("-Tym"), c_black,c_ltgray);