/// @description Insert description here
// You can write your code in this editor
if(room = rHighscore)
{
	//Get high scores
	ini_open("savedata.ini");
	rGameIce1Score = ini_read_real("stats", "rGameIce1", 0);
	ini_close();
}

