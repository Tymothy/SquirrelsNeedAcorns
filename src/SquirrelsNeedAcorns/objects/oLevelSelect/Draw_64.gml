if(live_call()) return live_result;

//Draw the art
//draw_sprite(global.levelSelectArray[global.selectedLevel].art,0,artX,artY);

draw_set_font(levelSelectFont);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_outline(levelNameX, levelNameY, string(global.levelSelectArray[global.selectedLevel].levelName),c_black,c_ltgray);

//draw_set_valign(fa_top);
//draw_set_halign(fa_right);
//draw_text_outline(modeStringX, modeStringY, string("High Score"), c_black, c_ltgray);
draw_text_outline(modeStringX, modeStringY, string(global.gameModeString), c_black, c_ltgray);
if(global.gameMode != 2)
	{
		draw_text_outline(modeStringX, modeStringY+margin, string(global.levelSelectArray[global.selectedLevel].highScore[global.gameMode]), c_black, c_yellow);
	}

if(global.playerName == "")
{
	draw_text_outline(usernameX, usernameY, "No username set",c_black,c_aqua);
}
else{
	draw_text_outline(usernameX, usernameY, string(global.playerName),c_black,c_aqua);
}
//draw_text_outline(modeStringX, modeStringY+margin*2, string("High Score", c_black, c_ltgray);

//string(global.levelSelectArray[global.selectedLevel].playerHighScore),