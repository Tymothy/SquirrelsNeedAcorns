// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_game_mode(_gameMode){


	switch(_gameMode)
	{
		case 0:	
			global.gameModeString = "Challenge";
			global.gameOptions.timed = true;
			global.gameOptions.fuelUse = true;
			global.gameOptions.damage = true;
			global.gameOptions.scoring = true;
			break;

		case 1:
			global.gameModeString = "Practice";
			global.gameOptions.timed = false;
			global.gameOptions.fuelUse = false;
			global.gameOptions.damage = false;
			global.gameOptions.scoring = false;
			break;
	}

}