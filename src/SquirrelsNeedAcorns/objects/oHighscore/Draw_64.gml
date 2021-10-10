/// @description  Draw the highscores if available
if(live_call()) return live_result;
draw_set_colour(c_ltgray);
draw_set_font(highscoreFont);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
if (text1 == "Ready")
{
 //   draw_text_highscore(global.GUIww*.01, global.GUIhh*.01, "", "Name", "Score", string(text2), player_name, c_aqua);
}
else
{
 //   draw_text(global.GUIww*.1, global.GUIhh*.01, text1);
}
draw_text(global.GUIww*.05, global.GUIhh*.01, "Network Scores");
draw_text(global.GUIww*.05, global.GUIhh*.06, "Temporarily Disabled");
