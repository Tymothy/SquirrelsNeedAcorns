/// @description  Initialise loading the online highscores

player_name = global.playerName;
highscoreFont = fTextNormal;
lines = 5;
currentGameMode = global.gameMode;
currentSelectedLevel = global.selectedLevel;
scr_get_top_scores(player_name, lines, global.gameMode, global.selectedLevel);
text1 = "Please wait for the highscores to load...";
text2 = "";
alarm[1] = room_speed;