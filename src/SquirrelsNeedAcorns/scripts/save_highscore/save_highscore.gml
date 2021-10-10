// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_highscore(){
	ini_open(global.saveFile);
	var _checkHighscore = 0;
	var _checkTime = 9999.99;
	
	_checkHighscore = ini_read_real(string(global.gameModeString), string(global.levelSelectArray[global.selectedLevel].saveNum), 0);
	if(global.gameModeString == "Challenge")
	{
		_checkTime = ini_read_real("Time",  string(global.levelSelectArray[global.selectedLevel].saveNum), 0);			
	}

	
					show_debug_message("Checking for previous highscore");
					if(_checkHighscore <= global.points) //If high score is reached, set it
						{
						show_debug_message("Writing points to save file");
						ini_write_real(string(global.gameModeString), global.levelSelectArray[global.selectedLevel].saveNum, global.points);
						global.levelSelectArray[global.selectedLevel].highScore[global.gameMode] = global.points;

						
						if(_checkTime <= global.time && global.points >= global.availablePoints)
						{
							show_debug_message("Writing time to save file");
							ini_write_real("Time", global.levelSelectArray[global.selectedLevel].saveNum, global.time);
						}
							
						ini_close();

						}
						else {
								ini_close();
							return -1;	
						}
}

function load_highscore(){
	ini_open(global.saveFile);
	var _arraylength = array_length(global.levelSelectArray);
	show_debug_message("Loading highscores")
		for(var i = 0; i<_arraylength; i++) //Loop through levels
		{
			global.levelSelectArray[i].highScore[0] = ini_read_real("Challenge", string(global.levelSelectArray[i].saveNum), 0)
			global.levelSelectArray[i].highScore[1] = ini_read_real("Zen", string(global.levelSelectArray[i].saveNum), 0)
			global.levelSelectArray[i].highScore[2] = ini_read_real("Time", string(global.levelSelectArray[i].saveNum), 0)
		}
	
	
	ini_close();

}