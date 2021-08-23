randomize();
var _testScore = irandom(50);
scr_send_score(global.playerName, string(_testScore), global.gameMode, global.selectedLevel);
show_debug_message("Sent player: "+ string(global.playerName) + " and score: "+string(_testScore) +" to server.");