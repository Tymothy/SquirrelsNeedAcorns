if(live_call()) return live_result;

//Draw the art
//draw_sprite(global.levelSelectArray[global.selectedLevel].art,0,artX,artY);

draw_set_font(levelSelectFont);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
//Draw level name at top of screen
draw_text_outline(levelNameX, levelNameY, string(global.levelSelectArray[global.selectedLevel].levelName),c_black,c_ltgray);

//Draw current mode under level name
draw_text_outline(modeStringX, modeStringY, string(global.gameModeString), c_black, c_ltgray);

//As long as mode is not practice, display high score
	var _score = global.levelSelectArray[global.selectedLevel].highScore[global.gameMode];
	var _time = global.levelSelectArray[global.selectedLevel].highScore[2];

//TODO: Put score somewhere easily accesible.
//switch(global.gameModeString)
//{

	
//	case "Challenge" :
//		if(_time == 0)
//		{
//			draw_text_outline(modeStringX, modeStringY+margin, string(_score), c_black, c_yellow);
//		}
//		else
//		{
//			draw_text_outline(modeStringX, modeStringY+margin, string(_score) + " - " + string(_time), c_black, c_yellow);	
//		}
		
//		break;
		
//	case "Zen" :
//		draw_text_outline(modeStringX, modeStringY+margin, string(_score), c_black, c_yellow);
//		break;
		
//	case "Practice" :
	
//		break;
	
//}
//if(global.gameModeString == "Challenge")
//	{

//	}

//if(global.gameModeString == "Zen")
//	{
//		draw_text_outline(modeStringX, modeStringY+margin, string(global.levelSelectArray[global.selectedLevel].highScore[global.gameMode]), c_black, c_yellow);
//	}

//If player has not set username, display alert that no username is set
if(global.playerName == "")
{
	draw_text_outline(usernameX, usernameY, "SET USERNAME",c_black,c_aqua);
}
//Username is set, draw username
else{
	draw_text_outline(usernameX, usernameY, string(global.playerName),c_black,c_aqua);
}
