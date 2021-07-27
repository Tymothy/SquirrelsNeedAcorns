/// @description Insert description here
// You can write your code in this editor
if(room = rEndRun && global.gameMode == 0)
{
	ini_open(global.saveFile);
	var _checkHighscore = 0;
	switch(global.lastGameRoom)
	{
		case rGameIce1:
			_checkHighscore = ini_read_real("stats", rGameIce1, 0);
			show_debug_message("Checking for previous highscore");
			if(_checkHighscore < global.points) //If high score is reached, set it
				{
				ini_write_real("stats", "rGameIce1", global.points);
				show_debug_message("Writing points to save file");
				}
			break;
	}
	ini_close();
	save_change_money(global.points);
}
