/// @description  Initialise loading the online highscores
if(live_call()) return live_result;
player_name = global.playerName;
highscoreFont = fMenu12;
scr_get_top_scores(player_name, 5);
text1 = "Please wait for the highscores to load...";
text2 = "";
alarm[1] = room_speed;