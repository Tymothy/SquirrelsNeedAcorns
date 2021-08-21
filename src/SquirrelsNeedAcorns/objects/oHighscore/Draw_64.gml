/// @description  Draw the highscores if available
draw_set_colour(c_lime);
if (text1 == "Ready")
{
    draw_text_highscore(global.GUIww/2-110, 50, "", "Name", "Score", string(text2), player_name, c_green);
}
else
{
    draw_text(global.GUIww/2-110, 50, text1);
}