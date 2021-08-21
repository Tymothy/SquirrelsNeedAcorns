randomize();
var _testScore = irandom(50);
scr_send_score(global.playerName, string(_testScore));
show_debug_message("Sent player: "+ string(global.playerName) + " and score: "+string(_testScore) +" to server.");