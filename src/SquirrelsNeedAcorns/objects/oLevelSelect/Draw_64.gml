if(live_call()) return live_result;

//Draw the art
draw_sprite(global.levelSelectArray[global.selectedLevel].art,0,artX,artY);

draw_set_font(levelSelectFont);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_outline(levelNameX, levelNameY, string(global.levelSelectArray[global.selectedLevel].levelName),c_black,c_ltgray);

draw_text_outline(highScoreTitleX, highScoreTitleY, string("High Score"), c_black, c_ltgray);
draw_text_outline(highScoreTitleX, highScoreTitleY+margin, string(global.gameModeString), c_black, c_ltgray);
//draw_text_outline(highScoreTitleX, highScoreTitleY+margin*2, string("High Score", c_black, c_ltgray);

//string(global.levelSelectArray[global.selectedLevel].playerHighScore),