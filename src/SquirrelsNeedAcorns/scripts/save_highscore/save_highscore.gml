// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_highscore(){
	ini_open(global.saveFile);
	var _savedHighscore = 0;
	var _savedTime = 9999.99;
	
	//Read current high score
	_savedHighscore = ini_read_real(string(global.gameModeString), string(global.levelSelectArray[global.selectedLevel].saveNum), 0);
	_savedTime = ini_read_real("Time",  string(global.levelSelectArray[global.selectedLevel].saveNum), 0);
	
	if(global.gameModeString == "Challenge")
	{
		switch (global.GOALTYPE)
		{
			//Player's goal is to reach the end of the level, collecting all points in a level, and then improve their time
			case GOALTYPE.GOAL :
				if(check_highscore(_savedHighscore) == true)
				{
					save_points(global.points);
				}
				
				if(check_time(_savedTime) == true)
				{
					save_time(global.time);	
				}
					
			break;
			
			//Player's goal is to collect as many points as possible.
			case GOALTYPE.COLLECT :
				if(check_highscore(_savedHighscore) == true)
				{
					save_points(global.points);
				}
			break;
			
		}

	}
	ini_close();

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