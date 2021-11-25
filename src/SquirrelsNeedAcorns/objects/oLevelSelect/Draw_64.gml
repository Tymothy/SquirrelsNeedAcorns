if(live_call()) return live_result;

//Draw the art
//draw_sprite(global.levelSelectArray[global.selectedLevel].art,0,artX,artY);
draw_set_font(fTextNormal);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_text(global.GUIww*.03, global.GUIhh*.97, "Goal times not final");

var _score = global.levelSelectArray[global.selectedLevel].highScore[global.gameMode];
var _compLev1 = global.levelSelectArray[global.selectedLevel].compLev1;
var _compLev2 = global.levelSelectArray[global.selectedLevel].compLev2;
var _compLev3 = global.levelSelectArray[global.selectedLevel].compLev3;
var _time = global.levelSelectArray[global.selectedLevel].highScore[2];
var _availablePoints = global.levelSelectArray[global.selectedLevel].availablePoints;
	draw_set_font(fTextLarge);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
//Draw world at top of screen
draw_text_outline(levelNameX, levelNameY, string(global.worldName[global.selectedWorld]),c_black,c_ltgray);
		
switch(global.levelSelectArray[global.selectedLevel].unlocked)
{
	case true:

		draw_set_font(fTextLarge);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);

		//Draw level name at top of screen
		draw_text_outline(levelNameX, levelNameY + margin, string(global.levelSelectArray[global.selectedLevel].levelName),c_black,c_ltgray);


		switch (global.GOALTYPE)
		{
			case GOALTYPE.GOAL :
				//Format to 3 decimals
				_time = string_format(_time, 2, 3)
				_compLev1 = string_format(_compLev1, 2, 3);
				_compLev2 = string_format(_compLev2, 2, 3);
				_compLev3 = string_format(_compLev3, 2, 3);	
				if(_time < 9998)
				{
					//draw_text_outline(modeStringX, modeStringY+margin, string(_score), c_black, c_yellow);
				draw_text_outline(modeStringX, modeStringY+margin, string(_time) + " seconds", c_black, c_yellow);					
				}
			break;
					
			case GOALTYPE.COLLECT :
				draw_text_outline(modeStringX, modeStringY+margin, string(_score), c_black, c_yellow);				
			break;
					
			default :
				//draw_text_outline(modeStringX, modeStringY+margin, string(_score), c_black, c_yellow);	
			break;
		}	
		
			var _mid = ((compLvlY +compLvlYMax) / 2);
	
		draw_set_font(infoFont);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
		
	//Draw the goal scores/times
		draw_sprite_ext(complete2, 0, compLvlX, compLvlY, 1, 1, image_angle, image_blend, image_alpha);
		draw_sprite_ext(complete3, 0, compLvlX, _mid, 1, 1, image_angle, image_blend, image_alpha);
		draw_sprite_ext(complete4, 0, compLvlX, compLvlYMax, 1, 1, image_angle, image_blend, image_alpha);
		
		
		draw_set_valign(fa_middle);
		draw_set_halign(fa_left);

		draw_text_outline(compLvlX + xStringOffset, compLvlY, string(_compLev1),c_black, c_ltgray);
		draw_text_outline(compLvlX + xStringOffset, _mid, string(_compLev2),c_black, c_ltgray);
		draw_text_outline(compLvlX + xStringOffset, compLvlYMax, string(_compLev3),c_black, c_ltgray);
		
		//Draw how many acorns were collected from the level
		draw_set_halign(fa_middle);
		//draw_text_outline(acornsX, acornsY, "Acorns Collected", c_black, c_ltgray);
		draw_sprite_ext(s_pickup_point_acorn, 0, acornsX, acornsY, .5, .5, image_angle, image_blend, image_alpha);
		
		switch(global.GOALTYPE)
		{
			case GOALTYPE.GOAL :
				//draw_sprite_ext(s_pickup_point_acorn, 0, acornsX, acornsY + margin, .5, .5, image_angle, image_blend, image_alpha);
				if(_availablePoints > 0)
				{
					//This will give a collected out of available.  Commented out for now.
					//draw_text_outline(acornsX, acornsY + margin, string(_score) + " / " +  string(_availablePoints), c_black, c_ltgray);
					draw_text_outline(acornsX, acornsY + margin, string(_score), c_black, c_ltgray);
				}
				else {
					draw_text_outline(acornsX, acornsY + margin, string(_score), c_black, c_ltgray);
				}
				break;
				
			case GOALTYPE.COLLECT :
				//draw_sprite_ext(s_pickup_point_acorn, 0, acornsX, acornsY + margin * 2, .5, .5, image_angle, image_blend, image_alpha);
				draw_text_outline(acornsX, acornsY + margin, string(_score) , c_black, c_ltgray);
				break;
		}
	break;
	
	case false:
	draw_set_font(fTextNormal);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);

		//Draw level name at top of screen
		draw_text_outline(levelNameX, levelNameY + margin, "World locked!",c_black,c_red);
		draw_text_outline(modeStringX, modeStringY+margin, "Collect more acorns!", c_black, c_red);			
	break;
	
}



	