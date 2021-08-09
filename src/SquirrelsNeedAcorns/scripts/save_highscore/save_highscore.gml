// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_highscore(){
	ini_open(global.saveFile);
	var _checkHighscore = 0;
	_checkHighscore = ini_read_real(string(global.gameModeString), string(global.levelSelectArray[global.selectedLevel].roomName), 0);

					show_debug_message("Checking for previous highscore");
					if(_checkHighscore < global.points) //If high score is reached, set it
						{
						ini_write_real(string(global.gameModeString), string(global.levelSelectArray[global.selectedLevel].roomName), global.points);
						global.levelSelectArray[global.selectedLevel].highScore[global.gameMode] = global.points;
						ini_close();
						show_debug_message("Writing points to save file");
						}
						else {
								ini_close();
							return -1;	
						}
}

function load_highscore(){
	ini_open(global.saveFile);
	var _arraylength = array_length(global.levelSelectArray);
	
		for(var i = 0; i<_arraylength; i++) //Loop through levels
		{
			global.levelSelectArray[i].highScore[0] = ini_read_real("Challenge", string(global.levelSelectArray[i].roomName), 0)
			global.levelSelectArray[i].highScore[1] = ini_read_real("Zen", string(global.levelSelectArray[i].roomName), 0)
		}
	
	
	ini_close();

}