if(live_call()) return live_result;

//Draw the art
//draw_sprite(global.levelSelectArray[global.selectedLevel].art,0,artX,artY);

draw_set_font(levelSelectFont);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

//Draw world at top of screen
draw_text_outline(levelNameX, levelNameY, string(global.worldName[global.selectedWorld]),c_black,c_ltgray);

//Draw level name at top of screen
draw_text_outline(levelNameX, levelNameY + margin, string(global.levelSelectArray[global.selectedLevel].levelName),c_black,c_ltgray);

//Draw current mode under level name
//draw_text_outline(modeStringX, modeStringY, string(global.gameModeString), c_black, c_ltgray);
//draw_text_outline(modeX, modeY - margin*2.3, string(global.gameModeString), c_black, c_ltgray);
//As long as mode is not practice, display high score
	var _score = global.levelSelectArray[global.selectedLevel].highScore[global.gameMode];
	var _compLev1 = global.levelSelectArray[global.selectedLevel].compLev1;
	var _compLev2 = global.levelSelectArray[global.selectedLevel].compLev2;
	var _compLev3 = global.levelSelectArray[global.selectedLevel].compLev3;
	var _time = global.levelSelectArray[global.selectedLevel].highScore[2];
	
	

switch(global.gameModeString)
{

	
	case "Challenge" :
		switch(global.levelSelectArray[global.selectedLevel].completionLevel)
		{
			case 0 :
				draw_text_outline(modeStringX, modeStringY+margin, string(_score), c_black, c_yellow);
			break;
			
			case 1 :
				draw_text_outline(modeStringX, modeStringY+margin, string(_score), c_black, c_yellow);
			break;
			
			case 2 :
				switch (global.GOALTYPE)
				{
					case GOALTYPE.GOAL :
						draw_text_outline(modeStringX, modeStringY+margin, string(_time) + " seconds", c_black, c_yellow);					
					break;
					
					case GOALTYPE.COLLECT :
						draw_text_outline(modeStringX, modeStringY+margin, string(_score), c_black, c_yellow);				
					break;
					
					default :
						draw_text_outline(modeStringX, modeStringY+margin, string(_score), c_black, c_yellow);	
					break;
				}
			break;
			
			case 3 :
				switch (global.GOALTYPE)
				{
					case GOALTYPE.GOAL :
						draw_text_outline(modeStringX, modeStringY+margin, string(_time) + " seconds", c_black, c_yellow);					
					break;
					
					case GOALTYPE.COLLECT :
						draw_text_outline(modeStringX, modeStringY+margin, string(_score), c_black, c_yellow);				
					break;
					
					default :
						draw_text_outline(modeStringX, modeStringY+margin, string(_score), c_black, c_yellow);	
					break;
				}
			break;
		}
		
		break;
		
	case "Zen" :
		draw_text_outline(modeStringX, modeStringY+margin, string(_score), c_black, c_yellow);
		break;
		
	case "Practice" :
	
		break;
	
}

	//compLvlX = _ww * .75;
	//compLvlY = _hh * .1;
	//compLvlYMax = _hh * .35;
	var _mid = ((compLvlY +compLvlYMax) / 2);
	//Draw the goal scores/times
		draw_sprite_ext(complete1, 0, compLvlX, compLvlY, .5, .5, image_angle, image_blend, image_alpha);
		draw_sprite_ext(complete2, 0, compLvlX, _mid, .5, .5, image_angle, image_blend, image_alpha);
		draw_sprite_ext(complete3, 0, compLvlX, compLvlYMax, .5, .5, image_angle, image_blend, image_alpha);
		
		
		draw_set_valign(fa_center);
		draw_set_halign(fa_left);

		draw_text_outline(compLvlX + xStringOffset, compLvlY, string(_compLev1),c_black, c_ltgray);
		draw_text_outline(compLvlX + xStringOffset, _mid, string(_compLev2),c_black, c_ltgray);
		draw_text_outline(compLvlX + xStringOffset, compLvlYMax, string(_compLev3),c_black, c_ltgray);
	
	