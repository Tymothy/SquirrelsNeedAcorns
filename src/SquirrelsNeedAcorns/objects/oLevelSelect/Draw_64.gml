if(live_call()) return live_result;

//Draw the art
//draw_sprite(global.levelSelectArray[global.selectedLevel].art,0,artX,artY);

draw_set_font(levelSelectFont);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_text_outline(levelNameX, levelNameY, string(global.levelSelectArray[global.selectedLevel].levelName),c_black,c_ltgray);

draw_set_valign(fa_top);
draw_set_halign(fa_right);
draw_text_outline(highScoreTitleX, highScoreTitleY, string("High Score"), c_black, c_ltgray);
draw_text_outline(highScoreTitleX, highScoreTitleY+margin, string(global.gameModeString), c_black, c_ltgray);
if(global.gameMode != 2)
	{
		draw_text_outline(highScoreTitleX, highScoreTitleY+margin*2, string(global.levelSelectArray[global.selectedLevel].highScore[global.gameMode]), c_black, c_yellow);
	}
//draw_text_outline(highScoreTitleX, highScoreTitleY+margin*2, string("High Score", c_black, c_ltgray);

//string(global.levelSelectArray[global.selectedLevel].playerHighScore),